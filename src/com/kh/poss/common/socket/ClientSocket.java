package com.kh.poss.common.socket;

import java.net.URI;

import org.java_websocket.client.WebSocketClient;
import org.java_websocket.drafts.Draft;
import org.java_websocket.handshake.ServerHandshake;

public class ClientSocket extends WebSocketClient{

			
	public ClientSocket(URI serverUri, Draft draft) {
		super(serverUri, draft);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void onOpen(ServerHandshake handshakedata) {
		System.out.println("서버가 연결되었습니다.");

	}

	
	//메세지가 오면?
	@Override
	public void onMessage(String message) {
		
		if(message=="waiting-insert") {
			
			
		}
		System.out.println(message);
		
	}

	@Override
	public void onClose(int code, String reason, boolean remote) {
		System.out.println("서버가 종료되었습니다.");
	}

	@Override
	public void onError(Exception ex) {
		System.out.println("서버 에러");
	}
	
	
	
		

}
