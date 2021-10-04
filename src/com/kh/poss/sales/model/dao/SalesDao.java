package com.kh.poss.sales.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.sales.model.dto.Sales;

public class SalesDao {
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	//메뉴 탑5 가져오기
	public Map<String,Object> selectMenuRank(String userId, String period, Connection conn) {
        Map<String,Object> rankMap = new LinkedHashMap<String,Object>();
         PreparedStatement pstm = null;
         ResultSet rset = null;
         String query = "select v.*, rownum from (select name, sum(cnt) as monthCnt from (select * from order_list o " + 
               "join menu using (menu_idx) " + 
               "join order_master using (order_master_idx) " + 
               "join seat_html using (seat_html_idx) " + 
               "where user_id = ? and to_char(o.reg_date, 'yyyy-mm') = ?) group by name order by monthCnt desc) v " + 
               "where rownum < 6";
         try {
            pstm = conn.prepareStatement(query);
            pstm.setString(1, userId);
            pstm.setString(2, period);
            rset = pstm.executeQuery();
            
            while(rset.next()) {
               String menuName = rset.getString("name");
               int totalCnt = rset.getInt("monthcnt");
               rankMap.put(menuName,totalCnt);
            }
         } catch (SQLException e) {
            throw new DataAccessException(e);
         } finally {
            template.close(rset, pstm);
         }   
         System.out.println(rankMap);
         return rankMap;
    }
	
	//결제금액
	public int selectTotalSales(String userId, String period, Connection conn) {
		  int res = 0;
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      String query = "select sum(m.price*o.cnt) as sp " + 
	      		"from menu m " + 
	      		"join order_list o using(menu_idx) " + 
	      		"join menu_cat  c using(cat_idx) " + 
	      		"join order_master v using(order_master_idx) " + 
	      		"where user_id = ? and to_char(o.reg_date, 'yyyy-mm') = ? " + 
	      		"and v.payment != 'P00' and v.payment != 'P03'";
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, userId);
	         pstm.setString(2, period);
	         rset = pstm.executeQuery();
	         
	         if(rset.next()) {
	            res = rset.getInt("sp");
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }   
	      System.out.println(res);
	      return res;
	   }
	
	//결제건수
	public int selectTotalSalesCnt(String userId, String period, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select count(*) as sc "
				+ "from order_master join seat_html using(seat_html_idx) "
				+ "where user_id = ? and to_char(reg_date, 'yyyy-mm') = ? and payment != 'P00' and payment != 'P03'";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			pstm.setString(2, period);
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				res = rset.getInt("sc");
			}
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}   
		System.out.println(res);
		return res;
	}
	
	public int selectTodaySales(String userId, Connection conn) {
		  int res = 0;
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      String query = "select sum(m.price*o.cnt) as sp " + 
		      		"from menu m " + 
		      		"join order_list o using(menu_idx) " + 
		      		"join menu_cat  c using(cat_idx) " + 
		      		"join order_master v using(order_master_idx) " + 
		      		"where user_id = ? and to_char(o.reg_date, 'yyyy-mm-dd') = to_char(CURRENT_DATE, 'yyyy-mm-dd')  " + 
		      		"and v.payment != 'P00' and v.payment != 'P03'";
	      try { 
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, userId);
	         rset = pstm.executeQuery();
	         
	         if(rset.next()) {
	            res = rset.getInt("sp");
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }   
	      System.out.println(res);
	      return res;
	   }

	
	public List<Sales> selectSalesList(String userId, String period, Connection conn) {
		  List<Sales> salesList = new ArrayList<Sales>();
		  Sales sales = null;
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      String query = "select * from (SELECT order_master_idx, sum(price*cnt) as sp FROM ORDER_MASTER " + 
	      		"JOIN SEAT_HTML USING(SEAT_HTML_IDX) " + 
	      		"JOIN ORDER_LIST USING (ORDER_MASTER_IDX) " + 
	      		"JOIN MENU USING (MENU_IDX) " + 
	      		"WHERE USER_ID = ? " + 
	      		"GROUP BY ORDER_MASTER_IDX) join (SELECT title, reg_date, payment, order_master_idx from order_master join seat_html using(seat_html_idx) " + 
	      		"where user_id = ? and to_char(reg_date, 'yyyy-mm') = ? and (payment != 'P00' and payment != 'P03')" + 
	      		") using (order_master_idx) order by order_master_idx";
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, userId);
	         pstm.setString(2, userId);
	         pstm.setString(3, period);
	         rset = pstm.executeQuery();
	         
	         while(rset.next()) {
	        	sales = new Sales();
	            sales.setOrderMasterIdx(rset.getString("order_master_idx"));
	            sales.setSumPrice(rset.getInt("sp"));
	            sales.setTitle(rset.getString("title"));
	            sales.setPayment(rset.getString("payment"));
	            sales.setRegDate(rset.getDate("reg_date"));
	            salesList.add(sales);
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }   
	      System.out.println(salesList);
	      return salesList;
	}

	public Map<String,Object> selectTodayMenu(String userId,String period, Connection conn) {
		  Map<String,Object> todayMap = new LinkedHashMap<String,Object>();
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      String query = "select sum(price*cnt) as sp, to_char(reg_date, 'yyyy-mm-dd') as dailyDate " + 
	      		"from (select order_master_idx, user_id from order_master "
	      		+ "join seat_html using (seat_html_idx) where user_id = ? and payment != 'P00' and payment != 'P03') " + 
	      		"join order_list using (order_master_idx) " + 
	      		"join menu using (menu_idx) " + 
	      		"where to_char(reg_date, 'yyyy-mm') = ? " + 
	      		"group by to_char(reg_date, 'yyyy-mm-dd') order by dailyDate";
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, userId);
	         pstm.setString(2, period);
	         rset = pstm.executeQuery();
	         
	         while(rset.next()) {
	            String dailyDate = rset.getString("dailyDate");
	            int sumPrice = rset.getInt("sp");
	            todayMap.put(dailyDate,sumPrice);
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }   
	      System.out.println("todayMap : " +todayMap);
	      return todayMap;
	   }	
	
	
}
