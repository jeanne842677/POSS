package com.kh.poss.sales.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.sales.model.dto.Sales;
import com.kh.poss.sales.model.service.SalesService;

@WebServlet("/sales/*")
public class SalesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SalesService salesService = new SalesService();

	public SalesController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length - 1]); // 콘솔 확인용 코드 (추후 삭제 예정)

		switch (uri[uri.length - 1]) {
		case "confirm": // 매출 조회 확인 폼으로 이동
			confirm(request, response);

			break;
		case "detail": // 매출 내역 폼으로 이동
			detail(request, response);

			break;
		default:
			throw new PageNotFoundException();
		}

	}

	private void confirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = ((Member) request.getSession().getAttribute("authentication")).getUserId();

		//기간
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM");
		String period = format.format(time);
		if (request.getParameter("thismonth") != null) {
			period = request.getParameter("thismonth");
		}
		
		//탑 5메뉴
		Map<String, Object> rankMap = salesService.selectMenuRank(userId, period);
		String[] name = new String[rankMap.size()];
		rankMap.keySet().stream().findFirst().get();
		int[] cnt = new int[rankMap.size()];
		
		for (int i = 0; i < rankMap.size(); i++) {
			name[i] = rankMap.keySet().stream().skip(i).findFirst().get();
			cnt[i] = (int) rankMap.values().toArray()[i];
		}

		//총 판매금액
		int sales = salesService.selectTotalSales(userId, period);
		String sales2 = String.format("%,d", sales);

		//총 판매건수
		int salesCnt = salesService.selectTotalSalesCnt(userId, period);
		int avg = sales / salesCnt;
		String avg2 = String.format("%,d", avg);
		
		//오늘 판매금액
		int todaySales = salesService.selectTodaySales(userId);
		String todaySales2 = String.format("%,d", todaySales);
		
		request.setAttribute("nameArr", name);
		request.setAttribute("cntArr", cnt);
		request.setAttribute("sales", sales2);
		request.setAttribute("salesCnt", salesCnt);
		request.setAttribute("avg", avg2);
		request.setAttribute("todaySales", todaySales2);
		request.getRequestDispatcher("/sales/sales-confirm").forward(request, response);
	}

	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Member) request.getSession().getAttribute("authentication")).getUserId();
		
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM");
		String period = format.format(time);
		if (request.getParameter("thismonth") != null) {
			period = request.getParameter("thismonth");
		}
		
		//리스트
		List<Sales> salesList = salesService.selectSalesList(userId,period);
		
		//오늘 판매금액
		int todaySales = salesService.selectTodaySales(userId);
		String todaySales2 = String.format("%,d", todaySales);
		
		request.setAttribute("salesList", salesList);
		request.setAttribute("todaySales", todaySales2);
		request.getRequestDispatcher("/sales/sales-detail").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
