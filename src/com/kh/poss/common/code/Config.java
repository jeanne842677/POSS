package com.kh.poss.common.code;

public enum Config {
	
	
	DOMAIN("http://localhost:9090"),
	COMPANY_EMAIL("lhj132824@gmail.com"),
	SMTP_AUTHENTICATION_ID("lhj132824@gmail.com"),
	SMTP_AUTHENTICATION_PASSWORD("wjscoals102$");
	
	
	public final String DESC ;
	
	private Config(String DESC) {
		
		this.DESC = DESC;
		
		
	}
	

}
