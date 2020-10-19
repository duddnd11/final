package com.yg.pro_f;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yg.dao.ProductDao;
import com.yg.dao.ProductDaoImpl;
import com.yg.dto.ProductVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DatadaoTest {
	@Autowired
	ProductDaoImpl dao;
	
//	@Test
//	public void testInsertProduct() throws Exception{
//		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
//		Date time = new Date();
//		String time1 = format1.format(time);
//		
//		ProductVo vo = new ProductVo("앤디워홀", "https://d2o50qy6q24mld.cloudfront.net/rbb/rare_by_blue/attach_file/image/202004/RBBFL0000004936.jpg?d=630x630", 2000000, time1, "20201020", "yg", "그림", "일반");
//		if(dao.insertProduct(vo) == 1) {
//			System.out.println("인서트");
//		}
//	}
	
//	@Test
//	public void testshow() throws Exception{
//		List<ProductVo> list = dao.selectPop();
//		for(ProductVo vo: list) {
//			System.out.println(vo.getUploaddate() +" / "+vo.getImage() +" / "+ vo.getPname()+" / "+vo.getPrice()+" / "+vo.getDeadlinedate()+" / "+vo.getHitcount());
//		}
//		
//	}
	
//	@Test
//	public void testshow() throws Exception{
//		List<ProductVo> list = dao.selectHurry();
//		for(ProductVo vo: list) {
//			System.out.println( vo.getPno()+" / "+ vo.getUploaddate()+" / "+vo.getDeadlinedate());
//		}
//		
//	}
	
	
//	@Test
//	public void testOne() throws Exception{
//		int idx=401;
//		BoardVo vo = dao.selectOne(idx);
//		System.out.println(vo.getIdx()  +"/"+ vo.getTitle()  +"/"+ vo.getContent());
//	}
	
//	@Test
//	public void testUpdate() throws Exception{
//		BoardVo vo = new BoardVo("제ㅔㅔ목", "내ㅐ용", "작성자", 1000);
//		dao.updateBoard(vo);
//	}
	
}
