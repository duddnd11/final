package com.yw.service;

import java.util.List;

import com.yw.vo.BoardVo;

public interface BoardService {
	public List<BoardVo> selectBoardAction(int size, int offset);
	public List<BoardVo> selectBoardAllAction();
	public BoardVo detailBoardAction(int idx);
	public void writeBoardAction(BoardVo vo);
	public void updateRefAction(int idx);
	public int selectLevelAction(int ref);
	public void updateLevelAction(int level, int ref);
}
