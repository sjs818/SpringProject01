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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${root }bootstrap/css/styles.css">

<style>
h2, h3 {
	font-family: 'Stylish', sans-serif
};
</style>

</head>

<body>
	<!-- 상단 메뉴바  -->
	<c:import url="/WEB-INF/view/include/header.jsp" />
	
	
	<!-- Top 5 출력 -->
	<section class="page-section bg-light" id="portfolio">
		<div class="container" style="margin-top: 100px">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">제주 지역 탐방</h2>
				<h3 class="section-subheading text-muted">제주도는 제주시, 서귀포시로 크게 나뉠 수 있습니다. 각 지역의 Top5 유명지를 소개합니다.</h3>
			</div>
			
			<!-- 지역별  -->
			<div class="row" style="margin-top: 50px">
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
								</div>
							</div> 
							<img class="img-fluid" src="${root }images/thumbnail.png" alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading"> Top 1 </div>
							<div class="portfolio-caption-subheading text-muted">Graphic Design</div>
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
							</div> <img class="img-fluid" src="${root }images/thumbnail.png"
							alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading"> Top 2 </div>
							<div class="portfolio-caption-subheading text-muted">Graphic Design</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
								</div>
							</div> 
							<img class="img-fluid" src="${root }images/thumbnail.png" alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading"> Top 3 </div>
							<div class="portfolio-caption-subheading text-muted">Graphic Design</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
								</div>
							</div> 
							<img class="img-fluid" src="${root }images/thumbnail.png" alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading"> Top 4 </div>
							<div class="portfolio-caption-subheading text-muted">Graphic Design</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
								</div>
							</div> 
							<img class="img-fluid" src="${root }images/thumbnail.png" alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading"> Top 5 </div>
							<div class="portfolio-caption-subheading text-muted">Graphic Design</div>
						</div>
					</div>
				</div>		<!-- top 5개 입력 -->
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="portfolio-item">
						<a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x"
										aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 448 512" data-fa-i2svg="">
										<path fill="currentColor"
											d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
								</div>
							</div> 
							<img class="img-fluid" src="${root }images/thumbnail.png" alt="...">
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">More</div>
							<div class="portfolio-caption-subheading text-muted">더 많은 여행지 찾기</div>
						</div>
					</div>
				</div>		<!-- More -->
			</div>
		</div>
	</section>
	
	
	<%-- <div class="container" style="margin-top: 100px">
		<div class="contents">
			<div class="wrap_contView padB10">
				<div>
					<div style="margin: 50px">
						<table border="1" width="80%">
							<tbody>
								<tr align="center">
									<td><a href="${root }spot/local_detail?local_no=0&check=1">
											전체 지역 </a></td>
									<td><a href="${root }spot/local_detail?local_no=0&check=1">
											제주시 </a></td>
									<td><a href="${root }spot/local_detail?local_no=0&check=1">
											서귀포시 </a></td>
								<tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div id="contentAppend" style="margin-top: 50px">
				<div class="wrap_contView">
					<h3 class="title_atc">인기 여행지 Top10</h3>
					<span class="date">제주의 추천 여행지를 소개합니다.</span>
					<div class="listBn_msPc m_none" id="msmain0">
						<ul class="clfix">
							<li><a href="${root }spot/read?check=1&spot_idx=2">1</a></li>
							<li><a href="${root }spot/read?check=1&spot_idx=2">2</a></li>
							<li><a href="${root }spot/read?check=1&spot_idx=2">3</a></li>
							<li><a href="${root }spot/read?check=1&spot_idx=2">4</a></li>
							<li><a href="${root }spot/read?check=1&spot_idx=2">5</a></li>
						</ul>
						<ul>
							<li><a href="${root }spot/read?check=1&spot_idx=2">6</a></li>
							<li><a href="${root }spot/read?check=1&spot_idx=2">7</a></li>
							<li><a href="${root }spot/read?check=1&spot_idx=2">8</a></li>
							<li><a href="${root }spot/read?check=1&spot_idx=2">9</a></li>
							<li><a href="${root }spot/read?check=1&spot_idx=2">10</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div> --%>

	<!-- 하단 -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>