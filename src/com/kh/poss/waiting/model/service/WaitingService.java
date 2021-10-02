package com.kh.poss.waiting.model.service;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.waiting.model.dao.WaitingDao;
import com.kh.poss.waiting.model.dto.Waiting;

//Service
//어플리케이션의 비즈니스로직을 작성
//사용자의 요청을 컨트롤러로부터 위임받아 해당 요청을 처리하기 위해 필요한 핵심적인 작업을 진행
//작업을 수행하기 위해 데이터베이스에 저장된 데이터가 필요하면 dao에게 요청
//비즈니스로직을 service가 담당하기 때문에 transaction관리를 Service가 닫당
//cimmit, rollback을 Service가 담당함 

//connection객체 생성, close처리
//commit과 rollback
//SQLException 예외처리(rollback)

public class WaitingService {

	private WaitingDao waitingDao = new WaitingDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();

	public int insertWaiting(Waiting waiting) {
		System.out.println("\n*********** service 실행! *************\n");
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = waitingDao.insertWaiting(waiting, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public int waitingCnt(String userId) {
		System.out.println("\n*********** Cnt service 실행! *************\n");
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = waitingDao.waitingCnt(userId, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public int totalWaitingCnt(String userId) {
		System.out.println("\n*********** Cnt service 실행! *************\n");
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = waitingDao.totalWaitingCnt(userId, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public int updateWaiting(String waitingNum) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = waitingDao.updateWaiting(waitingNum, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public int confirmWaitingByMessage(HttpServletRequest request, HttpServletResponse response, String phone,
			String waitingPeopleNum) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = waitingDao.confirmWaitingByMessage(request, response, phone, waitingPeopleNum);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;

	}

	public List<Waiting> selectWaitingList(String userId) {
		List<Waiting> waitingList = null;
		Connection conn = template.getConnection();
		try {
			waitingList = waitingDao.selectWaitingList(userId, conn);
		} finally {
			template.close(conn);
		}
		return waitingList;
	}

	public List<Waiting> searchWaitingList(String userId, String start, String end_date) {
		List<Waiting> searchWaitingList = null;
		Connection conn = template.getConnection();
		try {
			searchWaitingList = waitingDao.searchWaitingList(userId, start, end_date, conn);
		} finally {
			template.close(conn);
		}
		return searchWaitingList;
	}

	public List<Waiting> selectTodayWaiting(String userId) {

		List<Waiting> waitingList = null;
		Connection conn = template.getConnection();
		try {

			waitingList = waitingDao.selectTodayWaiting(userId, conn);

		} finally {
			template.close(conn);
		}
		return waitingList;

	}

	public Waiting selectNewWaiting(String userId) {

		Waiting waiting = null;
		Connection conn = template.getConnection();
		try {

			waiting = waitingDao.selectNewWaiting(userId, conn);

		} finally {
			template.close(conn);
		}

		return waiting;

	}

}
