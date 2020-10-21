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
		int result =  sqlSession.insert("com.auctioin.mapper.ProductMapper.insertProduct", vo);
		sqlSession.update("com.auctioin.mapper.ProductMapper.startmoney");
		sqlSession.update("com.auctioin.mapper.ProductMapper.lastmoney");
		sqlSession.update("com.auctioin.mapper.ProductMapper.timeout");
		return result;
	}

	@Override
	public ProductVo selectOne(int pno) {
		sqlSession.update("com.auctioin.mapper.ProductMapper.hitcountUp", pno);
		return sqlSession.selectOne("com.auctioin.mapper.ProductMapper.selectOne", pno);
	}

	@Override
	public List<ProductVo> selectAuction() {
		return sqlSession.selectList("com.auctioin.mapper.ProductMapper.selectAuction");
	}

	@Override
	public List<ProductVo> selectPop() {
		return sqlSession.selectList("com.auctioin.mapper.ProductMapper.selectPop");
	}

	@Override
	public List<ProductVo> selectHurry() {
		return sqlSession.selectList("com.auctioin.mapper.ProductMapper.selectHurry");
	}

	@Override
	public List<ProductVo> selectAuctionBlind() {
		return sqlSession.selectList("com.auctioin.mapper.ProductMapper.selectAuctionBlind");
	}
	
	
	

}
