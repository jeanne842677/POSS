package com.kh.poss.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.code.ErrorCode;
import com.kh.poss.common.exception.HandleableException;
import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.member.validator.JoinForm;



public class ValidatorFilter implements Filter {

    public ValidatorFilter() {
        // TODO Auto-generated constructor stub
    }

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		String[] uriArr = httpRequest.getRequestURI().split("/");
		
		//  /member/join   =>  [ , member,  join]
		String redirectUrl = null;
		
		if(uriArr.length != 0) {
			
			switch (uriArr[1]) {
			case "member":
				redirectUrl = memberValidation(httpRequest,uriArr);
				break;
			}
			
			if(redirectUrl != null) {
				httpResponse.sendRedirect(redirectUrl);
				return;
			}
	
		chain.doFilter(request, response);
		}
	}
	
	private String memberValidation(HttpServletRequest httpRequest, String[] uriArr) {
		
		String redirectUrl = null;
		JoinForm joinForm = new JoinForm(httpRequest);
		
		switch (uriArr[2]) {
		case "join":
			if(!joinForm.test()) {
				redirectUrl = "/member/join-form";
			}
			break;
		case "chang-pass-impl":
			if(!joinForm.testPass()) {
				redirectUrl = "/member/change-pass";
			}
			
			break;
		}
		return redirectUrl;
	}
	
	
	
	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
