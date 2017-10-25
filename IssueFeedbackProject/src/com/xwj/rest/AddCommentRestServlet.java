package com.xwj.rest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.Comment;
import com.xwj.entity.User;
import com.xwj.params.MyError;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class AddCommentRestServlet
 */
@WebServlet("/AddCommentRest")
public class AddCommentRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BusinessService businessService;
	private Gson gson;

	public AddCommentRestServlet() {
		super();
		businessService = new BusinessServiceImpl();
		gson = new Gson();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String isResovled = request.getParameter("is_resovled");
		Integer issueId = Integer.parseInt(request.getParameter("issue_id"));
//		String commentStr = request.getParameter("comment");
//		Integer userId = Integer.parseInt(request.getParameter("user_id"));
		
		String jsonStr = request.getParameter("comm");
		System.out.println("comm:"+jsonStr);
		Comment comment =gson.fromJson(jsonStr, Comment.class);
		User user = (User) request.getSession().getAttribute("user_session");

		comment.setUser(user);
		System.out.println(comment);
		int res = businessService.addCommentToIssue(issueId, comment);
		MyError error = null;
		if (res > 0) {
			error = new MyError("add success", -1, null);
		} else {
			error = new MyError("add failed", 1, null);
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().append(gson.toJson(comment));
		

	}

}
