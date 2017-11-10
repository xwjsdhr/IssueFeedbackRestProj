package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xwj.service.BusinessService;

@Controller
@RequestMapping("/v1")
public class MainController {

	@Autowired
	private BusinessService businessService;	

	@GetMapping("/")
	public String default1(HttpSession hs) {
		if (hs.getAttribute("user_session") == null) {
			return "login";
		}
		
		return "v1/index";
	}
	
	@GetMapping("/index")
	public String index(HttpSession hs) {
		if (hs.getAttribute("user_session") == null) {
			return "login";
		}
		
		return "v1/index";
	}

	@GetMapping("/login")
	public String login(HttpSession hs) {
		if (hs.getAttribute("user_session") != null) {
			return "index";
		}
		return "v1/login";
	}
	
	
	@GetMapping("/project_management")
	public String projectManagement(ModelMap modelMap) {
		modelMap.addAttribute("allProject", businessService.getAllProject());
		return "v1/project_management";
	}
	
	@GetMapping("/dept_management")
	public String deptManagement() {
		return "v1/dept_management";
	}
	
	@GetMapping("/user_info")
	public String userInfo(ModelMap modelMap) {
		modelMap.addAttribute("all_depts", businessService.getAllDepts());
		return "v1/user_info";
	}
	@GetMapping("/issue_detail")
	public String issueDetails(@RequestParam("id") Integer id ,ModelMap modelMap) {
		modelMap.addAttribute("issue_detail", businessService.getById(id));
		return "v1/issue_detail";
	}
	
	@GetMapping("/permission_management")
	public String permissionManagement() {
		return "v1/permission_management";
	}
	
	@GetMapping("new_issue")
	public String newIssue() {
		return "v1/new_issue";
	}
	
	@GetMapping("/register")
	public String register() {
		return "v1/register";
	}
	
	@GetMapping("/user_management")
	public String userManagement() {
		return "v1/user_management";
	}
	
	@GetMapping("/sys_params")
	public String sysParams() {
		return "v1/sys_params";
	}
	@GetMapping("/update_pwd")
	public String updatePwd() {
		return "v1/update_pwd";
	}
	
	@GetMapping("/statistics")
	public String statistics() {
		return "v1/issue_statistics";
	}
	
	

}
