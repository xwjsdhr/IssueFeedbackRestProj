package controllers;

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
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

/**
 * Index Servlet
 */
@WebServlet("/Index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;

	public IndexServlet() {
		super();
		businessService = BusinessServiceImpl.newInstance();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user_session");
		if (user == null) {
			resp.sendRedirect("/IssueFeedbackProject/Login");
		} else {

			
			// List<Issue> issues = businessService.getAllIssues(user.getDept().getId());
			// req.setAttribute("list", issues);
			// req.setAttribute("issue_quantity", issues.size());

			// List<User> users = businessService.getAllUsers();
			// req.setAttribute("all_users", users);
			// List<Status> allStatus = businessService.getAllStatus();
			// req.setAttribute("all_status", allStatus);
			// List<Dept> allDepts = businessService.getAllDepts();
			// req.setAttribute("all_depts", allDepts);
			// req.setAttribute("dept_quantity", allDepts.size());
			req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
