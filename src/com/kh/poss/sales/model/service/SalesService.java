package com.kh.poss.sales.model.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.sales.model.dto.Sales;
import com.kh.poss.sales.model.dao.SalesDao;

public class SalesService {

	private JDBCTemplate template = JDBCTemplate.getInstance();
	private SalesDao salesDao = new SalesDao();
	
	public Map<String,Object> selectMenuRank(String userId, String period) {
		  Map<String,Object> rankMap = null;
	      Connection conn = template.getConnection();
	      try {
	    	  rankMap = salesDao.selectMenuRank(userId, period, conn);
	      } finally {
	         template.close(conn);
	      }
	      return rankMap;
	}
	
	public int selectTotalSales(String userId, String period) {
		int res = 0;
		Connection conn = template.getConnection();
		try {
			res = salesDao.selectTotalSales(userId, period, conn);
		} finally {
			template.close(conn);
		}
		return res;
	}
	
	public int selectTotalSalesCnt(String userId, String period) {
		int res = 0;
		Connection conn = template.getConnection();
		try {
			res = salesDao.selectTotalSalesCnt(userId, period, conn);
		} finally {
			template.close(conn);
		}
		return res;
	}
	
	public int selectTodaySales(String userId) {
		int res = 0;
		Connection conn = template.getConnection();
		try {
			res = salesDao.selectTodaySales(userId, conn);
		} finally {
			template.close(conn);
		}
		return res;
	}

	public List<Sales> selectSalesList(String userId, String period) {
		List<Sales> salesList = null;
	    Connection conn = template.getConnection();
	    try {
	    	salesList = salesDao.selectSalesList(userId, period, conn);
	    } finally {
	        template.close(conn);
	    }
	    return salesList;
	}
	
	public Map<String,Object> selectTodayMenu(String userId, String period) {
		  Map<String,Object> todayMap = null;
	      Connection conn = template.getConnection();
	      try {
	    	  todayMap = salesDao.selectTodayMenu(userId, period, conn);
	      } finally {
	         template.close(conn);
	      }
	      return todayMap;
	}
}
	

