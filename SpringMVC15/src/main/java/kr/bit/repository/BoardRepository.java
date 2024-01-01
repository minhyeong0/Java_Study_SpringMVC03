package kr.bit.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.bit.entity.Board;

@Repository //생략가능
//JpaRepository 있는 sql함수를 상속받아 sql문 작성
//JpaRepository <테이블명, 기본키 타입>을 적어줘야함, JpaRepository에 없는 메서드는 쿼리 메서드로 만들 수 있음
public interface BoardRepository extends JpaRepository<Board, Long> {
	
	//쿼리메서드 : 쿼리이름 + 테이블명(생략가능) + by + 칼럼명으로 다양한 쿼리 생성 가능
	
}
