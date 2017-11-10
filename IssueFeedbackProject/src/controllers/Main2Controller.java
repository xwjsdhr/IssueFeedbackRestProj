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
@RequestMapping("/v2")
public class Main2Controller {

	@Autowired
	private BusinessService businessService;

	@GetMapping("/")
	public String default2(HttpSession session) {
		if (session.getAttribute("user_session") == null) {
			return "login";
		}
		return "v2/index";
	}
	
	@GetMapping("/login")
	public String login(HttpSession session) {
		session.removeAttribute("user_session");
		return "v2/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_session");
		return "v2/login";
	}

	@GetMapping("/index")
	public String index(HttpSession session) {
		if (session.getAttribute("user_session") == null) {
			return "login";
		}
		return "v2/index";
	}

	@GetMapping("/issue_detail")
	public String issueDetails(HttpSession hs, @RequestParam("id") Integer id, ModelMap modelMap) {
		if (hs.getAttribute("user_session") == null) {
			return "login";
		}
		modelMap.addAttribute("issue_detail", businessService.getById(id));
		return "v2/issue_details";
	}

	@GetMapping("/user_management")
	public String userManagement(HttpSession session) {
		if (session.getAttribute("user_session") == null) {
			return "login";
		}
		return "v2/user_management";
	}

	@GetMapping("/dept_management")
	public String deptManagement(HttpSession session) {
		if (session.getAttribute("user_session") == null) {
			return "login";
		}
		return "v2/dept_management";
	}

	@GetMapping("/project_management")
	public String projectManagement(HttpSession session) {
		if (session.getAttribute("user_session") == null) {
			return "login";
		}
		return "v2/project_management";
	}

	@GetMapping("/permission_management")
	public String permissionManagement(HttpSession session) {
		if (session.getAttribute("user_session") == null) {
			return "login";
		}
		return "v2/permission_management";
	}
}
