package com.adregamdi.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.adregamdi.mapper.Board01Mapper;
import com.adregamdi.mapper.Board02Mapper;
import com.adregamdi.mapper.Board03Mapper;
import com.adregamdi.mapper.Board04Mapper;
import com.adregamdi.mapper.Board05Mapper;
import com.adregamdi.mapper.UserMapper;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.adregamdi.controller", "com.adregamdi.dao", "com.adregamdi.service"})
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer{
	
	@Value("${db.classname}")
	private String db_classname;
	
	@Value("${db.url}")
	private String db_url;
	
	@Value("${db.username}")
	private String db_username;
	
	@Value("${db.password}")
	private String db_password;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/view/", ".jsp");
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}
	
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);
		return source;
	}
	
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}
	
	@Bean
	public MapperFactoryBean<Board01Mapper> getBoard01Mapper(SqlSessionFactory factory) {
		MapperFactoryBean<Board01Mapper> factoryBean = new MapperFactoryBean<Board01Mapper>(Board01Mapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<Board02Mapper> getBoard02Mapper(SqlSessionFactory factory) {
		MapperFactoryBean<Board02Mapper> factoryBean = new MapperFactoryBean<Board02Mapper>(Board02Mapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<Board03Mapper> getBoard03Mapper(SqlSessionFactory factory) {
		MapperFactoryBean<Board03Mapper> factoryBean = new MapperFactoryBean<Board03Mapper>(Board03Mapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<Board04Mapper> getBoard04Mapper(SqlSessionFactory factory) {
		MapperFactoryBean<Board04Mapper> factoryBean = new MapperFactoryBean<Board04Mapper>(Board04Mapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<Board05Mapper> getBoard05Mapper(SqlSessionFactory factory) {
		MapperFactoryBean<Board05Mapper> factoryBean = new MapperFactoryBean<Board05Mapper>(Board05Mapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) {
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
}
