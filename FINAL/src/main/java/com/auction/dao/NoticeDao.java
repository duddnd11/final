package com.auction.dao;

import java.util.List;

import com.auction.vo.NoticeVo;
import com.auction.vo.QnaBoardVo;

public interface NoticeDao {
	public void writeBoard(NoticeVo vo);
	
	public List<NoticeVo> selectBoard(int offset);
	public NoticeVo selectContent(int nbo);
	public List<NoticeVo> selectBoardAll();
//	public void updateHitCount(int nbo);

}
