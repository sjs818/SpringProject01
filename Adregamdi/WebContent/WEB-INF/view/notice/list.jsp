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
<title>어드레감디 | 공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- CSS import -->
<link href="${root }css/notice.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Header Import -->
	<c:import url="/WEB-INF/view/include/header.jsp" />
	<!-- 공지사항 리스트 -->
	<div class="container" style="margin-top: 150px; margin-bottom: 150px">
		<h3 class="BoardTitle">
			<b>공지사항</b>
		</h3>
		<hr>
		<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="text-center" style="width: 8%">글번호</th>
					<th class="text-center" style="width: 55%">글제목</th>
					<th class="text-center" style="width: 10%">작성자</th>
					<th class="text-center" style="width: 8%">조회수</th>
					<th class="text-center" style="width: 15%">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="NoticeDTO" items="${contentList}">
					<tr>
						<td class="text-center">${NoticeDTO.notice_rownum }</td>
						<td class="text-center">
							<a style="color: black;" href="${root}notice/read?content_idx=${NoticeDTO.notice_no}">${NoticeDTO.notice_title }</a>
						</td>
						<td class="text-center">${NoticeDTO.content_notice_user_no }</td>
						<td class="text-center">${NoticeDTO.notice_cnt }</td>
						<td class="text-center">${NoticeDTO.notice_date }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pageNevigation" style="margin-top: 50px;">
			<ul class="pagination justify-content-center">
				<!-- 맨 처음 페이지인 경우에는 이전 페이지가 비활성화 하게 함 -->
				<c:choose>
					<c:when test="${pageDTO.prevPage <= 0 }"></c:when>
					<c:otherwise>
						<li class="page-item">
							<a href="${root}notice/list?page=${pageDTO.prevPage}" class="page-link">이전</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="idx" begin="${pageDTO.min}" end="${pageDTO.max}">
					<c:choose>
						<c:when test="${idx == pageDTO.currentPage}">
							<li class="page-item active">
								<a href="${root }notice/list?page=${idx}" class="page-link">${idx}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }notice/list?page=${idx}" class="page-link">${idx}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 맨 마지막일 경우 다음페이지를 비활성화 시킴 -->
				<c:choose>
					<c:when test="${pageDTO.max >= pageDTO.pageCount }">
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a href="${root}notice/list?page=${pageDTO.nextPage}" class="page-link">다음</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<div class="text-right">
			<c:if test="${loginUserDTO.userLogin == true && loginUserDTO.user_provider == 0}">
				<!-- user_provider == 0 일 때 글쓰기 버튼 노출 -->
				<a href="${root}notice/write" class="btn btn-info" style="color: white">글 쓰 기</a>
			</c:if>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>