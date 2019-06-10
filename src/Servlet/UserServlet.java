package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBFunction.UserImpl;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type=request.getParameter("type");
		if(type.equals("login")) {
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			UserImpl userImpl =new UserImpl();
			int status = 1;
		
			status = userImpl.canLoad(account, password);
			System.out.println("UserAction 43 lines:"+status);

			if(status==0&&account!=null&&password!=null) {
				request.getSession(false).setAttribute("user", userImpl.getUserByAccount(account));  
				RequestDispatcher dispatcher = request.getRequestDispatcher("/client/index.jsp");    
		        dispatcher.forward(request, response);                                            
			}else {
				request.getSession().setAttribute("user", null);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/client/login/login.jsp");    
		        dispatcher.forward(request, response);
			}
			System.out.println("UserServlet 55 line:Go into success");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
