package com.kh.poss.member.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.member.model.service.MemberService;


@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();
       
    public MemberController() {
        super();

    
    }

	
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length-1]);  //콘솔 확인용 코드 (추후 삭제 예정)
		
		switch(uri[uri.length-1]) {
		case "login-form" :  //로그인 폼으로 이동
			loginForm(request, response);
			break;
		case "login" :  //로그인 후 메인페이지로 이동
			login(request, response);
			break;
		case "kakao-form" :  //로그인 후 메인페이지로 이동
			kakaoForm(request, response);
			break;
		case "kakao-login" :  //로그인 후 메인페이지로 이동
			kakaoLogin(request, response);
			break;
		case "logout" : //로그 아웃 후 로그인폼으로 이동
			logout(request, response);
			break;
		case "join-form" : //회원가입 폼으로 이동
			joinFrom(request, response);
			break;
		case "join" :
			join(request, response);
			break;
		case "id-check" :
			checkID(request, response);
			break;
		case "email-check" :
			checkEmail(request, response);
			break;
		case "joinImpl":
			joinImpl(request, response);
			break;
		case "mypage":
			mypage(request, response);
			break;
		case "modify-info":  //내정보 폼으로 이동
			modifyInfo(request, response);
			break;
		case "modify" : 
			modify(request, response); //내 정보가 수정됐을 시 수행하는 메소드
			break;
		case "lostid" : //아이디 찾기 폼으로 이동
			lostId(request, response);
			break;
			
		case "finding-id" : //아이디 찾기 실행
			findingId(request, response);
			break;
		case "lostpass" : //비밀번호 찾기 폼으로 이동
			lostPass(request, response);
			break;
			
		case "change-pass" : //비밀번호 바꾸기 
			changePass(request, response);
			break;
			
		default :
			throw new PageNotFoundException();

		}
		
	
	
	}


	












	//로그인 폼으로 이동
	private void loginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
		request.getRequestDispatcher("/member/login-form").forward(request, response);
		
		
	}
	
	
	//로그인 기능
	//로그인 후 메인페이지로 이동
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		System.out.println(userId);
		System.out.println(password);
		Member member = memberService.memberAuthenticate(userId, password);
		System.out.println(member);
		
		//1. DataBase 또는 Service단에서 문제가 생겨서 예외가 발생
		//2. 사용자가 잘못된 아이디와 비밀번호를 입력한 경우
		//	  사용자에게 아이디나 비밀번호가 틀렸음을 알림, login-form으로 redirect
		if(member == null) {
			response.sendRedirect("/member/login-form?err=1");
			return;
		}
		
		request.getSession().setAttribute("authentication", member);
		response.sendRedirect("/index");
		

		
	}
	
	
	private void kakaoForm(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		
		request.getRequestDispatcher("/test/kakao-test").forward(request, response);
		
		
	}
	
	private void kakaoLogin(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		
		String code = (String)request.getAttribute("code");
		System.out.println(code);
		
		
	}


	//로그아웃 후 메인페이지로 이동
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		//로그아웃 기능 들어갈 곳 {}
		
		
		
		
		response.sendRedirect("/member/login-form");
	
		
		
	}
	
	
	//조인 폼으로 이동
	private void joinFrom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/member/join-form").forward(request, response);
	
	}
	


	
	
	
	//회원 가입 버튼을 눌렀을 때 
	private void join(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		
		String userId = request.getParameter("userId");
		System.out.println(userId);
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String store_name = request.getParameter("storeName");
		String address = request.getParameter("address") + " " + request.getParameter("detailAddress") + "(" + request.getParameter("postCode") + ")";
		System.out.println("address : " + address);
		
		Member member = new Member();
		member.setUserId(userId);
		member.setPassword(password);
		member.setName(name);
		member.setPhone(phone);
		member.setEmail(email);
		member.setStore_name(store_name);
		member.setAddress(address);
		
		
		String persistToken = UUID.randomUUID().toString();
		request.getSession().setAttribute("persistUser", member);
		request.getSession().setAttribute("persistToken", persistToken);
		
		memberService.authenticateByEmail(member, persistToken);
		
		request.setAttribute("msg", "이메일이 발송되었습니다.");
		request.setAttribute("url", "/member/login-form");
		request.getRequestDispatcher("/error/result").forward(request, response);
		
	}


	//아이디 체크 
	private void checkID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println(userId);
		Member member = memberService.selectMemberById(userId);
		System.out.println(member);
		if (member == null) {
			response.getWriter().print("available");
		} else {
			response.getWriter().print("disable");
		}
	}

	//이메일 체크
	private void checkEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		System.out.println(email);
		Member member = memberService.selectMemberByEm(email);
		System.out.println(member);
		if (member == null) {
			response.getWriter().print("available");
		} else {
			response.getWriter().print("disable");
		}
		
	}
	
	//이메일 인증
	private void joinImpl(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("persistUser");
		memberService.insertMember(member);
		session.removeAttribute("persistToken");
		session.removeAttribute("persistUser");
		response.sendRedirect("/member/login-form");
	}


	private void mypage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String userId = request.getParameter("userId");
		Member member = memberService.selectMemberById(userId);
		
		String[] splitAddress = member.getAddress().split("\\(");
		
		request.getSession().setAttribute("myInfo", member);
		request.getSession().setAttribute("addressNum", splitAddress[1].replaceAll("\\)", ""));
		request.getSession().setAttribute("detailAddress", splitAddress[0]);
		
		request.getRequestDispatcher("/member/mypage").forward(request, response);
		
	}

	

	private void modifyInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("modify Info 실행");
		
		request.getRequestDispatcher("/member/modify-info").forward(request, response);
		
	}

	
	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//내정보 db에 업데이트(구현해야함)
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String storeName = request.getParameter("storeName");
		
		if(memberService.updateMember(userId, userPw, name, phone, address, storeName) > 0) {
			Member member = memberService.selectMemberById(userId);
			request.setAttribute("myInfo", member);
			response.getWriter().print("available");
		} else {
			response.getWriter().print("disable");
		}
		
		
}



	//아이디 찾기 폼으로 이동
	private void lostId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/member/lost-id").forward(request, response);
		
	}

	//아이디 찾기 실행
	private void findingId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
		
	}


	//비밀번호 찾기 폼으로 이동
	private void lostPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/member/lost-pass").forward(request, response);
		
	}



	//비밀번호 바꾸기 실행
	private void changePass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
