package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class Encodeing
 */
@WebFilter("/*")
public class Encodeing implements Filter {

    /**
     * Default constructor. 
     */
    public Encodeing() {
        System.out.println("Encoding is ok");
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		
		String url = ((HttpServletRequest) request).getRequestURL().toString();
		String text=url.substring(url.lastIndexOf(".")+1);
		
		
		if(text.equals("js")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			chain.doFilter(request, response);
		}else if(text.equals("html")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/"+text+";charset=UTF-8");
			chain.doFilter(request, response);
		}else if(text.equals("css")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/"+text+";charset=UTF-8");
			chain.doFilter(request, response);
		}else {
			request.setCharacterEncoding("UTF-8");
			chain.doFilter(request, response);
		}
		
	
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
