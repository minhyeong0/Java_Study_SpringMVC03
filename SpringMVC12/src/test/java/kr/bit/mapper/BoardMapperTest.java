package kr.bit.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.bit.entity.Board;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {
	
	@Autowired
	BoardMapper boardMapper;
	
//	@Test
//	public void testGetList() {
//		 List<Board> list = boardMapper.getList();
//		 for(Board vo : list) log.info(vo);
//	}
	
	@Test
	public void testInsert() {
		Board vo = new Board();
		vo.setMemID("bit03");
		vo.setTitle("C");
		vo.setContent("새로 작성한 글");
		vo.setWriter("홍길동");
		
		//boardMapper.insert(vo);
		boardMapper.insertSelectkey(vo);
		log.info(vo);
	}
}
