package com.auction.dao;

import java.util.List;

import com.auction.vo.QnaBoardVo;

public interface QnaBoardDao {
	public void writeBoard(QnaBoardVo vo);
	public List<QnaBoardVo> selectBoard(int offset);
	public QnaBoardVo selectContent(int qbno);
	public List<QnaBoardVo> selectBoardAll();
	public List<QnaBoardVo> searchTitleSize(String keyword);
	public List<QnaBoardVo> searchContentSize(String keyword);
	public List<QnaBoardVo> searchWriterSize(String keyword);
	
	public List<QnaBoardVo> searchTitle(String keyword,int offset);
	public List<QnaBoardVo> searchContent(String keyword,int offset);
	public List<QnaBoardVo> searchWriter(String keyword,int offset);
}
