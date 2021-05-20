<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adregamdi 마이페이지</title>
<!-- Font Awesome CDN -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">

<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style type="text/css">
.ellipsis {
	white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.card_hover a{
	color:black;
	text-decoration:none;
	
}

.card_hover:hover {
	color: #ffaa42;
}

.content-box{
	overflow: auto;
	max-height: 636px;
}

</style>


</head>
<body>


	<!-- 상단 -->
	<c:import url="/WEB-INF/view/include/header.jsp" />



	<div class="container" style="margin-top: 120px; margin-bottom: 50px;">
		<h3 class="BoardTitle mb-4">
			<b>마이페이지</b>
		</h3>

		<div class="card">
			<div class="card-header">
				<a href="${root }user/modify" class="float-right btn btn-success btn-sm">정보수정</a>
				<ul class="nav nav-tabs card-header-tabs">
					<li class="nav-item"><a class="nav-link" href="${root }user/my_page">공유일정</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="${root }user/my_page_disable">숨김일정</a></li>
				</ul>
			</div>
			<div class="row mx-3 my-3 content-box">

			
				<div class="col-sm-3">
					<div class="card mb-3 card_hover">
						<a href="#"><img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="일정보기"></a>
						<div class="card-body">
							<a href="#">
								<h5 class="card-title">나만의 숨겨진 제주 여행일정</h5>
								<p class="card-text ellipsis">이곳은 나만의 제주여행 일정을 작성하였으나 수정사항이 있어서 숨겨둔 일정들 입니다.</p>
							</a>
							<span class="badge badge-secondary">&nbsp<i class="fas fa-lock"></i>&nbsp</span>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="card mb-3 card_hover">
						<a href="#"><img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="일정보기"></a>
						<div class="card-body">
							<a href="#">
								<h5 class="card-title">나만의 숨겨진 제주 여행일정</h5>
								<p class="card-text ellipsis">이곳은 나만의 제주여행 일정을 작성하였으나 수정사항이 있어서 숨겨둔 일정들 입니다.</p>
							</a>
							<span class="badge badge-secondary">&nbsp<i class="fas fa-lock"></i>&nbsp</span>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="card mb-3 card_hover">
						<a href="#"><img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="일정보기"></a>
						<div class="card-body">
							<a href="#">
								<h5 class="card-title">나만의 숨겨진 제주 여행일정</h5>
								<p class="card-text ellipsis">이곳은 나만의 제주여행 일정을 작성하였으나 수정사항이 있어서 숨겨둔 일정들 입니다.</p>
							</a>
							<span class="badge badge-secondary">&nbsp<i class="fas fa-lock"></i>&nbsp</span>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="card mb-3 card_hover">
						<a href="#"><img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="일정보기"></a>
						<div class="card-body">
							<a href="#">
								<h5 class="card-title">나만의 숨겨진 제주 여행일정</h5>
								<p class="card-text ellipsis">이곳은 나만의 제주여행 일정을 작성하였으나 수정사항이 있어서 숨겨둔 일정들 입니다.</p>
							</a>
							<span class="badge badge-secondary">&nbsp<i class="fas fa-lock"></i>&nbsp</span>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="card mb-3 card_hover">
						<a href="#"><img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="일정보기"></a>
						<div class="card-body">
							<a href="#">
								<h5 class="card-title">나만의 숨겨진 제주 여행일정</h5>
								<p class="card-text ellipsis">이곳은 나만의 제주여행 일정을 작성하였으나 수정사항이 있어서 숨겨둔 일정들 입니다.</p>
							</a>
							<span class="badge badge-secondary">&nbsp<i class="fas fa-lock"></i>&nbsp</span>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>






			<!-- 하단 -->
			<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>