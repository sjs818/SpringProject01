<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<div>
	<h1><a href="#">로고</a></h1>
	<div>
		<ul>
			<li>
				메뉴_01
				<ul>
					<li><a href="#">하위 메뉴_01</a></li>
					<li><a href="#">하위 메뉴_02</a></li>
				</ul>
			</li>
			<li>
				메뉴_02
				<ul>
					<li><a href="#">하위 메뉴_01</a></li>
					<li><a href="#">하위 메뉴_02</a></li>
				</ul>
			</li>
			<li>
				메뉴_03
				<ul>
					<li><a href="#">하위 메뉴_01</a></li>
					<li><a href="#">하위 메뉴_02</a></li>
					<li><a href="#">하위 메뉴_03</a></li>
				</ul>
			</li>			
		</ul>
	</div>
	<div>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</div>
</div>