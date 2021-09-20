package com.kh.poss.sales.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.exception.PageNotFoundException;

@WebServlet("/sales/*")
public class SalesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SalesController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length-1]);  //콘솔 확인용 코드 (추후 삭제 예정)
		
		
		
		
		switch(uri[uri.length-1]) {
		case "confirm" :  //매출 조회 확인 폼으로 이동
			confirm(request, response);
			
			break;
		case "detail" :  //매출 내역 폼으로 이동
			detail(request, response);
			
			break;
		default : throw new PageNotFoundException();
		}
	
	}

	private void confirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		request.getRequestDispatcher("/sales/sales-confirm").forward(request, response);
		
	}
	
	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		request.getRequestDispatcher("/sales/sales-detail").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
