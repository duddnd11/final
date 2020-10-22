package com.auction.dao;

import java.util.List;

import com.auction.vo.NoticeVo;

public interface NoticeDao {
	public List<NoticeVo> selectBoard(int offset);
	public NoticeVo selectContent(int qbno);
	public void updateHitCount(int qbno);
	public List<NoticeVo> selectBoardAll();

}
