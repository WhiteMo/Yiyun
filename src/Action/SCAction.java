package Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.Course;
import Bean.User;
import DBFunction.CourseImpl;
import DBFunction.SCImpl;
import DBFunction.UserImpl;
import Tool.StringTool;
/**
 * Servlet implementation class AndAction
 */
@WebServlet("/SCAction")
public class SCAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SCAction() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type=request.getParameter("type");
        if(type.equals("add")) {
            String account=request.getParameter("account");
            User u = new UserImpl().getUserByAccount(account);
            if(u==null) {
                response.getWriter().println("errorAccount");
            }else {
                String courseId=request.getParameter("courseId");
                String studentId=u.getId();
                SCImpl sImpl = new SCImpl();
                boolean b = sImpl.addSC(studentId, courseId);
                if(b) {
                    response.getWriter().print("success");
                }else {
                    response.getWriter().print("unknown");
                }
            }	
        }else if(type.equals("addCourseByCode")) {
            String userId = request.getParameter("userId");
            String code = request.getParameter("code");
            if(!StringTool.isRightCode(code)) {
                response.getWriter().write("errorCode");
                return ;
            }else {
                SCImpl sImpl = new SCImpl();
                String courseId = StringTool.codeToId(code);
                String result=sImpl.addSCWithCheck(userId, courseId);
                response.getWriter().write(result);
                return ;
            }
        }else if(type.equals("deleteSC")) {
            String courseId =request.getParameter("courseId");
            String userId = request.getParameter("userId");
            SCImpl sImpl  =new SCImpl();
            boolean b  = sImpl.deleteSC(userId, courseId);
            if(b) {
                response.getWriter().write("success");
                return ;
            }else {
                response.getWriter().write("failed");
            }
        }else if(type.equals("apply")){
            String courseId =request.getParameter("courseId");
            String studentId = request.getParameter("studentId");
            String isOpen = request.getParameter("isOpen");
            SCImpl sImpl =new SCImpl();
            boolean b=false;
            if(isOpen.equals("1")) {
                b= sImpl.addSC(studentId, courseId);
            }else {
                b = sImpl.applySC(courseId, studentId);
                Course course = new CourseImpl().getCourseById(courseId);
                String teacherId = course.teacherId;
                User user = new UserImpl().getUserById(teacherId);
                int count = Integer.parseInt(user.messageCount);
                count += 1;
                user.setMessageCount(""+count);
                new UserImpl().updateUser(user);
            }
            if(b) {
                response.getWriter().print("success");
            }else {
                response.getWriter().print("unknown");
            }
        }else if(type.equals("agreeApply")) {
            String studentId = request.getParameter("studentId");
            String courseId = request.getParameter("courseId");
            SCImpl scImpl = new SCImpl();
            boolean b= scImpl.agreeApply(courseId, studentId);
            if(b) {
                response.getWriter().write("success");
            }else {
                response.getWriter().write("failed");
            }
            return ;
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