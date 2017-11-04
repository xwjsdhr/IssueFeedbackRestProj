package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xwj.service.BusinessService;

@Controller
public class MainController {

	@Autowired
	private BusinessService businessService;	

	@GetMapping("/index")
	public String index(HttpSession hs) {
		if (hs.getAttribute("user_session") == null) {
			return "login";
		}
		
		return "index";
	}

	@GetMapping("/login")
	public String login(HttpSession hs) {
		if (hs.getAttribute("user_session") != null) {
			return "index";
		}
		return "login";
	}
	
	
	@GetMapping("/project_management")
	public String projectManagement(ModelMap modelMap) {
		modelMap.addAttribute("allProject", businessService.getAllProject());
		return "project_management";
	}
	
	@GetMapping("/dept_management")
	public String deptManagement() {
		return "dept_management";
	}
	
	@GetMapping("/user_info")
	public String userInfo(ModelMap modelMap) {
		modelMap.addAttribute("all_depts", businessService.getAllDepts());
		return "user_info";
	}
	@GetMapping("/issue_detail")
	public String issueDetails(@RequestParam("id") Integer id ,ModelMap modelMap) {
		modelMap.addAttribute("issue_detail", businessService.getById(id));
		return "issue_detail";
	}
	
	@GetMapping("/permission_management")
	public String permissionManagement() {
		return "permission_management";
	}
	
	@GetMapping("new_issue")
	public String newIssue() {
		return "new_issue";
	}
	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	@GetMapping("/user_management")
	public String userManagement() {
		return "user_management";
	}

}
