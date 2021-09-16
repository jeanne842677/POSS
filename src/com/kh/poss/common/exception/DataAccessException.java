package com.kh.poss.common.exception;

import com.kh.poss.common.code.ErrorCode;

public class DataAccessException extends HandleableException{


	private static final long serialVersionUID = 521587827126031031L;

	public DataAccessException(Exception e) {
		
		super(ErrorCode.DATABASE_ACCESS_ERROR,e);  //생성자 1개이고 url가 index로 되어있음
		
	}
	
	
	
	

}
