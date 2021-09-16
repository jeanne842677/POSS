package test.http;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	
	
	//로그인 후 메인페이지로 이동
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인 기능 들어갈 곳 {} 
		
		response.sendRedirect("/index");
		

		
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
		
		/* 
		//이메일 인증 로직 구현 (일부러 안지웠음) 파라미터 추가하기
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String tell = request.getParameter("tell");
		String email = request.getParameter("email");
			
		
		Member member = new Member();
		

		//멤버 세팅
		member.setUserId(userId);
		member.setPassword(password);
		member.setTell(tell);
		member.setEmail(email);

		
		//이메일 관련 인증
		memberService.authenticateByEmail(member);
		
		//여긴 나중에 수정할 것
		request.setAttribute("msg", "이메일이 발송되었습니다.");
		request.setAttribute("url", "/index");
		request.getRequestDispatcher("/error/result").forward(request, response);
		
		*/
		
		//위 기능 구현 전 임시로 로그인창으로 보내는 리다이렉트
		response.sendRedirect("/member/login-form");
		
		
	}


	//아이디 체크 
	private void checkID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		// fetch로 받음 PrintWriter로 보낼 것
		
		
	}

	//이메일 인증
	private void joinImpl(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		
		//이메일 인증 구현 {}
		
		response.sendRedirect("/member/login-form");
			

		
		
		
	}


	private void mypage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.getRequestDispatcher("/member/mypage").forward(request, response);
		
		
	}

	




	private void modifyInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("modify Info 실행");
		//도와주세요
		//도와주세요
		//도와주세요
		//도와주세요
		//도와주세요
		//도와주세요
		//도와주세요
		//도와주세요
		//도와주세요
		//도와주세요
		//도와주세요
		
		request.getRequestDispatcher("/member/modify-info").forward(request, response);
		
	}

	
	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//내정보 db에 업데이트(구현해야함)
		
		
		
		
		
		//내정보 페이지로 redirect

		response.sendRedirect("/member/mypage");
			
		
		
	}



	//아이디 찾기 폼으로 이동
	private void lostId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/member/lost-id").forward(request, response);
		
	}

	//아이디 찾기 실행
	private void findingId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		
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
