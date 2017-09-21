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
import com.xwj.entity.IssueResult;
import com.xwj.service.BusinessService;

@WebServlet("/AllIssueRest")
public class AllIssueRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BusinessService businessService;
    private Gson gson;
    public AllIssueRestServlet() {
        super();
        businessService = new BusinessService();
        gson = new Gson();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");     
		List<Issue> issues = businessService.getAllIssues();
		IssueResult issueResult = new IssueResult();
		issueResult.setIssues(issues);
		String issuesJsonStr = gson.toJson(issueResult);
		response.getWriter().append(issuesJsonStr);
	
	}
}
