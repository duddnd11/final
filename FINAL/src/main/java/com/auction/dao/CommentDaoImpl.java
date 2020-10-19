package com.auction.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.auction.vo.CommentVo;

public class CommentDaoImpl implements CommentDao{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void writeComment(CommentVo vo) {
		sqlSession.insert("com.auction.mapper.CommentMapper.writeComment", vo);
	}

	@Override
	public List<CommentVo> selectComment(int qbno) {
		return sqlSession.selectList("com.auction.mapper.CommentMapper.selectComment", qbno);
	}
}
