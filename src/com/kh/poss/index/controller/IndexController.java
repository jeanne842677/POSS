package com.kh.poss.index.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/index")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public IndexController() {
        super();
        
        
    }

    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("인덱스 페이지");
		//response.sendRedirect("/WEB-INF/views/index.jsp"); 얘는 웹단에서 다시 부르는 거라 web-inf접근 불가
		
		request.getRequestDispatcher("/index").forward(request, response);
		
		
		//request.getRequestDispatcher("/index").forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}
	

}
