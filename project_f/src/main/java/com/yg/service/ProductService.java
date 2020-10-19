package com.yg.service;

import java.util.List;

import com.yg.dto.ProductVo;

public interface ProductService {
	int insertProduct(ProductVo vo);
	ProductVo selectOne(int pno);
	List<ProductVo> selectAll();
	List<ProductVo> selectPop();
	List<ProductVo> selectHurry();
}
