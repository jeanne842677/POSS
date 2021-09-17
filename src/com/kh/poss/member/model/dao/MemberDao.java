package com.kh.poss.member.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.member.model.dto.Member;

public class MemberDao {

	private JDBCTemplate template = JDBCTemplate.getInstance();
	//

	
	// 멤버 아이디로 멤버 정보 출력하기
	public Member selectMemberById(String userId, Connection conn) {

		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;

		String query = "select * from \"poss_user\" where \"user_id\" = ?";

		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();
			if (rset.next()) {
				member = new Member();
			
				member.setUserId(rset.getString("user_id"));
				member.setPassword(rset.getString("password"));
				member.setEmail(rset.getString("Email"));
			
				
				
			}

		} catch (SQLException e) {

			throw new DataAccessException(e);
		} finally {

			template.close(rset, pstm);

		}

		return member;
	}

	
}
