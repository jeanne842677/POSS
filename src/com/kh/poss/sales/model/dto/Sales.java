package com.kh.poss.sales.model.dto;

import java.sql.Date;

public class Sales {
	String orderMasterIdx;
	int sumPrice;
	String title;
	Date regDate;
	String payment;
	
	public Sales() {
		// TODO Auto-generated constructor stub
	}

	public String getOrderMasterIdx() {
		return orderMasterIdx;
	}

	public void setOrderMasterIdx(String orderMasterIdx) {
		this.orderMasterIdx = orderMasterIdx;
	}

	public int getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(int sumPrice) {
		this.sumPrice = sumPrice;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "Sales [orderMasterIdx=" + orderMasterIdx + ", sumPrice=" + sumPrice + ", title=" + title + ", regDate="
				+ regDate + ", payment=" + payment + "]";
	}
	
	
	
}	