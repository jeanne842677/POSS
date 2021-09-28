package com.kh.poss.order.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.menu.model.dto.MenuCat;
import com.kh.poss.order.model.dao.OrderDao;
import com.kh.poss.order.model.dto.OrderMaster;


public class OrderService {

	JDBCTemplate template = JDBCTemplate.getInstance();
	OrderDao orderDao = new OrderDao(); 
	
	
	//아직 미완성
	public int insertOrderList(OrderMaster orderMaster,List<Map<String, String>> orderList) {
		Connection conn = template.getConnection();
		int res = 0;
		List<String> menuList = new ArrayList<>();
		List<String> menuCnt = new ArrayList<>();
		String orderTitle = "";
		
		
		System.out.println("서비스: 오더리스트 : " +orderList);
		for(Map<String, String > map : orderList) {
			menuList.add(map.get("menuIdx"));
			menuCnt.add(map.get("menuCnt"));
			
			
			
		}
		
		System.out.println("메뉴 리스트: " + menuList);
		System.out.println("메뉴 cnt: " + menuCnt);
		 
		
		if(orderList.size()>0) {
			orderTitle = orderList.get(0).get("menuIdx") + "외 " + orderList.size() +"건";
		}else {
			orderTitle = "주문취소";
		}
		
		orderMaster.setTitle(orderTitle);
		
		System.out.println("오더 타이틀: " + orderTitle);
		try {

			orderDao.insertOrderList(orderMaster ,menuList , menuCnt ,conn);
			
			
			
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		return res;
		
		
		
		
	}
	
	
	
	

	public int selectTodayOrderNum(String seat_html_idx) {

		
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = orderDao.selectTodayOrderNum(seat_html_idx , conn);
		} finally {
			template.close(conn);
		}
		return res;
	}

	
	
	
	
	
	
	
	
	
	
	

}
