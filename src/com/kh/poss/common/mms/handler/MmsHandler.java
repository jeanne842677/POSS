package com.kh.poss.common.mms.handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.mms.MmsSender;

@WebServlet("/mms")
public class MmsHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MmsHandler() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   	
			String phone = "01095347492"; //request.getParameter("phone");
			String context =  "예진아~~싸랑해^0^";//request.getParameter("context");
			String uri = "/index"; //request.getParameter("redirectUri");
			String storeName = "";
			
			System.out.println("폰번호:" + phone);
			System.out.println("글내용:" + context);
			
			MmsSender mmsSender = new MmsSender();
			
			mmsSender.setMessage(phone, storeName , context);
		    response.sendRedirect("/index");
	
	}
	
	   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
	
	
	}

}
