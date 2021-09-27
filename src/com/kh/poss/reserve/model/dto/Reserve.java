package com.kh.poss.reserve.model.dto;

import java.sql.Date;

public class Reserve {
   String reserveIdx;
   String userId;
   String seatIdx;
   String name;
   String phone;
   String num;
   Date reDate;
   Date regDate;
   int isVisit;
   int isCancel;
   String content;
   String reTime;
   public Reserve() {
      // TODO Auto-generated constructor stub
   }
   public String getReserveIdx() {
      return reserveIdx;
   }
   public void setReserveIdx(String reserveIdx) {
      this.reserveIdx = reserveIdx;
   }
   public String getUserId() {
      return userId;
   }
   public void setUserId(String userId) {
      this.userId = userId;
   }
   public String getSeatIdx() {
      return seatIdx;
   }
   public void setSeatIdx(String seatIdx) {
      this.seatIdx = seatIdx;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getNum() {
      return num;
   }
   public void setNum(String num) {
      this.num = num;
   }
   public Date getReDate() {
      return reDate;
   }
   public void setReDate(Date reDate) {
      this.reDate = reDate;
   }
   public Date getRegDate() {
      return regDate;
   }
   public void setRegDate(Date regDate) {
      this.regDate = regDate;
   }
   public int getIsVisit() {
      return isVisit;
   }
   public void setIsVisit(int isVisit) {
      this.isVisit = isVisit;
   }
   public int getIsCancel() {
      return isCancel;
   }
   public void setIsCancel(int isCancel) {
      this.isCancel = isCancel;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getReTime() {
      return reTime;
   }
   public void setReTime(String reTime) {
      this.reTime = reTime;
   }
   @Override
   public String toString() {
      return "Reserve [reserveIdx=" + reserveIdx + ", userId=" + userId + ", seatIdx=" + seatIdx + ", name=" + name
            + ", phone=" + phone + ", num=" + num + ", reDate=" + reDate + ", regDate=" + regDate + ", isVisit="
            + isVisit + ", isCancel=" + isCancel + ", content=" + content + ", reTime=" + reTime + "]";
   }
   
   
}