package Action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.AD;
import DBFunction.ADImpl;

/**
 * Servlet implementation class ADAction
 */
@WebServlet("/ADAction")
public class ADAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ADAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");		
		if (type.equals("add")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String shortContent = request.getParameter("shortContent");
			String imgUrl = request.getParameter("imgUrl");
			ADImpl adImpl =new ADImpl();
			AD a = new AD();
			a.setDate("now()");
			a.setImgUrl(imgUrl);
			a.setShortContent(shortContent);
			a.setTitle(title);
			boolean b = adImpl.addAD(a);
			System.out.println("ArticleAction 48 :"+b);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
			
		}else if(type.equals("delete")){
			String id = request.getParameter("id");
			ADImpl adImpl = new ADImpl();
			boolean b = adImpl.deleteAD(id);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if (type.equals("update")) {
			String title = request.getParameter("title");
			String shortContent = request.getParameter("shortContent");
			String imgUrl = request.getParameter("imgUrl");
			String id = request.getParameter("id");
			ADImpl adImpl =new ADImpl();
			AD a = new AD();
			a.setId(id);
			a.setDate("now()");
			a.setImgUrl(imgUrl);
			a.setShortContent(shortContent);
			a.setTitle(title);
			boolean b = adImpl.updateAD(a);
			System.out.println("ArticleAction 103 :"+b);
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
