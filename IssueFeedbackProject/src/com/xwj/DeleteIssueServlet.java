package com.xwj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.MyError;
import com.xwj.entity.User;
import com.xwj.service.BusinessService;


@WebServlet("/DeleteIssue")
public class DeleteIssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BusinessService businessService;
   
    public DeleteIssueServlet() {
        super();
        businessService = new BusinessService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user_session");
		System.out.println("request.getContextPath()"+request.getContextPath());
		if(user != null) {
			if(user.getDept().getId() == 4) {
				int issueId = Integer.parseInt(request.getParameter("issue_id"));
				int res = businessService.deleteIssue(issueId);
				if(res > 0) {
					response.sendRedirect("/IssueFeedbackProject/Index");
				}
			}else {
				MyError error = new MyError("ÎÞÈ¨ÏÞÉ¾³ý", 1,request.getContextPath()+"/Index");
				request.setAttribute("error", error);
				request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
				
			}
		}else {
			response.sendRedirect("/IssueFeedbackProject/Login");
		}
		
	}
}
