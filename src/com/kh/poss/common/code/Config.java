package com.kh.poss.common.code;

public enum Config {
	
	
	DOMAIN("http://localhost:9090"),
	COMPANY_EMAIL("jee4870@gmail.com"),
	SMTP_AUTHENTICATION_ID("jee4870@gmail.com"),
	SMTP_AUTHENTICATION_PASSWORD("!Tjs24fkdlwm");
	
	
	public final String DESC ;
	
	private Config(String DESC) {
		
		this.DESC = DESC;
		
		
	}
	

}
