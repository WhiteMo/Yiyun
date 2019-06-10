package Action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Ware;
import DBFunction.WareImpl;

/**
 * Servlet implementation class WareAction
 */
@WebServlet("/WareAction")
public class WareAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String PATH_FOLDER ="C:";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WareAction() {
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
		if(type.equals("getWareById")) {
			String id = request.getParameter("id");
			Ware ware = new WareImpl().getWareById(id);
		        // 构建输入流  
				String path = PATH_FOLDER+ware.getWareUrl();
		        InputStream in = new FileInputStream(new File(path));  
		        // 下载  
		        response.setCharacterEncoding("utf-8");  
		        // 通知客户端以下载的方式打开  
		        response.setContentType("application/x-msdownload");
		        response.setHeader("Content-Disposition", "attachment;filename="+ new String(ware.getName().getBytes("UTF-8"),"iso-8859-1"));  
		        OutputStream out = response.getOutputStream();  
		  
		        int len = -1;  
		        byte b[] = new byte[1024];  
		        while ((len = in.read(b)) != -1) {  
		            out.write(b, 0, len);  
		        }  
		        in.close();  
		        out.close();  
		}else if(type.equals("delete")) {
			String id = request.getParameter("id");
			WareImpl wImpl = new WareImpl();
			boolean b = wImpl.deleteWareById(id);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}
		
		
	}

}
