package br.com.bookstore.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import br.com.bookstore.daos.UserDAO;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDAO userDAO;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/$2a$10$clgpvXf9HwBPQet6d0IwMeBfotEBOUiCDZi85/u077R3TDzd./Q76").permitAll()
	    .antMatchers("/products/form").permitAll()
	    .antMatchers("/cart/**").permitAll()
	    .antMatchers(HttpMethod.POST, "/products").permitAll()
	    .antMatchers(HttpMethod.GET, "/products").permitAll()
	    .antMatchers("/resources/**").permitAll()
	    .antMatchers("/products/**").permitAll()
	    .antMatchers("/").permitAll()
	    .anyRequest().authenticated()
	    .and().formLogin().loginPage("/login").permitAll()
	    .and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDAO).passwordEncoder(new BCryptPasswordEncoder());
	}
	
	
}
