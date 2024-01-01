package kr.bit.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity //jpa가 table로 인식하게끔 만듦
@Data
public class Board { //vo <---ORM---> table
	
	//idx 기본키 지정
	@Id
	//idx 자동증가
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idx;
	private String title;
	
	//content 길이를 2000으로 지정
	@Column(length = 2000)
	private String content;
	
	//writer컬럼을 update할때 제외
	@Column(updatable = false)
	private String writer;
	
	//name 속성은 db 컬럼의 이름과 매칭, columnDefinition 속성은 컬럼 정의 지정
	//indate칼럼을 datetime타입으로 지정하고 기본값은 now(), insert, update할때는 제외
	@Column(insertable = false, updatable = false, name = "indate", columnDefinition = "datetime default now()")
	private Date indate;
	
	//count컬럼의 값을 int로 지정하고 기본값은 0, insert, update할때는 제외
	@Column(insertable = false, updatable = false, columnDefinition = "int default 0")
	private Long count;
}
