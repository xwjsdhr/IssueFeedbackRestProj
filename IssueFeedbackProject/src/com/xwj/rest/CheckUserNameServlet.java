package com.xwj.rest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class CheckUserNameServlet
 */
@WebServlet("/CheckUserName")
public class CheckUserNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;
	private Gson gson;
       
    public CheckUserNameServlet() {
        super();
        businessService =  BusinessServiceImpl.newInstance();
        gson = new Gson();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		String username = request.getParameter("userName");
		Boolean b = businessService.checkUserName(username);
		String json = gson.toJson(b);
		response.getWriter().append(json);
	
	}

}
