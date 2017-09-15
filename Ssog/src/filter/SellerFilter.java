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

public class SellerFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		String seller = (String)session.getAttribute("seller");
		if(seller != null){
			chain.doFilter(req, resp);
		}else{
			String uri = req.getRequestURI();
			System.out.println("uri : "+uri);
			if(uri.startsWith("/seller/member/join") || uri.startsWith("/seller/main")){
				chain.doFilter(req, resp);
			}else{
				session.setAttribute("goLogin", "goLogin");
				req.setAttribute("goLogin", "goLogin");
				resp.sendRedirect("/seller/main?goLogin=goLogin");
			}
		}
	}

}
