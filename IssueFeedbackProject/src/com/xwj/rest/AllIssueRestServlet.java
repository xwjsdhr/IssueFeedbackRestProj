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
import com.xwj.entity.IssueStatistics;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

@WebServlet("/AllIssueRest")
public class AllIssueRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;
	private Gson gson;
	private Calendar calendar;

	public AllIssueRestServlet() {
		super();
		businessService = new BusinessServiceImpl();
		gson = new Gson();
		calendar =Calendar.getInstance(Locale.CHINA);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		String weekOfYearStr = request.getParameter("weekOfYear");
		int weekOfYear = 0;
		if (weekOfYearStr != null) {
			weekOfYear = Integer.parseInt(weekOfYearStr);
		} else {
			weekOfYear = calendar.get(Calendar.WEEK_OF_YEAR);
		}

		IssueStatistics byWeekOfYear = businessService.getByWeekOfYear(weekOfYear);

		String jsonStr = gson.toJson(byWeekOfYear);
		response.getWriter().append(jsonStr);

	}
}
