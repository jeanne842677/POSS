package com.kh.poss.order.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.menu.model.dto.MenuCat;
import com.kh.poss.order.model.dto.OrderMaster;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

public class OrderDao {

	
	
	JDBCTemplate template = JDBCTemplate.getInstance();
	
	public void insertOrderList(OrderMaster orderMaster,List<String> menuList, List<String> menuCnt, Connection conn) {

		CallableStatement cstm = null;
		ResultSet rset = null;
		String query = "{call SP_ORDERS_INSERT(?,?,?,?,?,?,?,?)}";
		
		System.out.println(orderMaster);
		try {
			

			// procedure의 table type은 oralce.sql.ARRAY 타입과 매핑
			cstm = conn.prepareCall(query);
			ArrayDescriptor descriptor = ArrayDescriptor.createDescriptor("BK_IDXS", conn); //이거 매개변수 대소문자 구분함
			ARRAY menuListArr = new ARRAY(descriptor , conn, menuList.toArray());
			ARRAY menuCntArr = new ARRAY(descriptor , conn, menuCnt.toArray());
			cstm.setString(1, orderMaster.getSeatHtmlIdx());
			cstm.setString(2, orderMaster.getSeatUUID());
			cstm.setInt(3, orderMaster.getTodayOrderCnt());
			cstm.setString(4, orderMaster.getTableName());
			cstm.setString(5, orderMaster.getTitle());
			cstm.setArray(6, menuListArr);
			cstm.setArray(7, menuCntArr );
			cstm.setInt(8, menuList.size());
			
			cstm.executeUpdate();
			
			


		} catch (SQLException e) {
			
			   throw new DataAccessException(e);

		} finally {
			
			template.close(rset,cstm);
		}
	}
	
	
	

	public int selectTodayOrderNum(String seat_html_idx,Connection conn) {

		      PreparedStatement pstm = null;
		      ResultSet rset = null;
		      int res = 0;
		      String query = "SELECT COUNT(*)+1 cnt FROM ORDER_MASTER WHERE TO_CHAR(REG_DATE , 'YY-MM-DD') = TO_CHAR(SYSDATE ,'YY-MM-DD') and seat_html_idx=?";
		      try {
		         pstm = conn.prepareStatement(query);
		         pstm.setString(1, seat_html_idx);
		         rset = pstm.executeQuery();
		         
		         while(rset.next()) {
		        
		        	 res = rset.getInt("cnt");

		         
		         }
		      } catch (SQLException e) {
		         throw new DataAccessException(e);
		      } finally {
		         template.close(rset, pstm);
		      }   
		      return res;
		
		
		
		
		
		
		
	}

	

}
