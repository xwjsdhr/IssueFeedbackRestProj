package controllers;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.filter.OncePerRequestFilter;
@Controller
public class UserSessionFilter extends OncePerRequestFilter {
	
	protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws ServletException, IOException {

		Integer userLoginId = (Integer) req.getSession().getAttribute("user_session_id");
		if(userLoginId != null) {
			chain.doFilter(req, res);
		}else {
			 res.sendRedirect(req.getContextPath()+"/v2/login");
		}
		
	}
	@Override
	protected boolean shouldNotFilter(HttpServletRequest request) throws ServletException {
		String contextPath = request.getServletPath();
		return contextPath.endsWith("login")||contextPath.endsWith("auth")
				|| contextPath.endsWith("logout")|| contextPath.endsWith(".css") 
				|| contextPath.endsWith(".js");
	}
}
