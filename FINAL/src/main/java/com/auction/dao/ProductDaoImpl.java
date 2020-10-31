package com.auction.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.vo.AuctionVo;
import com.auction.vo.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertProduct(ProductVo vo) {
		int result =  sqlSession.insert("com.auction.mapper.ProductMapper.insertProduct", vo);
		sqlSession.update("com.auction.mapper.ProductMapper.startmoney", vo.getPno());
		sqlSession.update("com.auction.mapper.ProductMapper.lastmoney", vo.getPno());
		return result;
	}

	@Override
	public ProductVo selectOne(int pno) {
		sqlSession.update("com.auction.mapper.ProductMapper.timeout");
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
	public List<ProductVo> showNormalCategory(String category) {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.normalCategory", category);
	}

	@Override
	public int insertAuction(AuctionVo vo) {
		int result=0;
		int select = sqlSession.selectOne("com.auction.mapper.ProductMapper.showAuction", vo.getPno());
		if(select>0) {
			result = sqlSession.insert("com.auction.mapper.ProductMapper.insertAuction", vo);
			result += sqlSession.update("com.auction.mapper.ProductMapper.updateMoney", vo.getPno());
		}else {
			result = sqlSession.insert("com.auction.mapper.ProductMapper.insertAuction", vo);
			result += sqlSession.update("com.auction.mapper.ProductMapper.updateMoneyFirst", vo.getPno());
		}
		return result;
	}

	
	@Override
	public List<ProductVo> showBlindCategory(String category) {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.blindCategory", category);
	}

}
