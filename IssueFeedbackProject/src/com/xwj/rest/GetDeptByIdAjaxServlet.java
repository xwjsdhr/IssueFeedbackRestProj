package com.xwj.rest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.entity.Dept;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class GetDeptByIdAjaxServlet
 */
@WebServlet("/GetDeptByIdAjax")
public class GetDeptByIdAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson;
       
    private BusinessService businessService;
    public GetDeptByIdAjaxServlet() {
        super();
        businessService = BusinessServiceImpl.newInstance();
        gson = new Gson();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		if(idStr.length()!= 0) {
			Integer id = Integer.parseInt(idStr);
			Dept dept = businessService.getDeptById(id);
			
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().append(gson.toJson(dept));
		}
		
	}

	

}
