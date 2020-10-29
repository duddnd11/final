package com.auction.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.vo.MemberVo;


@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override		//회원가입
	public void write(MemberVo vo) {
		sqlSession.insert("com.auction.mapper.SignUpMapper.insert", vo);
	}
	
	@Override
	public MemberVo login(MemberVo vo) {
		return sqlSession.selectOne("com.auction.mapper.SignUpMapper.login", vo);
//		if(voDB == null) {
//			return false;
//		}
//		if(vo.getID().equals(voDB.getID()) && vo.getPW().equals(voDB.getPW())) {
//			return true;
//		}else {
//			return false;
//		}
	}
		
	
	@Override		//회원 정보 수정
	public void memberUpdate(MemberVo vo) {
		sqlSession.update("com.auction.mapper.SignUpMapper.memberUpdate", vo);
	}

}
