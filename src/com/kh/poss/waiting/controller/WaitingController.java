package com.kh.poss.waiting.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.waiting.model.dto.Waiting;
import com.kh.poss.waiting.model.service.WaitingService;

@WebServlet("/waiting/*")
public class WaitingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private WaitingService waitingService = new WaitingService();

	public WaitingController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length - 1]); // 콘솔 확인용 코드 (추후 삭제 예정)

		switch (uri[uri.length - 1]) {
		case "waiting-page": // 웨이팅 폼으로 이동
			waitingPage(request, response);
			break;

		case "waiting-insert": // 웨이팅 폼으로 이동
			waitingInsert(request, response);
			break;
			
		case "waiting-confirm": // 웨이팅 내역 폼으로 이동
			waitingConfirm(request, response);
			break;
		default:
			throw new PageNotFoundException();
		}

	}

	// 웨이팅 폼으로 이동
	private void waitingPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/waiting/waiting-page").forward(request, response);
	}

	// 웨이팅 정보 db에 저장
	private void waitingInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		// 웨이팅 db에 업데이트

		System.out.println("\n*********** controller 실행! *************\n");

		Member member = (Member) request.getSession().getAttribute("authentication");

		String userId = member.getUserId();
		System.out.println(userId);

		String phone = request.getParameter("phone");
		System.out.println(phone);

		String waitingPeopleNum = request.getParameter("waitingPeopleNum");
		int waitingPeople = Integer.parseInt(waitingPeopleNum);
		System.out.println(waitingPeople);
		
		Waiting waiting = new Waiting();
		waiting.setUserId(userId);
		waiting.setPhone(phone);
		waiting.setWaitingPeople(waitingPeople);
		
		int isSuccess = waitingService.insertWaiting(waiting);
		
		int waitingCnt = waitingService.waitingCnt(waiting);
		
		int isSuccessSendwaitingMessage = waitingService.confirmWaitingByMessage(request, response, phone, waitingPeopleNum);

		if (isSuccess > 0) {
			System.out.println("웨이팅 등록 성공");
			response.getWriter().print(waitingCnt);
		} else {
			System.out.println("등록 실패");
			response.getWriter().print("disable");
		}
		
		if (isSuccessSendwaitingMessage > 0) {
			System.out.println("발송 완료");
		}else {
			System.out.println("발송 실패");
		}
	}
	

	// 웨이팅 내역 폼으로 이동
	private void waitingConfirm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/waiting/waiting-confirm").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
