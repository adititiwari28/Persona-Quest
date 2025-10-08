package com.quiz.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan(basePackages = "com.quiz")
public class adminConfig {

	 
	@Bean("ds")
	public DriverManagerDataSource getds() {
	 	DriverManagerDataSource ds= new DriverManagerDataSource();
	     ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
	     ds.setUrl("jdbc:mysql://localhost:3306/pquiz");
	     ds.setUsername("root");
	     ds.setPassword("aditi2002");
	      return ds;
	}
	
	@Bean("jdbctemp")
	public JdbcTemplate getjs() {
		JdbcTemplate jt= new JdbcTemplate();
		jt.setDataSource(getds());
		return jt;
		}
	
	
}
