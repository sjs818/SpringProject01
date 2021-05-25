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
  <title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Header Import -->
	<c:import url="/WEB-INF/view/include/header.jsp" />
	
	<div class="container" style="margin-top: 100px;">
		<div class="card shadow">
			<div class="card-header">
				<h3 class="InputSubject">
					<b>${readContentDTO.notice_title}</b>
				</h3>
			<h6>${readContentDTO.content_notice_user_no}&nbsp;&nbsp;&nbsp;&nbsp;${readContentDTO.notice_date}</h6>
			</div>
			<div class="card-body">
			<form class="form-horizontal" name="noticeDTO" id="noticeDTO"
				action="${root}notice/writeProc" method="POST">
				<div class="form-group" style="margin-bottom: 30px;">
					<div class="mb-3">${readContentDTO.notice_content}</div>
				</div>
				<hr>
				<div class="form-group float-right">
					<a href="${root}notice/list" class="btn btn-info"
						style="padding: 4px; margin-right: 5px;">목록보기</a>
					<c:if
						test="${loginUserDTO.user_no == readContentDTO.notice_user_no && loginUserDTO.user_provider == 0}">
						<a
							href="${root}notice/modify?content_idx=${readContentDTO.notice_no}"
							class="btn btn-success" style="padding: 4px; margin-right: 5px;">수정하기</a>
						<a
							href="${root}notice/delete?content_idx=${readContentDTO.notice_no}"
							class="btn btn-danger" style="padding: 4px; margin-right: 5px;">삭제하기</a>
					</c:if>
				</div>
			</form>
			</div>
			</div>
				<table class="table table-hover">
					<tr>
						<c:choose>
							<c:when test="${nextPrev.pre_no == 0}">
								<td class="text-center">이전글</td>
								<td class="text-center" colspan="3">${nextPrev. pre_title}</td>
							</c:when>
							<c:otherwise>
								<td class="text-center">이전글</td>
								<td class="text-center"><a
									href="${root}notice/read?content_idx=${nextPrev. pre_no}">${nextPrev. pre_title}</a></td>
								<td class="text-center">${preContentDTO.notice_cnt}</td>
								<td class="text-center">${preContentDTO.notice_date}</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<c:choose>
							<c:when test="${nextPrev. next_no == 0}">
								<td class="text-center">이전글</td>
								<td class="text-center" colspan="3">${nextPrev. next_title}</td>
							</c:when>
							<c:otherwise>
								<td class="text-center">다음글</td>
								<td class="text-center"><a
									href="${root}notice/read?content_idx=${nextPrev. next_no}">${nextPrev. next_title}</a></td>
								<td class="text-center">${nextContentDTO.notice_cnt}</td>
								<td class="text-center">${nextContentDTO.notice_date}</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
				</div>		
</body>
</html>