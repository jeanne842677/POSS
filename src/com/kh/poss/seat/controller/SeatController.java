package com.kh.poss.seat.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.reserve.controller.reserveController;
import com.kh.poss.reserve.model.dto.Reserve;
import com.kh.poss.reserve.model.service.ReserveService;
import com.kh.poss.seat.model.dto.SeatHTML;
import com.kh.poss.seat.model.service.SeatService;
import com.kh.poss.waiting.model.dto.Waiting;
import com.kh.poss.waiting.model.service.WaitingService;

@WebServlet("/seat/*")
public class SeatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SeatService seatService = new SeatService();
	
	public SeatController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length - 1]);

		switch (uri[uri.length - 1]) {
		case "select": // 테이블 선택	
			select(request,response);
			break;
		case "modify": // 테이블 수정
			modify(request,response);
			break;
		case "save-modify" ://테이블 수정 저장버튼
			saveModify(request, response);
			break;
		default:
			throw new PageNotFoundException();
			

		}

	}

	

	//포스 버튼 눌렀을 때 (테이블 선택 창)
	private void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member member = (Member)request.getSession().getAttribute("authentication");
		String userId = member.getUserId(); 
		List<SeatHTML> seatList = seatService.selectSeatList(userId);
		
		
		WaitingService waitingService = new WaitingService();
		List<Waiting> waitingList = waitingService.selectTodayWaiting(userId);
		
		
		System.out.println("웨이팅 리스트: " + waitingList);
		
		request.setAttribute("waitingList", waitingList);
		SimpleDateFormat form = new SimpleDateFormat("HH:mm");
		
		List<String> timeList = new ArrayList<>(); 
		for(Waiting waiting : waitingList) {
			String hour = form.format(waiting.getTime());
			timeList.add(hour);
		}
		
		request.setAttribute("timeList", timeList );
		
		
		
		if(seatList.size()==0 ) {
			
			SeatHTML seat = new SeatHTML();
			seat.setFloor("1층");
			seat.setTableHtml(""); //만약 테이블이 없는 경우
			seat.setUserId(userId);
			request.setAttribute("tableHtml", seat);
			seatService.saveHtml(seat);
			
		}else {
			request.setAttribute("tableHtml", seatList.get(0));
			
		}
		
		
		request.getRequestDispatcher("/seat/select-seat").forward(request, response);
		
		
	}

	
	//수정버튼 눌렀을 때 
	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member member = (Member)request.getSession().getAttribute("authentication");
		List<SeatHTML> seatList = seatService.selectSeatList(member.getUserId());
		request.setAttribute("tableHtml", seatList.get(0));
		
		request.getRequestDispatcher("/seat/seat-modify").forward(request, response) ;
		
	}
	
	
	//수정버튼 눌렀을 때 
	private void saveModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//post로 넘어온 body읽기
		String html = seatService.jsonParse(request.getInputStream());

		Member member = (Member)request.getSession().getAttribute("authentication");
		String userId = member.getUserId(); 
		SeatHTML seat = new SeatHTML();
		seat.setFloor("1층");
		seat.setTableHtml(html);
		seat.setUserId(userId);
		
		seatService.saveHtml(seat); //html db에 저장하기
		

		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
