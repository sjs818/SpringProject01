<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<nav class="navbar navbar-expand-md navbar-white fixed-top shadow-sm">
	<a href="${root }" class="navbar-brand"><img src="${root }images/logo.png" style="height: 60px"></a>
	<div id="navMenu" class="collapse navbar-collapse">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${root }spot/main">메뉴_1</a></li>
			<li class="nav-item"><a class="nav-link" href="${root }schedule/list?page=1">메뉴_02</a></li>
			<li class="nav-item"><a class="nav-link" href="#">게시판 3</a></li>
			<li><a class="nav-link" href="${root }freedom/list">자유게시판</a></li>
		</ul>
		
	    <ul class="navbar-nav ml-auto">
	      <c:choose>
	        <c:when test="${loginUserDTO.userLogin == true }">
	          <li class="nav-item"><a href="${root }user/modify"
	            class="nav-link">정보수정</a></li>
	          <li class="nav-item"><a href="${root }user/logout"
	            class="nav-link">로그아웃</a></li>
	        </c:when>
	        <c:otherwise>       
	          <li class="nav-item"><a href="${root }user/login"
	            class="nav-link">로그인</a></li>
	          <li class="nav-item"><a href="${root }user/join"
	            class="nav-link">회원가입</a></li>
	        </c:otherwise>    
	      </c:choose>
	    </ul>
	</div>
</nav>