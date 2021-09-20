package com.kh.poss.board.model.dto;

import java.util.Date;

public class Board {
	String boardIdx;
	String userId;
	String title;
	String boardContent;
	String writer;
	String boardPw;
	Date regDate;
	String boardFile;
	int boardPrivate;
	int boardNo;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public String getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(String boardIdx) {
		this.boardIdx = boardIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getBoardPw() {
		return boardPw;
	}

	public void setBoardPw(String boardPw) {
		this.boardPw = boardPw;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	public int getBoardPrivate() {
		return boardPrivate;
	}

	public void setBoardPrivate(int boardPrivate) {
		this.boardPrivate = boardPrivate;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Board [boardIdx=" + boardIdx + ", userId=" + userId + ", title=" + title + ", boardContent="
				+ boardContent + ", writer=" + writer + ", boardPw=" + boardPw + ", regDate=" + regDate + ", boardFile="
				+ boardFile + ", boardPrivate=" + boardPrivate + ", boardNo=" + boardNo + "]";
	}
	
	
}
