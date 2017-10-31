package com.xwj.rest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class GrantPermissionToDeptServlet
 */
@WebServlet("/GrantPermissionToDept")
public class GrantPermissionToDeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService bs;

	public GrantPermissionToDeptServlet() {
		super();
		bs = BusinessServiceImpl.newInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer deptId = Integer.parseInt(request.getParameter("dept_id"));
		String[] permissions = request.getParameterValues("permissions[]");
		List<Integer> permissionIdList = new ArrayList<>();
		if (permissions != null) {
			for (String string : permissions) {
				permissionIdList.add(Integer.parseInt(string));
			}
		}

		boolean b = bs.updatePermission2Dept(deptId, permissionIdList);

		response.getWriter().print(b);

	}

}
