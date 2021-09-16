package com.kh.poss.waiting.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.exception.PageNotFoundException;


@WebServlet("/waiting/*")
public class WaitingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public WaitingController() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length-1]);  //콘솔 확인용 코드 (추후 삭제 예정)
		

		switch(uri[uri.length-1]) {
		case "waiting-page" :  //웨이팅 폼으로 이동
			waitingPage(request, response);
			
			break;
		default : throw new PageNotFoundException();
		}
		
		
	}

	 //웨이팅 폼으로 이동
	private void waitingPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.getRequestDispatcher("/waiting/waiting-page").forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
