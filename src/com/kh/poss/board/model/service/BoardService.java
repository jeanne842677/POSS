package com.kh.poss.board.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kh.poss.board.model.dao.BoardDao;
import com.kh.poss.board.model.dto.Board;
import com.kh.poss.common.db.JDBCTemplate;

public class BoardService {

	private BoardDao boardDao = new BoardDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();

	public int insertBoard(Board board) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = boardDao.insertBoard(board, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;

	}

	public List<Board> selectBoardList(String userId, int page) {
		List<Board> boardList = null;
		Connection conn = template.getConnection();
		try {
			boardList = boardDao.selectBoardList(userId, page, conn);
		} finally {
			template.close(conn);
		}
		return boardList;
	}

	public List<Board> searchBoardList(String userId, String searchKeyword) {
		List<Board> searchList = null;
		Connection conn = template.getConnection();
		try {
			searchList = boardDao.searchBoardList(userId, searchKeyword, conn);
		} finally {
			template.close(conn);
		}
		return searchList;
	}

	public Board selectBoardDetail(String userId, String boardIdx) {
		Board board = null;
		Connection conn = template.getConnection();
		try {
			board = boardDao.selectBoardDetail(userId, boardIdx, conn);
		} finally {
			template.close(conn);
		}
		return board;
	}

	public int modifyBoard(String boardIdx, String writer, String title, String content, String password,
			int isPrivate) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = boardDao.modifyBoard(boardIdx, writer, title, content, password, isPrivate, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public int deleteBoard(String boardIdx) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = boardDao.deleteBoard(boardIdx, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public int deleteReply(String replyIdx) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = boardDao.deleteReply(replyIdx, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public int getAllCount(String userId) {
		Connection conn = template.getConnection();
		int count = 0;

		try {
			count = boardDao.getAllCount(conn, userId);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}

		return count;
	}

	
	
	
	
	private Map<String, Object> getBoardParams(HttpServletRequest request, String userId) {
		Map<String, Object> params = new HashMap<>();
		int isPrivate = request.getParameter("isPrivate")==null? 0 : 1;
		params.put("userId", userId);
		params.put("writer", request.getParameter("writer"));
		params.put("title", request.getParameter("title"));
		params.put("content", request.getParameter("content"));
		params.put("isPrivate", isPrivate);
		params.put("password", request.getParameter("password"));

		return params;
	}

	
	public Board getBoard(HttpServletRequest request, String userId) {

		Map<String, Object> params = getBoardParams(request, userId);
	      
		Board board = new Board();
		board.setUserId((String)params.get("userId"));
		board.setWriter((String)params.get("writer"));
		board.setTitle((String)params.get("title"));
		board.setBoardContent((String)params.get("content"));
		board.setBoardPrivate((int)params.get("isPrivate"));
		board.setBoardPw((String)params.get("password"));

		return board;
	}

}