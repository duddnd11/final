package com.auction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.MemberDao;
import com.auction.vo.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	
	@Override	//회원가입
	public void writeSignUp(MemberDto dto) {
		dao.write(dto);
	}
	
	@Override
	public MemberDto loginCheck(MemberDto dto) throws Exception{
//		dao.login(vo);
		return dao.login(dto);
	}
	
	@Override	//회원 정보 수정
	public void memberUpdate(MemberDto dto) {
		dao.memberUpdate(dto);
	}

}
