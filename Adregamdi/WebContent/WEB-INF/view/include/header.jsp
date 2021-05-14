<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<nav class="navbar navbar-expand-md navbar-white fixed-top shadow-sm">
	<a href="${root }" class="navbar-brand"><img src="${root }images/logo01.png" style="height: 55px"></a>
	<div id="navMenu" class="collapse navbar-collapse">
		<ul class="navbar-nav main_menu">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
					여행지 
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="${root}spot/local_main">지역별</a> <!-- 지역별 -->
					<a class="dropdown-item" href="${root}spot/thema_main">테마별</a> <!-- 테마별 -->
				</div>
			</li>
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