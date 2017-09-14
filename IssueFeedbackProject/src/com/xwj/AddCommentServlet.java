package com.xwj;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.xwj.entity.Comment;
import com.xwj.entity.User;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class AddCommentServlet
 */
@WebServlet("/AddComment")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BusinessService businessService;

	public AddCommentServlet() {
		super();
		businessService = new BusinessService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer issueId = Integer.parseInt(request.getParameter("issue_id"));
		String commentStr = request.getParameter("comment");
		Integer userId = Integer.parseInt(request.getParameter("user_id"));
		
		Comment comment = new Comment();
		comment.setContent(commentStr);

		User user = new User();
		user.setId(userId);

		System.out.println(user == null);
		comment.setUser(user);
		int res = businessService.addCommentToIssue(issueId, comment);
		if (res > 0) {
			response.sendRedirect("/IssueFeedbackProject/IssueDetail?id=" + issueId);
		}
	}

}
