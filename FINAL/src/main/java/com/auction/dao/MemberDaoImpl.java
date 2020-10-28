package com.auction.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.vo.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override		//회원가입
	public void write(MemberDto dto) {
		sqlSession.insert("com.ya.mapper.SignUpMapper.insert", dto);
	}
	
	@Override
	public MemberDto login(MemberDto dto) {
		return sqlSession.selectOne("com.ya.mapper.SignUpMapper.login", dto);
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
	public void memberUpdate(MemberDto dto) {
		sqlSession.update("com.ya.mapper.SignUpMapper.memberUpdate", dto);
	}

}
