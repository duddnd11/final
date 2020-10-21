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
	public List<QnaBoardVo> searchTitleSize(String keyword) {
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.searchTitleSize",keyword);
	}
	
	@Override
	public List<QnaBoardVo> searchContentSize(String keyword) {
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.searchContentSize",keyword);
	}
	
	@Override
	public List<QnaBoardVo> searchWriterSize(String keyword) {
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.searchWriterSize",keyword);
	}

	@Override
	public List<QnaBoardVo> searchTitle(String keyword,int offset) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("offset", offset);
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.searchTitle", map);
	}


	@Override
	public List<QnaBoardVo> searchContent(String keyword, int offset) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("offset", offset);
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.searchContent", map);
	}

	@Override
	public List<QnaBoardVo> searchWriter(String keyword, int offset) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("offset", offset);
		return sqlSession.selectList("com.auction.mapper.QnaBoardMapper.searchWriter", map);
	}

}
