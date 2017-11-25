package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xwj.entity.LogType;
import com.xwj.entity.User;
import com.xwj.service.BusinessService;
import com.xwj.util.CommonUtil;
import com.xwj.util.ConstantUtil;

@Controller
@RequestMapping("/v2")
public class Main2Controller {

	private static final String USER_LOGIN = "user_login";
	@NonNull
	@Autowired
	private BusinessService businessService;

	@GetMapping("/")
	public String default2(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/index");
	}

	@GetMapping("/login")
	public String login(HttpSession session, ModelMap modelMap, HttpServletRequest req) {
		User user = getUserByIdStoredInSession(session);
		if (user != null) {
			modelMap.addAttribute(USER_LOGIN, user);
			return "v2/index";
		}
		return "v2/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest hsr, ModelMap modelMap) {
		User user = getUserByIdStoredInSession(session);
		try {
			if (user != null) {
				hsr.logout();
				session.removeAttribute("user_session_id");
				modelMap.remove(USER_LOGIN);
				LogType logType = new LogType(2);
				businessService.logUser(user, CommonUtil.getClientIp(hsr), logType);
			}
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		return "v2/login";
	}

	@GetMapping("/index")
	public String index(HttpServletRequest req, HttpSession session, ModelMap modelMap) {
		User user = getUserByIdStoredInSession(session);

		if (modelMap.get(USER_LOGIN) != null) {
			modelMap.remove(USER_LOGIN);
		}
		modelMap.addAttribute(USER_LOGIN, user);
		return "v2/index";
	}

	@GetMapping("/{id}")
	public String issueDetails(HttpSession hs, @PathVariable Integer id, ModelMap modelMap) {
		modelMap.addAttribute("issue_detail", businessService.getById(id));
		return loginPageNoUser(hs, modelMap, "v2/issue_details");
	}

	@GetMapping("/user_management")
	public String userManagement(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/user_management");
	}

	@GetMapping("/dept_management")
	public String deptManagement(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/dept_management");
	}

	private String loginPageNoUser(HttpSession session, ModelMap modelMap, String dest) {
		User user = getUserByIdStoredInSession(session);
		modelMap.addAttribute(USER_LOGIN, user);
		return dest;
	}

	@GetMapping("/project_management")
	public String projectManagement(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/project_management");
	}

	@GetMapping("/permission_management")
	public String permissionManagement(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/permission_management");
	}

	@GetMapping("/train_record_management")
	public String trainRecordManagement(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/train_record_management");
	}

	@GetMapping("/issue_statistics")
	public String issueStatistics(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/issue_statistics");
	}

	@GetMapping("/user_info")
	public String userInfo(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/user_info");
	}

	@GetMapping("/home_main")
	public String mainHome(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/home_main");
	}

	@GetMapping("/index_beta")
	public String navbarBeta(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/index_beta");
	}

	@GetMapping("/update_pwd")
	public String updatePwd(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/update_pwd");
	}

	@GetMapping("/user_log_management")
	public String userLogManagement(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/user_log_management");
	}

	@GetMapping("/personal_settings")
	public String personalSettings(HttpSession session, ModelMap modelMap) {
		return loginPageNoUser(session, modelMap, "v2/personal_settings");
	}

	private User getUserByIdStoredInSession(HttpSession hs) {
		Integer userId = (Integer) hs.getAttribute(ConstantUtil.USER_SESSION_ID);
		return userId != null ? businessService.getUserById(userId) : null;
	}
}
