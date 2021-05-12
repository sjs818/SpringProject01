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

<script src="${root }js/spot.js"></script>
<link href="${root }css/spot.css" rel="stylesheet">

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


	<!-- Top 5 출력 -->
	<section class="page-section bg-light" id="portfolio">
		<div class="container"
			style="margin-top: 100px; margin-bottom: 100px;">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">제주 지역 탐방</h2>
				<h3 class="section-subheading text-muted">제주도는 제주시, 서귀포시로 크게 나뉠
					수 있습니다. 각 지역의 Top5 유명지를 소개합니다.</h3>
			</div>

			<!-- 지역별  -->
			<div class="row" style="margin-top: 50px">
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal"
							href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
								</div>
							</div> <img class="img-fluid" src="${root }images/spot/jeju.jpg"
							alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">Top 1</div>
							<div class="portfolio-caption-subheading text-muted">Graphic
								Design</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal"
							href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
									<!-- <i class="fas fa-plus fa-3x"></i> Font Awesome fontawesome.com -->
								</div>
							</div> <img class="img-fluid" src="${root }images/spot/jeju.jpg"
							alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">Top 2</div>
							<div class="portfolio-caption-subheading text-muted">Graphic
								Design</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal"
							href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
								</div>
							</div> <img class="img-fluid" src="${root }images/spot/jeju.jpg"
							alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">Top 3</div>
							<div class="portfolio-caption-subheading text-muted">Graphic
								Design</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal"
							href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
								</div>
							</div> <img class="img-fluid" src="${root }images/spot/jeju.jpg"
							alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">Top 4</div>
							<div class="portfolio-caption-subheading text-muted">Graphic
								Design</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal"
							href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
								</div>
							</div> <img class="img-fluid" src="${root }images/spot/jeju.jpg"
							alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">Top 5</div>
							<div class="portfolio-caption-subheading text-muted">Graphic
								Design</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>

		<!-- 전체 여행지 보기 -->
		<hr>
		<input type="hidden" id="pageMaker" value="${pageMaker }">
		<input type="hidden" id="sigunguCode" value="${sigunguCode }">
		<input type="hidden" id="contentTypeId" value="${contentTypeId }">
		<div class="container" style="margin-top: 100px;">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">제주 모든 여행지를 한눈에...</h2>
				<h3 class="section-subheading text-muted">수많은 제주의 아름다운 여행지를 취향에
					맞게 선택해보자. 368개의 크고 작은 오름을 비롯하여 눈 돌리면 어디에서나 마주치는 한라산 그리고 푸른 바다…. 제주의
					보석 같은 여행지가 여러분의 선택을 기다린다.</h3>
			</div>
			<div class="row">
				<c:forEach var="i" begin="0" end="5">
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="portfolio-item" >
							<a class="portfolio-link" data-toggle="modal" href="#portfolioModal${i}">
								<div class="portfolio-hover">
									<div class="portfolio-hover-content">
										<i class="fas fa-plus fa-3x"></i>
									</div>
								</div> 
								<img class="img-fluid photo" id="photo${i}" src="" alt="...">
							</a>
							<div class="portfolio-caption">
								<div id="title${i}" class="portfolio-caption-heading"></div>
								<div id="addr${i}"
									class="portfolio-caption-subheading text-muted"></div>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</section>

	<!-- Portfolio Modals-->
	<!-- Modal 1-->
	
		<div class="portfolio-modal modal fade" id="portfolioModal1"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="close-modal" data-dismiss="modal">
						<img src="${root }bootstrap/assets/img/close-icon.svg"
							alt="Close modal" />
					</div>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<div class="modal-body">
									<!-- Project Details Go Here-->
									<h2 class="text-uppercase">Project Name</h2>
									<p class="item-intro text-muted">Lorem ipsum dolor sit amet
										consectetur.</p>
									<img class="img-fluid d-block mx-auto"
										src="${root }images/spot/jeju.jpg" alt="..." />
									<p>Use this area to describe your project. Lorem ipsum dolor
										sit amet, consectetur adipisicing elit. Est blanditiis dolorem
										culpa incidunt minus dignissimos deserunt repellat aperiam
										quasi sunt officia expedita beatae cupiditate, maiores
										repudiandae, nostrum, reiciendis facere nemo!</p>
									<ul class="list-inline">
										<li>Date: January 2021</li>
										<li>Client: Threads</li>
										<li>Category: Illustration</li>
									</ul>
									<button class="btn btn-primary" data-dismiss="modal"
										type="button">
										<i class="fas fa-times mr-1"></i> Close Project
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
	<!-- Modal 2-->
	<div class="portfolio-modal modal fade" id="portfolioModal2"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="${root }bootstrap/assets/img/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project Details Go Here-->
								<h2 class="text-uppercase">Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="${root }images/spot/jeju.jpg" alt="..." />
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
									<li>Date: January 2021</li>
									<li>Client: Explore</li>
									<li>Category: Graphic Design</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
									<i class="fas fa-times mr-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 3-->
	<div class="portfolio-modal modal fade" id="portfolioModal3"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="${root }bootstrap/assets/img/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project Details Go Here-->
								<h2 class="text-uppercase">Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="${root }images/spot/jeju.jpg" alt="..." />
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
									<li>Date: January 2021</li>
									<li>Client: Finish</li>
									<li>Category: Identity</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
									<i class="fas fa-times mr-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 4-->
	<div class="portfolio-modal modal fade" id="portfolioModal4"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="${root }bootstrap/assets/img/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project Details Go Here-->
								<h2 class="text-uppercase">Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="${root }images/spot/jeju.jpg" alt="..." />
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
									<li>Date: January 2021</li>
									<li>Client: Lines</li>
									<li>Category: Branding</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
									<i class="fas fa-times mr-1"></i> Close Project
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 5-->
	<div class="portfolio-modal modal fade" id="portfolioModal5"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="${root }bootstrap/assets/img/close-icon.svg"
						alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project Details Go Here-->
								<h2 class="text-uppercase">Project Name</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<img class="img-fluid d-block mx-auto"
									src="${root }images/spot/jeju.jpg" alt="..." />
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
									<li>Date: January 2021</li>
									<li>Client: Southwest</li>
									<li>Category: Website Design</li>
								</ul>
								<button class="btn btn-primary" data-dismiss="modal"
									type="button">
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