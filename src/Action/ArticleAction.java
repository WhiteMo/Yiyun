package Action;
 

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Article;
import DBFunction.ArticleImpl;



/**
 * Servlet implementation class UserAction
 */
@WebServlet("/ArticleAction")

public class ArticleAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");

		if (type.equals("add")) {
			String title = request.getParameter("title");
			String authorId = request.getParameter("authorId");
			String content = request.getParameter("content");
			String tag = request.getParameter("tag");
			String shortContent = request.getParameter("shortContent");
			String imgUrl = request.getParameter("imgUrl");
			String weight = request.getParameter("weight");
			if(authorId==null) {
				authorId="1";
			}
			ArticleImpl aImpl =new ArticleImpl();
			Article a = new Article();
			a.setAuthorId(authorId);
			a.setContent(content);
			a.setDate("now()");
			a.setImgUrl(imgUrl);
			a.setShortContent(shortContent);
			a.setTag(tag);
			a.setTitle(title);
			a.setWeight(weight);
			boolean b = aImpl.addArticle(a);
			System.out.println("ArticleAction 63 :"+b);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
			
		}else if(type.equals("delete")){
			String id = request.getParameter("id");
			ArticleImpl aImpl = new ArticleImpl();
			boolean b = aImpl.deleteArticle(id);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if (type.equals("update")) {
			String title = request.getParameter("title");
			String authorId = request.getParameter("authorId");
			String content = request.getParameter("content");
			String tag = request.getParameter("tag");
			String shortContent = request.getParameter("shortContent");
			String imgUrl = request.getParameter("imgUrl");
			String weight = request.getParameter("weight");
			String id = request.getParameter("id");
			if(authorId==null) {
				authorId="1";
			}
			ArticleImpl aImpl =new ArticleImpl();
			Article a = new Article();
			a.setId(id);
			a.setAuthorId(authorId);
			a.setContent(content);
			a.setDate("now()");
			a.setImgUrl(imgUrl);
			a.setShortContent(shortContent);
			a.setTag(tag);
			a.setTitle(title);
			a.setWeight(weight);
			boolean b = aImpl.updateArticle(a);
			System.out.println("ArticleAction 103 :"+b);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
