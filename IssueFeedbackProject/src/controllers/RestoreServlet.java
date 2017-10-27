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
 * Servlet implementation class RestoreServlet
 */
@WebServlet("/Restore")
public class RestoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BusinessService businessService;
    
    public RestoreServlet() {
        super();
        businessService= BusinessServiceImpl.newInstance();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user_session");
		if(user!= null && user.getDept().getId() == 4) {
			String issueIdStr = request.getParameter("id");
			Integer id = Integer.parseInt(issueIdStr);
			int res = businessService.restoreIssue(id);
			if(res > 0) {
				request.getRequestDispatcher("/TrashBin").forward(request, response);
			}else {
				
			}
		}
		if(user != null && user.getDept().getId() != 4) {
			
		}
		
		
	}
	

}
