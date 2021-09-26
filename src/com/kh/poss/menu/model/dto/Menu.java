package com.kh.poss.menu.model.dto;

public class Menu {
	
	private String menuIdx;
	private String catIdx;
	private String name;
	private int price;
	private int totalCnt;
	private String icon;
	private String color;
	
	public Menu() {
		// TODO Auto-generated constructor stub
	}

	public String getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
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

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
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
		return "Menu [menuIdx=" + menuIdx + ", catIdx=" + catIdx + ", name=" + name + ", price=" + price + ", totalCnt="
				+ totalCnt + ", icon=" + icon + ", color=" + color + "]";
	}

	
}
