package com.auction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.MemberDao;
import com.auction.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	
	@Override	//회원가입
	public void writeSignUp(MemberVo vo) {
		dao.write(vo);
	}
	
	@Override
	public MemberVo loginCheck(MemberVo vo) throws Exception{
//		dao.login(vo);
		return dao.login(vo);
	}
	
	@Override	//회원 정보 수정
	public void memberUpdate(MemberVo vo) {
		dao.memberUpdate(vo);
	}

}
