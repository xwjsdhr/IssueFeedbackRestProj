package com.xwj.rest;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.Comment;
import com.xwj.entity.User;
import com.xwj.params.MyError;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class AddCommentRestServlet
 */
@WebServlet("/AddCommentRest")
public class AddCommentRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BusinessService businessService;
	private Gson gson;
	private SimpleDateFormat dateFormat;

	public AddCommentRestServlet() {
		super();
		businessService = new BusinessServiceImpl();
		gson = new Gson();
		dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.CHINA);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer issueId = Integer.parseInt(request.getParameter("issue_id"));

		String jsonStr = request.getParameter("comm");
		System.out.println("comm:" + jsonStr);
		Comment comment = gson.fromJson(jsonStr, Comment.class);
		User user = (User) request.getSession().getAttribute("user_session");

		comment.setUser(user);
		System.out.println(comment);
		int res = businessService.addCommentToIssue(issueId, comment);

		if (res > 0) {
			response.setContentType("application/json; charset=UTF-8");
			comment.setCreateTime(dateFormat.format(new Date()));
			response.getWriter().append(gson.toJson(comment));
		}

	}

}
