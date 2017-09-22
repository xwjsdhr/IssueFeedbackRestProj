package com.xwj.rest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.IssueStatistics;
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
		IssueStatistics byWeekOfYear = businessService.getByWeekOfYear(38);
		
		String jsonStr = gson.toJson(byWeekOfYear);
		response.getWriter().append(jsonStr);
	
	}
}
