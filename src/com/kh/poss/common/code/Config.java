package com.kh.poss.common.code;

public enum Config {
	
	
	DOMAIN("http://localhost:9090"),
	COMPANY_EMAIL("webposs123@gmail.com"),
	SMTP_AUTHENTICATION_ID("webposs123@gmail.com"),
	SMTP_AUTHENTICATION_PASSWORD("Rngusgowh1"),
	UPLOAD_PATH("C:\\CODE\\upload\\");
	
	
	public final String DESC ;
	
	private Config(String DESC) {
		
		this.DESC = DESC;
		
		
	}
	

}
