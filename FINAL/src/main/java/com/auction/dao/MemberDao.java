package com.auction.dao;

import com.auction.vo.MemberDto;

public interface MemberDao {
	void write(MemberDto dto);		//회원가입
	
	boolean loginUp(MemberDto dto)throws Exception; 		//로그인
	
	void memberUpdate(MemberDto dto);	//회원 정보 수정
}
