package com.auction.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{
	// 웹 소켓 세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	// 클라이언트 연결 후.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		System.out.println(session.getAttributes());
//		Map<String,Object> map = session.getAttributes();
//		System.out.println(map.get("아이디"));
		sessionList.add(session);
//		sessionList.add((WebSocketSession) map.get("아이디"));
		logger.info("{} 연결됨",session.getId());
		System.out.println("입장:"+session.getId());
//		System.out.println("채팅방 입장자 : "+ session.getPrincipal().getName());
		for(int i=0; i<sessionList.size();i++) {
			System.out.println(sessionList.get(i));
		}
	}
	// 웹 소켓 서버로 데이터 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음",session.getId(),message.getPayload());
//		session.getPrincipal().getName()
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId()+" : "+message.getPayload()+"<br/>"));
		}
	}
	// 연결이 끊어진 경우
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		
		logger.info("{} 연결 끊김.",session.getId());
//		System.out.println("채팅방 퇴장자 :"+session.getPrincipal().getName());
		System.out.println("퇴장:"+session.getId());
	}
	
}
