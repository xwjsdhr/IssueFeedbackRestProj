package com.xwj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.User;

/**
 * Servlet implementation class UserManagementServlet
 */
@WebServlet("/UserManagement")
public class UserManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserManagementServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user_session");
		if(user != null && user.getDept().getId() ==4) {
			request.getRequestDispatcher("/WEB-INF/user_management.jsp").forward(request, response);
		}
	}
}
