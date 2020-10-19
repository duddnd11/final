package com.auction.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.vo.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertProduct(ProductVo vo) {
		return sqlSession.insert("com.yg.mapper.ProductMapper.insertProduct", vo);
	}

	@Override
	public ProductVo selectOne(int pno) {
		sqlSession.update("com.yg.mapper.ProductMapper.hitcountUp", pno);
		return sqlSession.selectOne("com.yg.mapper.ProductMapper.selectOne", pno);
	}

	@Override
	public List<ProductVo> selectAuction() {
		return sqlSession.selectList("com.yg.mapper.ProductMapper.selectAuction");
	}

	@Override
	public List<ProductVo> selectPop() {
		return sqlSession.selectList("com.yg.mapper.ProductMapper.selectPop");
	}

	@Override
	public List<ProductVo> selectHurry() {
		return sqlSession.selectList("com.yg.mapper.ProductMapper.selectHurry");
	}

	@Override
	public List<ProductVo> selectAuctionBlind() {
		return sqlSession.selectList("com.yg.mapper.ProductMapper.selectAuctionBlind");
	}
	
	
	

}
