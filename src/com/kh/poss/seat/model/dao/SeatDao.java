package com.kh.poss.seat.model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.seat.model.dto.Seat;

public class SeatDao {

	

	private JDBCTemplate template = JDBCTemplate.getInstance();
	/*
	public int insertSeat(Seat seat, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		String query = "insert into seat(seat_idx,user_id,floor,table_html)"
				+ " values(sc_seat_idx.nextval, ?, ?, ?)";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, seat.getUserId());
			pstm.setString(2, seat.getFloor());
			pstm.setString(3, seat.getTableHtml());
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}
		return res;
	}
	
	public int modifySeat(Seat seat, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		String query = "update seat set floor=?, table_html=? where seat_idx =?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, seat.getFloor());
			pstm.setString(2, seat.getTableHtml());
			pstm.setString(3, seat.getTableIdx());
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}
		return res;
	}
	*/
	
	//html save하기
	public void saveHtml(Seat seat, Connection conn) {
		
		CallableStatement cstm = null;
		String query = "{call SP_SAVE_HTML(?,?,?)}";
		

		try {
			cstm = conn.prepareCall(query);
			cstm.setString(1, seat.getUserId());
			cstm.setString(2, seat.getFloor());
			cstm.setString(3, seat.getTableHtml());
			cstm.executeUpdate();
			
			
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			
			template.close(cstm);
			
		}
		
		
		
	}
	

	 public List<Seat> selectSeatList(String userId, Connection conn) {
	      List<Seat> seatList = new ArrayList<Seat>();
	      PreparedStatement pstm = null;
	      ResultSet rset = null;
	      
	      String query = "select * from seat where user_id = ? order by seat_idx";
	      try {
	         pstm = conn.prepareStatement(query);
	         pstm.setString(1, userId);
	         rset = pstm.executeQuery();
	         while(rset.next()) {
	            Seat seat = new Seat(); 
	            seat.setFloor( rset.getString("floor"));
	            seat.setTableHtml(rset.getString("table_html"));
	            seat.setTableIdx(rset.getString("seat_idx"));
	            seat.setUserId(rset.getString("user_id"));
	            seatList.add(seat);
	         }
	      } catch (SQLException e) {
	         throw new DataAccessException(e);
	      } finally {
	         template.close(rset, pstm);
	      }   
	      return seatList;
	   }
	

}
