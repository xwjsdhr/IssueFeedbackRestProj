package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.User;
import com.xwj.params.LoginError;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * 登录认证
 * @author Administrator
 * @createTime 上午9:17:28
 */
@WebServlet("/Auth")
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;
	private Gson mGson;
	public AuthServlet() {
		super();
		businessService =BusinessServiceImpl.newInstance();
		mGson = new Gson();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("user_name");
		String password = request.getParameter("password");
		User user = businessService.login(username, password);
		if(user != null) {
			request.getSession().setAttribute("user_session", user);
//			Cookie cookie = new Cookie("userId", user.getId()+"");
//			cookie.setMaxAge(3000);
//			cookie.setSecure(false);
//			cookie.setPath("/");
//			response.addCookie(cookie);
//			response.sendRedirect("/IssueFeedbackProject/Index");
			response.getWriter().append(mGson.toJson(user));
		}else {
			LoginError loginError = new LoginError();
			loginError.setErrorCode(1);
			loginError.setErrorMsg("用户名或密码错误");
			response.getWriter().append(mGson.toJson(loginError));
//			request.setAttribute("error", loginError);
//			request.getRequestDispatcher("/Login").forward(request, response);
		}
	}

}
