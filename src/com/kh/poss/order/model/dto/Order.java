package com.kh.poss.order.model.dto;


//주문 상세
public class Order {
	
	private String orderIdx;
	private String orderMasterIdx;
	private String menuIdx;
	private String cnt;
	private String regDate;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public String getOrderIdx() {
		return orderIdx;
	}

	public void setOrderIdx(String orderIdx) {
		this.orderIdx = orderIdx;
	}

	public String getOrderMasterIdx() {
		return orderMasterIdx;
	}

	public void setOrderMasterIdx(String orderMasterIdx) {
		this.orderMasterIdx = orderMasterIdx;
	}

	public String getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Order [orderIdx=" + orderIdx + ", orderMasterIdx=" + orderMasterIdx + ", menuIdx=" + menuIdx + ", cnt="
				+ cnt + ", regDate=" + regDate + "]";
	}

	
	
}
