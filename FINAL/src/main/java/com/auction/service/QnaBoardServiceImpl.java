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
	public List<QnaBoardVo> selectBoard() {
		return dao.selectBoard(0);
	}

	@Override
	public QnaBoardVo selectContent(int qbno) {
		return dao.selectContent(qbno);
	}
}
