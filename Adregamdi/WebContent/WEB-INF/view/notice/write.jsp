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
<title>어드레감디 | 공지사항 글쓰기</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}ckeditor/ckeditor.js"></script>
<!-- CSS import -->
<link href="${root }css/notice.css" rel="stylesheet" type="text/css">
<script>
	 function submit(){
		 $("#noticeDTO").submit();
	 }
  </script>
</head>
<body>
	<!-- Header Import -->
	<c:import url="/WEB-INF/view/include/header.jsp" />
	<div class="container" style="margin-top: 150px; margin-bottom: 150px">
		<h3 class="InputSubject">
			<b>공지사항 글쓰기</b>
		</h3>
		<hr>
		<div class="panel">
			<div class="panel-body">
				<form:form action="${root}notice/writeProc" method="post"
					modelAttribute="noticeWriteDTO" class="form-horizontal">
					<div class="form-group">
						<form:label path="notice_title">글 제 목</form:label>
						<form:input path="notice_title" class="form-control" />
						<form:errors path="notice_title" style="color:red;" />
					</div>
					<div class="form-group">
						<form:label path="notice_content">글 내 용</form:label>
						<form:textarea path="notice_content" class="form-control" rows="10" style="resize:none" />
						<script>
				        	CKEDITOR.replace('notice_content',{
				        		height: 400
				        	});
		                </script>
						<form:errors path="notice_content" style="color:red;" />
					</div>
					<div class="form-group">
						<div class="text-right">
							<form:button class="btn btn-success">작성완료</form:button>
							<a href="${root}notice/list" class="btn btn-danger" style="color: white;">취소</a>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>