package com.kh.poss.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import com.kh.poss.common.wrapper.RequestWrapper;



@WebFilter("/WrapperFilter")
public class WrapperFilter implements Filter {

 
    public WrapperFilter() {
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		RequestWrapper wrapperRequest = new RequestWrapper((HttpServletRequest)request);
		System.out.println("Filter Wrapper실행");
		
		
		chain.doFilter(wrapperRequest, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {

	}

}
