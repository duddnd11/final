package com.yw.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.yw.vo.MemberVo;

public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSession sqlSession;
	@Override
	public void insertMember(MemberVo vo) {
		sqlSession.insert("com.yw.mapper.MemberMapper.insertMember", vo);
	}
	@Override
	public MemberVo loginMember(MemberVo vo) {
		return sqlSession.selectOne("com.yw.mapper.MemberMapper.loginMember", vo);
	}
	@Override
	public void modifyMember(MemberVo vo) {
		sqlSession.update("com.yw.mapper.MemberMapper.modifyMember", vo);
	}
}
