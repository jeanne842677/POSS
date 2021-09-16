package com.kh.poss.common.code;

public enum ErrorCode {
	
	
	DATABASE_ACCESS_ERROR("데이터베이스와 통신 중 에러가 발생하였습니다." ),
	VALIDATOR_FAIL_ERROR("부적절한 양식의 데이터입니다."),
	MAIL_SEND_FAIL_ERROR("이메일 발송 중 에러가 발생했습니다.");

	
	public final String MESSAGE;
	public final String URL;
	
	
	
	private ErrorCode(String msg) {
		
		this.MESSAGE = msg;
		this.URL = "/index";
		
	}
	
	
	
	private ErrorCode(String msg , String url) {
		this.MESSAGE = msg;
		this.URL = url;
		
	}
	
	

}
