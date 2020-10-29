package com.auction.dao;

import com.auction.vo.MemberVo;

public interface MemberDao {
	void write(MemberVo vo);		//회원가입
	
	MemberVo login(MemberVo vo);	//로그인
	
	void memberUpdate(MemberVo vo);	//회원 정보 수정
}
