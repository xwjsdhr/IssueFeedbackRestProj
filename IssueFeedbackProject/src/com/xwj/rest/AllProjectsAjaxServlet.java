package com.xwj.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.Project;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class AllProjectsAjaxServlet
 */
@WebServlet("/AllProjectsAjax")
public class AllProjectsAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private BusinessService businessService;
     private Gson gson;
    
    public AllProjectsAjaxServlet() {
        super();
        businessService = BusinessServiceImpl.newInstance();
        gson = new Gson();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("Utf-8");
		response.setCharacterEncoding("UTF-8");
		List<Project> allProject = businessService.getAllProject();
		String json = gson.toJson(allProject);
		response.setContentType("application/json; charset=UTF-8"); 
		response.getWriter().append(json);
	}
}
