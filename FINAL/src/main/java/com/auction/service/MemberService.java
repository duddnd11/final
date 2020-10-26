package com.auction.service;

import javax.servlet.http.HttpSession;

import com.auction.vo.MemberDto;


public interface MemberService {
	void writeSignUp(MemberDto dto);	//회원 가입
	
	boolean loginCheck(MemberDto dto, HttpSession session) throws Exception;		//로그인
	
	void memberUpdate(MemberDto dto);	//회원 정보 수정
}
