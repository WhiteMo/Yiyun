package Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.Channel;
import DBFunction.ChannelImpl;

/**
 * Servlet implementation class ChannelAction
 */
@WebServlet("/ChannelAction")
public class ChannelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChannelAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(type.equals("update")) {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String weight = request.getParameter("weight");
			String targetUrl = request.getParameter("targetUrl");
			Channel channel = new Channel();
			channel.setId(id);
			channel.setTargetUrl(targetUrl);
			channel.setTitle(title);
			channel.setWeight(weight);
			ChannelImpl cImpl = new ChannelImpl();
			boolean b = cImpl.updateChannel(channel);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if(type.equals("add")) {
			String title = request.getParameter("title");
			String weight = request.getParameter("weight");
			String targetUrl = request.getParameter("targetUrl");
			Channel channel = new Channel();
			channel.setTargetUrl(targetUrl);
			channel.setTitle(title);
			channel.setWeight(weight);
			ChannelImpl cImpl = new ChannelImpl();
			boolean b = cImpl.addChannel(channel);
			if(b) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
		}else if(type.equals("delete")) {
			String id= request.getParameter("id");
			ChannelImpl cImpl = new ChannelImpl();
			boolean b = cImpl.deleteChannel(id);
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
