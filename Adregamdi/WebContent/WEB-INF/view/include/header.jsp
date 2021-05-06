<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top shadow-lg">
	<a href="${root }main" class="navbar-brand">LOGO</a>
	<div id="navMenu" class="collapse navbar-collapse">
		<ul class="navbar-nav">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
					게시판 1
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="">서브 메뉴1</a>
					<a class="dropdown-item" href="">서브 메뉴2</a>
				</div>
			</li>
			<li class="nav-item"><a class="nav-link" href="${root }schedule/list">메뉴_02</a></li>
			<li class="nav-item"><a class="nav-link" href="#">게시판 3</a></li>
			<li><a class="nav-link" href="#">자유게시판</a></li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" href="${root }user/login">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
		</ul>
	</div>
</nav>