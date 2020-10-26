package com.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.NoticeDao;
import com.auction.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao dao;
	
	@Override
	public List<NoticeVo> selectBoard(int offset) {
		return dao.selectBoard(offset);
	}

	@Override
	public NoticeVo selectContent(int nbo) {
		return dao.selectContent(nbo);
	}

	@Override
	public List<NoticeVo> selectBoardAll() {
		return dao.selectBoardAll();
	}

	@Override
	public void wirteBoardService(NoticeVo vo) {
		dao.writeBoard(vo);
	}

//	@Override
//	public void updateHitCount(int nbo) {
//		dao.updateHitCount(nbo);
//	}
}
