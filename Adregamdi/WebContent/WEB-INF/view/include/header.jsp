<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<nav class="navbar navbar-inverse navbar-fixed-top">
	<a href="#" class="navbar-brand">LOGO</a>
	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navMenu">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
	<div id="navMenu" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="#">게시판 1</a></li>
			<li><a href="${root }schedule/list">메뉴_02</a></li>
			<li><a href="#">게시판 3</a></li>
			<li><a href="#">자유게시판</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="${root }user/login">로그인</a></li>
			<li><a href="#">회원가입a</a></li>
		</ul>
	</div>
</nav>