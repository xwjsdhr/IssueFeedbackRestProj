package com.xwj.rest;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.params.YearResult;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class AllYears
 */
@WebServlet("/AllYears")
public class AllYearsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;
	private Gson gson ;
       
   
    public AllYearsServlet() {
        super();
        businessService = new BusinessService();
        gson = new Gson();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		List<Integer> list = businessService.getAllYears();
		YearResult result = new YearResult();
		result.setList(list);
		String json = gson.toJson(result);
		response.getWriter().append(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
