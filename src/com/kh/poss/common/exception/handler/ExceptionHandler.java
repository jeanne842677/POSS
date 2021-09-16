package com.kh.poss.common.exception.handler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.exception.HandleableException;



//에러 작업용 서블릿
@WebServlet("/exception-handler")
public class ExceptionHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExceptionHandler() {
        super();
    }

    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//서블릿 컨테이너는 HandleableException이 발생하면 요청을 exception-handler로 재지정
		//이때 request의 javax.servlet.error.exception 속성에 발생한 예외를 함께 담아서 넘겨준다. ㅇㅋ
		
		HandleableException e = (HandleableException) request.getAttribute("javax.servlet.error.exception");
	
		request.setAttribute("msg", e.error.MESSAGE);
		request.setAttribute("url", e.error.URL);
		
		//얘는 web을 타고 여기로 넘어오기때문에 wrapper을 타지 않음.. 따라서 경로 다써줘야함.
		request.getRequestDispatcher("/WEB-INF/views/error/result.jsp").forward(request, response);

	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
