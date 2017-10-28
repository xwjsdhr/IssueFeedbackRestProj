package com.xwj.rest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.User;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class SearchIssueAjaxServelet
 */
@WebServlet("/SearchIssueAjax")
public class SearchIssueAjaxServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   private BusinessService bs;
    public SearchIssueAjaxServelet() {
        super();
        bs = BusinessServiceImpl.newInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user_session");
		if(user != null) {
			String statusId = request.getParameter("statusId");
			int sid = statusId == null ? -1 :Integer.parseInt(statusId);
			
			bs.getAllIssues(sid,sid);
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
