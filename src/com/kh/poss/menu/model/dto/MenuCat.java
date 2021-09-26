package com.kh.poss.menu.model.dto;

public class MenuCat {

	private String catIdx;
	private String userId;
	private String name;
	private String icon;
	private String color;

	public MenuCat() {
		// TODO Auto-generated constructor stub
	}

	public String getCatIdx() {
		return catIdx;
	}

	public void setCatIdx(String catIdx) {
		this.catIdx = catIdx;
	}

	public String getName() {
		return name;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "MenuCat [catIdx=" + catIdx + ", userId=" + userId + ", name=" + name + ", icon=" + icon + ", color="
				+ color + "]";
	}

}
