package com.kh.poss.index.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.member.model.dto.Member;
import com.kh.poss.reserve.model.service.ReserveService;

@WebServlet("/index")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IndexController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("인덱스 페이지");

		Member member = (Member) request.getSession().getAttribute("authentication");
		if (member != null) {
			ReserveService reserveService = new ReserveService();
			String reservationNum = Integer.toString(reserveService.countReservation(member.getUserId()));
			request.getSession().setAttribute("reservationNum", reservationNum);
		}

		request.getRequestDispatcher("/index").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
