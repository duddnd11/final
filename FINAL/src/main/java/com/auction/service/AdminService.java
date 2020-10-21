package com.auction.service;

import java.util.List;

import com.auction.vo.ProductVo;

public interface AdminService {
	List<ProductVo> adminProduct(int admin, int deal);
	List<ProductVo> showProduct();
//	List<MemberVo> showMember();
}
