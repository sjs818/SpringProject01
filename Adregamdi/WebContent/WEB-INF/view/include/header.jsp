<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">

<style>
     
   .navbar{
   	box-shadow: 0 2px 10px rgba(135,135,135,0.15);
   	border-bottom:1px solid #eee;
   } 
    
  .navbar a {
     font-size: 25px;
     color:black;
  }
  
  a:hover{
       text-decoration: none;
       color:orange;
  }
  
  .wrapper {
     position: relative;
  }
</style>

      <nav class="navbar navbar-expand-md navbar-white fixed-top sm bg-white" style="padding: 10px 30px;">
         <a href="${root }" class="navbar-brand pr-5"><img src="${root }images/logo.png" style="height: 60px"></a>
         <div id="navMenu" class="collapse navbar-collapse">
            <ul class="navbar-nav">
               <li class="nav-item"><a class="nav-link" href="${root }spot/main">여행지</a></li>
               <li class="nav-item"><a class="nav-link" href="${root }schedule/list?page=1">여행일정</a></li>
               <li class="nav-item"><a class="nav-link" href="${root }together/list">같이가치</a></li>
               <li class="nav-item"><a class="nav-link" href="${root }freedom/list">자유게시판</a></li>
               <li class="nav-item"><a class="nav-link" href="${root }notice/list">공지사항</a></li>
            </ul>
          <ul class="navbar-nav ml-auto">
            <c:choose>
              <c:when test="${loginUserDTO.userLogin == true }">
                <li class="nav-item"><a href="${root }user/my_page"
                  class="nav-link">마이페이지</a></li>
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
