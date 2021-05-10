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
<title>어드레감디 - 공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Header Import -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- 공지사항 리스트 -->
	<div class="container" style="padding-top: 80px">
		<h3 class="BoardTitle">
			<b>공지사항</b>
		</h3>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr>
			      <th class="text-center" style="width:8%">글번호</th>
        		  <th class="text-center" style="width:55%">글제목</th>
                  <th class="text-center" style="width:10%">작성자</th>
                  <th class="text-center" style="width:8%">조회수</th>
                  <th class="text-center" style="width:15%">작성날짜</th>
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
		<div class="pageNevigation">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
        		<li class="page-item active"><a class="page-link" href="#">1</a></li>
       			<li class="page-item"><a class="page-link" href="#">2</a></li>
        		<li class="page-item"><a class="page-link" href="#">3 </a></li>
        		<li class="page-item"><a class="page-link" href="#">4 </a></li>
        		<li class="page-item"><a class="page-link" href="#">5 </a></li>
        		<li class="page-item"><a class="page-link" href="#">6 </a></li>
        		<li class="page-item"><a class="page-link" href="#">7 </a></li>
        		<li class="page-item"><a class="page-link" href="#">8 </a></li>
        		<li class="page-item"><a class="page-link" href="#">9 </a></li>
        		<li class="page-item"><a class="page-link" href="#">10 </a></li>
        		<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</div>
		  <div class="text-right">
		    <c:if test="${loginUserDTO.userLogin == true}">
      			<a href="${root}freedom/write" class="btn btn-info">글 쓰 기</a>
      		</c:if>
    	  </div>
	 </div>
</body>
</html>