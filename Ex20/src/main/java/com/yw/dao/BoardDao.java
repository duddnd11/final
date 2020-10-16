package com.yw.dao;

import java.util.List;

import com.yw.vo.BoardVo;

public interface BoardDao {
	public List<BoardVo> selectBoard(int size, int offset);
	public List<BoardVo> selectBoardAll();
	public BoardVo detailBoard(int idx);
	public void writeBoard(BoardVo vo);
	public void updateRef(int idx);
	public int selectLevel(int ref);
	public void updateLevel(int level,int ref);
}
