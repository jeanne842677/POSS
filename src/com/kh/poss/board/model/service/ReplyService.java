package com.kh.poss.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.kh.poss.board.model.dao.ReplyDao;
import com.kh.poss.board.model.dto.Reply;
import com.kh.poss.common.db.JDBCTemplate;

public class ReplyService {
   private ReplyDao replyDao = new ReplyDao();
   private JDBCTemplate template = JDBCTemplate.getInstance();
   
   public int insertReply(String boardIdx, String writer, String password, String content) {
      Connection conn = template.getConnection();
          int res = 0;
          try {
             res = replyDao.insertReply(boardIdx, writer, password, content, conn);
             template.commit(conn);
          } catch (Exception e) {
             template.rollback(conn);
             throw e;
          } finally {
             template.close(conn);
          }
          return res;
   }
   
   public List<Reply> selectReplyList(String boardIdx) {
		
	   	List<Reply> replyList = null;
	    Connection conn = template.getConnection();
	    
	    try {
	    	replyList = replyDao.selectReplyList(boardIdx, conn);
	    } finally {
	        template.close(conn);
	    }
	    
	    return replyList;
	}
    
    
    
    
    
    
    
    
    
}