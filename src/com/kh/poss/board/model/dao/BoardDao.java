package com.kh.poss.board.model.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.poss.board.model.dto.Board;
import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;


public class BoardDao {

   private JDBCTemplate template = JDBCTemplate.getInstance();
   Date date = new Date();

   public int insertBoard(Board board, Connection conn) {
      int res = 0;
      long time = date.getTime();
       java.sql.Date date1 = new java.sql.Date(time);
      PreparedStatement pstm = null;
      String query = "insert into board(board_idx,user_id,title,board_content,writer,board_pw,reg_date,board_private,board_no)"
            + " values(sc_board_idx.nextval,?, ?, ?, ?, ?, ?, ?, (select board_no from poss_user where user_id = ?))";
      try {
         pstm = conn.prepareStatement(query);
         pstm.setString(1, board.getUserId());
         pstm.setString(2, board.getTitle());
         pstm.setString(3, board.getBoardContent());
         pstm.setString(4, board.getWriter());
         pstm.setString(5, board.getBoardPw());
         pstm.setDate(6, date1);
         pstm.setInt(7, board.getBoardPrivate());
         pstm.setString(8, board.getUserId());
         
         res = pstm.executeUpdate();
      } catch (SQLException e) {
         throw new DataAccessException(e);
      } finally {
         template.close(pstm);
      }
      return res;
   }

   public List<Board> selectBoardList(String userId, Connection conn) {
      List<Board> boardList = new ArrayList<Board>();
      Board board = null;
      PreparedStatement pstm = null;
      ResultSet rset = null;
      String query = "select * from board where user_id = ? order by board_no desc";
      try {
         pstm = conn.prepareStatement(query);
         pstm.setString(1, userId);
         rset = pstm.executeQuery();
         
         while(rset.next()) {
            board = convertAllToBoard(rset);
            boardList.add(board);
         }
      } catch (SQLException e) {
         throw new DataAccessException(e);
      } finally {
         template.close(rset, pstm);
      }   
      System.out.println(boardList);
      return boardList;
   }
   
   public List<Board> searchBoardList(String userId, String searchKeyword,Connection conn) {
      List<Board> searchList = new ArrayList<Board>();
      Board board = null;
      PreparedStatement pstm = null;
      ResultSet rset = null;
      String query = "select * from board where user_id = ? and title like ? order by board_no desc";
      try {
         pstm = conn.prepareStatement(query);
         pstm.setString(1, userId);
         pstm.setString(2, "%" + searchKeyword + "%");
         rset = pstm.executeQuery();
         
         while(rset.next()) {
            board = convertAllToBoard(rset);
            searchList.add(board);
         }
      } catch (SQLException e) {
         throw new DataAccessException(e);
      } finally {
         template.close(rset, pstm);
      }   
      System.out.println(searchList);
      return searchList;
   }
   
   public Board selectBoardDetail(String userId, String boardIdx, Connection conn) {
      Board board = null;
      PreparedStatement pstm = null;
      ResultSet rset = null;
      String query = "select * from board where user_id = ? and board_idx = ?";
      try {
         pstm = conn.prepareStatement(query);
         pstm.setString(1, userId);
         pstm.setString(2, boardIdx);
         rset = pstm.executeQuery();
         
         while(rset.next()) {
            board = convertAllToBoard(rset);
         }
      } catch (SQLException e) {
         throw new DataAccessException(e);
      } finally {
         template.close(rset, pstm);
      }   
      System.out.println(board);
      return board;
   }

   public int modifyBoard(Board board, Connection conn) {
      int res = 0;
      PreparedStatement pstm = null;
      String query = "update board set writer=?, title=?, board_content=?, board_private=?, board_pw=? where board_idx=?";
            
      try {
         pstm = conn.prepareStatement(query);
         pstm.setString(1, board.getWriter());
         pstm.setString(2, board.getTitle());
         pstm.setString(3, board.getBoardContent());
         pstm.setInt(4, board.getBoardPrivate());
         pstm.setString(5, board.getBoardPw());
         pstm.setString(6, board.getBoardIdx());
         
         res = pstm.executeUpdate();
      } catch (SQLException e) {
         throw new DataAccessException(e);
      } finally {
         template.close(pstm);
      }
      return res;
   }
   
   public int modifyBoard(String boardIdx, String writer, String title, String content, String password, int isPrivate, Connection conn) {
	   int res = 0;
	   PreparedStatement pstm = null;
	   String query = "update board set writer=?, title=?, board_content=?, board_private=?, board_pw=? where board_idx=?";
            
	   try {
         pstm = conn.prepareStatement(query);
         pstm.setString(1, writer);
         pstm.setString(2, title);
         pstm.setString(3, content);
         pstm.setInt(4, isPrivate);
         pstm.setString(5, password);
         pstm.setString(6, boardIdx);
         
         res = pstm.executeUpdate();
	    } catch (SQLException e) {
	         throw new DataAccessException(e);
	    } finally {
	         template.close(pstm);
	    }
	   
	    return res;
	}
   
   private Board convertAllToBoard(ResultSet rset) throws SQLException {
      Board Board = new Board();
      Board.setBoardIdx(rset.getString("board_idx"));
      Board.setUserId(rset.getString("user_id"));
      Board.setTitle(rset.getString("title"));
      Board.setBoardContent(rset.getString("board_content"));
      Board.setWriter(rset.getString("writer"));
      Board.setBoardPw(rset.getString("board_pw"));
      Board.setRegDate(rset.getDate("reg_date"));
      Board.setBoardPrivate(rset.getInt("board_private"));
      Board.setBoardNo(rset.getInt("board_no"));
      return Board;
   }


   
}