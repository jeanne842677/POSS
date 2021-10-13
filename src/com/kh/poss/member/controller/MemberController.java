package com.kh.poss.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.kh.poss.common.code.ErrorCode;
import com.kh.poss.common.exception.HandleableException;
import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.member.model.service.MemberService;
import com.kh.poss.reserve.model.service.ReserveService;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   private MemberService memberService = new MemberService();
   private ReserveService reserveService = new ReserveService();
   
   public MemberController() {
      super();

   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String[] uri = request.getRequestURI().split("/");
      System.out.println(Arrays.toString(uri));
      System.out.println("날아온 url : " + uri[uri.length - 1]); // 콘솔 확인용 코드 (추후 삭제 예정)

      switch (uri[uri.length - 1]) {
      case "login-form": // 로그인 폼으로 이동
         loginForm(request, response);
         break;
      case "login": // 로그인 후 메인페이지로 이동
         login(request, response);
         break;

      case "kakao-login": // 로그인 후 메인페이지로 이동
         kakaoLogin(request, response);
         break;
      case "logout": // 로그 아웃 후 로그인폼으로 이동
         logout(request, response);
         break;
      case "join-form": // 회원가입 폼으로 이동
         joinFrom(request, response);
         break;
      case "kakao-join": // 카카오계정으로 회원가입 폼으로 이동
         kakaoJoin(request, response);
         break;

      case "join":
         join(request, response);
         break;
      case "id-check":
         checkID(request, response);
         break;
      case "email-check":
         checkEmail(request, response);
         break;
      case "joinImpl":
         joinImpl(request, response);
         break;
      case "mypage":
         mypage(request, response);
         break;
      case "modify-info": // 내정보 폼으로 이동
         modifyInfo(request, response);
         break;
      case "modify":
         modify(request, response); // 내 정보가 수정됐을 시 수행하는 메소드
         break;
      case "lostid": // 아이디 찾기 폼으로 이동
         lostId(request, response);
         break;
      case "finding-user": // 아이디 찾기 실행
         findingUser(request, response);
         break;
      case "finding-id-email-auth": // 아이디 찾기 실행
         findingIdEmailAuth(request, response);
         break;
      case "finding-id-and-email":
         findingIdAndEmail(request, response);
         break;
      case "choose-finding-id":
         chooseFindingId(request, response);
         break;
      case "lostpass": // 비밀번호 찾기 폼으로 이동
         lostPass(request, response);
         break;
      case "finding-pass": // 비밀번호 찾기 실행시
         findingPass(request, response);
         break;
      case "change-pass": // 비밀번호 폼으로 이동
         changePass(request, response);
         break;
      case "chang-pass-impl":// 비밀번호 바꾸기 실행
         changePassImpl(request, response);
         break;
      case "deleteUser": // 회원 탈퇴
         deleteUser(request, response);
         break;
      case "info-page": // 인포페이지
          infoPage(request, response);
          break;
      default:
         throw new PageNotFoundException();

      }

   }

   // 로그인 폼으로 이동
   private void loginForm(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.getSession().removeAttribute("userId");
      request.getSession().removeAttribute("reg_date");
      request.getRequestDispatcher("/member/login-form").forward(request, response);

   }

   
   // 로그인 기능
   // 로그인 후 메인페이지로 이동
   private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String userId = request.getParameter("userId");
      String password = request.getParameter("password");
      Member member = memberService.memberAuthenticate(userId, password);
    
      request.getSession().setAttribute("authentication", member);
   
      // 1. DataBase 또는 Service단에서 문제가 생겨서 예외가 발생
      // 2. 사용자가 잘못된 아이디와 비밀번호를 입력한 경우
      // 사용자에게 아이디나 비밀번호가 틀렸음을 알림

      if (member == null) {
         response.getWriter().print("disable");
      } else {
         response.getWriter().print("available");
      }
      
      

   }

   

   private void kakaoLogin(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String password = "kakaopw123!";
		Member member = memberService.memberAuthenticate(userId, password);

		request.getSession().setAttribute("authentication", member);

		// 1. DataBase 또는 Service단에서 문제가 생겨서 예외가 발생
		// 2. 사용자가 잘못된 아이디와 비밀번호를 입력한 경우
		// 사용자에게 아이디나 비밀번호가 틀렸음을 알림

		if (member == null) {
			response.getWriter().print("disable");
		} else {
			response.getWriter().print("available");
		}

		String reservationNum = Integer.toString(reserveService.countReservation(member.getUserId()));

		request.getSession().setAttribute("reservationNum", reservationNum);

   }

   // 로그아웃 후 메인페이지로 이동
   private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      request.getSession().removeAttribute("authentication");
      response.sendRedirect("/member/login-form");

   }

   // 조인 폼으로 이동
   private void joinFrom(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.getRequestDispatcher("/member/join-form").forward(request, response);

   }

   // 카카오 회원가입 폼으로 이동
   private void kakaoJoin(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	  
	  String userId = request.getParameter("userId");
	  request.getSession().setAttribute("kakaoId", userId);
	  
      request.getRequestDispatcher("/member/kakao-join").forward(request, response);

   }

   // 회원 가입 버튼을 눌렀을 때
   private void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String userId = request.getParameter("userId");
      String password = "";
      
		if (request.getParameter("password") == null) {
			password = UUID.randomUUID().toString().substring(0,12)+"a1!";
		} else {
			password = request.getParameter("password");
		}
		
		if(userId ==null) {
			userId = (String) request.getSession().getAttribute("kakaoId");
		}

      String name = request.getParameter("name");
      String phone = request.getParameter("phone");
      String email = request.getParameter("email");
      String store_name = request.getParameter("storeName");
      String address = request.getParameter("address") + " " + request.getParameter("detailAddress") + "("
            + request.getParameter("postCode") + ")";
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

   // 아이디 체크
   private void checkID(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
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

   // 이메일 체크
   private void checkEmail(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
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

   // 이메일 인증
   private void joinImpl(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      HttpSession session = request.getSession();

      Member member = (Member) session.getAttribute("persistUser");
      request.getSession().removeAttribute("kakaoId");
      memberService.insertMember(member);
      session.removeAttribute("persistToken");
      session.removeAttribute("persistUser");
      response.sendRedirect("/member/login-form");
   }

   private void mypage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String userId = request.getParameter("userId");
      Member member = memberService.selectMemberById(userId);

      if (member == null) {
         response.sendRedirect("/member/login-form");
         return;
      }

      String[] splitAddress = member.getAddress().split("\\(");

      request.getSession().setAttribute("addressNum", splitAddress[1].replaceAll("\\)", ""));
      request.getSession().setAttribute("detailAddress", splitAddress[0]);

      request.getRequestDispatcher("/member/mypage").forward(request, response);

   }

   private void modifyInfo(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      System.out.println("modify Info 실행");

      request.getRequestDispatcher("/member/modify-info").forward(request, response);

   }

   private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	  String url = "";
	  
      // 내정보 db에 업데이트(구현해야함)
      String userId = request.getParameter("id");
      String userPw = request.getParameter("password");
      String name = request.getParameter("name");
      String phone = request.getParameter("phone");
      String address = request.getParameter("storeDetailAddress") + "(" + request.getParameter("storeAddress") + ")";
      String storeName = request.getParameter("storeName");

      if (memberService.updateMember(userId, userPw, name, phone, address, storeName) > 0) {
         Member member = memberService.selectMemberById(userId);
         request.getSession().setAttribute("authentication", member);
         url = "/member/mypage?userId=" + member.getUserId();
         response.sendRedirect(url);
      } else {
    	  response.sendRedirect("/member/modify-info");
      }

   }

   // 회원탈퇴
   private void deleteUser(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      System.out.println("탈퇴 실행");
      String userId = ((Member) request.getSession().getAttribute("authentication")).getUserId();
      String password = request.getParameter("password");
      if (memberService.deleteUser(userId, password) > 0) {
         request.getSession().removeAttribute("authentication");
         System.out.println("\n탈퇴 처리가 완료되었습니다.");
         response.getWriter().print("available");
      } else {
         System.out.println("\n탈퇴 처리에 실패하였습니다.");
         response.getWriter().print("disable");
      }

   }

   // 아이디 찾기 폼으로 이동
   private void lostId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.getRequestDispatcher("/member/lost-id").forward(request, response);

   }

   // 아이디 찾기 실행
   private void findingUser(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String name = request.getParameter("name");
      String email = request.getParameter("email");
      String userId = request.getParameter("userId");
      Member member = null;
      String type = "";

      System.out.println(name);
      System.out.println(email);
      System.out.println(userId);
      if (userId == null) {
         member = memberService.selectMemberByEmailAndName(name, email);
         type = "findingId";
         System.out.println("아이디 찾기 실행");
      }

      if (name == null) {
         member = memberService.selectMemberByEmailAndUserId(userId, email);
         type = "findingPassword";
         System.out.println("비밀번호 찾기 실행");
      }

      PrintWriter pw = response.getWriter();
      if (member == null) {

         pw.print("failed");
         return;

      }

      String persistToken = UUID.randomUUID().toString();
      persistToken = persistToken.substring(0, 6).toUpperCase(); // 6자리 인증번호 생성
      System.out.println("findingId메소드:" + member);

      request.getSession().setAttribute("persistToken", persistToken); // 세션에 토큰 저장

      memberService.idFindByEmail(member, persistToken, type);

      pw.print("successful");

   }

   // 아이디 찾기 이메일 인증 실행

   private void findingIdEmailAuth(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      System.out.println("인증 실행");
      String persistToken = (String) request.getSession().getAttribute("persistToken");
      String clientToken = request.getParameter("clientToken");
      PrintWriter pw = response.getWriter();

      if (persistToken == null) {

         pw.print("noToken");
         return;
      }

      if (persistToken.equals(clientToken)) {

         request.getSession().removeAttribute("persistToken");

         pw.print("tokenCorrespond"); // 토큰 일치
      } else {

         pw.print("tokenDifferent"); // 토큰 불일치

      }

   }

   private void findingIdAndEmail(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String name = request.getParameter("name");
      String email = request.getParameter("email");
      Member member = memberService.selectMemberByEmailAndName(name, email);

      if (member == null) {
         throw new HandleableException(ErrorCode.USER_INFORMATION_NOT_FOUND); // 회원이 인증코드 전송 후 이메일이나 아이디 수정시 발생하는 에러창

      } else {

         request.getSession().setAttribute("userId", member.getUserId());
         request.getSession().setAttribute("reg_date", member.getReg_date());
         response.sendRedirect("/member/choose-finding-id");

      }

   }

   private void chooseFindingId(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.getRequestDispatcher("/member/select-user-id-form").forward(request, response);

   }

   // 비밀번호 찾기 폼으로 이동
   private void lostPass(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.getRequestDispatcher("/member/lost-pass").forward(request, response);

   }

   private void findingPass(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String userId = request.getParameter("userId");
      String email = request.getParameter("email");

      Member member = memberService.selectMemberByEmailAndUserId(userId, email);
      request.getSession().setAttribute("userId", member.getUserId());

      response.sendRedirect("/member/change-pass");

   }

   // 비밀번호 바꾸기 폼으로 이동
   private void changePass(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.getRequestDispatcher("/member/change-pass").forward(request, response);

   }

   // 비밀번호 바꾸기 실행
   private void changePassImpl(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String userId = (String) request.getSession().getAttribute("userId");
      String password = request.getParameter("password");
      int res = memberService.updateMemberPass(userId, password);
      if (res > 0) {

         response.getWriter().print("complete");

      } else {
         response.getWriter().print("incomplete");
      }

      request.getSession().removeAttribute("userId");

   }
   
   
   private void infoPage(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
	   request.getRequestDispatcher("/member/info-page").forward(request, response);
		
	}


   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doGet(request, response);
   }

}