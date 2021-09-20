package com.kh.poss.board.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.board.model.dto.Board;
import com.kh.poss.board.model.dto.Reply;
import com.kh.poss.board.model.service.BoardService;
import com.kh.poss.board.model.service.ReplyService;
import com.kh.poss.common.exception.PageNotFoundException;
import com.kh.poss.member.model.dto.Member;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   private BoardService boardService = new BoardService();
   private ReplyService replyService = new ReplyService();
   
   public BoardController() {
      super();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String[] uri = request.getRequestURI().split("/");
      System.out.println(Arrays.toString(uri));
      System.out.println("날아온 url : " + uri[uri.length - 1]); // 콘솔 확인용 코드 (추후 삭제 예정)

      switch (uri[uri.length - 1]) {
      case "notice": // 게시판으로 이동
         notice(request, response);
         break;
      case "write-form": // 글쓰기 페이지로 이동
         writeForm(request, response);
         break;
      case "write": // 글쓰기 후 게시판으로 이동
         write(request, response);
         break;
      case "post": // 게시글 상세페이지
         post(request, response);
         break;
      case "search":
         search(request, response);
         break;
      case "modify-form":
         modifyForm(request, response);
         break;
      case "modify":
         modify(request, response);
         break;
      case "reply-write":
         replyWrite(request, response);
         break;
      default:
         throw new PageNotFoundException();
      }
   }

   private void notice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Member member = (Member) request.getSession().getAttribute("authentication");
      String userId = member.getUserId();
      List<Board> boardList = boardService.selectBoardList(userId);

      request.setAttribute("boardList", boardList);
      request.getRequestDispatcher("/board/board-notice").forward(request, response);
   }

   private void writeForm(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.getRequestDispatcher("/board/write-form").forward(request, response);
   }

   private void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Member member = (Member) request.getSession().getAttribute("authentication");
      String userId = member.getUserId();
      System.out.println(userId);
      String writer = request.getParameter("writer");
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String Private = request.getParameter("isPrivate");
      String password = request.getParameter("password");

      int isPrivate = 0;

      if (Private != null) {
         isPrivate = 1;
      }

      Board board = new Board();
      board.setUserId(userId);
      board.setWriter(writer);
      board.setTitle(title);
      board.setBoardContent(content);
      board.setBoardPrivate(isPrivate);
      board.setBoardPw(password);
      // 글쓰기 버튼시 db에 등록할 로직 구현 {}

      int ibSuccess = boardService.insertBoard(board);
      if (ibSuccess == 1) {
         System.out.println("게시판 등록 성공");
      } else {
         System.out.println("등록 실패");
      }
      response.sendRedirect("/board/notice"); // 게시판으로 이동
   }

   private void post(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Member member = (Member) request.getSession().getAttribute("authentication");
      String userId = member.getUserId();
      String boardIdx = request.getParameter("boardIdx");

      Board board = new Board();
      board.setUserId(userId);
      board.setBoardIdx(boardIdx);
      board = boardService.selectBoardDetail(userId, boardIdx);
      
      List<Reply> replyList = replyService.selectReplyList(boardIdx);
      
      // 쿼리에 보드 번호,id 담아서 보냄=>
      request.getSession().setAttribute("board", board);
      request.getSession().setAttribute("replyList", replyList);
      request.getRequestDispatcher("/board/post").forward(request, response);
      // 알맞은 포스트 불러오기

      // 매개변수에 담아서 게시글로 보냄..
   }

   private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Member member = (Member) request.getSession().getAttribute("authentication");
      String userId = member.getUserId();
      String searchKeyword = request.getParameter("keyword");
      List<Board> searchList = boardService.searchBoardList(userId, searchKeyword);

      request.setAttribute("searchList", searchList);
      request.getRequestDispatcher("/board/board-notice").forward(request, response);
   }

   private void modifyForm(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.getRequestDispatcher("/board/modify-form").forward(request, response);
   }

   private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      Board board = (Board) request.getSession().getAttribute("board");

      String boardIdx = board.getBoardIdx();
      String writer = request.getParameter("writer");
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String Private = request.getParameter("isPrivate");
      String password = request.getParameter("password");

      int isPrivate = 0;

      if (Private != null) {
         isPrivate = 1;
      }

      // 글쓰기 버튼시 db에 등록할 로직 구현 {}

      int ibSuccess = boardService.modifyBoard(boardIdx, writer, title, content, password, isPrivate);

      if (ibSuccess == 1) {
         System.out.println("게시판 등록 성공");
      } else {
         System.out.println("등록 실패");
      }

      response.sendRedirect("/board/notice"); // 게시판으로 이동
   }

   private void replyWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Board board = (Board) request.getSession().getAttribute("board");
       String boardIdx = board.getBoardIdx();

       String writer = request.getParameter("writer");
       String password = request.getParameter("password");
       String content = request.getParameter("content");
      
      int rpSuccess = replyService.insertReply(boardIdx, writer, password, content);
      
      if (rpSuccess == 1) {
         System.out.println("댓글 등록 성공");
      } else {
         System.out.println("댓글 등록 실패");
      }
      
      response.sendRedirect("/board/post?boardIdx="+boardIdx);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doGet(request, response);
   }

}