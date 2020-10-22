package com.auction.service;

import java.util.List;

import com.auction.vo.NoticeVo;

public interface NoticeService {
	public List<NoticeVo> selectBoard(int offset);
	public NoticeVo selectContent(int qbno);
	public void updateHitCount(int qbno);
	public List<NoticeVo> selectBoardAll();
}
