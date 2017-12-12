package controllers;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class UserSessionFilter extends OncePerRequestFilter {
	
	
	protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws ServletException, IOException {

		Integer userLoginId = (Integer) req.getSession().getAttribute("user_session_id");
		
		if(userLoginId != null) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			System.err.println(SecurityContextHolder.getContext().getAuthentication() == null);
			if(authentication!= null) {
//				String username = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//				System.err.println(username);
			}
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
				|| contextPath.endsWith(".js")||contextPath.endsWith("allIssues1");
	}
}
