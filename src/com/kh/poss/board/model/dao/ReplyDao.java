package com.kh.poss.board.model.dao;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.poss.board.model.dto.Board;
import com.kh.poss.board.model.dto.Reply;
import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.exception.DataAccessException;

public class ReplyDao {
   private JDBCTemplate template = JDBCTemplate.getInstance();
   Date date = new Date();
   
   public int insertReply(String boardIdx, String writer, String password, String content, Connection conn) {
	     int res = 0;
         long time = date.getTime();
         java.sql.Date date1 = new java.sql.Date(time);
         PreparedStatement pstm = null;
         String query = "insert into reply(reply_idx,board_idx,reply,reply_writer,reply_pw,reg_date)"
               + " values(sc_reply_idx.nextval, ?, ?, ?, ?, sysdate)";
         try {
            pstm = conn.prepareStatement(query);
            pstm.setString(1, boardIdx);
            pstm.setString(2, content);
            pstm.setString(3, writer);
            pstm.setString(4, password);
            
            res = pstm.executeUpdate();
         } catch (SQLException e) {
            throw new DataAccessException(e);
         } finally {
            template.close(pstm);
         }
         return res;
   }

  public List<Reply> selectReplyList(String boardIdx, Connection conn) {
      PreparedStatement pstm = null;
      ResultSet rset = null;
      Reply reply = null;
      List<Reply> replyList = new ArrayList<Reply>();
      
      String query = "select * from reply where board_idx = ? order by reply_idx desc";
      try {
         pstm = conn.prepareStatement(query);
         pstm.setString(1, boardIdx);
         rset = pstm.executeQuery();
         
         while(rset.next()) {
        	 reply = convertAllToReply(rset);
        	 replyList.add(reply);
         }
         
      } catch (SQLException e) {
         throw new DataAccessException(e);
      } finally {
         template.close(rset, pstm);
      }
      
      return replyList;
  }
  
  private Reply convertAllToReply(ResultSet rset) throws SQLException {
      Reply reply = new Reply();
      reply.setReplyIdx(rset.getString("reply_idx"));
      reply.setBoardIdx(rset.getString("board_idx"));
      reply.setReply(rset.getString("reply"));
      reply.setReplyWriter(rset.getString("reply_writer"));
      reply.setReplyPw(rset.getString("reply_pw"));
      reply.setReg_date(rset.getDate("reg_date"));
      return reply;
   }

}