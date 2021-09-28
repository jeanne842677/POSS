package com.kh.poss.order.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.order.model.dto.OrderMaster;
import com.kh.poss.order.model.service.OrderService;


@WebServlet("/order/*")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderService orderService = new OrderService();
       
    public OrderController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	      String[] uri = request.getRequestURI().split("/");
	      System.out.println(Arrays.toString(uri));
	      System.out.println("날아온 url : " + uri[uri.length - 1]); // 콘솔 확인용 코드 (추후 삭제 예정)

	      switch (uri[uri.length - 1]) {
	      case "order-impl": // 오더 실행
	         orderImpl(request, response);
	         break;
	      default:
	          throw new PageNotFoundException();
	      }
	          
	          
	}


	
	
	
	
	private void orderImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		BufferedReader br = new BufferedReader(request.getReader());
		String line = "";
		String res ="";
		while((line =br.readLine())!=null) {
			
			res+=line;
			
		}
		
		String htmlIdx = request.getParameter("htmlIdx");
		String tableUUID = request.getParameter("tableUUID");
		String tableName = "지영테이블";//request.getParameter("tableName");
				
		int orderNum = Integer.parseInt(request.getParameter("orderNum"));
		
		System.out.println(res);
		Gson gson = new Gson();
		Map<String, List<Map<String, String>>> orderMap = gson.fromJson(res, HashMap.class);
		List<Map<String, String>> orderList = orderMap.get("orderList");
		
		OrderMaster orderMaster = new OrderMaster();		
		orderMaster.setSeatHtmlIdx(htmlIdx);
		orderMaster.setTableName(tableName);
		orderMaster.setSeatUUID(tableUUID);

		System.out.println("여기");
		
		if(orderList == null) {
			
			//P04로 만드는 프로시저...생성;;;
			response.sendRedirect("/seat/select");
			return;
		}
		
		
		System.out.println("여기");
		
		orderService.insertOrderList(orderMaster , orderList);
		System.out.println("여기");
		
	//	response.sendRedirect("/seat/select");
		
		
		
	}
	
	
	
	
	
	
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
