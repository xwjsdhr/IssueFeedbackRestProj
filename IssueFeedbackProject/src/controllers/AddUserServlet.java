package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.Dept;
import com.xwj.entity.User;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUser")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	BusinessService businessService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        businessService = new BusinessServiceImpl();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("user_name");
		String password = request.getParameter("password");
		String realName = request.getParameter("real_name");
		int deptId = Integer.parseInt(request.getParameter("dept_id"));
		User user = new User();
		Dept dept = new Dept();
		dept.setId(deptId);
		user.setPassword(password);
		user.setRealName(realName);
		user.setUsername(username);
		user.setDept(dept);
		
		int res = businessService.registerUser(user);
		if(res >0) {
			response.sendRedirect("/IssueFeedbackProject/Index");
		}else {
			response.sendRedirect("/IssueFeedbackProject/Index");
		}
	}

}
