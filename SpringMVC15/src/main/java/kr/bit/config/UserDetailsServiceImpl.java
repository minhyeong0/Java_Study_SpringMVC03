package kr.bit.config;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.bit.entity.CustomUser;
import kr.bit.entity.Member;
import kr.bit.repository.MemberRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
	//UserDetailsService를 상속받아 내용을 구현해야함
	
	@Autowired
	MemberRepository memberRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<Member> res = memberRepository.findById(username);
		Member member = res.get();
		
		if (member == null) {			
			throw new UsernameNotFoundException(username + " 없음");
		}
		
		//User (3가지정보) + Member (그 외정보)를 스프링 시큐리티에 전달
		return new CustomUser(member);
	}
}
