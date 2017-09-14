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

import com.xwj.entity.Issue;
import com.xwj.entity.Status;
import com.xwj.entity.User;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class AddIssueServlet
 */
@WebServlet("/AddIssue")
public class AddIssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;

	public AddIssueServlet() {
		super();
		businessService = new BusinessService();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Issue issue = new Issue();
		issue.setTitle(title);
		issue.setContent(content);
	
		User userSession = (User) request.getSession().getAttribute("user_session");
		if (userSession != null) {
			issue.setUser(userSession);
			int res = businessService.addIssue(issue);
			System.out.println(res);
			if (res > 0) {
				response.sendRedirect("/IssueFeedbackProject/Index");
			} 
		}else {
			
		}

		
	}

}
