package Action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Tool.EMailTool;
import Tool.StringTool;

/**
 * Servlet implementation class ValidateAction
 */
@WebServlet("/ValidateAction")
public class ValidateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(type.equals("getAuCode")) {
			String toMail = request.getParameter("toMail");
			String au_code = StringTool.getAuCode();
			String content = "【亦云直播】验证码为"+au_code+"（亦云直播平台邮箱绑定验证码，请完成验证），如非本人操作，请忽略本短信";
			String result = EMailTool.sendEmail(toMail, content);
			String json ="{\"au_code\":\""+au_code+"\",\"result\":\""+result+"\"}";
			response.getWriter().write(json);
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
