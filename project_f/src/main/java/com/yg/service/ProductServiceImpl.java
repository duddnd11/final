package com.yg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yg.dao.ProductDao;
import com.yg.dto.ProductVo;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;
	
	@Override
	public int insertProduct(ProductVo vo) {
		return dao.insertProduct(vo);
	}

	@Override
	public ProductVo selectOne(int pno) {
		return dao.selectOne(pno);
	}

	@Override
	public List<ProductVo> selectPop() {
		return dao.selectPop();
	}

	@Override
	public List<ProductVo> selectHurry() {
		return dao.selectHurry();
	}

	@Override
	public List<ProductVo> selectAuction() {
		return dao.selectAuction();
	}

	@Override
	public List<ProductVo> selectAuctionBlind() {
		return dao.selectAuctionBlind();
	}

}
