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
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.menu.model.dto.MenuCat;
import com.kh.poss.menu.model.service.MenuService;
import com.kh.poss.order.model.dto.OrderJoin;
import com.kh.poss.order.model.dto.OrderMaster;
import com.kh.poss.order.model.service.OrderService;

@WebServlet("/order/*")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderService orderService = new OrderService();

	public OrderController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length - 1]); // 콘솔 확인용 코드 (추후 삭제 예정)

		switch (uri[uri.length - 1]) {
		case "order-impl": // 오더 실행
			orderImpl(request, response);
			break;
		case "payment":
			payment(request, response);
			break;
		case "order-list":
			orderList(request, response);
			break;
		case "modify":
			modify(request, response);
			break;
		default:
			throw new PageNotFoundException();
		}

	}

	// 확인버튼 눌러서
	// 오더가 실행되면
	private void orderImpl(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BufferedReader br = new BufferedReader(request.getReader());
		String line = "";
		String res = "";
		while ((line = br.readLine()) != null) {

			res += line;

		}

		String htmlIdx = request.getParameter("html_idx");
		String tableUUID = request.getParameter("tableUUID");
		String tableName = request.getParameter("tableName");
		int orderNum = Integer.parseInt(request.getParameter("orderNum"));

		System.out.println(res);
		Gson gson = new Gson();
		Map<String, List<Map<String, String>>> orderMap = gson.fromJson(res, HashMap.class);
		List<Map<String, String>> orderList = orderMap.get("orderList");

		OrderMaster orderMaster = new OrderMaster();
		orderMaster.setSeatHtmlIdx(htmlIdx);
		orderMaster.setTableName(tableName);
		orderMaster.setSeatUUID(tableUUID);
		orderMaster.setTodayOrderCnt(orderNum);

		System.out.println("여기");

		if (orderList == null) {

			// orderService.orderCencle(orderMaster);
			response.sendRedirect("/seat/select");
			return;
		}

		orderService.insertOrderList(orderMaster, orderList);

		response.getWriter().print("success");

	}

	private void payment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String htmlIdx = request.getParameter("html_idx");
		String tableUUID = request.getParameter("tableUUID");
		String tableName = request.getParameter("tableName");
		int orderNum = Integer.parseInt(request.getParameter("orderNum"));

		OrderMaster orderMaster = new OrderMaster();
		orderMaster.setSeatHtmlIdx(htmlIdx);
		orderMaster.setTableName(tableName);
		orderMaster.setSeatUUID(tableUUID);
		orderMaster.setTodayOrderCnt(orderNum);

	}

	private void orderList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String htmlIdx = request.getParameter("html_idx");
		System.out.println(htmlIdx);
		List<OrderJoin> orderJoinList = orderService.selectOrderList(htmlIdx);
		System.out.println(orderJoinList);

		Gson gson = new Gson();
		String json = gson.toJson(orderJoinList);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(json);

	}

	// 오더 수정시
	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String orderIdx = request.getParameter("orderIdx");
		System.out.println(orderIdx);

		List<OrderJoin> orderJoinList = orderService.selectTableOrderList(orderIdx);
		System.out.println(orderJoinList);
		

		MenuService menuService = new MenuService();
		if (orderJoinList.size() > 0) {
			Gson gson = new Gson();
			String orderJoinJson = gson.toJson(orderJoinList);
			
			String userId = ((Member) request.getSession().getAttribute("authentication")).getUserId();
			List<MenuCat> menuCatList = menuService.selectCateList(userId);

			request.setAttribute("menuCatList", menuCatList);
			request.setAttribute("orderNum", orderJoinList.get(0).getTodayOrderNum());
			request.setAttribute("orderJoinList", orderJoinJson);

		}

		request.getRequestDispatcher("/menu/menu-select").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
