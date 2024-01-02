package kr.bit.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import jakarta.servlet.DispatcherType;

@Configuration //스프링 컨테이너 설정파일이라고 메모리에 올림
public class SecurityConfiguration {
	
	@Autowired
	private UserDetailsServiceImpl userDetailsService;
	
	//패스워드 인코딩 객체를 스프링 컨테이너에 등록
	@Bean
	public PasswordEncoder PasswordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf(csrfConfig ->
            csrfConfig.disable()
        )
		.authorizeHttpRequests (authorizeRequests -> authorizeRequests
			.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
			.requestMatchers("/", "/member/**", "/resources/**").permitAll()
			.requestMatchers("/board/**").authenticated()
		)	
        .formLogin(login -> login
            .loginPage("/member/login")
            .defaultSuccessUrl("/board/list")
        )
        .logout(logout -> logout
    		.logoutUrl("/member/logout")
    		.logoutSuccessUrl("/")
		)
		.userDetailsService(userDetailsService);
		
		return http.build();
	}
}
