package com.kh.poss.waiting.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.common.mms.MmsSender;
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.waiting.model.dto.Waiting;

public class WaitingDao {

	private JDBCTemplate template = JDBCTemplate.getInstance();
	Date date = new Date();

	public int insertWaiting(Waiting waiting, Connection conn) {
		int res = 0;
		long time = date.getTime();
	    java.sql.Date waitingTime = new java.sql.Date(time);
		
		PreparedStatement pstm = null;
		String query = "insert into waiting(waiting_num, user_id, phone, num, time)"
				+ " values(SC_ID2_IDX.NEXTVAL, ?, ?, ?, ?)";
		System.out.println("\n*********** DAO 실행! *************\n");
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, waiting.getUserId());
			pstm.setString(2, waiting.getPhone());
			pstm.setInt(3, waiting.getWaitingPeople());
			pstm.setDate(4, waitingTime);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}
		return res;
	}

	public int waitingCnt(Waiting waiting, Connection conn) {
		System.out.println("cnt dao 실행!");
		PreparedStatement pstm = null;
		ResultSet rset = null;
		int res = 0;
		String query = "select count(*) cnt from waiting where user_id = ? and time >= sysdate";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, waiting.getUserId());
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				res = rset.getInt("cnt")+1;
				System.out.println(res);
			}
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}
		return res;
	}

	public int confirmWaitingByMessage(HttpServletRequest request, HttpServletResponse response, String phone,
			String waitingPeopleNum) {
		
		Member member = (Member) request.getSession().getAttribute("authentication");
		String storeName = member.getStore_name();
		MmsSender.setMessage(phone, "[" + storeName + "]\n웨이팅 등록이 완료되었습니다.\n * 예약인원 : " + waitingPeopleNum + "명");
		return 1;
	}


	
	
}

