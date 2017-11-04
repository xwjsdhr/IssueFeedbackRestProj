package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xwj.entity.Dept;
import com.xwj.entity.Issue;
import com.xwj.entity.Project;
import com.xwj.entity.Status;
import com.xwj.entity.User;
import com.xwj.params.AjaxResult;
import com.xwj.params.AjaxResult.ErrorCode;
import com.xwj.params.SearchCondition;
import com.xwj.service.BusinessService;

@Component
@RestController
public class MyRestController {

	@Autowired
	public BusinessService businessService;

	@PostMapping("/auth")
	public ResponseEntity<User> auth(@RequestParam("user_name") String username,
			@RequestParam("password") String password, HttpSession hs) {

		User user = businessService.loginBCrypt(username, password);
		if (user != null) {
			hs.setAttribute("user_session", user);
			return ResponseEntity.ok(user);
		} else {
			return ResponseEntity.noContent().build();
		}

	}

	@GetMapping("/allIssues")
	public ResponseEntity<List<Issue>> allIssues(HttpSession hs) {
		User user = (User) hs.getAttribute("user_session");
		List<String> permissions = user.getDept().getPermissions();
		List<Issue> issues = new ArrayList<>();
		if (!permissions.contains("1")) {
			issues = businessService.getAllIssues(user.getDept().getId());
		} else if (permissions.contains("2")) {
			issues = businessService.getAllIssuesWithoutDept();
		}
		return ResponseEntity.ok(issues);
	}

	@GetMapping("/allStatus")
	public ResponseEntity<List<Status>> allStatus() {
		return ResponseEntity.ok(businessService.getAllStatus());
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping("/searchIssue")
	public ResponseEntity<List<Issue>> searchIssue(@RequestParam("statusId") Integer id,
			@RequestParam("year") Integer year, @RequestParam("week") Integer week, HttpSession hs) {
		User user = (User) hs.getAttribute("user_session");
		SearchCondition condition = new SearchCondition(user.getDept().getId(), id, year, week);
		return ResponseEntity.ok(businessService.getIssueWithSearchCondition(condition));
	}

	@GetMapping("/allDepts")
	public ResponseEntity<AjaxResult<List<Dept>>> allDepts() {
		AjaxResult<List<Dept>> ar = new AjaxResult.Builder<List<Dept>>()
				.result(businessService.getAllDepts())
				.errorCode(ErrorCode.ERRORCODE_SUCCESS)
				.message("获取成功")
				.build();
		return ResponseEntity.ok(ar);
	}

	@GetMapping("/allProjects")
	public ResponseEntity<AjaxResult<List<Project>>> allProject() {
		AjaxResult<List<Project>> ar = new AjaxResult.Builder<List<Project>>()
				.result(businessService.getAllProject())
				.errorCode(ErrorCode.ERRORCODE_SUCCESS)
				.message("获取成功")
				.build();
		return ResponseEntity.ok(ar);
	}

	@GetMapping("/getDeptById")
	public ResponseEntity<Dept> getDeptById(@RequestParam("dept_id") Integer id) {
		return ResponseEntity.ok(businessService.getDeptById(id));
	}

	@GetMapping("/allUser")
	public ResponseEntity<AjaxResult<List<User>>> allUser(HttpSession hs) {
		AjaxResult<List<User>> ajaxResult;
		User user = (User) hs.getAttribute("user_session");
		if (user == null) {
			ajaxResult = new AjaxResult.Builder<List<User>>()
					.errorCode(ErrorCode.ERRORCODE_NO_USER)
					.message("无用户登录")
					.result(null)
					.build();
		}else if(!user.getDept().getPermissions().contains("3")) {
			ajaxResult = new AjaxResult.Builder<List<User>>()
					.errorCode(ErrorCode.ERRORCODE_NO_SUCH_PERMISSION)
					.message("当前用户无此权限")
					.result(null)
					.build();
		} else  {
			ajaxResult = new AjaxResult.Builder<List<User>>()
					.result(businessService.getAllUsers())
					.errorCode(ErrorCode.ERRORCODE_SUCCESS)
					.message("获取成功")
					.build();
		}
		return ResponseEntity.ok(ajaxResult);
	}

	@PostMapping("/logout")
	public ResponseEntity<AjaxResult<Boolean>> logout(HttpSession hs) {
		User userSession = (User) hs.getAttribute("user_session");
		AjaxResult<Boolean> ar;
		if(userSession != null) {
			hs.removeAttribute("user_session");
			ar = new AjaxResult.Builder<Boolean>()
					.errorCode(ErrorCode.ERRORCODE_SUCCESS)
					.message("注销成功")
					.result(true)
					.build();
		}else {
			ar = new AjaxResult.Builder<Boolean>()
					.errorCode(ErrorCode.ERRORCODE_NO_USER)
					.message("无用户登录")
					.result(false)
					.build();
		}
		return ResponseEntity.ok(ar);
	}
	
	@GetMapping("/disableOrEnableUser")
	public ResponseEntity<AjaxResult<Boolean>> disableOrEnableUser(HttpSession hs,
			@RequestParam("userId") Integer userId, @RequestParam("userStatus") Boolean userStatus) {
		System.out.println("userId" + userId + ": userStatus" + userStatus);

		User userSession = (User) hs.getAttribute("user_session");
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
	

}
