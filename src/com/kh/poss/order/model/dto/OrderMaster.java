package com.kh.poss.order.model.dto;

import java.sql.Date;

public class OrderMaster {

	private String orderMasterIdx;
	private String seatHtmlIdx;
	private String seatUUID;
	private String tableName;
	private String title;
	private String payment;
	private Date regDate;
	private int todayOrderCnt;

	public OrderMaster() {
		// TODO Auto-generated constructor stub
	}

	public String getOrderMasterIdx() {
		return orderMasterIdx;
	}

	public void setOrderMasterIdx(String orderMasterIdx) {
		this.orderMasterIdx = orderMasterIdx;
	}

	public String getSeatHtmlIdx() {
		return seatHtmlIdx;
	}

	public void setSeatHtmlIdx(String seatHtmlIdx) {
		this.seatHtmlIdx = seatHtmlIdx;
	}

	public String getSeatUUID() {
		return seatUUID;
	}

	public void setSeatUUID(String seatUUID) {
		this.seatUUID = seatUUID;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getTodayOrderCnt() {
		return todayOrderCnt;
	}

	public void setTodayOrderCnt(int todayOrderCnt) {
		this.todayOrderCnt = todayOrderCnt;
	}

	@Override
	public String toString() {
		return "OrderMaster [orderMasterIdx=" + orderMasterIdx + ", seatHtmlIdx=" + seatHtmlIdx + ", seatUUID="
				+ seatUUID + ", tableName=" + tableName + ", title=" + title + ", payment=" + payment + ", regDate="
				+ regDate + ", todayOrderCnt=" + todayOrderCnt + "]";
	}

	
	
}
