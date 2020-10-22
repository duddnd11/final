package com.auction.dao;

import java.util.List;

import com.auction.vo.ProductVo;

public interface AdminDao {
	List<ProductVo> dealProduct(int admin, int deal);
	List<ProductVo> adminProduct(int admin);
	List<ProductVo> showProduct();
//	List<MemberVo> showMember();
	
}
