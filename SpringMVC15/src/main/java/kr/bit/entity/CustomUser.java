package kr.bit.entity;


import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User{
	//회원정보에서 username, password, role를 UserDetails를 상속받은
	//User에게 전달해주는 클래스
	
	private Member member;
	
	
	//UserDetails를 상속받은 User의 생성자에게 username, password, role를
	//넘겨주면 스프링 컨테이너에 정보가 등록됨
	public CustomUser(Member member) {
		super(member.getUsername(), member.getPassword(), 
				AuthorityUtils.createAuthorityList("ROLE_" + member.getRole().toString()));
		this.member = member;
	}
	
	
}
