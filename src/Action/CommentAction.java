package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Comment;
import DBFunction.CommentImpl;
import Tool.DateTool;
import Tool.ObjectTool;

/**
 * Servlet implementation class CommentAction
 */
@WebServlet("/CommentAction")
public class CommentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentAction() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(type.equals("add")) {
			String userid = request.getParameter("userId");
			String targetId = request.getParameter("targetId");
			String content = request.getParameter("content");
			String commentType  = request.getParameter("commentType");
			Comment c = new Comment();
			c.setUserid(userid);
			c.setContent(content);
			c.setDate(DateTool.getDate());
			c.setCommentType(commentType);
			c.setTargetId(targetId);
			CommentImpl commentImpl = new CommentImpl();
			
			boolean b= commentImpl.addComment(c);
			if(b) {
				/*String json = ObjectTool.objectToJson(c);
				json = json.replace("}", ",\"result\":\"success\"}");
				System.out.println("CommentAction 53 line:"+json);
				response.getWriter().write(json);*/
				response.getWriter().write("success");
				return;
			}else {
				//response.getWriter().write("{\"result\":\"failed\"}");
				response.getWriter().write("failed");
			}
					
		}else if(type.equals("thumbUp")){
			String id = request.getParameter("id");
			CommentImpl cImpl = new CommentImpl();
			boolean b = cImpl.thumbUp(id);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
			
		} else if(type.equals("update")) {
			String id = request.getParameter("id");
			String score = request.getParameter("score");
			String content = request.getParameter("content");
			CommentImpl cImpl = new CommentImpl();
			Comment comment = cImpl.getCommentById(id);
			comment.setContent(content);
			comment.setScore(score);
			boolean b = cImpl.updateComment(comment);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if(type.equals("delete")){
			String id = request.getParameter("id");
			CommentImpl cImpl = new CommentImpl();
			boolean b = cImpl.deleteComment(id);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if(type.equals("getCommentsByCourseId")) {
			String id = request.getParameter("courseId");
			CommentImpl cImpl = new CommentImpl();
			Comment[] comments = cImpl.getCommentsByCourseId(id);
			if(comments!=null) {
				response.getWriter().write(ObjectTool.arrayToJson(comments));
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
