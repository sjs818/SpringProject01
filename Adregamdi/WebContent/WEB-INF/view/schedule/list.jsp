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
		<div class="card shadow">
		  
		  <div class="card-header">
		  	<h1>title</h1>
		  	<p>explanation</p>
		  </div>
		 	
		 	<div class="card-body">
			  <div class="row">
				  <c:forEach var="dto" items="${scheduleList }">
				  	<div class="col-3" style="margin-bottom:10px;">
						  <div class="card">
						  	<div class="card-body">
					  			<div class="card-title">
					  				<h4><a href="${root }schedule/read?page=${pageDTO.currentPage }&schedule_no=${dto.schedule_no}">${dto.schedule_title }</a></h4>
					  			</div>
					  			<div>
					  				<img alt="thumbnail" src="${root }images/thumbnail.png" width="100%">
							  		<p>작성자 : ${dto.schedule_writer }</p>
							  		<p>작성일 : ${dto.schedule_date }</p>
							  		<p>조회수 : 0</p>
							  		<p>추천수 : 0</p>
							  		<a class="btn btn-primary" href="${root }schedule/read?page=${pageDTO.currentPage }&schedule_no=${dto.schedule_no}">More</a>
						  		</div>
					  		</div>
					  	</div>
					  </div>
				  </c:forEach>
			  </div>
			  
				<div class="d-none d-md-block" style="margin-top:20px;">
			 		<ul class="pagination justify-content-center">
			  		<c:if test="${pageDTO.prevPage!=0 }">
			  			<li class="page-item"><a class="page-link" href="${root }schedule/list?page=${pageDTO.prevPage}">이전</a></li>
			  		</c:if>
			  		<c:forEach var="idx" begin="${pageDTO.min }" end="${pageDTO.max }">
			  			<c:choose>
			  				<c:when test="${pageDTO.currentPage==idx }">	
			  					<li class="page-item active"><a class="page-link" href="${root }schedule/list?page=${idx }">${idx }</a></li>
			  				</c:when>
			  				<c:otherwise>
			  					<li class="page-item"><a class="page-link" href="${root }schedule/list?page=${idx }">${idx }</a></li>
			  				</c:otherwise>
			  			</c:choose>
			  		</c:forEach>
			  		<c:if test="${pageDTO.nextPage!=pageDTO.pageCount && pageDTO.pageCount > 10}">
			  			<li class="page-item"><a class="page-link" href="${root }schedule/list?page=${pageDTO.nextPage}">다음</a></li>
			  		</c:if>
			  	</ul>
				</div>
			  
			  <div class="text-right" style="margin-top:20px;">
			  	<a class="btn btn-primary" href="${root }schedule/write?page=${pageDTO.currentPage }">글쓰기</a>
			  </div>
		  </div>
		  
	  </div>
  </div>
  <!-- Footer -->
  <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>