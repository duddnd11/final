package com.kk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auction.handler.ChatRoom;
import com.auction.handler.ChatRoomRepository;
import com.auction.vo.ChatRoomForm;

@Controller
public class ChatController {
	@Autowired
	private ChatRoomRepository chatRoomRepository;
	
		@RequestMapping(value = "/rooms")
	    public String rooms(Model model){
	        model.addAttribute("rooms",chatRoomRepository.findAllRoom());
	        return "rooms";
	    }
		// 방번호찾아서 들어감
		@RequestMapping(value = "/room")
	    public String room(String id, Model model){
	        ChatRoom room = chatRoomRepository.findRoomById(id);
	        model.addAttribute("room",room);
	        return "room";
	    }
//		@RequestMapping(value = "/new")
//	    public String make(Model model){
//	        ChatRoomForm form = new ChatRoomForm();
//	        model.addAttribute("form",form);
//	        return "newRoom";
//	    }
		//새로운 채팅방 생성
		@RequestMapping(value = "/new")
	    public String makeRoom(ChatRoomForm form,Model model){
			ChatRoom room=chatRoomRepository.createChatRoom(form.getName());
	        model.addAttribute("room",room);
	        return "room";
	    }
}
