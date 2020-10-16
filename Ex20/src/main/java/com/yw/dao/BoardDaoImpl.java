package com.yw.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.yw.vo.BoardVo;

public class BoardDaoImpl implements BoardDao {
	@Autowired
	SqlSession sqlSession;
	@Override
	public List<BoardVo> selectBoard(int size, int offset) {
		HashMap<String, Integer> map =new HashMap<String,Integer>();
		map.put("size", size);
		map.put("offset", offset);
		return sqlSession.selectList("com.yw.mapper.BoardMapper.selectBoard", map);
	}
	@Override
	public List<BoardVo> selectBoardAll() {
		return sqlSession.selectList("com.yw.mapper.BoardMapper.selectBoardAll");
	}
	@Override
	public BoardVo detailBoard(int idx) {
		return sqlSession.selectOne("com.yw.mapper.BoardMapper.detailBoard", idx);
	}
	@Override
	public void writeBoard(BoardVo vo) {
		sqlSession.insert("com.yw.mapper.BoardMapper.writeBoard", vo);
	}
	@Override
	public void updateRef(int idx) {
		sqlSession.update("com.yw.mapper.BoardMapper.updateRef", idx);
	}
	@Override
	public int selectLevel(int ref) {
		return sqlSession.selectOne("com.yw.mapper.BoardMapper.selectLevel", ref);
	}
	@Override
	public void updateLevel(int level, int ref) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("level", level);
		map.put("ref", ref);
		sqlSession.update("com.yw.mapper.BoardMapper.updateLevel", map);
	}

}
