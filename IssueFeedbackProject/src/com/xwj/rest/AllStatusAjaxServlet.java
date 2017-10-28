package com.xwj.rest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class AllStatusAjaxServlet
 */
@WebServlet("/AllStatusAjax")
public class AllStatusAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BusinessService bs;
	private Gson gson;

	public AllStatusAjaxServlet() {
		super();
		bs = BusinessServiceImpl.newInstance();
		gson = new Gson();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().append(gson.toJson(bs.getAllStatus()));
	}
}
