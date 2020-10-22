package com.auction.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.vo.ProductVo;
@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ProductVo> dealProduct(int admin, int deal) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("admin", admin);
		map.put("deal", deal);
		return sqlSession.selectList("com.auction.mapper.AdminMapper.dealProduct", map);
	}

	@Override
	public List<ProductVo> showProduct() {
		return sqlSession.selectList("com.auction.mapper.AdminMapper.showProduct");
	}

	@Override
	public List<ProductVo> adminProduct(int admin) {
		return sqlSession.selectList("com.auction.mapper.AdminMapper.adminProduct", admin);
	}

}
