package com.auction.dao;

import java.util.List;

import com.auction.vo.ProductVo;

public interface AdminDao {
	List<ProductVo> adminProduct(int admin, int deal);
	List<ProductVo> showProduct();
//	List<MemberVo> showMember();
	
}
