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
	int insertAuction(AuctionVo vo,String auctionmenu,int diff, int myDiff);
	List<ProductVo> showNormalCategory(String category);
	List<ProductVo> showBlindCategory(String category);
	int dealChage(int pno);
	
	public AuctionVo blindCharge(int pno);
}
