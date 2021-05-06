<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 등록</title>

<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/view/include/header.jsp" />
	
	<!-- 관광지 등록 하는 부분(게시판) -->
	<div class="container" style="margin-top:100px">
		<form action="${root }spot/write_proc" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="spot_name">여행지명</label>
				<input type="text" id="spot_name" class="form-control"/>
			</div>
			<div  class="form-group">
				<label for="local_no" >지역</label>
				<select id="local_no">
					<option value="">--지역--</option>
					<option value="1">제주시</option>
					<option value="2">서귀포시</option>
				</select>
			</div>
			<div  class="form-group">
				<label for="thema_no" >테마</label>
				<select id="thema_no">
					<option value="">--테마--</option>
					<option value="1">볼거리</option>
					<option value="2">먹거리</option>
					<option value="3">놀거리</option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="spot_addr">주소</label>
				<input type="text" id="spot_addr" class="form-control"/>
			</div>
			
			<div class="form-group">
				<p>관광지 설명</p>
				<textarea cols="100" rows="3" placeholder="입력하세요."></textarea>
			</div>
			
			<div class="form-group">
				<label for="upload_file">첨부 이미지</label>
				<input type="file" name="upload_file" class="form-control" accept="image/*"/>
			</div>
			<div class="form-group">
				<div class="text-right">
					<input type="submit" value="작성완료"></input>
				</div>
			</div>
		</form>
	</div>
	
	<!-- 하단 부분 -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>