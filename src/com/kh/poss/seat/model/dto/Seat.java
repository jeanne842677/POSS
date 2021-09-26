package com.kh.poss.seat.model.dto;

public class Seat {

	private String seatIdx;
	private String seatName;
	private String seatHtmlIdx;

	public Seat() {

	}

	public String getSeatIdx() {
		return seatIdx;
	}

	public void setSeatIdx(String seatIdx) {
		this.seatIdx = seatIdx;
	}

	public String getSeatName() {
		return seatName;
	}

	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}

	public String getSeatHtmlIdx() {
		return seatHtmlIdx;
	}

	public void setSeatHtmlIdx(String seatHtmlIdx) {
		this.seatHtmlIdx = seatHtmlIdx;
	}

	@Override
	public String toString() {
		return "Seat [seatIdx=" + seatIdx + ", seatName=" + seatName + ", seatHtmlIdx=" + seatHtmlIdx + "]";
	}

}
