package com.auction.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<QnaBoardVo> selectBoardAll() {
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.selectBoardAll");
	}

	@Override
	public List<QnaBoardVo> searchKeyword(String keyword,int offset) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("offset", offset);
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.searchKeyword", map);
	}

	@Override
	public List<QnaBoardVo> keywordSize(String keyword) {
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.keywordSize",keyword);
	}
}
