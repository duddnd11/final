package com.yw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yw.dao.MemberDao;
import com.yw.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	@Override
	public void insertMemberAction(MemberVo vo) {
		dao.insertMember(vo);
	}
	@Override
	public MemberVo loginMemberAction(MemberVo vo) {
		return dao.loginMember(vo);
	}
	@Override
	public void modifyMemberAction(MemberVo vo) {
		dao.modifyMember(vo);
	}
}
