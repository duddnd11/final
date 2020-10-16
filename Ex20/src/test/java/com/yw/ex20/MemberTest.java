package com.yw.ex20;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yw.dao.BoardDao;
import com.yw.dao.MemberDao;
import com.yw.vo.BoardVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MemberTest {
	@Autowired
	MemberDao dao;
	@Autowired
	BoardDao boardDao;
	@Test
	public void test22() {
		for(int i=0; i<60;i++) {
			BoardVo vo = new BoardVo("제목","내용","작성자",0,0,0,"빤딱이2.gif");
			boardDao.writeBoard(vo);
			
		}
	}
}
