package com.kh.poss.member.validator;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import com.kh.poss.common.code.ErrorCode;
import com.kh.poss.common.exception.HandleableException;
import com.kh.poss.member.model.service.MemberService;

public class JoinForm {
	
	private String userId;
	private String password;
	private String email;
	private String phone;
	MemberService memberService = new MemberService();
	private Map<String,String> failedAttribute = new HashMap<String,String>();
	
	
	private HttpServletRequest request;
	
	public JoinForm(HttpServletRequest request) {
		this.request = request;
		this.userId = request.getParameter("userId");
		
		if (request.getParameter("password") != null) {
			this.password = request.getParameter("password");
		} else {
			this.password = "kakaopw123!";
		}
		
		this.email = request.getParameter("email");
		this.phone = request.getParameter("phone");
		
	}
	

	
	public boolean test() {
		
		boolean res = true;
		boolean valid = true;
		
		//db에 존재하지 않는 아이디인지 확인
		if(memberService.selectMemberById(userId) != null) {
			failedAttribute.put("userId", userId);
			res = false;
		}
		
		
		//비밀번호가 영수특수문자 조합의 8자리 이상 문자열
		valid = Pattern.matches("(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9]).{8,}", password);
		if(!valid) {
			failedAttribute.put("password", password);
			res = false;
		}
		
		
		
		//전화번호가 9~11자리의 숫자
		valid = Pattern.matches("^\\d{9,11}$", phone);
		if(!valid) {
			failedAttribute.put("phone", phone);
			res = false;
		}
		
		
		if(!res) {
			request.getSession().setAttribute("joinFailed", failedAttribute);
			request.getSession().setAttribute("joinForm", this);
		}else {
			request.getSession().removeAttribute("joinFailed");
			request.getSession().removeAttribute("joinForm");
		}
		
		return res;
	}
	
	
	public boolean testPass() {
		boolean res = true;
		boolean valid = true;
		
		
		//비밀번호가 영수특수문자 조합의 8자리 이상 문자열
		valid = Pattern.matches("(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9]).{8,}", password);
		if(!valid) {
			failedAttribute.put("password", password);
			res = false;
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

	public String getPhone() {
		return phone;
	}
	
}
