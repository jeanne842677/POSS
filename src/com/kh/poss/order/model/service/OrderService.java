package com.kh.poss.order.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.menu.model.dto.Menu;
import com.kh.poss.menu.model.dto.MenuCat;
import com.kh.poss.order.model.dao.OrderDao;
import com.kh.poss.order.model.dto.Order;
import com.kh.poss.order.model.dto.OrderJoin;
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
		
		
		for(Map<String, String > map : orderList) {
			menuList.add(map.get("menuIdx"));
			menuCnt.add(map.get("menuCnt"));
			
			
		}
		
		 
		
	
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
	
	
	
	public List<OrderJoin> selectOrderList(String seat_html_idx ) {

		Connection conn = template.getConnection();
		List<OrderJoin> orderJoinList = null;
		
		try {
			
			orderJoinList = orderDao.selectOrderList( seat_html_idx ,conn);
			
		} finally {
			template.close(conn);
		}
		
		return orderJoinList;
		
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



	public List<OrderJoin> selectTableOrderList(String order_master_idx) {
		
		Connection conn = template.getConnection();
		List<OrderJoin> orderJoinList = null;
		
		try {
			
			orderJoinList= orderDao.selectTableOrderList( order_master_idx ,conn);
			
		} finally {
			template.close(conn);
		}
		
		
		
		return orderJoinList;
	}



	//오더 취소시
	public int orderCencle(String orderMasterIdx) {

		Connection conn = template.getConnection();

		int res = 0;
		try {
			
			res = orderDao.orderCencle(orderMasterIdx , conn); //오더 정보를 취소로 바꿈
			orderDao.DeleteOrderList(orderMasterIdx, conn); //오더 리스트 내역 삭제
			
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		return res;
		
		
		
	}



	public int modifyOrderMaster(String orderMasterIdx , List<Map<String, String>> orderList) {
		Connection conn = template.getConnection();

		int res = 0;
		
		List<String> menuList = new ArrayList<>();
		List<String> menuCnt = new ArrayList<>();
		
		for(Map<String, String > map : orderList) {
			menuList.add(map.get("menuIdx"));
			menuCnt.add(map.get("menuCnt"));
			
			
			
		}
		
		try {
			
			orderDao.DeleteOrderList(orderMasterIdx, conn); //오더 리스트 내역 삭제
			orderDao.modifyOrderMaster(orderMasterIdx, menuList, menuCnt , conn);
			
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		return res;
		
		
	}



	public int paymentCompleted(String orderMasterIdx, String option) {

		Connection conn = template.getConnection();

		int res = 0;
		
		try {
			
			res = orderDao.paymentCompleted(orderMasterIdx, option ,conn); 
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		return res;
		
		
	}
	
	

	


	
	
	
	
	
	
	
	

}
