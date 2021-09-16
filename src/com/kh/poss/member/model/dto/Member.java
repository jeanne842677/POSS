package com.kh.poss.member.model.dto;

import java.sql.Date;

//DTO(데이터 전송 객체)
//데이터 전송 객체
//데이터베이스로부터 얻어온 데이터를 service(비즈니스로직)으로 보내기 위해 사용하는 객체
//비즈니스 로직을 포함하고 있지 않은, 순수하게 데이터 전송만을 위해 사용되는 객체
//getter/setter , equals, hashCode, toString 


// *** DTO와 비슷한 친구들
// domain object , value object(vo) , entity , bean

//DTO의 조건 (JAVA BEAN 규약)
//1. 모든 필드변수는 private 처리
//2. 모든 필드변수는 getter/setter 메서드를 가져야 한다.
//3. 반드시 기본 생성자(매개변수가 없는 생성자)가 존재해야 한다. 


//오라클-자바 타입 매핑
//CHAR , VARCHAR2 -> String
//DATE -> java.util.Date  , java.sql.Date
//Number -> int, double



public class Member {
	
	/*
	USER_ID	VARCHAR2(36 CHAR)
	PASSWORD	VARCHAR2(60 CHAR)
	EMAIL	VARCHAR2(50 CHAR)
	GRADE	CHAR(4 CHAR)
	TELL	VARCHAR2(15 CHAR)
	REG_DATE	DATE
	RENTABLE_DATE	DATE
	IS_LEAVE	NUMBER
	*/
	
	private String userId;
	private String password;
	private String email;
	private String grade;
	private String tell;
	private Date regDate;
	private Date rentableDate;
	private int isLeave;
	private int number;
	
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




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getGrade() {
		return grade;
	}




	public void setGrade(String grade) {
		this.grade = grade;
	}




	public String getTell() {
		return tell;
	}




	public void setTell(String tell) {
		this.tell = tell;
	}




	public Date getRegDate() {
		return regDate;
	}




	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}




	public Date getRentableDate() {
		return rentableDate;
	}




	public void setRentableDate(Date rentableDate) {
		this.rentableDate = rentableDate;
	}




	public int getNumber() {
		return number;
	}




	public void setNumber(int number) {
		this.number = number;
	}


	public int getIsLeave() {
		return isLeave;
	}



	public void setIsLeave(int isLeave) {
		this.isLeave = isLeave;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", email=" + email + ", grade=" + grade
				+ ", tell=" + tell + ", regDate=" + regDate + ", rentableDate=" + rentableDate + ", number=" + number
				+ "]";
	}
	
	
	
	
	
}
