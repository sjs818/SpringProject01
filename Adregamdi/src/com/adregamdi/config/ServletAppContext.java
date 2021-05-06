package com.adregamdi.config;

import javax.annotation.Resource;

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
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.adregamdi.dto.UserDTO;
import com.adregamdi.interceptor.LoginInterceptor;
import com.adregamdi.interceptor.TopMenuInterceptor;
import com.adregamdi.mapper.FreedomBoardMapper;
import com.adregamdi.mapper.ScheduleMapper;
import com.adregamdi.mapper.TogetherMapper;
import com.adregamdi.mapper.UserMapper;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.adregamdi.controller","com.adregamdi.dto", "com.adregamdi.dao", "com.adregamdi.service"})
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
	
	@Resource(name="loginUserDTO")
	private UserDTO loginUserDTO;
	
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
	public MapperFactoryBean<ScheduleMapper> getScheduleMapper(SqlSessionFactory factory) {
		MapperFactoryBean<ScheduleMapper> factoryBean = new MapperFactoryBean<ScheduleMapper>(ScheduleMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<TogetherMapper> getTogetherMapper(SqlSessionFactory factory) {
		MapperFactoryBean<TogetherMapper> factoryBean = new MapperFactoryBean<TogetherMapper>(TogetherMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<FreedomBoardMapper> FreedomBoardMapper(SqlSessionFactory factory) {
		MapperFactoryBean<FreedomBoardMapper> factoryBean = new MapperFactoryBean<FreedomBoardMapper>(FreedomBoardMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) {
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	
	public void addInterceptors(InterceptorRegistry registry) {
	    WebMvcConfigurer.super.addInterceptors(registry);
		
	  	TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(loginUserDTO);
		
		LoginInterceptor loginInterceptor = new LoginInterceptor(loginUserDTO);
		
		
	  	InterceptorRegistration topReg
	  	  = registry.addInterceptor(topMenuInterceptor);
		
	  	InterceptorRegistration userReg
		  = registry.addInterceptor(loginInterceptor);
	  	
	  	topReg.addPathPatterns("/**");
	  	userReg.addPathPatterns("/user/modify", "/user/logout");
	
	}
	
	
	
}