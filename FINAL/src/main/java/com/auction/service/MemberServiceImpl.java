package com.auction.service;

import javax.servlet.http.HttpSession;

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
	
	@Override	//로그인
	public boolean loginCheck(MemberDto dto, HttpSession session) throws Exception{
		
		boolean result = dao.loginUp(dto);
		if(result == true) {	//true일 경우 세션 등록
			//세션 변수 등록
			session.setAttribute("ID", dto.getID());
		}
		return result;
	}
	
	@Override	//회원 정보 수정
	public void memberUpdate(MemberDto dto) {
		dao.memberUpdate(dto);
	}

}
