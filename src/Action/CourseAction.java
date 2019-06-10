package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Article;
import Bean.Course;
import DBFunction.ArticleImpl;
import DBFunction.CourseImpl;

/**
 * Servlet implementation class CourseAction
 */
@WebServlet("/CourseAction")
public class CourseAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");

		if (type.equals("add")) {
			String name = request.getParameter("name");
			String targetUrl = request.getParameter("targetUrl");
			String college = request.getParameter("college");
			String tag = request.getParameter("tag");
			String shortContent = request.getParameter("shortContent");
			String imgUrl = request.getParameter("imgUrl");
			String weight = request.getParameter("weight");
			String wareUrl = request.getParameter("wareUrl");
			String teacherName =request.getParameter("teacherName");
			String status =request.getParameter("status");
			String teacherId = request.getParameter("teacherId");
			String isOpen = request.getParameter("isOpen");
			if(teacherId==null) {
				teacherId="6";
			}
			CourseImpl aImpl =new CourseImpl();
			Course c = new Course();
			c.setCollege(college);
			c.setImgUrl(imgUrl);
			c.setName(name);
			c.setShortContent(shortContent);
			c.setTargetUrl(targetUrl);
			c.setTeacherName(teacherName);
			c.setWareUrl(wareUrl);
			c.setStatus(status);
			c.setIsOpen(isOpen);
			c.setTeacherId(teacherId);
			CourseImpl cImpl = new CourseImpl();
			boolean b = cImpl.addCourse(c);
			System.out.println("CourseAction 63 :"+b);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}	
		}else if(type.equals("delete")){
			String id = request.getParameter("id");
			CourseImpl cImpl = new CourseImpl();
			boolean b = cImpl.deleteCourse(id);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if (type.equals("update")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String targetUrl = request.getParameter("targetUrl");
			String college = request.getParameter("college");
			String tag = request.getParameter("tag");
			String shortContent = request.getParameter("shortContent");
			String imgUrl = request.getParameter("imgUrl");
			String weight = request.getParameter("weight");
			String wareUrl = request.getParameter("wareUrl");
			String teacherName =request.getParameter("teacherName");
			String status = request.getParameter("status");
			String isOpen = request.getParameter("isOpen");
			String teacherId = request.getParameter("teacherId");
			String isIpv6= request.getParameter("isIpv6");
			CourseImpl cImpl =new CourseImpl();
			Course c = new Course();
			c.setCollege(college);
			c.setId(id);
			c.setImgUrl(imgUrl);
			c.setName(name);
			c.setShortContent(shortContent);
			c.setStatus(status);
			c.setTargetUrl(targetUrl);
			c.setTeacherName(teacherName);
			c.setWareUrl(wareUrl);
			c.setIsOpen(isOpen);
			c.setTeacherId(teacherId);
			c.setIsIpv6(isIpv6);
			boolean b = cImpl.updateCourse(c);
			System.out.println("CourseAction 87 :"+b);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
			
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
