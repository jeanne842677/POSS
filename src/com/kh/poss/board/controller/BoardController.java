package com.kh.poss.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   private BoardService boardService = new BoardService();
   private ReplyService replyService = new ReplyService();
   
   public BoardController() {
      super();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String[] uri = request.getRequestURI().split("/");
      System.out.println(Arrays.toString(uri));
      System.out.println("날아온 url : " + uri[uri.length - 1]); // 콘솔 확인용 코드 (추후 삭제 예정)
      String userId = uri[uri.length - 2];
      
      switch (uri[uri.length - 1]) {
      case "notice": // 게시판으로 이동
         notice(request, response, userId);
         break;
      case "write-form": // 글쓰기 페이지로 이동
         writeForm(request, response, userId);
         break;
      case "write": // 글쓰기 후 게시판으로 이동
         write(request, response, userId);
         break;
      case "post": // 게시글 상세페이지
         post(request, response, userId);
         break;
      case "search":
         search(request, response, userId);
         break;
      case "modify-form":
         modifyForm(request, response);
         break;
      case "modify":
         modify(request, response);
         break;
      case "delete":
         delete(request, response, userId);
         break;
      case "reply-write":
         replyWrite(request, response, userId);
         break;
      case "reply-delete":
         replyDelete(request, response, userId);
         break;
      default:
         throw new PageNotFoundException();
      }
     
   }


   private void notice(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
      
     int page = 1;
     int index = 1;
     
     if(request.getParameter("page") != null) {
        page = Integer.parseInt(request.getParameter("page"));
     }
     
     int count = boardService.getAllCount(userId);
     int totalPage = (int)Math.ceil(count/(double)10);
     System.out.println(totalPage);
     
     int[] pageList = new int[totalPage];
     List<Board> boardList = boardService.selectBoardList(userId, page);
     
     
     for (int i = 0; i < totalPage; i++) {
        pageList[i] = index;
        index++;
     }
     
      request.setAttribute("boardList", boardList);
      request.setAttribute("userId", userId);
      request.setAttribute("pageList", pageList);
      
      request.getRequestDispatcher("/board/board-notice").forward(request, response);
   }

   private void writeForm(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
     request.setAttribute("userId", userId);
      request.getRequestDispatcher("/board/write-form").forward(request, response);
   }

   private void write(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
      
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
      response.sendRedirect("/board/"+userId+"/notice"); // 게시판으로 이동
   }

   private void post(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
      
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

   private void search(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
      
      String searchKeyword = request.getParameter("keyword");
      List<Board> searchList = boardService.searchBoardList(userId, searchKeyword);
      request.setAttribute("userId", userId);
      request.setAttribute("searchList", searchList);
      request.getRequestDispatcher("/board/board-notice").forward(request, response);
   }

   private void modifyForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.getRequestDispatcher("/board/modify-form").forward(request, response);
   }

   private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      Board board = (Board) request.getSession().getAttribute("board");

      String boardIdx = board.getBoardIdx();
      String userId = board.getUserId();
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

      int mbSuccess = boardService.modifyBoard(boardIdx, writer, title, content, password, isPrivate);

      if (mbSuccess == 1) {
         System.out.println("게시판 등록 성공");
      } else {
         System.out.println("등록 실패");
      }

      response.sendRedirect("/board/"+userId+"/notice"); // 게시판으로 이동
   }

   private void delete(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
      
      Board board = (Board) request.getSession().getAttribute("board");
      
      String boardIdx = board.getBoardIdx();
      System.out.println(boardIdx);
      int dbSuccess = boardService.deleteBoard(boardIdx);

       if (dbSuccess == 1) {
          System.out.println("게시판 삭제 성공");
       } else {
          System.out.println("삭제 실패");
       }

       response.sendRedirect("/board/"+userId+"/notice"); // 게시판으로 이동
   }
   
   private void replyWrite(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
       Board board = (Board) request.getSession().getAttribute("board");
       String boardIdx = board.getBoardIdx();

       String writer = request.getParameter("writer");
       String password = request.getParameter("password");
       String content = request.getParameter("content");
      
      int wrSuccess = replyService.insertReply(boardIdx, writer, password, content);
      
      if (wrSuccess == 1) {
         System.out.println("댓글 등록 성공");
      } else {
         System.out.println("댓글 등록 실패");
      }
      
      response.sendRedirect("/board/"+userId+"/post?boardIdx="+boardIdx);
   }

   private void replyDelete(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
      
      String replyIdx = request.getParameter("replyIdx");
      System.out.println(replyIdx);
      Board board = (Board) request.getSession().getAttribute("board");
       String boardIdx = board.getBoardIdx();

      int drSuccess = boardService.deleteReply(replyIdx);

       if (drSuccess == 1) {
          System.out.println("댓글 삭제 성공");
       } else {
          System.out.println("댓글 삭제 실패");
       }

       response.sendRedirect("/board/"+userId+"/post?boardIdx="+boardIdx);
   }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doGet(request, response);
   }

}