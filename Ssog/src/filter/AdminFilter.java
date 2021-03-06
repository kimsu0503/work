package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		String admin = (String)session.getAttribute("admin");
		if(admin != null){
			chain.doFilter(req, resp);
		}else{
			String uri = req.getRequestURI();
			System.out.println("uri : "+uri);
			if(uri.startsWith("/admin/login") || uri.startsWith("/admin/popupImg")){
				chain.doFilter(req, resp);				
			}else{
				resp.sendRedirect("/admin/login.ja");
			}
		}
	}

}
