package com.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.QnaBoardDao;
import com.auction.vo.QnaBoardVo;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	@Autowired
	QnaBoardDao dao;

	@Override
	public void wirteBoardService(QnaBoardVo vo) {
		dao.writeBoard(vo);
	}

	@Override
	public List<QnaBoardVo> selectBoard(int offset) {
		return dao.selectBoard(offset);
	}

	@Override
	public QnaBoardVo selectContent(int qbno) {
		return dao.selectContent(qbno);
	}

	@Override
	public List<QnaBoardVo> selectBoardAll() {
		return dao.selectBoardAll();
	}

	@Override
	public List<QnaBoardVo> searchKeyword(String keyword,int offset) {
		return dao.searchKeyword(keyword,offset);
	}

	@Override
	public List<QnaBoardVo> keywordSize(String keyword) {
		return dao.keywordSize(keyword);
	}
}
