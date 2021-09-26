package com.kh.poss.seat.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletInputStream;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.seat.model.dao.SeatDao;
import com.kh.poss.seat.model.dto.Seat;
import com.kh.poss.seat.model.dto.SeatHTML;

public class SeatService {

	private SeatDao seatDao = new SeatDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();

	
	
	public void saveHtml(SeatHTML seat) {

		Connection conn = template.getConnection();

		try {
			
			seatDao.saveHtml(seat, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
			
		} finally {
			
			template.close(conn);
		}

	}

	
	
	
	
	public List<SeatHTML> selectSeatList(String userId) {

		Connection conn = template.getConnection();
		List<SeatHTML> seatList = new ArrayList<>();

		try {
			seatList = seatDao.selectSeatList(userId, conn);
		} finally {
			template.close(conn);
		}

		return seatList;

	}




	//post로 넘어온 body읽기
	private String getBody(ServletInputStream inputStream) throws IOException {
		
		
		InputStreamReader ir = new InputStreamReader(inputStream);
		BufferedReader br = new BufferedReader(ir);
		
		String res="" ;
		StringBuffer file = new StringBuffer("");
		
		while((res=br.readLine())!=null) {
			
			file.append(res);
		}
		
		return file.toString();
	}



	public String jsonParse(ServletInputStream inputStream) throws IOException {
		
		
		String body = getBody(inputStream);
		Gson gson = new Gson();
		Map<String , Object> map = gson.fromJson(body, Map.class);
		String html = (String) map.get("table");
		
		String tables = map.get("tables").toString();
		JsonArray tablesArr = gson.fromJson(tables, JsonArray.class);
		
		
		/*
		List<Map<String, String>> tableList = new ArrayList<>();
		for(int i = 0; i<tablesArr.size(); i++) {
			
			Map<String , String> tableMap = gson.fromJson(tablesArr.get(i).toString(), Map.class);
			tableList.add(tableMap);
			
			
		}
		
		System.out.println(tableList);
		//tableList = > 테이블 리스트가 담겨있는 map
		
		for(Map<String, String> tm : tableList) {
			Seat seat = new Seat();
			String seatIdx = tm.get("seat_idx");
			String seatName = tm.get("set_name");
			
			if(seatIdx=="undefine") {
				seat.setSeatIdx(seadtIdx);
				seat.setSeatName(seatName);
				insertSeat(seat);
			
			}
			
		}
		*/
		
		html = html.trim();
		
		
		return html;
		
	}
	
	
	/*
	public void insertSeat(Seat seat) {

		Connection conn = template.getConnection();

		try {
			
			seatDao.insertSeat(seat , conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
			
		} finally {
			
			template.close(conn);
		}

	}

	*/
	

}
