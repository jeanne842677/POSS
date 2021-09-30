package com.kh.poss.waiting.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
			waitingConfirmPage(request, response);
			break;
			
		case "waiting-search": // 웨이팅 내역 폼으로 이동
			waitingSearch(request, response);
			break;
		case "update": // 웨이팅 완료
			update(request, response);
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
		String phone = request.getParameter("phone");
		String waitingPeopleNum = request.getParameter("waitingPeopleNum");
		int waitingPeople = Integer.parseInt(waitingPeopleNum);
		
		Waiting waiting = new Waiting();
		waiting.setUserId(userId);
		waiting.setPhone(phone);
		waiting.setWaitingPeople(waitingPeople);
		
		int isSuccess = waitingService.insertWaiting(waiting);
		int waitingCnt = waitingService.waitingCnt(waiting);
		int time = (waitingService.waitingCnt(waiting))*15;
		
		String team = Integer.toString(waitingCnt);
		String estimatedTime = Integer.toString(time);
		request.getSession().setAttribute("team", team);
		request.getSession().setAttribute("estimatedTime", estimatedTime);
		
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
	private void waitingConfirmPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    Member member = (Member) request.getSession().getAttribute("authentication");
	    String userId = member.getUserId();
		List<Waiting> waitingList = waitingService.selectWaitingList(userId);
		
		request.setAttribute("waitingList", waitingList);
		
		List<String> timeList = new ArrayList<>();
		
		for(Waiting w : waitingList) {
			Date time = w.getTime();
			SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/dd HH:mm");
			String dateFormat = format.format(time);
			timeList.add(dateFormat);
		}
		
		System.out.println(timeList);
		request.setAttribute("timeList", timeList);
		
		request.getRequestDispatcher("/waiting/waiting-confirm").forward(request, response);


	}

	
	
	private void waitingSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member member = (Member) request.getSession().getAttribute("authentication");
		String userId = member.getUserId();
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		
		try {
			c.setTime(sdf.parse(end));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		end = sdf.format(c.getTime());
		c.add(Calendar.DATE, 1);   //하루 더하기
		String end_date = sdf.format(c.getTime());
		System.out.println(end_date);

		List<Waiting> searchWaitingList = waitingService.searchWaitingList(userId,start,end_date);

		request.setAttribute("searchWaitingList", searchWaitingList);

		List<String> searchTimeList = new ArrayList<>();

		for (Waiting w : searchWaitingList) {
			Date time = w.getTime();
			SimpleDateFormat format = new SimpleDateFormat("YYYY/MM/dd HH:mm");
			String dateFormat = format.format(time);
			searchTimeList.add(dateFormat);
		}

		System.out.println("searchTimeList : " +searchTimeList);
		request.setAttribute("searchTimeList", searchTimeList);

		request.getRequestDispatcher("/waiting/waiting-confirm").forward(request, response);
		
	}
	

	private void update(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException  {

		String waitingNum = request.getParameter("waitingNum");
		waitingService.updateWaiting(waitingNum);
		
		
	}

	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
