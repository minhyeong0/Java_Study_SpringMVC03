package kr.bit.entity;

import lombok.Data;

@Data
public class PageMaker {
	private Criteria cri;
	private int totalCount; //총 게시글의 수
	private int startPage; //시작 페이지 번호
	private int endPage; //끝 페이지 번호
	private boolean prev; //이전버튼
	private boolean next; //다음버튼
	private int displayPageNum = 5; //한 페이지에 보여줄 게시글의 수
	
	
	//총게시글 수를 구하는 메서드
	public void setTotalCount(int totalCount){
		this.totalCount = totalCount;
		makePaging();
	}

	private void makePaging() {
		//1. 화면에 보여질 마지막 페이지 번호
		endPage = (int)(Math.ceil(cri.getPage()/ (double)displayPageNum) * displayPageNum);
		
		//2. 화면에 보여질 시작 페이지 번호
		startPage = endPage - displayPageNum + 1;
		if(startPage <= 0) startPage = 1;
		
		//3. 전체 마지막 페이지 계산
		int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
		
		//4. 화면에 보여질 마지막 페이지 유효성 검사
		if(tempEndPage < endPage) endPage = tempEndPage;
		
		//5. 이전 페이지 버튼(존재 여부)
		prev = (startPage == 1) ? false : true;
		
		//5. 다음 페이지 버튼(존재 여부)
		next = (endPage < tempEndPage) ? true : false;
	}
}
