package com.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.AdminDao;
import com.auction.vo.ProductVo;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao dao;
	
	@Override
	public List<ProductVo> adminProduct(int admin, int deal) {
		return dao.adminProduct(admin, deal);
	}

	@Override
	public List<ProductVo> showProduct() {
		return dao.showProduct();
	}

}
