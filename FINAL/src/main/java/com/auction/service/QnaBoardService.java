package com.auction.service;

import java.util.List;

import com.auction.vo.QnaBoardVo;

public interface QnaBoardService {
	public void wirteBoardService(QnaBoardVo vo);
	public List<QnaBoardVo> selectBoard(int offset);
	public QnaBoardVo selectContent(int qbno);
	public List<QnaBoardVo> selectBoardAll();
}
