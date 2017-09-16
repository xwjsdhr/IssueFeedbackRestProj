package com.xwj;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.Dept;
import com.xwj.entity.User;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class DeptManagementServlet
 */
@WebServlet("/DeptManagement")
public class DeptManagementServlet extends HttpServlet {
	private BusinessService businessService;
	
	private static final long serialVersionUID = 1L;
       
    
    public DeptManagementServlet() {
        super();
        businessService = new BusinessService();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userSession = (User) request.getSession().getAttribute("user_session");
		if(userSession!= null && userSession.getDept().getId() == 4) {
			List<Dept> allDepts = businessService.getAllDepts();
			request.setAttribute("all_depts", allDepts);
			request.getRequestDispatcher("/WEB-INF/dept_management.jsp").forward(request, response);
		}else if(userSession == null) {
			response.sendRedirect(request.getContextPath()+"/Login");
		}
	}
}
