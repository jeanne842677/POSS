package com.kh.poss.common.wrapper;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


public class RequestWrapper extends HttpServletRequestWrapper{

	private HttpServletRequest request;
	
	
	public RequestWrapper(HttpServletRequest request) {
		super(request);
		this.request = request;
		
	}
	
	

	@Override
	public RequestDispatcher getRequestDispatcher(String url) {
		
		url = "/WEB-INF/views" + url + ".jsp";
		return request.getRequestDispatcher(url);
		
	}
	
	

}
