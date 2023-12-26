package kr.bit.service;

import java.util.List;

import kr.bit.entity.Board;

public interface BoardService {
	public List<Board> getList();   //전체 리스트 조회
	public void register(Board vo); //글등록
	
}
