package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.User;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class AddDeptServlet
 */
@WebServlet("/AddDept")
public class AddDeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;
       
    
    public AddDeptServlet() {
        super();
        businessService = new BusinessServiceImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user_session");
		if(user != null) {
			String deptName = request.getParameter("dept_name");
			System.out.println(deptName);
			int res =businessService.addDept(deptName);
			System.out.println(res);
			if(res > 0) {
				response.sendRedirect(request.getContextPath()+"/DeptManagement");
			}
			
		}
	}

}
