package com.xwj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.User;

/**
 * Servlet implementation class DeptManagementServlet
 */
@WebServlet("/DeptManagement")
public class DeptManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeptManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userSession = (User) request.getSession().getAttribute("user_session");
		if(userSession!= null) {
			request.getRequestDispatcher("/WEB-INF/dept_management.jsp").forward(request, response);
		}else {
			
		}
	}
}
