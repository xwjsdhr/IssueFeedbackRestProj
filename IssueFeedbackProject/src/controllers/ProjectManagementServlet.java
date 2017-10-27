package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.Project;
import com.xwj.service.BusinessService;
import com.xwj.service.BusinessServiceImpl;

/**
 * Servlet implementation class ProjectManagementServlet
 */
@WebServlet("/ProjectManagement")
public class ProjectManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService mBusinessService;
       
   
    public ProjectManagementServlet() {
        super();
        mBusinessService = BusinessServiceImpl.newInstance();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Project> allProject = mBusinessService.getAllProject();
		request.setAttribute("allProject", allProject);
		request.getRequestDispatcher("/WEB-INF/project_management.jsp").forward(request, response);;
	
	}

}
