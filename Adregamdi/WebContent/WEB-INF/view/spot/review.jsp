<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 페이지</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
<link href="${root }css/spot.css" rel="stylesheet">
<link rel="stylesheet" href="${root }css/styles.css">
<style>
@font-face {
	font-family: 'Bazzi';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/Bazzi.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body, h1, h2, h3, div {
	font-family: 'Bazzi';
}

.plus {
	padding: 20px;
	border: 1px solid;
	text-align : center;
}

</style>
</head>
<body>
	<!-- 상단 헤더 -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- 1개 클릭 시 세부사항 -->
	<div class="container bg-light" style="margin-top: 200px; margin-bottom: 100px; border:1px;">
		<div class="text-center">
			<h1 class="section-heading" style="font-size : 50px;">${information[1] }</h1>
			<h3 class="section-subheading text-muted">${information[3] }</h3>
		</div>
		<div style="text-align: center;">
			<br>
			<img class="img-fluid photo" src="${information[0] }" alt="img"/>
			<br>
		</div>
		<br><br>
		<div>
			<br>${information[2] }	<br>
		</div>
		<div>
			<ul class="plus">
				<c:choose>
					<c:when test="${contentTypeId eq 12 }">
						<li>문의 및 안내 : ${information[6] } </li><br>
						<li>쉬는 날 : ${information[7] }</li><br>
						<li>이용시간 : ${information[8] }</li><br>
					</c:when>
					<c:when test="${contentTypeId eq 14 }">
						<li>문의 및 안내 : ${information[6] }</li><br>
						<li>쉬는 날 : ${information[7] }</li><br>
						<li>이용시간 : ${information[8] }</li><br>
					</c:when>
					<c:when test="${contentTypeId eq 15 }">
						<li>행사 홈페이지 : ${information[6] }</li><br>
						<li>연락처 : ${information[7] }</li><br>
						<li>공연시간 : ${information[8] }</li><br>
						<li>이용 요금 : ${information[9] }</li><br>
					</c:when>
					<c:when test="${contentTypeId eq 25 }">
						<li>문의 및 안내 : ${information[6] }</li><br>
						<li>코스 예상 소요시간 : ${information[7] }</li><br>
						<li>코스 테마 : ${information[8] }</li><br>
					</c:when>
					<c:when test="${contentTypeId eq 28 }">
						<li>문의 및 안내 : ${information[6] }</li><br>
						<li>쉬는 날 : ${information[7] }</li><br>
						<li>이용 요금 : ${information[8] }</li><br>
						<li>이용 시간 : ${information[9] }</li><br>
					</c:when>
					<c:when test="${contentTypeId eq 32 }">
						<li>문의 및 안내 : ${information[6] }</li><br>
						<li>체크인 :  ${information[7] }</li><br>
						<li>체크아웃 : ${information[8] }</li><br>
						<li>홈페이지 : ${information[9] }</li><br>
						<li>예약안내 : ${information[10] }</li><br>
					</c:when>
					<c:when test="${contentTypeId eq 38 }">
						<li>문의 및 안내 : ${information[6] }</li><br>
						<li>영업 시간 : ${information[7] }</li><br>
						<li>쉬는 날 : ${information[8] }</li><br>
					</c:when>
					<c:when test="${contentTypeId eq 39 }">
						<li>문의 및 안내 : ${information[6] }</li><br>
						<li>대표 메뉴 : ${information[7] }</li><br>
						<li>영업 시간 : ${information[8] }</li><br>
						<li>쉬는 날 : ${information[9] }</li><br>
					</c:when>
				</c:choose>
			</ul>
		</div>		
	</div>

	<!-- 하단 -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />
	
	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>