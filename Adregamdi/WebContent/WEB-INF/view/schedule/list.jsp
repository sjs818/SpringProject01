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
	<div class="container" style="margin-top:100px"> 
		
		  <div>
		  	<h1>title</h1>
		  	<p>explanation</p>
		  </div>
		 	
		 	<div>
		  	<a href="${root }schedule/write">글쓰기</a>
		  </div>
		  
		  <div class="row">
			  <c:forEach var="dto" items="${scheduleList }">
				  <div class="card shadow col-3">
			  		<h4><a href="${root }schedule/read">${dto.schedule_title }</a></h4>
			  		<table>
				  		<tr>
				  			<th colspan="2">작성자</th>
				  			<td colspan="2">${dto.schedule_writer }</td>
				  		<tr>
				  		<tr>
				  			<th colspan="2">작성일</th>
				  			<td colspan="2">${dto.schedule_date }</td>
				  		</tr>
				  		<tr>
				  			<th>조회수</th>
				  			<td>0</td>
				  			<th>추천수</th>
				  			<td>0</td>
				  		</tr>
			  		</table>
				  </div>
			  </c:forEach>
		  </div>
		  
		  <div class="d-none d-md-block">
		  	<ul class="pagination justify-content-center">
		  		<c:if test="${pageDTO.prevPage!=0 }">
		  			<li class="page-item"><a href="${root }schedule/list?page=${pageDTO.prevPage}">이전</a></li>
		  		</c:if>
		  		<c:forEach var="idx" begin="${pageDTO.min }" end="${pageDTO.max }">
		  			<c:choose>
		  				<c:when test="${pageDTO.currentPage==idx }">	
		  					<li class="page-item active"><a href="${root }schedule/list?page=${idx }">${idx }</a></li>
		  				</c:when>
		  				<c:otherwise>
		  					<li class="page-item"><a href="${root }schedule/list?page=${idx }">${idx }</a></li>
		  				</c:otherwise>
		  			</c:choose>
		  		</c:forEach>
		  		<c:if test="${pageDTO.nextPage!=pageDTO.pageCount && pageDTO.pageCount > 10}">
		  			<li class="page-item"><a href="${root }schedule/list?page=${pageDTO.nextPage}">다음</a></li>
		  		</c:if>
		  	</ul>
		  </div>
		  
		  <div>
		  	<a href="${root }schedule/write">글쓰기</a>
		  </div>
	 
  </div>
  
  <!-- Footer -->
  <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>