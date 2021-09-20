package com.kh.poss.board.model.dto;

import java.util.Date;

public class Reply {
   String replyIdx;
   String boardIdx;
   String reply;
   String replyWriter;
   String replyPw;
   Date reg_date;
   
   public Reply() {
      // TODO Auto-generated constructor stub
   }
   
   public String getReplyIdx() {
      return replyIdx;
   }
   public void setReplyIdx(String replyIdx) {
      this.replyIdx = replyIdx;
   }
   public String getBoardIdx() {
      return boardIdx;
   }
   public void setBoardIdx(String boardIdx) {
      this.boardIdx = boardIdx;
   }
   public String getReply() {
      return reply;
   }
   public void setReply(String reply) {
      this.reply = reply;
   }
   public String getReplyWriter() {
      return replyWriter;
   }
   public void setReplyWriter(String replyWriter) {
      this.replyWriter = replyWriter;
   }
   public String getReplyPw() {
      return replyPw;
   }
   public void setReplyPw(String replyPw) {
      this.replyPw = replyPw;
   }
   public Date getReg_date() {
      return reg_date;
   }
   public void setReg_date(Date reg_date) {
      this.reg_date = reg_date;
   }
   @Override
   public String toString() {
      return "Reply [replyIdx=" + replyIdx + ", boardIdx=" + boardIdx + ", reply=" + reply + ", replyWriter="
            + replyWriter + ", replyPw=" + replyPw + ", reg_date=" + reg_date + "]";
   }
   
   
}