package com.xwj.rest;

import java.io.IOException;
import java.util.Calendar;
import java.util.Locale;

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
 * Servlet implementation class AddIssueAjaxServlet
 */
@WebServlet("/AddIssueAjax")
public class AddIssueAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Gson gson ;
    private Calendar calendar;
    private BusinessService bs;
	
    
    public AddIssueAjaxServlet() {
    	gson = new Gson();
    	calendar = Calendar.getInstance(Locale.CHINA);
    	bs = new BusinessServiceImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String issueCommentStr = request.getParameter("issue");
		Issue issue = gson.fromJson(issueCommentStr, Issue.class);
		
		issue.setIsTop(0);
		issue.setWeekOfYear(calendar.get(Calendar.WEEK_OF_YEAR));
		
		User userSession = (User) request.getSession().getAttribute("user_session");
		if (userSession != null) {
			issue.setUser(userSession);
			int res = bs.addIssue(issue);
			System.out.println(res);
			
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().append(gson.toJson(issue));
		}else {
			
		}
	}


}
