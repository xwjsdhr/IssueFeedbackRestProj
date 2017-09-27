package com.xwj;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.service.BusinessService;

/**
 * Servlet implementation class StickTopServlet
 */
@WebServlet("/StickTop")
public class StickTopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;

	public StickTopServlet() {
		super();
		businessService = new BusinessService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer issueId = Integer.parseInt(request.getParameter("issue_id"));
		Integer cancel = Integer.parseInt(request.getParameter("cancel"));
		int i = businessService.stickTop(issueId,cancel);
		if (i > 0) {
			response.sendRedirect(request.getContextPath() + "/Index");
		}
	}

}
