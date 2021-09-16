package com.kh.poss.common.mail.handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/mail")
public class MailHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MailHandler() {
        super();
    }

    
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//mailTemplate이라는 파라미터로 전송된 template(JSP)로 요청을 재지정 
		
		String template = request.getParameter("mailTemplate");
		String userId = request.getParameter("userId");
		request.getRequestDispatcher("/mail-template/" + template).forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
