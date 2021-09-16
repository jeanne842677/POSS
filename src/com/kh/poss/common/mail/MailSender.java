package com.kh.poss.common.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

import com.kh.poss.common.code.Config;
import com.kh.poss.common.code.ErrorCode;
import com.kh.poss.common.exception.HandleableException;

public class MailSender {
	
	
	private static final Properties SMTP_PROPERTIES;
	
	//스테틱 변수 초기화 블록
	static {
		
		SMTP_PROPERTIES = new Properties();
		SMTP_PROPERTIES.put("mail.smtp.host", "smtp.gmail.com");
		SMTP_PROPERTIES.put("mail.smtp.port", "465");
		SMTP_PROPERTIES.put("mail.smtp.ssl.enable", "true");
		SMTP_PROPERTIES.put("mail.smtp.ssl.protocols", "TLSv1.2"); //자바 1.8이랑 맞는 tls통신 버전
		SMTP_PROPERTIES.put("mail.smtp.auth", "true");
		SMTP_PROPERTIES.put("mail.debug","true");
	}
	
	
	
	
	
	//수신자, 메일제목, 메일 내용(body)
	public void sendMail(String email , String subject , String body) {
		
		    
		    Session session = Session.getInstance(SMTP_PROPERTIES, null);

		    try {
		    	
		        MimeMessage msg = setMessage(session,email,subject, body);
		        sendMesseage(session, msg);
		        
		        
	
		    } catch (MessagingException mex) {
		    	
		    	//사용자에게 "메일 발송 중 문제가 생겼습니다."  전달 후 email로 보내기 
		        throw new HandleableException(ErrorCode.MAIL_SEND_FAIL_ERROR , mex);
		        
		        
		        
		    }
		

		
	}

	private MimeMessage setMessage(Session session ,String email , String subject , String body) throws MessagingException {
		
		MimeMessage msg = new MimeMessage(session);
        msg.setFrom(Config.COMPANY_EMAIL.DESC);
        msg.setRecipients(Message.RecipientType.TO, email);
        msg.setSubject(subject);  //제목
        msg.setSentDate(new Date());
        msg.setText(body , "utf-8" , "html");  //내용
        
        return msg;
		
	}
	
	
	private void sendMesseage(Session session , MimeMessage msg) throws MessagingException {
		
		
		Transport tr = session.getTransport("smtp");
        tr.connect("smtp.gmail.com", Config.SMTP_AUTHENTICATION_ID.DESC, "!Tjs24fkdlwm");
        msg.saveChanges();      // don't forget this
        tr.sendMessage(msg, msg.getAllRecipients());
        tr.close();
        
	}
		
		
		
	
	

}
