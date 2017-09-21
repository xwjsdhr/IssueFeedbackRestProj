package com.xwj;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.service.BusinessService;

/**
 * Servlet implementation class StatisticsServlet
 */
@WebServlet("/Statistics")
public class StatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BusinessService businessService;
   
    public StatisticsServlet() {
        super();
        businessService = new BusinessService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		businessService.statisticsIssue();
		request.getRequestDispatcher("/WEB-INF/issue_statistics.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
