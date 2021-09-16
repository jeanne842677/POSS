package com.kh.poss.member.validator;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import com.kh.poss.member.model.service.MemberService;

public class JoinForm {

	private String userId;
	private String password;
	private String email;
	private String tell;
	private HttpServletRequest request;
	private MemberService memberService = new MemberService();
	private Map<String, String> failedAtrribute = new HashMap<>(); // 실패한 속성 담는용

	public JoinForm(HttpServletRequest request) {
		this.request = request;
		this.userId = request.getParameter("userId");
		this.password = request.getParameter("password");
		this.email = request.getParameter("email");
		this.tell = request.getParameter("tell");
	}

	public boolean test() {

		boolean res = true;
		boolean valid = true;

		// back단에서 유효한 데이터인지 확인하기
		// 1.db에 존재하지 아이디 확인

		// 만약 아이디가 미리 있으면?
		if (memberService.selectMemberById(userId) != null) {

			res = false;
			failedAtrribute.put("userId", userId);

		}

		// Parttern 클래스 : 정규표현식 클래스
		valid = Pattern.matches("(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9]).{8,}", password);
		if (!valid) {
			// 2.비밀번호가 영수특수문자 조합의 8자리 이상의 문자열 만족 못하면?
			res = false;
			failedAtrribute.put("password", password);

		}

		valid = Pattern.matches("^\\d{9,11}$", tell);
		if (!valid) {

			// 3.전화번호가 9~11자리의 숫자 만족 못하면?
			res = false;
			failedAtrribute.put("tell", tell);

		}

		if (!res) {

			request.getSession().setAttribute("joinFailed", failedAtrribute); // 실패한 애들 값이 담겨있음.
			request.getSession().setAttribute("joinForm", this); // this = 현재 인스턴스

		} else {
			request.getSession().removeAttribute("joinFailed"); // 성공시 이전에 실패했던 값 지워주기
			request.getSession().removeAttribute("joinForm");

		}

		return res;

	}

	
	public String getUserId() {
		return userId;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getTell() {
		return tell;
	}
	
	

}
