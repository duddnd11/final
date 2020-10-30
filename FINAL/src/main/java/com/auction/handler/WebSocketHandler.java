package com.auction.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
public class WebSocketHandler extends TextWebSocketHandler{
	@Autowired
	private ChatRoomRepository chatRoomRepository;
	private final ObjectMapper objectMapper = new ObjectMapper();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		System.out.println(msg);
		ChatMessage chatMessage = objectMapper.readValue(msg, ChatMessage.class);
		ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
		chatRoom.handleMessage(session, chatMessage, objectMapper);
	}
}
