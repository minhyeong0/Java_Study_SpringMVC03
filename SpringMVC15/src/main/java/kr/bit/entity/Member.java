package kr.bit.entity;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import lombok.Data;

@Entity //jpa가 table로 인식하게끔 만듦
@Data
public class Member {
	//회원정보 전부가 담겨있는 테이블
	
	@Id //username 기본키 설정
	private String username;     //회원아이디
	
	private String password;     //회원비번
	
	private String name;         //회원이름
	
	@Enumerated(EnumType.STRING) //DB에 열거형 타입 String으로 선언함
	private Role role;           //회원권한
	
	private String enabled;      //회원등록
}
