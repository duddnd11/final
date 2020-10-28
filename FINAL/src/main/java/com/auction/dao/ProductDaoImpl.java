package com.auction.dao;

import java.util.HashMap;
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
		int result =  sqlSession.insert("com.auction.mapper.ProductMapper.insertProduct", vo);
		sqlSession.update("com.auction.mapper.ProductMapper.startmoney");
		sqlSession.update("com.auction.mapper.ProductMapper.lastmoney");
		sqlSession.update("com.auction.mapper.ProductMapper.timeout");
		return result;
	}

	@Override
	public ProductVo selectOne(int pno) {
		sqlSession.update("com.auction.mapper.ProductMapper.hitcountUp", pno);
		return sqlSession.selectOne("com.auction.mapper.ProductMapper.selectOne", pno);
	}

	@Override
	public List<ProductVo> selectAuction() {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.selectAuction");
	}

	@Override
	public List<ProductVo> selectPop() {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.selectPop");
	}

	@Override
	public List<ProductVo> selectHurry() {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.selectHurry");
	}

	@Override
	public List<ProductVo> selectAuctionBlind() {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.selectAuctionBlind");
	}

	@Override
	public List<ProductVo> showCategory(String category, String auctionmenu) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("auctionmenu", auctionmenu);
		return sqlSession.selectList("com.auction.mapper.ProductMapper.category", map);
	}

	
	
	

}
