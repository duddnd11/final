package com.auction.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.auction.vo.QnaBoardVo;

public class QnaBoardDaoImpl implements QnaBoardDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void writeBoard(QnaBoardVo vo) {
		sqlSession.insert("com.auction.mapper.QnaBoardMapper.writeBoard",vo);
	}

	@Override
	public List<QnaBoardVo> selectBoard(int offset) {
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.selectBoard",offset);
	}

	@Override
	public QnaBoardVo selectContent(int qbno) {
		return sqlSession.selectOne("com.auction.mapper.QnaBoardMapper.selectContent", qbno);
	}
}
