package kr.bit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.bit.entity.Board;
import kr.bit.entity.Criteria;
import kr.bit.entity.Member;
import kr.bit.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<Board> getList(Criteria cri) {
		//반영할 로직 수행
		List<Board> list = boardMapper.getList(cri);
		return list;
	}

	@Override
	public Member login(Member vo) {
		Member mvo = boardMapper.login(vo);
		return mvo;
	}

	@Override
	public void register(Board vo) {
		boardMapper.insertSelectkey(vo);
	}

	@Override
	public Board get(int idx) {
		Board vo = boardMapper.read(idx);
		return vo;
	}

	@Override
	public void modify(Board vo) {
		boardMapper.update(vo);
	}

	@Override
	public void remove(int idx) {
		boardMapper.delete(idx);
	}

	@Override
	public void replyProcess(Board vo) {
		//답글 만들기
		//1. 부모글(원글)의 정보 가져오기
		Board parent = boardMapper.read(vo.getIdx());
		
		//2. 부모글의 BoardGroup의 값을 답글정보(vo)에 저장하기
		vo.setBoardGroup(parent.getBoardGroup());
		
		//3. 부모글의 BoardSequence, BoardLevel의 값을 +1하여 답글정보(vo)에 저장하기
		vo.setBoardSequence(parent.getBoardSequence()+1);
		vo.setBoardLevel(parent.getBoardLevel()+1);
		
		//4. 같은 BoardGroup에 있는 글 중에서 부모글의 BoardSequence보다 큰 값들을
		//모두 1씩 업데이트하기
		boardMapper.replySeqUpdate(parent);
		
		//5. 답글(vo) 저장하기
		boardMapper.replyInsert(vo);
	}

	@Override
	public int totalCount() {
		return boardMapper.totalCount();
	}

}
