<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />
  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>같이가치</title>
  <!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/view/include/header.jsp"/>
	
	<div class="container" style="padding-top: 100px">
		<h3 class="BoardTitle">
			<b>같이가치</b>
		</h3>
		<hr>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="text-center width : 40%">글번호</th>
					<th class="text-center width : 30%">글제목</th>
					<th class="text-center c">작성자</th>
					<th class="text-center col-md-1">조회수</th>
					<th class="text-center col-md-2">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="TogetherDTO" items="${contentList}">
					<tr>
						<td class="text-center">${TogetherDTO.to_no }</td>
						<td class="text-center"><a href="${root}together/read?content_idx=${TogetherDTO.to_no}">${TogetherDTO.to_title }</a></td>
						<td class="text-center">${TogetherDTO.to_writer }</td>
						<td class="text-center">${TogetherDTO.to_cnt }</td>
						<td class="text-center">${TogetherDTO.to_date }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pageNevigation text-center">
			<ul class="pagination">
				<li class="disabled"><a href="#">이전</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3 </a></li>
				<li><a href="#">4 </a></li>
				<li><a href="#">5 </a></li>
				<li><a href="#">6 </a></li>
				<li><a href="#">7 </a></li>
				<li><a href="#">8 </a></li>
				<li><a href="#">9 </a></li>
				<li><a href="#">10 </a></li>
				<li><a href="#">다음</a></li>
			</ul>
		</div>
		  <div class="text-right">
      		<a href="${root}together/write" class="btn btn-info">동행자 구인공고</a>
      		<a href="#" class="btn btn-danger">글 삭제</a>
    	  </div>
	 </div>
</body>
</html>
	
	