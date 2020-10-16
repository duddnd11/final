package com.yw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yw.dao.BoardDao;
import com.yw.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao dao;
	@Override
	public List<BoardVo> selectBoardAction(int size, int offset) {
		return dao.selectBoard(size, offset);
	}
	@Override
	public List<BoardVo> selectBoardAllAction() {
		// TODO Auto-generated method stub
		return dao.selectBoardAll();
	}
	@Override
	public BoardVo detailBoardAction(int idx) {
		return dao.detailBoard(idx);
	}
	@Override
	public void writeBoardAction(BoardVo vo) {
		dao.writeBoard(vo);
	}
	@Override
	public void updateRefAction(int idx) {
		dao.updateRef(idx);
	}
	@Override
	public int selectLevelAction(int ref) {
		return dao.selectLevel(ref);
	}
	@Override
	public void updateLevelAction(int level, int ref) {
		dao.updateLevel(level, ref);
	}
}
