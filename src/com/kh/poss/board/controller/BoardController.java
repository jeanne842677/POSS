package com.kh.poss.board.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.exception.PageNotFoundException;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] uri = request.getRequestURI().split("/");
		System.out.println(Arrays.toString(uri));
		System.out.println("날아온 url : " + uri[uri.length-1]);  //콘솔 확인용 코드 (추후 삭제 예정)
		

		switch(uri[uri.length-1]) {
		case "notice" :  //게시판으로 이동
			notice(request, response);
			break;
		case "write-form" :  //글쓰기 페이지로 이동
			writeForm(request, response);
			break;
		case "write" :  //글쓰기 후 게시판으로 이동
			write(request, response);
			break;
		case "post" :  //글쓰기 후 게시판으로 이동
			post(request, response);
			break;
		default : throw new PageNotFoundException();
		}
	}





	private void notice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/board/board-notice").forward(request, response);
		
		
	}
	

	private void writeForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/board/write-form").forward(request, response);
		
		
	}
	
	

	private void write(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		
		
		//글쓰기 버튼시 db에 등록할 로직 구현 {}
		
		
		
		
		

		response.sendRedirect("/board/notice");  //게시판으로 이동
		
		
		
	}
	
	
	private void post(HttpServletRequest request, HttpServletResponse response) {
		
		
		//쿼리에 보드 번호,id 담아서 보냄=>
		//알맞은 포스트 불러오기 
		//매개변수에 담아서 게시글로 보냄..
		
		
		
		
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
