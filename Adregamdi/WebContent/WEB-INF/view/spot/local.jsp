<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 절대 경로 설정 - view 폴더까지 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 관광지</title>

<!-- Bootstrap CDN -->
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${root }bootstrap/css/styles.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">

</head>

<style>
h2, h3 {
	font-family: 'Stylish', sans-serif
};

#please { 
	font-size: 20px; 
	font-family: 'Stylish', sans-serif;
	color: white;
};
</style>
<body>
	<!-- 상단 메뉴바  -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- 지역별로 보여주기 -->
	<section class="page-section bg-light" id="portfolio">
		<div class="container" style="margin-top: 100px">
			<div class="text-center">
				<h2 class="section-heading">지역별 제주 탐방</h2>
				<div style="margin: 50px">
						<table id="please" class="table-light" border="1" width="100%" >
							<tbody>
								<tr align="center">
									<td>
										<a href="${root }spot/local?local_no=0">전체 지역 </a>
									</td>
									<td>
										<a href="${root }spot/local?local_no=0">제주시 </a>
									</td>
									<td>
										<a  href="${root }spot/local?local_no=0">서귀포시</a>
									</td>
								<tr>
							</tbody>
						</table>
					</div>
			</div>
		</div>
	</section>
	
	<%-- <div class="container" style="margin-top: 100px">
		<div class="wrap_contView padB10">
			<h3>지역</h3>
			<div class="area_List m_none">
				<ul class="clfix">
					<li id="0"><a href="${root }spot/local_detail?local_no=0&check=1">전체
							지역</a></li>
					<li id="1"><a href="${root }spot/local_detail?local_no=1&check=1">제주시</a>
					</li>
					<li id="2"><a href="${root }spot/local_detail?local_no=2&check=1">서귀포시</a>
					</li>
				</ul>
			</div>
			<div class="text-right">
				<!-- model.addAttribute("board_info_idx", board_info_idx);값 받아옴 -->
				<a href="${root }spot/write" class="btn btn-dark">글쓰기</a>
			</div>
		</div> --%>
		<!-- 3개씩 정보 보여주기 -->

		<table class="tg" border="1">
			<tr>
				<td colspan="3">제주시</td>
			</tr>
			<tr>
				<td class="tg-0pky"><a href="${root }spot/read?check=1&spot_idx=2">읽기</a></td>
				<td class="tg-0pky"></td>
				<td class="tg-0pky"></td>
			</tr>

		</table>

	</div>

	<br>
	<br>

	<!-- 하단 -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>