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
import javax.servlet.http.HttpSession;

import com.kh.poss.common.code.ErrorCode;
import com.kh.poss.common.exception.HandleableException;
import com.kh.poss.member.model.dto.Member;

public class AuthorizationFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AuthorizationFilter() {
		// TODO Auto-generated constructor stub
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("AuthorizationFilter 실행");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String[] uriArr = httpRequest.getRequestURI().split("/");

		if (uriArr.length != 0) {
			switch (uriArr[1]) {
			case "sales":
			case "board":
			case "waiting":
			case "seat" :
			case "reserve":
				loginAuthorize(httpRequest, httpResponse, uriArr);
				break;
			case "member":
				mypageAuthorize(httpRequest, httpResponse, uriArr);
			default:
				break;
			}

		}
		chain.doFilter(request, response);
	}

	//login 없이 
	//url(http://localhost:9090/member/mypage?userId=dev, http://localhost:9090/member/modify-info 등)
	//타고 접속하는 경우 차단
	private void mypageAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) {
		if (uriArr.length > 2) {
			switch (uriArr[2]) {
			case "mypage":
				loginAuthorize(httpRequest, httpResponse, uriArr);
				break;
			case "modify-info":
				loginAuthorize(httpRequest, httpResponse, uriArr);
				break;
			}
		}
	}

	// 로그인 안했을 경우 페이지 접근 차단
	private void loginAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) {
		HttpSession session = httpRequest.getSession();
		Member member = (Member) session.getAttribute("authentication");

		if (member == null) {

			throw new HandleableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
