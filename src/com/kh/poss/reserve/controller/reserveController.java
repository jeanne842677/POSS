package com.kh.poss.reserve.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.exception.PageNotFoundException;


@WebServlet("/reserve/*")
public class reserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public reserveController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length-1]);  //콘솔 확인용 코드 (추후 삭제 예정)
		

		switch(uri[uri.length-1]) {
		case "confirm" :  //예약 내역 확인 폼으로 이동
			confirm(request, response);
			
			break;
		case "modify" :  //예약 설정 폼으로 이동
			modify(request, response);
			
			break;
		case "reservation-form" :  //고객용 예약 폼으로 이동
			form(request, response);
			break;
		case "reservation-confirm" :  //고객용 예약 확인 폼으로 이동
			resconfirm(request, response);
			break;
		case "reservation-lookup" :  //고객용 예약 조회 폼으로 이동
			lookup(request, response);
			break;
		default : throw new PageNotFoundException();
		}
	
	
	}
	
	private void confirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {

		request.getRequestDispatcher("/reserve/reserve-confirm").forward(request, response);
		
	}


	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/reserve/reserve-modify").forward(request, response);
		
	}



	//고객용 예약폼
	private void form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/reserve/reservation-form").forward(request, response);

	}

	//고객용 예약 확인폼
	private void resconfirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/reserve/reservation-confirm").forward(request, response);

		
	}

	//고객용 예약 조회폼
	private void lookup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/reserve/reservation-lookup").forward(request, response);

		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
