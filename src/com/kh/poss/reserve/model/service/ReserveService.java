package com.kh.poss.reserve.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.common.file.FileDTO;
import com.kh.poss.reserve.model.dao.ReserveDao;
import com.kh.poss.reserve.model.dto.Reserve;
import com.kh.poss.reserve.model.dto.ReserveConfig;

public class ReserveService {

	private ReserveDao reserveDao = new ReserveDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();

	public String isExsist(String userId) {
		String existId = null;
		Connection conn = template.getConnection();
		try {
			existId = reserveDao.isExsist(userId, conn);
		} finally {
			template.close(conn);
		}
		return existId;
	}

	public List<Reserve> selectReserveList(String userId) {

		List<Reserve> reserveList = null;
		Connection conn = template.getConnection();

		try {
			reserveList = reserveDao.selectBoardList(userId, conn);
		} finally {
			template.close(conn);
		}

		return reserveList;
	}

	public List<Reserve> selectDetailReserveList(String userId, String userName,
			String startDate, String endDate, int day) {

		List<Reserve> reserveList = null;
		Connection conn = template.getConnection();

		try {
			reserveList = reserveDao.selectDetailReserveList(userId, userName, startDate, endDate, day, conn);
		} finally {
			template.close(conn);
		}

		return reserveList;
	}

	public int countReservation(String userId) {
		Connection conn = template.getConnection();
		int count = 0;

		try {
			count = reserveDao.countReservation(conn, userId);
		} finally {
			template.close(conn);
		}

		return count;
	}

	public int insertReserve(Reserve reserve) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = reserveDao.insertReserve(reserve, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public Reserve selectReserveInfo(String userId, String phone) {
		Reserve reserve = null;
		Connection conn = template.getConnection();
		try {
			reserve = reserveDao.selectBoardList(userId, phone, conn);
		} finally {
			template.close(conn);
		}
		return reserve;
	}

	public int cancelReserve(String reserveIdx) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = reserveDao.cancelReserve(reserveIdx, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public int confirmWaitingByMessage(HttpServletRequest request, HttpServletResponse response, String userId,
			String reserveIdx) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = reserveDao.confirmWaitingByMessage(request, response, userId, reserveIdx, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;
	}

	public int confirmWaitingByMessage(HttpServletRequest request, HttpServletResponse response, Reserve reserve) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = reserveDao.confirmWaitingByMessage(request, response, reserve);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		return res;

	}

	public List<Reserve> searchReserve(String userId, String name, String phone) {
		List<Reserve> reserveList = null;
		Connection conn = template.getConnection();
		try {
			reserveList = reserveDao.searchReserve(userId, name, phone, conn);
		} finally {
			template.close(conn);
		}
		return reserveList;
	}

	public Reserve selectReserve(String reserveIdx) {
		Reserve reserve = null;
		Connection conn = template.getConnection();
		try {
			reserve = reserveDao.selectReserve(reserveIdx, conn);
		} finally {
			template.close(conn);
		}
		return reserve;
	}

	public ReserveConfig selectConfig(String userId) {
		ReserveConfig reserveConfig = null;

		Connection conn = template.getConnection();
		try {
			reserveConfig = reserveDao.selectConfig(userId, conn);
		} finally {
			template.close(conn);
		}
		return reserveConfig;
	}

	public void modifyReserve(String userId, String startPeriod, String endPeriod, String openTime, String closeTime,
			String introductionOfStore) {
		Connection conn = template.getConnection();

		try {
			reserveDao.modifyReserve(userId, startPeriod, endPeriod, openTime, closeTime, introductionOfStore, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
	}

	public void uploadImage(FileDTO fileDTO, String userId) {
		Connection conn = template.getConnection();

		try {
			reserveDao.uploadImage(fileDTO, userId, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}

	}

	public FileDTO selectImage(String userId) {
		FileDTO fileDTO = null;

		Connection conn = template.getConnection();
		try {
			fileDTO = reserveDao.selectImage(userId, conn);
		} finally {
			template.close(conn);
		}
		return fileDTO;
	}

	public List<Reserve> selectMessageList(String userId) {
		List<Reserve> reserveList = null;
		Connection conn = template.getConnection();
		try {
			reserveList = reserveDao.selectMessageList(userId, conn);
		} finally {
			template.close(conn);
		}
		return reserveList;

	}

}
