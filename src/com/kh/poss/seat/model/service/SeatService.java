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
import com.kh.poss.common.db.JDBCTemplate;
import com.kh.poss.seat.model.dao.SeatDao;
import com.kh.poss.seat.model.dto.Seat;

public class SeatService {

	private SeatDao seatDao = new SeatDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();

	
	
	public void saveHtml(Seat seat) {

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

	
	
	
	
	public List<Seat> selectSeatList(String userId) {

		Connection conn = template.getConnection();
		List<Seat> seatList = new ArrayList<>();

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
		html = html.trim();
		
		return html;
		
	}
	
	
	
	

}
