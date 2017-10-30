package com.xwj.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.Issue;
import com.xwj.entity.User;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class AllIssueAjaxServlet
 */
@WebServlet("/AllIssueAjax")
public class AllIssueAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;
	private Gson gson;

	public AllIssueAjaxServlet() {
		super();
		businessService = BusinessServiceImpl.newInstance();
		gson = new Gson();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user_session");
		
		if (user != null) {
			List<String> permissions = user.getDept().getPermissions();
			
			if(!permissions.contains("1")){
				System.out.println("not contain");
				List<Issue> issue = businessService.getAllIssues(user.getDept().getId());
				String str  = gson.toJson(issue);
				response.setContentType("application/json; charset=UTF-8");
				response.getWriter().append(str);
			}else if(permissions.contains("2")) {
				System.out.println("contain");
				List<Issue> issue = businessService.getAllIssuesWithoutDept();
				String str  = gson.toJson(issue);
				response.setContentType("application/json; charset=UTF-8");
				response.getWriter().append(str);
			}
			
		}

	}

}
