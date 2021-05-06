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
  	
  	<%--
  	<div>
  		<form:form action="${root }schedule/write_proc" method="post" modelAttribute="" enctype="">
  			<div>
  				<form:label path="">제목</form:label>
  				<form:input path=""/>
  			</div>
  			<div>
  				<form:label path="">기간</form:label>
  				<form:input path=""/>
  				<form:input path=""/>
  			</div>
  			<div>
  				<form:label path="">내용</form:label>
  				<form:textarea path=""></form:textarea>
  			</div>
  			<div>
  				<form:button>등록하기</form:button>
  			</div>
  		</form:form>
  	</div>
  	--%>
  	
  	<div>
  		<form action="${root }schedule/write_proc" method="post">
  			
  			<div>
  				<label>제목</label>
  				<input type="text">
  			</div>
  			
  			<div>
  				<label>기간</label>
  				출발 : <input type="date">
  				도착 : <input type="date">
  			</div>
  			
  			<div>
  				<label>내용</label>
  				<textarea rows="30" cols="50"></textarea>
  			</div>
  			
  			<div>
  				<input type="submit" value="수정하기">
  				<a href="${root }schedule/list">취소</a>
  			</div>
  			
  		</form>
  	</div>
  </div>
  
  <!-- Footer -->
  <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>