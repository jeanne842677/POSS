package com.kh.poss.member.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.member.model.dto.Member;
import com.kh.poss.common.exception.DataAccessException;

public class MemberDao {

	private JDBCTemplate template = JDBCTemplate.getInstance();

	public Member memberAuthenticate(String userId, String password, Connection conn) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from poss_user where user_id = ? and password = ? and is_leave = 0";
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
	
	public Member selectMemberByEm(String email, Connection conn) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from poss_user where email = ?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, email);
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

	public int updateMember(String userId, String userPw, String name, String phone, String address, String storeName, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		String query = "update poss_user set password = ?, name = ?, phone = ?, store_name = ?, address = ? where user_id = ?";
		
		System.out.println(userId + "," + userPw + "," + name + "," + phone + "," + address + "," + storeName);
		try {
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userPw);
			pstm.setString(2, name);
			pstm.setString(3, phone);
			pstm.setString(4, storeName);
			pstm.setString(5, address);
			pstm.setString(6, userId);
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}
		
		System.out.println("다오 발동");
		return res;
	}
	

	public int deleteUser(String userId, String password, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		String query = "update poss_user set is_leave = 1 where user_id = ? and password =?";

		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			pstm.setString(2, password);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			template.rollback(conn);
			e.printStackTrace();
		} finally {
			template.close(pstm);
		}
		return res;
	}
	

	public Member selectMemberByEmailAndName(String name, String email, Connection conn) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from poss_user where name=? and email = ?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, name);
			pstm.setString(2, email);
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


	public int updateMemberPass(String userId, String password, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		String query = "update poss_user set password = ? where user_id = ?";
		
		try {
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, password);
			pstm.setString(2, userId);
			
			res=pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}
		
		return res;

	}
	

	public Member selectMemberByEmailAndUserId(String userId, String email, Connection conn) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from poss_user where user_id=? and email = ?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			pstm.setString(2, email);
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




	
}

