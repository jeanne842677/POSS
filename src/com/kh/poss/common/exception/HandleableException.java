package com.kh.poss.common.exception;

import com.kh.poss.common.code.ErrorCode;

public class HandleableException extends RuntimeException {

	/**
	 * web.xml에 등록해서 예외 핸들러로 보냄
	 */
	private static final long serialVersionUID = -3930409458039432875L;
	
	public ErrorCode error;   //error 는 enum valueOf 인스턴스를 나타냄
	
	
	//생성자1
	public HandleableException(ErrorCode error) {
		this.error = error;
		this.setStackTrace(new StackTraceElement[0]);  //stactTrace 안뜨게 하기
	
	}
	
	
	//생성자2
	public HandleableException(ErrorCode error , Exception e) {
		this.error = error;
		
	
	}
	
	
	//1. 콘솔에 로그
	//2. 사용자에게 알림 메시지 띄워주기, 경로 재지정
	//   발생한 예외별 에러 메세지와, 재지정할 경로 
	
	
	
	

}
