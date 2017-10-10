package com.xwj.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.params.WeeksResult;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class AllWeekServlet
 */
@WebServlet("/AllWeek")
public class AllWeekServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;
	private Gson gson;
    public AllWeekServlet() {
        super();
        businessService = new BusinessServiceImpl();
        gson = new Gson();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		Integer year = Integer.parseInt(request.getParameter("year"));
		List<Integer> list = businessService.getWeeksByYear(year);
		WeeksResult result = new WeeksResult();
		result.setList(list);
		String resultJsonStr = gson.toJson(result);
		response.getWriter().append(resultJsonStr);
	}
}
