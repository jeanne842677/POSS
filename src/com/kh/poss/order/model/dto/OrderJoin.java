package com.kh.poss.order.model.dto;

public class OrderJoin {
	
	private String orderMasterIdx;
	private String seatUuid;
	private String name;
	private String todayOrderNum;
	private String menuIdx;
	private int price;
	private int cnt;
	
	

	public OrderJoin() {
		// TODO Auto-generated constructor stub
	}

	public String getOrderMasterIdx() {
		return orderMasterIdx;
	}

	public void setOrderMasterIdx(String orderMasterIdx) {
		this.orderMasterIdx = orderMasterIdx;
	}

	public String getSeatUuid() {
		return seatUuid;
	}

	public void setSeatUuid(String seatUuid) {
		this.seatUuid = seatUuid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
	}
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTodayOrderNum() {
		return todayOrderNum;
	}

	public void setTodayOrderNum(String todayOrderNum) {
		this.todayOrderNum = todayOrderNum;
	}

	@Override
	public String toString() {
		return "OrderJoin [orderMasterIdx=" + orderMasterIdx + ", seatUuid=" + seatUuid + ", name=" + name
				+ ", todayOrderNum=" + todayOrderNum + ", menuIdx=" + menuIdx + ", price=" + price + ", cnt=" + cnt
				+ "]";
	}

	




	

}
