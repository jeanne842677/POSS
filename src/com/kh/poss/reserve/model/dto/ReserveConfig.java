package com.kh.poss.reserve.model.dto;

public class ReserveConfig {

	String userId;
	String openTime;
	String closeTime;
	String startPeriod;
	String endPeriod;
	String storeInfo;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public String getStartPeriod() {
		return startPeriod;
	}

	public void setStartPeriod(String startPeriod) {
		this.startPeriod = startPeriod;
	}

	public String getEndPeriod() {
		return endPeriod;
	}

	public void setEndPeriod(String endPeriod) {
		this.endPeriod = endPeriod;
	}

	public String getStoreInfo() {
		return storeInfo;
	}

	public void setStoreInfo(String storeInfo) {
		this.storeInfo = storeInfo;
	}

	@Override
	public String toString() {
		return "ReserveConfig [userId=" + userId + ", openTime=" + openTime + ", closeTime=" + closeTime
				+ ", startPeriod=" + startPeriod + ", endPeriod=" + endPeriod + ", storeInfo=" + storeInfo + "]";
	}

}