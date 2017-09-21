package com.xwj;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.Comment;
import com.xwj.entity.Issue;
import com.xwj.entity.Status;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class IssueDetailServlet
 */
@WebServlet("/IssueDetail")
public class IssueDetailServlet extends HttpServlet {
	private BusinessService businessService;

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IssueDetailServlet() {
		super();
		businessService = new BusinessService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("user_session") != null) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			Issue issue = businessService.getById(id);
			List<Comment> comments = businessService.getCommentsById(id);
			List<Status> allStatus = businessService.getAllStatus();
			
			if (issue != null) {
				request.setAttribute("issue_detail", issue);
				request.setAttribute("comments", comments);
				request.setAttribute("comment_number", comments.size());
				request.setAttribute("all_status", allStatus);
				request.getRequestDispatcher("/WEB-INF/issue_detail.jsp").forward(request, response);
			}
		}else {
			response.sendRedirect("/IssueFeedbackProject/Login");
		}
	}
}
