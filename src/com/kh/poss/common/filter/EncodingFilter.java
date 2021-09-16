package com.kh.poss.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class EncodingFilter implements Filter {

    public EncodingFilter() {
    	
    	
    }

	public void destroy() {
		
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("============================================");
		System.out.println("Encoding 필터 실행");
		request.setCharacterEncoding("utf-8"); //response의 encoding은 jsp가 대신 해주기때문에 여기선 안씀
		
		//다음 차례의 filter에게 request 와 response 전달
		//마지막 filter면 httpServlet에게 request, response를 전달
		chain.doFilter(request, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
