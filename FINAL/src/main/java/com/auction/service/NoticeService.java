package com.auction.service;

import java.util.List;

import com.auction.vo.NoticeVo;
import com.auction.vo.QnaBoardVo;

public interface NoticeService {
	public void wirteBoardService(NoticeVo vo);
	public List<NoticeVo> selectBoard(int offset);
	public NoticeVo selectContent(int nbo);
	public List<NoticeVo> selectBoardAll();
//	public void updateHitCount(int nbo);
}
