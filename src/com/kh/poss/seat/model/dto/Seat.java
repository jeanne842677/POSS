package com.kh.poss.seat.model.dto;

public class Seat {
	
	private String tableIdx;
	private String userId;
	private String floor;
	private String tableHtml;
	
	
	public Seat() {
		// TODO Auto-generated constructor stub
	}


	public String getTableIdx() {
		return tableIdx;
	}


	public void setTableIdx(String tableIdx) {
		this.tableIdx = tableIdx;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getFloor() {
		return floor;
	}


	public void setFloor(String floor) {
		this.floor = floor;
	}


	public String getTableHtml() {
		return tableHtml;
	}


	public void setTableHtml(String tableHtml) {
		this.tableHtml = tableHtml;
	}


	@Override
	public String toString() {
		return "Seat [tableIdx=" + tableIdx + ", userId=" + userId + ", floor=" + floor + ", tableHtml=" + tableHtml
				+ "]";
	}
	
	
	
}
