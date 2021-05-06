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
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
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