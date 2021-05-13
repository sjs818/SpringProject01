<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 절대 경로 설정 -->
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

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"	rel="stylesheet">

<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${root }bootstrap/css/styles.css">

<script src="${root }js/detail.js"></script>
<%-- <link href="${root }css/detail.css" rel="stylesheet"> --%>

<style>

h2, h3 {
	font-family: 'Stylish', sans-serif
}
;

</style>

</head>

<body>
	<!-- 상단 메뉴바  -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- Portfolio Modals-->
	<input type="hidden" name="contentId" id="contentId" value=${contentId }>
	<input type="hidden" name="contentTypeId" id="contentTypeId" value=${contentTypeId }>
	
	<div class="portfolio-modal modal fade" id="portfolioModal${num }" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="${root }bootstrap/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
							<h2 id="title" class="text-uppercase"></h2>
								<img id="spot_img" class="img-fluid d-block mx-auto" src="" alt="..." />
								<p id="overview"></p>
								<ul class="details">
								</ul>
								<button class="btn btn-primary" data-dismiss="modal" type="button">
									<i class="fas fa-times mr-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 하단 -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />

	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>