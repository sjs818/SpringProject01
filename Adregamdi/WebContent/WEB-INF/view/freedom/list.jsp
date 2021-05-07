<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어드레 감디 - 자유게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Header Import -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- 자유 게시판 리스트 -->
	<div class="container" style="padding-top: 80px">
		<h3 class="BoardTitle">
			<b>자유게시판</b>
		</h3>
		<hr>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="text-center col-md-1">글번호</th>
					<th class="text-center col-md-6">글제목</th>
					<th class="text-center col-md-1">작성자</th>
					<th class="text-center col-md-1">조회수</th>
					<th class="text-center col-md-2">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="FreedomBoardDTO" items="${contentList}">
					<tr>
						<td class="text-center">${FreedomBoardDTO.free_no }</td>
						<td class="text-center"><a href="${root}freedom/read?content_idx=${FreedomBoardDTO.free_no}">${FreedomBoardDTO.free_title }</a></td>
						<td class="text-center">${FreedomBoardDTO.content_writer_id }</td>
						<td class="text-center">${FreedomBoardDTO.free_cnt }</td>
						<td class="text-center">${FreedomBoardDTO.content_date }</td>
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
      		<a href="${root}freedom/write" class="btn btn-info">글 쓰 기</a>
      		<a href="#" class="btn btn-danger">글 삭 제</a>
    	  </div>
	 </div>
</body>
</html>