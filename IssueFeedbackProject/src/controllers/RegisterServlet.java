package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.Dept;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BusinessService businessService;
   
    public RegisterServlet() {
        super();
        businessService = new BusinessServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	List<Dept> depts = businessService.getAllDepts();
    	req.setAttribute("list_dept", depts);
    	req.getRequestDispatcher("/WEB-INF/register.jsp").forward(req, resp);
    }

}
