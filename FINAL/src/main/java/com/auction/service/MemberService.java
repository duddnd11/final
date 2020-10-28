package com.auction.service;

import com.auction.vo.MemberDto;


public interface MemberService {
	void writeSignUp(MemberDto dto);	//회원 가입
	
	MemberDto loginCheck(MemberDto dto) throws Exception;	//로그인
	
	void memberUpdate(MemberDto dto);	//회원 정보 수정
}
