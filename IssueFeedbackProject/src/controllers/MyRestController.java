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
import com.xwj.params.SearchCondition;
import com.xwj.service.BusinessService;

@Component
@RestController
public class MyRestController {

	@Autowired
	public BusinessService businessService;
	
	@PostMapping("/auth")
	public ResponseEntity<User> auth(@RequestParam("user_name") String username,@RequestParam("password")String password,HttpSession hs) {
		User user = businessService.login(username, password);
		hs.setAttribute("user_session", user);
		return ResponseEntity.ok(user);
	}
	
	@GetMapping("/allIssues")
	public ResponseEntity<List<Issue>>  allIssues(HttpSession hs){
		User user = (User) hs.getAttribute("user_session");
		List<String> permissions = user.getDept().getPermissions();
		List<Issue> issues = new ArrayList<>();
		if(!permissions.contains("1")) {
			issues = businessService.getAllIssues(user.getDept().getId());
		}else if(permissions.contains("2")) {
			issues = businessService.getAllIssuesWithoutDept();
		}
		return ResponseEntity.ok(issues);
	}
	
	@GetMapping("/allStatus")
	public ResponseEntity<List<Status>> allStatus(){
		return ResponseEntity.ok(businessService.getAllStatus());
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping("/searchIssue")
	public ResponseEntity<List<Issue>> searchIssue(@RequestParam("statusId") Integer id , @RequestParam("year")  Integer year, @RequestParam("week")Integer week,HttpSession hs){
		User user = (User) hs.getAttribute("user_session");
		SearchCondition condition = new SearchCondition(user.getDept().getId(),id,year,week);
		return ResponseEntity.ok(businessService.getIssueWithSearchCondition(condition));
	}
	
	@GetMapping("/allDepts")
	public ResponseEntity<List<Dept>> allDepts(){
		return ResponseEntity.ok(businessService.getAllDepts());
	}
	
	@GetMapping("/allProjects")
	public ResponseEntity<List<Project>> allProject(){
		return ResponseEntity.ok(businessService.getAllProject());
	}
	
	@GetMapping("/getDeptById")
	public ResponseEntity<Dept> getDeptById(@RequestParam("dept_id") Integer id){
		return ResponseEntity.ok(businessService.getDeptById(id));
	}
	
	
	
}
