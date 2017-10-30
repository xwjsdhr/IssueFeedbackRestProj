package com.xwj.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.Permission;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class AllPermissionAjaxServlet
 */
@WebServlet("/AllPermissionAjax")
public class AllPermissionAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   private BusinessService businessService;
   private Gson gson;
    public AllPermissionAjaxServlet() {
        super();
        businessService = BusinessServiceImpl.newInstance();
        gson = new Gson();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Permission> permissions = businessService.getAllPermissions();

		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().append(gson.toJson(permissions));
	}


}
