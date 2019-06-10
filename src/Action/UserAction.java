package Action;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.User;
import DBFunction.UserImpl;
/**
 * Servlet implementation class UserAction
 */
@WebServlet("/UserAction")
public class UserAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAction() {
        super();
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        if(type.equals("login")) {
            String account = request.getParameter("account");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            UserImpl userImpl =new UserImpl();
            int status = 1;
            System.out.println("UserAction 37 line:"+"go into success");
            status = userImpl.canLoad(account, password);
            if(status==0&&account!=null&&password!=null) {
                User user = userImpl.getUserByInfo(account);
                if(user.getRole().equals(role)) {
                    request.getSession(false).setAttribute("user", userImpl.getUserByInfo(account));  
                    response.getWriter().write("success");    
                }else {
                    response.getWriter().write("error_role");   
                }
                                              
            }else {
                request.getSession().setAttribute("user", null);
                 response.getWriter().write("failed");
            }
            System.out.println("UserAction 52 line:Go into success");
        }else if(type.equals("add")){
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            String role=request.getParameter("role");
            String sex=request.getParameter("sex");
            String email=request.getParameter("email");
            String telephone=request.getParameter("telephone");
            String college=request.getParameter("college");
            String account=request.getParameter("account");;
            User user=new User();
            UserImpl uImpl=new UserImpl();
            user.setAccount(account);
            user.setCollege(college);
            user.setName(name);
            user.setPassword(password);
            user.setSex(sex);
            user.setTeleNumber(telephone);
            user.setTeleNumber(email);
            int rs=0;
            try {
                 rs=uImpl.addUser(user);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                System.out.println(e.getMessage());
            }
            if(rs==1)
            {
                response.getWriter().write("success");
            }
            else response.getWriter().write("failed");
        }else if(type.equals("update")) {
            String headImgUrl  =request.getParameter("headImgUrl");
            String college = request.getParameter("college");
            String id = request.getParameter("id");
            String sex = request.getParameter("sex");
            String name = request.getParameter("name");
            String messageCount = request.getParameter("messageCount");
            User user = null;
            UserImpl uImpl = new UserImpl();
            user = uImpl.getUserById(id);
            user.setId(id);
            user.setSex(sex);
            user.setName(name);
            user.setCollege(college);
            user.setHeadImgUrl(headImgUrl);
            user.setMessageCount(messageCount);
            int b= uImpl.updateUser(user);
            if(b==1) {
                response.getWriter().write("success");
            }else {
                response.getWriter().write("failed");
            }
        }else if(type.equals("cancelLoad")) {
            request.getSession().setAttribute("user", null);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/client/index.jsp");    // ʹ��req�����ȡRequestDispatcher����
            dispatcher.forward(request, response);
        }else if(type.equals("signup")){
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            String sex=request.getParameter("sex");
            String account=request.getParameter("account");
            String teleNumber=request.getParameter("teleNumber");
            String college=request.getParameter("college");
            String role=request.getParameter("role");
            String email=request.getParameter("email");
            User user=new User();
            UserImpl uImpl=new UserImpl();
            user.setAccount(account);
            user.setCollege(college);
            user.setName(name);
            user.setPassword(password);
            user.setSex(sex);
            user.setTeleNumber(teleNumber);
            user.setRole(role);
            user.setEmail(email);
            User tmp=new User();
            tmp=uImpl.getUserByAccount(account);
            if(tmp==null)
            {
                tmp=uImpl.getUserByTelenumber(teleNumber);
                if(tmp==null || teleNumber==null)
                {
                    tmp=uImpl.getUserByEmail(email);
                    if(tmp==null)
                    {
                        int rs=0;
                        try {
                             rs=uImpl.addUser(user);
                        } catch (SQLException e) {
                            System.out.println("UserAction 136 line:"+e.getMessage());
                        }
                        if(rs==1)
                        {
                            response.getWriter().write("success");
                        }
                        else response.getWriter().write("failed");
                    }
                    else
                        response.getWriter().write("failed3");
                }
                else
                    response.getWriter().write("failed2");
            }	
            else
                response.getWriter().write("failed1");
            
        }
        else if(type.equals("check")){
            String name=request.getParameter("name");
            String password=request.getParameter("password");
            String sex=request.getParameter("sex");
            String account=request.getParameter("account");
            String teleNumber=request.getParameter("teleNumber");
            String college=request.getParameter("college");
            String role=request.getParameter("role");
            User user=new User();
            UserImpl uImpl=new UserImpl();
            user.setAccount(account);
            user.setCollege(college);
            user.setName(name);
            user.setPassword(password);
            user.setSex(sex);
            user.setTeleNumber(teleNumber);
            user.setRole(role);
            int rs=0;
        
            User tmp=new User();
            tmp=uImpl.getUserByAccount(account);
            if(tmp==null)
            {
                response.getWriter().write("success");
            }
            else response.getWriter().write("failed");
        }
        
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        doGet(request, response);
    }
}