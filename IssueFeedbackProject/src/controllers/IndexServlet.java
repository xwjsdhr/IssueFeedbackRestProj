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
		businessService = new BusinessServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("user_session") == null) {
			resp.sendRedirect("/IssueFeedbackProject/Login");
		} else {
			String statusIdStr = req.getParameter("status_id");
			String deptIdStr = req.getParameter("dept_id");
			String keyword = req.getParameter("keyword");
			String userIdStr = req.getParameter("user_id");
			String order = req.getParameter("order");
			String orderType = req.getParameter("order_type");
			// String pageNum = req.getParameter("page_num");
			if (statusIdStr != null) {
				Integer statusId = Integer.parseInt(statusIdStr);
				String statusName = req.getParameter("status_name");
				Status selectedStatus = new Status();
				selectedStatus.setId(statusId);
				selectedStatus.setStatusName(statusName);

				List<Issue> issues = businessService.getIssueByStatusId(statusId);

				req.setAttribute("select_status", selectedStatus);
				req.setAttribute("list", issues);
				req.setAttribute("issue_quantity", issues.size());
			}
			if (deptIdStr != null) {
				Integer deptId = Integer.parseInt(deptIdStr);
				String deptName = req.getParameter("dept_name");
				Dept dept = new Dept();
				dept.setId(deptId);
				dept.setDeptName(deptName);
				List<Issue> issues = businessService.getIssueByDeptId(deptId);
				req.setAttribute("select_dept", dept);
				req.setAttribute("list", issues);
				req.setAttribute("issue_quantity", issues.size());

			}
			if (order != null) {
				List<Issue> issues = businessService.orderIssueByType(order, "desc");
				req.setAttribute("list", issues);
				req.setAttribute("issue_quantity", issues.size());

			}
			if (keyword != null) {
				List<Issue> issues = businessService.getIssueByKeyword(keyword);
				req.setAttribute("list", issues);
				req.setAttribute("issue_quantity", issues.size());
				req.setAttribute("keyword", keyword);
			} else if (userIdStr == null && deptIdStr == null && statusIdStr == null && order == null) {

				List<Issue> issues = businessService.getAllIssues();
				
				req.setAttribute("list", issues);
				req.setAttribute("issue_quantity", issues.size());

			}
			if (userIdStr != null) {
				Integer userId = Integer.parseInt(userIdStr);
				String realName = req.getParameter("real_name");
				List<Issue> issues = businessService.getIssuesByUserId(userId);
				req.setAttribute("real_name", realName);
				req.setAttribute("list", issues);
				req.setAttribute("issue_quantity", issues.size());
			}

			if (userIdStr != null && deptIdStr != null && statusIdStr != null && order != null) {
				int userId = Integer.parseInt(userIdStr);
				int deptId = Integer.parseInt(deptIdStr);
				int statusId = Integer.parseInt(statusIdStr);
				
				List<Issue> issues = null;
				if(orderType == null) {
					 issues = businessService.getIssuesByConditions(userId, deptId, statusId, order, "asc");
					 req.setAttribute("order_type", "off");
				}else if(orderType.equals("on")) {
					issues = businessService.getIssuesByConditions(userId, deptId, statusId, order, "desc");
					req.setAttribute("order_type",orderType);
				}

				req.setAttribute("user_id", userId);
				req.setAttribute("dept_id", deptId);
				req.setAttribute("status_id", statusId);
				req.setAttribute("order", order);
				req.setAttribute("list", issues);
				req.setAttribute("issue_quantity", issues.size());
			}
			
			
			List<User> users = businessService.getAllUsers();
			req.setAttribute("all_users", users);
			List<Status> allStatus = businessService.getAllStatus();
			req.setAttribute("all_status", allStatus);
			List<Dept> allDepts = businessService.getAllDepts();
			req.setAttribute("all_depts", allDepts);
			req.setAttribute("dept_quantity", allDepts.size());
			req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("post");
		
		doGet(req,resp);
	}
}
