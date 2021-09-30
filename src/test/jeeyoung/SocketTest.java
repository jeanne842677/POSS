package test.jeeyoung;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


// WebSocket 호스트 설정
@ServerEndpoint("/socketTest")
public class SocketTest {
// 접속 된 클라이언트 WebSocket session 관리 리스트
	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
// 메시지에서 유저 명을 취득하기 위한 정규식 표현

	
	
// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen(Session userSession) {
		sessionUsers.add(userSession);  //현재 세션을 세션리스트에 저장함
		System.out.println("client is now connected...");
	}

	
// WebSocket으로 메시지가 오면 요청되는 함수
	@OnMessage   //message :유저가 보낸 메세지  userSession : 유저의 세션정보
	public void handleMessage(String message, Session userSession) throws IOException {
// 메시지 내용을 콘솔에 출력한다.
		System.out.println(message);
		

		
		sessionUsers.forEach(session -> {
	
			
			try {
// 리스트에 있는 모든 세션(메시지 보낸 유저 제외)에 메시지를 보낸다. (형식: 유저명 => 메시지)
				session.getBasicRemote().sendText(message);
				
			} catch (IOException e) {
// 에러가 발생하면 콘솔에 표시한다.
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
