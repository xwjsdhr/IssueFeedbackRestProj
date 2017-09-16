package com.xwj.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.User;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class DeptUsersServlet
 */
@WebServlet("/DeptUsers")
public class DeptUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BusinessService businessService;
    private Gson gson;
   
    public DeptUsersServlet() {
        super();
        businessService = new BusinessService();
        gson = new Gson();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer id = Integer.parseInt(request.getParameter("dept_id"));
		List<User> users = businessService.getUsersByDeptId(id);
		String usersJson = gson.toJson(users);
		response.setContentType("application/json; charset=UTF-8");      
		response.getWriter().append(usersJson);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
