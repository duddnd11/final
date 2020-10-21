package com.auction.dao;

import java.util.List;

import com.auction.vo.QnaBoardVo;

public interface QnaBoardDao {
	public void writeBoard(QnaBoardVo vo);
	public List<QnaBoardVo> selectBoard(int offset);
	public QnaBoardVo selectContent(int qbno);
	public List<QnaBoardVo> selectBoardAll();
	public List<QnaBoardVo> searchKeyword(String keyword,int offset);
	public List<QnaBoardVo> keywordSize(String keyword);
}
