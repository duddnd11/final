package com.auction.service;

import java.util.List;

import com.auction.vo.AuctionVo;
import com.auction.vo.ProductVo;

public interface AdminService {
	List<ProductVo> dealProduct(int admin, int deal);
	List<ProductVo> adminProduct(int admin);
	List<ProductVo> adminProductPage(int admin,int offset);
	List<ProductVo> showProduct();
//	List<MemberVo> showMember();
	List<ProductVo> saleItem(String ID);
	List<AuctionVo> buyItem(String ID);
	List<ProductVo> showProductPage(int offset);
}
