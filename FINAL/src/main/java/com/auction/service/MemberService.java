package com.auction.service;

import com.auction.vo.MemberVo;


public interface MemberService {
	void writeSignUp(MemberVo vo);	//회원 가입
	
	MemberVo loginCheck(MemberVo vo) throws Exception;	//로그인
	
	void memberUpdate(MemberVo vo);	//회원 정보 수정
	
	public int apiLogin(String id, String api);
	
	public void insertApi(MemberVo vo);
}
