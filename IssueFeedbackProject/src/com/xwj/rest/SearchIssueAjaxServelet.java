package com.xwj.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.Issue;
import com.xwj.entity.User;
import com.xwj.params.SearchCondition;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class SearchIssueAjaxServelet
 */
@WebServlet("/SearchIssueAjax")
public class SearchIssueAjaxServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   private BusinessService bs;
   private Gson gson;
   
    public SearchIssueAjaxServelet() {
        super();
        bs = BusinessServiceImpl.newInstance();
        gson = new Gson();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user_session");
		if(user != null) {
			SearchCondition sc = gson.fromJson(request.getParameter("queryCondition"),SearchCondition.class);
			sc.setId(user.getDept().getId());
			List<Issue> issues = bs.getIssueWithSearchCondition(sc);
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().append(gson.toJson(issues));
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
