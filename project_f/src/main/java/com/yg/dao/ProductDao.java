package com.yg.dao;

import java.util.List;

import com.yg.dto.ProductVo;

public interface ProductDao {
	int insertProduct(ProductVo vo);
	ProductVo selectOne(int pno);
	List<ProductVo> selectAuction();
	List<ProductVo> selectPop();
	List<ProductVo> selectHurry();
	
}
