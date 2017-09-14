package com.xwj;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.Dept;
import com.xwj.entity.Issue;
import com.xwj.entity.Status;
import com.xwj.entity.User;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class UserInfoServlet
 */
@WebServlet("/UserInfo")
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;

	public UserInfoServlet() {
		super();
		businessService = new BusinessService();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (req.getSession().getAttribute("user_session") == null) {
			resp.sendRedirect("/IssueFeedbackProject/Login");
		} else {
			Integer userId = ((User) req.getSession().getAttribute("user_session")).getId();
			
			List<Issue> issues = businessService.getIssuesByUserId(userId);
			req.setAttribute("list", issues);
			req.setAttribute("issue_quantity", issues.size());

			List<Status> allStatus = businessService.getAllStatus();
			req.setAttribute("all_status", allStatus);
			List<Dept> allDepts = businessService.getAllDepts();
			req.setAttribute("all_depts", allDepts);
			req.setAttribute("dept_quantity", allDepts.size());
			req.getRequestDispatcher("/WEB-INF/user_info.jsp").forward(req, resp);
		}
	}

}
