package com.kh.poss.waiting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.kh.poss.menu.model.service.MenuService;
import com.kh.poss.waiting.model.service.WaitingService;

// WebSocket 호스트 설정
@ServerEndpoint("/waitingSocket")
public class WaitingSocket {
// 접속 된 클라이언트 WebSocket session 관리 리스트
	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
// 메시지에서 유저 명을 취득하기 위한 정규식 표현

	
	
// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen(Session userSession) {
		sessionUsers.add(userSession);  //현재 세션을 세션리스트에 저장함
		System.out.println("웨이팅 소켓에 새연결 감지");
		for(Session session : sessionUsers) {
			try {
				session.getBasicRemote().sendText("새 연결 안녕?");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

	
// WebSocket으로 메시지가 오면 요청되는 함수
	@OnMessage   //message :유저가 보낸 메세지  userSession : 유저의 세션정보
	public void handleMessage(String message, Session userSession) throws IOException {
		
		System.out.println("날아온 메세지: " + message);
		
		switch(message) {
		case "remove-waiting" :
			forSessions(sessionUsers , "remove-waiting");
			break;
			
		case "waiting-add" :
			forSessions(sessionUsers , "waiting-add");
			break;
		
		}

		
		
		
	}
	
	 private void forSessions(List<Session> sessionUsers , String message) {
		 
		 sessionUsers.forEach(session -> {

				try {
					session.getBasicRemote().sendText(message);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			});
	
		 
	 }
	
	
	
	

// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose(Session userSession) {
// session 리스트로 접속 끊은 세션을 제거한다.
		sessionUsers.remove(userSession);
// 콘솔에 접속 끊김 로그를 출력한다.
		System.out.println("client is now disconnected...");
	}
}
