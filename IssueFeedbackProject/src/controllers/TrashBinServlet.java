package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.Issue;
import com.xwj.entity.User;
import com.xwj.service.BusinessServiceImpl;
import com.xwj.service.BusinessService;


@WebServlet("/TrashBin")
public class TrashBinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BusinessService businessService;
    
    public TrashBinServlet() {
        super();
        businessService = new BusinessServiceImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user_session");
		if(user != null) {
			List<Issue> issues = businessService.getAllDeletedIssues();
			request.setAttribute("deleted_list", issues);
			request.getRequestDispatcher("/WEB-INF/trash_bin.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/Login");
		}
		
		
	}
}
