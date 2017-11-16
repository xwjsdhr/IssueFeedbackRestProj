package controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xwj.entity.Comment;
import com.xwj.entity.Dept;
import com.xwj.entity.Issue;
import com.xwj.entity.IssueCount;
import com.xwj.entity.Permission;
import com.xwj.entity.Project;
import com.xwj.entity.Status;
import com.xwj.entity.TrainingRecord;
import com.xwj.entity.User;
import com.xwj.params.AjaxResult;
import com.xwj.params.AjaxResult.ErrorCode;
import com.xwj.params.SearchCondition;
import com.xwj.service.BusinessService;
import com.xwj.util.CommonUtil;

@Component
@RestController
public class MyRestController {

	@NonNull
	@Autowired(required=true)
	public BusinessService businessService;
	
	@NonNull
	@Autowired(required=true)
	public Calendar calendar;

	@PostMapping("/auth")
	public ResponseEntity<User> auth(@RequestParam("user_name") String username,
			@RequestParam("password") String password, HttpSession hs, ModelMap modelMap, HttpServletRequest httpRequest) {
		User user = businessService.loginBCrypt(username, password);
		if (user != null) {
			hs.setAttribute("user_session_id", user.getId());
			modelMap.addAttribute("user_login", user);
			
			businessService.logUser(user,CommonUtil.getClientIp(httpRequest));
			return ResponseEntity.ok(user);
		} else {
			return ResponseEntity.noContent().build();
		}
	}

	@GetMapping("/allIssues")
	public ResponseEntity<AjaxResult<List<Issue>>> allIssues(HttpSession hs) {
		AjaxResult<List<Issue>> ar = null;
		User user = filterSession(hs);

		if (user == null) {
			AjaxResult<List<Issue>> ar1 = new AjaxResult.Builder<List<Issue>>().result(null)
					.errorCode(ErrorCode.ERRORCODE_NO_USER).message("无用户登录").build();
			return ResponseEntity.ok(ar1);
		}
		List<String> permissions = user.getDept().getPermissions();
		List<Issue> issues = new ArrayList<>();
		if (!permissions.contains("1")) {
			issues = businessService.getAllIssues(user.getDept().getId());
			ar = new AjaxResult.Builder<List<Issue>>().result(issues).errorCode(ErrorCode.ERRORCODE_SUCCESS).build();
		} else if (permissions.contains("2")) {
			issues = businessService.getAllIssuesWithoutDept();
			ar = new AjaxResult.Builder<List<Issue>>().result(issues).errorCode(ErrorCode.ERRORCODE_SUCCESS).build();
		}

		return ResponseEntity.ok(ar);
	}

	@GetMapping("/allStatus")
	public ResponseEntity<AjaxResult<List<Status>>> allStatus(HttpSession hs) {
		User user = filterSession(hs);
		AjaxResult<List<Status>> ar = null;
		if (user != null) {
			ar = new AjaxResult.Builder<List<Status>>().result(businessService.getAllStatus()).message("获取成功")
					.errorCode(ErrorCode.ERRORCODE_SUCCESS).build();
		}
		return ResponseEntity.ok(ar);
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping("/searchIssue")
	public ResponseEntity<List<Issue>> searchIssue(@RequestParam("statusId") Integer id,
			@RequestParam("year") Integer year, @RequestParam("week") Integer week, HttpSession hs) {
		User user = filterSession(hs);
		
		List<String> permissions = user.getDept().getPermissions();
		SearchCondition condition = null;
		System.out.println(permissions);
		if (permissions.contains("1")) {
			System.out.println("contain 1");
			condition = new SearchCondition(id, year, week == -1 ? null : week);
		} else if (permissions.contains("2")) {
			condition = new SearchCondition(user.getDept().getId(), id, year, week == -1 ? null : week);
		}
		return ResponseEntity.ok(businessService.getIssueWithSearchCondition(condition));
	}

	@GetMapping("/allDepts")
	public ResponseEntity<AjaxResult<List<Dept>>> allDepts() {
		AjaxResult<List<Dept>> ar = new AjaxResult.Builder<List<Dept>>().result(businessService.getAllDepts())
				.errorCode(ErrorCode.ERRORCODE_SUCCESS).message("获取成功").build();
		return ResponseEntity.ok(ar);
	}

	@GetMapping("/allProjects")
	public ResponseEntity<AjaxResult<List<Project>>> allProject() {
		AjaxResult<List<Project>> ar = new AjaxResult.Builder<List<Project>>().result(businessService.getAllProject())
				.errorCode(ErrorCode.ERRORCODE_SUCCESS).message("获取成功").build();
		return ResponseEntity.ok(ar);
	}

	@GetMapping("/allUser")
	public ResponseEntity<AjaxResult<List<User>>> allUser(HttpSession hs) {
		AjaxResult<List<User>> ajaxResult;
		User user = filterSession(hs);
		if (user == null) {
			ajaxResult = new AjaxResult.Builder<List<User>>().errorCode(ErrorCode.ERRORCODE_NO_USER).message("无用户登录")
					.result(null).build();
		} else if (!user.getDept().getPermissions().contains("3")) {
			ajaxResult = new AjaxResult.Builder<List<User>>().errorCode(ErrorCode.ERRORCODE_NO_SUCH_PERMISSION)
					.message("当前用户无此权限").result(null).build();
		} else {
			ajaxResult = new AjaxResult.Builder<List<User>>().result(businessService.getAllUsers())
					.errorCode(ErrorCode.ERRORCODE_SUCCESS).message("获取成功").build();
		}
		return ResponseEntity.ok(ajaxResult);
	}

	@GetMapping("/allPermissions")
	public ResponseEntity<AjaxResult<List<Permission>>> allPermissions() {

		AjaxResult<List<Permission>> ar = new AjaxResult.Builder<List<Permission>>()
				.result(businessService.getAllPermissions()).message("获取成功").errorCode(ErrorCode.ERRORCODE_SUCCESS)
				.build();
		return ResponseEntity.ok(ar);
	}

	@PostMapping("/logout")
	public ResponseEntity<AjaxResult<Boolean>> logout(HttpSession hs) {
		User userSession = (User) hs.getAttribute("user_session");
		AjaxResult<Boolean> ar;
		if (userSession != null) {
			hs.removeAttribute("user_session");
			ar = new AjaxResult.Builder<Boolean>().errorCode(ErrorCode.ERRORCODE_SUCCESS).message("注销成功").result(true)
					.build();
		} else {
			ar = new AjaxResult.Builder<Boolean>().errorCode(ErrorCode.ERRORCODE_NO_USER).message("无用户登录").result(false)
					.build();
		}
		return ResponseEntity.ok(ar);
	}

	@GetMapping("/disableOrEnableUser")
	public ResponseEntity<AjaxResult<Boolean>> disableOrEnableUser(HttpSession hs,
			@RequestParam("userId") Integer userId, @RequestParam("userStatus") Boolean userStatus) {

		User userSession = filterSession(hs);
		AjaxResult<Boolean> ajaxResult;
		if (userSession.getId() == userId) {

			ajaxResult = new AjaxResult.Builder<Boolean>().errorCode(AjaxResult.ErrorCode.ERRORCODE_USER_LOGINED)
					.message("当前用户已登录，无法修改").result(false).build();
		} else {
			Boolean res = businessService.disableOrEnableUser(userId, !userStatus);
			ajaxResult = new AjaxResult.Builder<Boolean>().errorCode(AjaxResult.ErrorCode.ERRORCODE_SUCCESS)
					.message("成功").result(res).build();
		}

		return ResponseEntity.ok(ajaxResult);
	}

	@PostMapping("/addUser")
	public ResponseEntity<AjaxResult<Boolean>> addUser(@RequestParam("user_name") String username,
			@RequestParam("password") String password, @RequestParam("real_name") String realName,
			@RequestParam("dept_id") Integer deptId) {
		User user = new User(username, password, realName);
		Dept dept = new Dept();
		dept.setId(deptId);
		user.setDept(dept);
		Boolean exist = businessService.checkUserName(username);
		if (!exist) {
			AjaxResult<Boolean> ajaxRes = new AjaxResult.Builder<Boolean>().result(false).message("用户已存在").build();
			return ResponseEntity.ok(ajaxRes);
		}

		int res = businessService.registerUser(user);
		AjaxResult<Boolean> ar = new AjaxResult.Builder<Boolean>().result(res > 0).message(res > 0 ? "添加成功" : "添加失败")
				.errorCode(res > 0 ? ErrorCode.ERRORCODE_SUCCESS : -2).build();

		return ResponseEntity.ok(ar);
	}

	@GetMapping("/addDept")
	public ResponseEntity<AjaxResult<Boolean>> addDept(@RequestParam("dept_name") String deptName) {
		int res = businessService.addDept(deptName);
		AjaxResult<Boolean> ajaxResult = new AjaxResult.Builder<Boolean>().result(res > 0)
				.errorCode(res > 0 ? ErrorCode.ERRORCODE_SUCCESS : -2).message(res > 0 ? "添加成功" : "添加失败").build();

		return ResponseEntity.ok(ajaxResult);
	}

	@GetMapping("/getDeptById")
	public ResponseEntity<AjaxResult<Dept>> getDeptById(@RequestParam("id") Integer id) {

		Dept dept = businessService.getDeptById(id);
		AjaxResult<Dept> ar = new AjaxResult.Builder<Dept>().result(dept).errorCode(ErrorCode.ERRORCODE_SUCCESS)
				.message("获取成功").build();

		return ResponseEntity.ok(ar);
	}

	@GetMapping("/checkUserName")
	public ResponseEntity<AjaxResult<Boolean>> checkUserName(@RequestParam("userName") String username) {

		AjaxResult<Boolean> ar = new AjaxResult.Builder<Boolean>().result(businessService.checkUserName(username))
				.errorCode(ErrorCode.ERRORCODE_SUCCESS).message("获取成功").build();

		return ResponseEntity.ok(ar);
	}

	@GetMapping("/addCommentToIssue")
	public ResponseEntity<AjaxResult<Comment>> addCommentToIssue(HttpSession hs,
			@RequestParam("issue_id") Integer issueId, @RequestParam("content") String desc,
			@RequestParam("isResovleIssue") Integer isResovleIssue, @RequestParam("isProblem") Integer isProblem) {
		User user = filterSession(hs);
		AjaxResult<Comment> ar = null;
		if (user != null) {
			Comment comment = new Comment();
			comment.setContent(desc);
			comment.setIsResovleIssue(isResovleIssue);
			comment.setIsProblem(isProblem);
			comment.setUser(user);
			int i = businessService.addCommentToIssue(issueId, comment);
			if (i > 0) {
				comment.setCreateTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.CHINA).format(new Date()));
			}
			ar = new AjaxResult.Builder<Comment>().result(comment).errorCode(i > 0 ? ErrorCode.ERRORCODE_SUCCESS : -2)
					.message("添加成功").build();
		} else {
			ar = new AjaxResult.Builder<Comment>().result(null).errorCode(ErrorCode.ERRORCODE_USER_LOGINED)
					.message("无用户登录").build();
		}
		return ResponseEntity.ok(ar);
	}

	@PostMapping("/addIssue")
	public ResponseEntity<AjaxResult<Boolean>> addIssue(HttpSession hs, @RequestParam("title") String title,
			@RequestParam("content") String content, @RequestParam("project_id") Integer projectId) {
		AjaxResult<Boolean> ar = null;
		User user = filterSession(hs);
		if (user != null) {
			Issue issue = new Issue();
			issue.setTitle(title);
			issue.setContent(content);
			Project project = new Project();
			project.setId(projectId);
			issue.setProject(project);
			issue.setUser(user);
			issue.setWeekOfYear(calendar.get(Calendar.WEEK_OF_YEAR));
			issue.setMonth(calendar.get(Calendar.MONTH) + 1);

			int i = businessService.addIssue(issue);
			ar = new AjaxResult.Builder<Boolean>().result(i > 0).errorCode(i > 0 ? ErrorCode.ERRORCODE_SUCCESS : -2)
					.message(i > 0 ? "添加成功" : "添加失败").build();
		} else {
			ar = new AjaxResult.Builder<Boolean>().result(null).errorCode(ErrorCode.ERRORCODE_NO_USER).message("无用户登录")
					.build();
		}

		return ResponseEntity.ok(ar);
	}

	@GetMapping("/grantPermissionToDept")
	public ResponseEntity<AjaxResult<Boolean>> grantPermissionToDept(@RequestParam("dept_id") Integer id,
			@RequestParam("permissions[]") String[] permissions) {
		List<Integer> permissionIdList = new ArrayList<>();
		if (permissions != null && permissions.length != 0) {
			for (String string : permissions) {
				permissionIdList.add(Integer.parseInt(string));
			}
		}
		boolean b = businessService.updatePermission2Dept(id, permissionIdList);
		AjaxResult<Boolean> ajaxResult = new AjaxResult.Builder<Boolean>().result(b)
				.errorCode(ErrorCode.ERRORCODE_SUCCESS).message("获取成功").build();
		return ResponseEntity.ok(ajaxResult);
	}

	@PostMapping("/resetPwd")
	public ResponseEntity<AjaxResult<Boolean>> resetPwd(@RequestParam("user_id") Integer userId) {
		AjaxResult<Boolean> ar = new AjaxResult.Builder<Boolean>().result(businessService.resetPwd(userId))
				.errorCode(ErrorCode.ERRORCODE_SUCCESS).build();
		return ResponseEntity.ok(ar);
	}

	@PostMapping("/checkOldPassword")
	public ResponseEntity<AjaxResult<Boolean>> checkOldPassword(HttpSession hs,
			@RequestParam("old_password") String password) {
		User user = (User) hs.getAttribute("user_session");
		System.out.println(user);
		AjaxResult<Boolean> ar = null;
		if (user != null) {
			ar = new AjaxResult.Builder<Boolean>()
					.result(businessService.checkOldPassword(user.getPassword(), password))
					.errorCode(ErrorCode.ERRORCODE_SUCCESS).build();
		} else {
			ar = new AjaxResult.Builder<Boolean>().result(null).errorCode(ErrorCode.ERRORCODE_NO_USER).build();
		}

		return ResponseEntity.ok(ar);
	}

	@PostMapping("/issueCount")
	public ResponseEntity<AjaxResult<List<IssueCount>>> issueCount(@RequestParam("year") Integer year,
			@RequestParam("type") String type) {
		System.out.println("year :" + year + "   type: " + type);
		AjaxResult<List<IssueCount>> ar = new AjaxResult.Builder<List<IssueCount>>()
				.result(businessService.countIssue(year, type)).errorCode(ErrorCode.ERRORCODE_SUCCESS).build();
		return ResponseEntity.ok(ar);
	}

	@GetMapping("/updateUserById")
	public ResponseEntity<AjaxResult<Boolean>> updateUserById(@RequestParam("username") String username,
			@RequestParam("real_name") String realName, @RequestParam("dept_id") Integer deptId,
			@RequestParam("id") Integer userId) {
		User user = new User();
		user.setId(userId);
		user.setRealName(realName);
		user.setUsername(username);
		Dept dept = new Dept();
		dept.setId(deptId);
		user.setDept(dept);
		AjaxResult<Boolean> ar = new AjaxResult.Builder<Boolean>().result(businessService.updateUser(user))
				.errorCode(ErrorCode.ERRORCODE_SUCCESS).build();
		return ResponseEntity.ok(ar);
	}

	@PostMapping("/updatePwdById")
	public ResponseEntity<AjaxResult<Boolean>> updatePwdById(HttpSession hs,ModelMap modelmap,
			@RequestParam("password") String password) {
		User user = filterSession(hs);
		if (user == null) {
			return null;
		}
		AjaxResult<Boolean> ar = new AjaxResult.Builder<Boolean>()
				.result(businessService.updateUserPassword(user.getId(), password))
				.errorCode(ErrorCode.ERRORCODE_SUCCESS).build();
		return ResponseEntity.ok(ar);
	}

	@GetMapping("/addProject")
	public ResponseEntity<AjaxResult<Boolean>> addProject(@RequestParam("project_name") String projectName,
			@RequestParam("dept_id") Integer id, @RequestParam("project_description") String description) {
		System.out.println("dept_id " + id);
		System.out.println("project_description " + description);
		System.out.println("project_name " + projectName);
		Project project = new Project();
		project.setProjectName(projectName);
		Dept dept = new Dept();
		dept.setId(id);
		project.setDescription(description);
		project.setDept(dept);

		AjaxResult<Boolean> ar = new AjaxResult.Builder<Boolean>().result(businessService.addProject(project))
				.errorCode(ErrorCode.ERRORCODE_SUCCESS).build();
		return ResponseEntity.ok(ar);
	}

	@GetMapping("/updateProject")
	public ResponseEntity<AjaxResult<Boolean>> updateProject(@RequestParam("project_id") Integer id,
			@RequestParam("project_name") String projectName, @RequestParam("project_desc") String projectDescription,
			@RequestParam("dept_id") Integer deptId) {
		Project project = new Project();
		project.setDescription(projectDescription);
		project.setId(id);
		project.setProjectName(projectName);
		Dept dept = new Dept();
		dept.setId(deptId);
		project.setDept(dept);
		Boolean b = businessService.updateProject(project);
		AjaxResult<Boolean> ar = new AjaxResult.Builder<Boolean>().result(b).message(b ? "修改成功" : "修改失败")
				.errorCode(b ? ErrorCode.ERRORCODE_SUCCESS : -1).build();
		return ResponseEntity.ok(ar);
	}
	
	@GetMapping("/getIssueById")
	public ResponseEntity<AjaxResult<Issue>> getIssueById(@RequestParam("id")Integer id){
		AjaxResult<Issue> issueAr =null;
		if(id != null) {
			issueAr = new AjaxResult.Builder<Issue>()
					.result(businessService.getById(id))
					.errorCode(ErrorCode.ERRORCODE_SUCCESS)
					.message("获取成功")
					.build();
		}else {
			issueAr = new AjaxResult.Builder<Issue>()
					.result(null)
					.errorCode(ErrorCode.ERRORCODE_NO_CONTENT)
					.message("无结果，查询失败！")
					.build();
		}
		return ResponseEntity.ok(issueAr);
	}
	
	@GetMapping("/allTrainingRecords")
	public ResponseEntity<AjaxResult<List<TrainingRecord>>> allTrainingRecords(){
		AjaxResult<List<TrainingRecord>> issueAr =null;
		
			issueAr = new AjaxResult.Builder<List<TrainingRecord>>()
					.result(businessService.getAllTrainingRecords())
					.errorCode(ErrorCode.ERRORCODE_SUCCESS)
					.message("获取成功")
					.build();
		return ResponseEntity.ok(issueAr);
	}

	private User filterSession(HttpSession hs) {
		Integer userId = (Integer) hs.getAttribute("user_session_id");
		if (userId != null) {
			return businessService.getUserById(userId);
		}
		return null;
	}

	@Bean
	public Calendar getCalendar() {
		return Calendar.getInstance(Locale.CHINA);
	}

}
