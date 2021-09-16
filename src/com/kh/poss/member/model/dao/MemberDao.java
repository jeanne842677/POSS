package com.kh.poss.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;
import com.kh.poss.member.model.dto.Member;

public class MemberDao {

	private JDBCTemplate template = JDBCTemplate.getInstance();

	// 멤버 정보 넣기
	public Member memberAuthenticate(String userId, String password, Connection conn) {

		Member member = null;

		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from member where user_id = ? and password = ?";

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

	
	
	// 멤버 아이디로 멤버 정보 출력하기
	public Member selectMemberById(String userId, Connection conn) {

		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;

		String query = "select * from member where user_id = ?";

		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
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

	public List<Member> selectMemberList(Connection conn) {

		
		List<Member> memberList = new ArrayList<Member>();

		Statement stmt = null;
		ResultSet rset = null;

		String query = "select * from member";
		
		try {
			
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				Member member = convertAllToMember(rset);
				String[] column = { "user_id", "password", "email", "grade", "tell", "reg_Date", "rentable_Date",
						"is_leave" };

				member = convertRowToMember(column, rset);

				memberList.add(member);

			}
	

		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {

			template.close(rset, stmt);
		}
		return memberList;
	}

	public int insertMember(Member member, Connection conn) {
		int res = 0;

		PreparedStatement pstm = null;
		String query = "insert into member(user_id,password, email , tell) " + "values(? ,? ,? ,?)";

		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, member.getUserId());
			pstm.setString(2, member.getPassword());
			pstm.setString(3, member.getEmail());
			pstm.setString(4, member.getTell());
			res = pstm.executeUpdate();

		}catch (SQLException e) {
			throw new DataAccessException(e);
			
		} finally {
			template.close(pstm);

		}

		return res;
	}

	
	
	public int updateMemberPassword(String userId, String password, Connection conn) throws SQLException {
		int res = 0;

		PreparedStatement pstm = null;
		String query = "update member set password = ? where user_Id = ? ";

		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, password);
			pstm.setString(2, userId);
			res = pstm.executeUpdate();

		} finally {
			template.close(pstm);

		}

		return res;
	}

	public int deleteMember(String userId, Connection conn) throws SQLException {
		int res = 0;

		PreparedStatement pstm = null;
		String query = "delete from member where user_id = ?";

		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			res = pstm.executeUpdate();

		} finally {

			template.close(pstm);

		}

		return res;
	}

	// membertable에 회원정보 담기
	private Member convertAllToMember(ResultSet rset) {

		Member member = new Member();

		try {

			member.setUserId(rset.getString("user_id"));
			member.setPassword(rset.getString("password"));
			member.setEmail(rset.getString("Email"));
			member.setGrade(rset.getString("Grade"));
			member.setTell(rset.getString("tell"));
			member.setRegDate(rset.getDate("reg_date"));
			member.setRentableDate(rset.getDate("rentable_date"));
			member.setIsLeave(rset.getInt("is_leave"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return member;

	}

	private Member convertRowToMember(String[] columns, ResultSet rset) throws SQLException {
		Member member = new Member();

		for (String s : columns) {
			String column = s.toLowerCase(); // 전부 소문자로 만들기
			// column = s.trim(); //공백 자르기

			switch (column) {
			case "user_id":
				member.setUserId(rset.getString("user_id"));
				break;
			case "password":
				member.setPassword(rset.getString("password"));
				break;
			case "email":
				member.setEmail(rset.getString("Email"));
				break;
			case "grade":
				member.setGrade(rset.getString("Grade"));
				break;
			case "tell":
				member.setTell(rset.getString("tell"));
				break;
			case "reg_date":
				member.setRegDate(rset.getDate("reg_date"));
				break;
			case "rentable_date":
				member.setRentableDate(rset.getDate("rentable_date"));
				break;
			case "is_leave":
				member.setIsLeave(rset.getInt("is_leave"));
				break;
			default:
				throw new SQLException("부적절한 컬럼명"); // 예외처리
			}

		}

		return member;

	}

}
