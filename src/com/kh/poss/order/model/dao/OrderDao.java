package com.kh.poss.order.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.menu.model.dto.Menu;
import com.kh.poss.menu.model.dto.MenuCat;
import com.kh.poss.order.model.dto.Order;
import com.kh.poss.order.model.dto.OrderJoin;
import com.kh.poss.order.model.dto.OrderMaster;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

public class OrderDao {

	JDBCTemplate template = JDBCTemplate.getInstance();

	public void insertOrderList(OrderMaster orderMaster, List<String> menuList, List<String> menuCnt, Connection conn) {

		CallableStatement cstm = null;
		ResultSet rset = null;
		String query = "{call SP_ORDERS_INSERT(?,?,?,?,?,?,?)}";

		System.out.println(orderMaster);
		try {

			// procedure의 table type은 oralce.sql.ARRAY 타입과 매핑
			cstm = conn.prepareCall(query);
			ArrayDescriptor descriptor = ArrayDescriptor.createDescriptor("MENU_IDX_ARR", conn); // 매개변수 대소문자 구분함
			ArrayDescriptor descriptor2 = ArrayDescriptor.createDescriptor("CNT_ARR", conn);
			ARRAY menuListArr = new ARRAY(descriptor, conn, menuList.toArray());
			ARRAY menuCntArr = new ARRAY(descriptor2, conn, menuCnt.toArray());
			cstm.setString(1, orderMaster.getSeatHtmlIdx());
			cstm.setString(2, orderMaster.getSeatUUID());
			cstm.setInt(3, orderMaster.getTodayOrderCnt());
			cstm.setString(4, orderMaster.getTableName());
			cstm.setArray(5, menuListArr);
			cstm.setArray(6, menuCntArr);
			cstm.setInt(7, menuList.size());

			cstm.executeUpdate();

		} catch (SQLException e) {

			throw new DataAccessException(e);

		} finally {

			template.close(rset, cstm);
		}
	}

	public int selectTodayOrderNum(String seat_html_idx, Connection conn) {

		PreparedStatement pstm = null;
		ResultSet rset = null;
		int res = 0;
		String query = "SELECT COUNT(*)+1 cnt FROM ORDER_MASTER WHERE TO_CHAR(REG_DATE , 'YY-MM-DD') = TO_CHAR(SYSDATE ,'YY-MM-DD') and seat_html_idx=?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, seat_html_idx);
			rset = pstm.executeQuery();

			while (rset.next()) {

				res = rset.getInt("cnt");

			}
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}
		return res;

	}

	public List<OrderJoin> selectOrderList(String seat_html_idx, Connection conn) {

		List<OrderJoin> orderJoinList = new ArrayList<>();

		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select order_master_idx , seat_uuid ,  cnt  , name , today_order_cnt from order_master" + " join order_list"
				+ " using(order_master_idx)" + " join menu" + " using(menu_idx)"
				+ " where seat_html_idx= ? and  payment=?"
				+ " order by order_master_idx , order_idx ";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, seat_html_idx);
			pstm.setString(2, "P00");
			rset = pstm.executeQuery();

			while (rset.next()) {
				OrderJoin orderJoin = new OrderJoin();
				orderJoin.setOrderMasterIdx(rset.getString("order_master_idx"));
				orderJoin.setSeatUuid(rset.getString("seat_uuid"));
				orderJoin.setName(rset.getString("name"));
				orderJoin.setCnt(rset.getInt("cnt"));
				orderJoin.setTodayOrderNum(rset.getString("today_order_cnt"));

				orderJoinList.add(orderJoin);

			}
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}

		return orderJoinList;
	}

	public List<OrderJoin>  selectTableOrderList(String order_master_idx, Connection conn) {

			List<OrderJoin> orderJoinList = new ArrayList<>();
			PreparedStatement pstm = null;
		     ResultSet rset = null;
		      String query = "select order_master_idx ,seat_uuid , menu_idx,  today_order_cnt , name , price, cnt from order_master " + 
		      		" join order_list" + 
		      		" using(order_master_idx)" + 
		      		" join menu" + 
		      		" using (menu_idx)" + 
		      		" where order_master_idx= ?"
		      		+ " order by order_idx";
		      try {
		    	  
		         pstm = conn.prepareStatement(query);
		         pstm.setString(1, order_master_idx);
		         rset = pstm.executeQuery();
		         
		         while(rset.next()) {
		        	 
		        	 OrderJoin orderJoin = new OrderJoin();
		        	 orderJoin.setOrderMasterIdx(rset.getString("order_master_idx"));
		        	 orderJoin.setSeatUuid(rset.getString("seat_uuid"));
		        	 orderJoin.setMenuIdx(rset.getString("menu_idx"));
		        	 orderJoin.setTodayOrderNum(rset.getString("today_order_cnt"));
		        	 orderJoin.setName(rset.getString("name"));
		        	 orderJoin.setPrice(rset.getInt("price"));
		        	 orderJoin.setCnt(rset.getInt("cnt"));
		        	 
		        	 orderJoinList.add(orderJoin);
		        	
		         
		         }
		      } catch (SQLException e) {
		         throw new DataAccessException(e);
		      } finally {
		         template.close(rset, pstm);
		      }   
		
		
		return orderJoinList;
		
		
	}

	public int orderCencle(String orderMasterIdx, Connection conn) {
	
		  int res = 0;
	      PreparedStatement pstm = null;
	      String query = "update order_master set payment = ? , title=? where order_master_idx = ?";
	            
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, "P03");  //P03 = 주문취소
	         pstm.setString(2, "주문취소");  //P03 = 주문취소
	         pstm.setString(3, orderMasterIdx);
	         
	         res = pstm.executeUpdate();
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(pstm);
	      }
	      return res;
		
	}

	
	public int DeleteOrderList(String orderMasterIdx, Connection conn) {
		 int res = 0;
	      PreparedStatement pstm = null;
	      String query = "delete order_list where order_master_idx = ?";
	            
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, orderMasterIdx);  //오더리스트 전부 삭제        
	         res = pstm.executeUpdate();
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(pstm);
	      }
	      
	      return res;
		
	}

	public void modifyOrderMaster(String orderMasterIdx, List<String> menuList, List<String> menuCnt, Connection conn) {

		CallableStatement cstm = null;
		ResultSet rset = null;
		String query = "{call SP_ORDERS_MODIFY(?,?,?,?)}";

		try {

			// procedure의 table type은 oralce.sql.ARRAY 타입과 매핑
			cstm = conn.prepareCall(query);
			ArrayDescriptor descriptor = ArrayDescriptor.createDescriptor("MENU_IDX_ARR", conn); // 매개변수 대소문자 구분함
			ArrayDescriptor descriptor2 = ArrayDescriptor.createDescriptor("CNT_ARR", conn);
			ARRAY menuListArr = new ARRAY(descriptor, conn, menuList.toArray());
			ARRAY menuCntArr = new ARRAY(descriptor2, conn, menuCnt.toArray());
			
			cstm.setString(1, orderMasterIdx);
			cstm.setArray(2, menuListArr);
			cstm.setArray(3, menuCntArr);
			cstm.setInt(4, menuList.size());

			cstm.executeUpdate();

		} catch (SQLException e) {

			throw new DataAccessException(e);

		} finally {

			template.close(rset, cstm);
		}
	}

	public int paymentCompleted(String orderMasterIdx, String option, Connection conn) {
		
		PreparedStatement pstm = null;
		int res = 0;
		String query = "update order_master set payment = ? where order_master_idx = ?";

		try {

			// procedure의 table type은 oralce.sql.ARRAY 타입과 매핑
			pstm = conn.prepareCall(query);
			pstm.setString(1, option);
			pstm.setString(2, orderMasterIdx);
			pstm.executeUpdate();

		} catch (SQLException e) {

			throw new DataAccessException(e);

		} finally {

			template.close(pstm);
		}
		
		
		return res;
	}
	
	

}
