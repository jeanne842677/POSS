package com.kh.poss.waiting.model.dto;

import java.sql.Date;

public class Waiting {

	private String waitingNum;
	private String userId;
	private String phone;
	private int waitingPeople;
	private Date time;
	private String orderIdx;
	
	public Waiting() {
		// TODO Auto-generated constructor stub
	}

	public String getWaitingNum() {
		return waitingNum;
	}

	public void setWaitingNum(String waitingNum) {
		this.waitingNum = waitingNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getWaitingPeople() {
		return waitingPeople;
	}

	public void setWaitingPeople(int waitingPeople) {
		this.waitingPeople = waitingPeople;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getOrderIdx() {
		return orderIdx;
	}

	public void setOrderIdx(String orderIdx) {
		this.orderIdx = orderIdx;
	}

	@Override
	public String toString() {
		return "Waiting [waitingNum=" + waitingNum + ", userId=" + userId + ", phone=" + phone + ", waitingPeople="
				+ waitingPeople + ", time=" + time + ", orderIdx=" + orderIdx + "]";
	}

	

	
	
	
	

	
}
