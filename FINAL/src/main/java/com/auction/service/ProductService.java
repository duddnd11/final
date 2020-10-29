package com.auction.service;

import java.util.List;

import com.auction.vo.ProductVo;

public interface ProductService {
	int insertProduct(ProductVo vo);
	ProductVo selectOne(int pno);
	List<ProductVo> selectAuction();
	List<ProductVo> selectAuctionBlind();
	List<ProductVo> selectPop();
	List<ProductVo> selectHurry();
	List<ProductVo> showNormalCategory(String category);
	List<ProductVo> showBlindCategory(String category);
}
