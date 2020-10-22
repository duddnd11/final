package com.auction.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.auction.vo.NoticeVo;
import com.auction.vo.QnaBoardVo;

public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<NoticeVo> selectBoard(int offset) {
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.selectBoard", offset);
	}

	@Override
	public NoticeVo selectContent(int qbno) {
		return sqlSession.selectOne("com.auction.mapper.NoticeMapper.selectContent", qbno);
	}

	@Override
	public void updateHitCount(int qbno) {
		sqlSession.update("com.auction.mapper.NoticeMapper.updateHitcount", qbno);
	}

	@Override
	public List<NoticeVo> selectBoardAll() {
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.selectBoardAll");
	}


}
