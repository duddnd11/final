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
	public NoticeVo selectContent(int nbo) {
		return sqlSession.selectOne("com.auction.mapper.NoticeMapper.selectContent", nbo);
	}


	@Override
	public List<NoticeVo> selectBoardAll() {
		return sqlSession.selectList("com.auction.mapper.NoticeMapper.selectBoardAll");
	}

	@Override
	public void writeBoard(NoticeVo vo) {
		sqlSession.insert("com.auction.mapper.NoticeMapper.writeBoard", vo);
	}

//	@Override
//	public void updateHitCount(int nbo) {
//		sqlSession.update("com.auction.mapper.NoticeMapper.updateHitcount", nbo);
//	}

}
