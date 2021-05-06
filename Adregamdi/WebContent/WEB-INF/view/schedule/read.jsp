<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <!-- Header -->
  <c:import url="/WEB-INF/view/include/header.jsp"/>
  
  <!-- Main -->
  <div>
  	<div>
  		<h1>title</h1>
  		<p>explanation</p>
  	</div>
  	
  	<div>
  		
  	</div>
  	
  	<div>
  		<a href="${root }schedule/list">목록</a>
  		<a href="${root }schedule/modify">수정</a>
  		<a href="${root }schedule/delete">삭제</a>
  	</div>
  </div>
  
  <!-- Footer -->
  <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>