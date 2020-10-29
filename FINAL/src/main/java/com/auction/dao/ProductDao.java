package com.auction.dao;

import java.util.List;

import com.auction.vo.AuctionVo;
import com.auction.vo.ProductVo;

public interface ProductDao {
	int insertProduct(ProductVo vo);
	ProductVo selectOne(int pno);
	List<ProductVo> selectAuction();
	List<ProductVo> selectAuctionBlind();
	List<ProductVo> selectPop();
	List<ProductVo> selectHurry();
	int insertAuctionFirst(AuctionVo vo);
	int insertAuction(AuctionVo vo);
	List<ProductVo> showNormalCategory(String category);
	List<ProductVo> showBlindCategory(String category);
}
