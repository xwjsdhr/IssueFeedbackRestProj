package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.xwj.entity.Dept;
import com.xwj.entity.User;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUser")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	BusinessService businessService;
	private PasswordEncoder encoder;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        businessService =BusinessServiceImpl.newInstance();
        encoder = new BCryptPasswordEncoder();
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
		user.setPassword(encoder.encode(password));
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
