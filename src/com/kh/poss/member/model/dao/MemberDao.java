package com.kh.poss.member.model.dao;


import com.kh.poss.common.db.JDBCTemplate;


import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.member.model.dto.Member;

public class MemberDao {

	private JDBCTemplate template = JDBCTemplate.getInstance();


	public Member memberAuthenticate(String userId, String password, Connection conn) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from \"poss_user\" where \"user_id\" = ? and \"password\" = ?";

		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			pstm.setString(2, password);
			rset = pstm.executeQuery();

			if (rset.next()) {
				member = convertAllToMember(rset);
			}
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}
		return member;
	}
	
	public Member selectMemberById(String userId, Connection conn) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;

		String query = "select * from poss_user where user_id = ?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				member = convertAllToMember(rset);
			}
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}
		return member;
	}
	
	public int insertMember(Member member, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		String query = "insert into poss_user(user_id,password,name,phone,store_name,address,email)"
				+ " values(?, ?, ?, ?, ?, ?, ?)";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, member.getUserId());
			pstm.setString(2, member.getPassword());
			pstm.setString(3, member.getName());
			pstm.setString(4, member.getPhone());
			pstm.setString(5, member.getStore_name());
			pstm.setString(6, member.getAddress());
			pstm.setString(7, member.getEmail());
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}
		return res;
	}
	
	private Member convertAllToMember(ResultSet rset) throws SQLException {
		Member member = new Member();
		member.setUserId(rset.getString("user_id"));
		member.setPassword(rset.getString("password"));
		member.setName(rset.getString("name"));
		member.setPhone(rset.getString("phone"));
		member.setStore_name(rset.getString("store_name"));
		member.setAddress(rset.getString("address"));
		member.setEmail(rset.getString("email"));
		member.setReg_date(rset.getDate("reg_date"));
		member.setIs_leave(rset.getInt("is_leave"));
		return member;
	}
>>>>>>> branch 'main' of https://github.com/sazzeo/poss-project
	
}
