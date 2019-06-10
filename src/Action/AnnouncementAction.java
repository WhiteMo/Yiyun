package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Announcement;
import DBFunction.AnnouncementImpl;
import Tool.DateTool;

/**
 * Servlet implementation class AnnouncementAction
 */
@WebServlet("/AnnouncementAction")
public class AnnouncementAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnouncementAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(type.equals("add")) {
			Announcement a =new Announcement();
			AnnouncementImpl aImpl = new AnnouncementImpl();
			String courseId = request.getParameter("courseId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String date =DateTool.getDate();
			a.setContent(content);
			a.setCourseId(courseId);
			a.setDate(date);
			a.setTitle(title);
			boolean b = aImpl.addAnnouncementImpl(a);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if(type.equals("delete")) {
			AnnouncementImpl aImpl = new AnnouncementImpl();
			String id = request.getParameter("id");
			boolean b= aImpl.deleteAnnouncementById(id);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}
	}

}
