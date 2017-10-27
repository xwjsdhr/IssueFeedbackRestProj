package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.Comment;
import com.xwj.entity.User;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

@WebServlet("/AddComment")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;
	
	public AddCommentServlet() {
		super();
		businessService = BusinessServiceImpl.newInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String isResovled = request.getParameter("is_resovled");
		String isProblem = request.getParameter("is_problem");

		Integer issueId = Integer.parseInt(request.getParameter("issue_id"));
		String commentStr = request.getParameter("comment");
		Integer userId = Integer.parseInt(request.getParameter("user_id"));

		Comment comment = new Comment();
		comment.setContent(commentStr);
		if (isResovled != null) {
			comment.setIsResovleIssue(isResovled.equals("on") ? 1 : 0);
		}
		if (isProblem != null) {
			comment.setIsProblem(isProblem.equals("on") ? 1 : 0);
		}
		User user = new User();
		user.setId(userId);

		comment.setUser(user);
		int res = businessService.addCommentToIssue(issueId, comment);
		if (res > 0) {
			response.sendRedirect("/IssueFeedbackProject/IssueDetail?id=" + issueId);
		}

	}

}
