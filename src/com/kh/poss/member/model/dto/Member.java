package com.kh.poss.member.model.dto;

import java.sql.Date;

public class Member {

	private String userId;
	private String password;
	private String name;
	private String phone;
	private String store_name;
	private String address;
	private String email;
	private Date reg_date;
	private int is_leave;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getIs_leave() {
		return is_leave;
	}

	public void setIs_leave(int is_leave) {
		this.is_leave = is_leave;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", store_name=" + store_name + ", address=" + address + ", email=" + email + ", reg_date=" + reg_date
				+ ", is_leave=" + is_leave + "]";
	}

}
