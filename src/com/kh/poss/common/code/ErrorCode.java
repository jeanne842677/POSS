package com.kh.poss.common.code;

public enum ErrorCode {
	
	
	DATABASE_ACCESS_ERROR("데이터베이스와 통신 중 에러가 발생하였습니다."),
	VALIDATOR_FAIL_ERROR("부적절한 양식의 데이터입니다."),
	MAIL_SEND_FAIL_ERROR("이메일 발송 중 에러가 발생했습니다.", "/member/join-form"),
	HTTP_CONNECT_ERROR("HTTP 통신 중 에러가 발생하였습니다."),
	AUTHENTICATION_FAILED_ERROR("유효하지 않은 인증입니다."),
	UNAUTHORIZED_PAGE_ERROR("접근 권한이 없는 페이지 입니다."),
	FAILED_FILE_UPLOAD_ERROR("파일 업로드에 실패했습니다."),
	REDIRECT_LOGIN_PAGE("","/member/login-form"),
	USER_INFORMATION_NOT_FOUND("입력하신 정보와 일치하는 회원을 찾을 수 없습니다. 인증 절차를 다시 시도해 보세요." , "/member/lostid");
	
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
