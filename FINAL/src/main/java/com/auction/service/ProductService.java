package com.auction.service;

import java.util.List;

import com.auction.vo.AuctionVo;
import com.auction.vo.ProductVo;

public interface ProductService {
	int insertProduct(ProductVo vo);
	ProductVo selectOne(int pno);
	List<ProductVo> selectAuction();
	List<ProductVo> selectAuctionBlind();
	List<ProductVo> selectPop();
	List<ProductVo> selectHurry();
//	List<ProductVo> showCategory(String category, String auctionmenu);
	int insertAuction(AuctionVo vo,String auctionmenu,int diff, int myDiff);
	List<ProductVo> showNormalCategory(String category);
	List<ProductVo> showBlindCategory(String category);
	int dealChage(int pno);
	int hitcountUp(int pno);
	AuctionVo blincCharge(int pno);
	int addLike(String str, String ID);
	String selectLike(String ID);
}
