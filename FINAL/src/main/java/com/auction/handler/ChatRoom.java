package com.auction.handler;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.auction.handler.ChatMessage.MessageType;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ChatRoom {
	private String roomId; 
	private String name; // 방이름
	private Set<WebSocketSession> sessions = new HashSet<>(); // 접속 세션
	
	// 방생성
	public static ChatRoom create(String name) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.roomId=UUID.randomUUID().toString();
		chatRoom.name=name;
		return chatRoom;
	}
	
	public void handleMessage(WebSocketSession session, ChatMessage chatMessage, ObjectMapper objectMapper) throws IOException {
		if(chatMessage.getType() == MessageType.ENTER) {
			sessions.add(session);
			chatMessage.setMessage(chatMessage.getWriter()+"님 입장");
		}else if(chatMessage.getType()==MessageType.LEAVE) {
			sessions.remove(session);
			chatMessage.setMessage(chatMessage.getWriter()+"님 퇴장");
		}else {
			chatMessage.setMessage(chatMessage.getWriter()+":"+chatMessage.getMessage());
		}
		send(chatMessage,objectMapper);
	}
	
	public void send(ChatMessage chatMessage, ObjectMapper objectMapper) throws IOException {
		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMessage()));
		
		for(WebSocketSession sess : sessions) {
			sess.sendMessage(textMessage);
		}
	}
	
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<WebSocketSession> getSessions() {
		return sessions;
	}

	public void setSessions(Set<WebSocketSession> sessions) {
		this.sessions = sessions;
	}
	
}












