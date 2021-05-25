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

<!-- CSS import -->
<link href="${root }css/user.css" rel="stylesheet" type="text/css">


</head>
<body>


	<!-- 상단 -->
	<c:import url="/WEB-INF/view/include/header.jsp"/>



	<div class="container my-top">
		<h3 class="BoardTitle mb-4">
			<b>마이페이지</b>
		</h3>

		<div class="card">
			<div class="card-header my-card-header">
				<a href="${root }user/modify" class="float-right btn btn-success" style="padding: 3px 10px;">회원정보</a>
				<ul class="nav nav-tabs card-header-tabs">
					<li class="nav-item"><a class="nav-link active" href="${root }user/my_page">공유일정&nbsp
						<c:if test="${myPublicCount ne '0' }">
							<span class="badge badge-success"> ${myPublicCount }</span>
						</c:if>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="${root }user/my_page_disable">숨긴일정&nbsp 
						<c:if test="${myPrivateCount ne '0' }">
							<span class="badge badge-secondary"> ${myPrivatCount }</span>
						</c:if>
					</a></li>
				</ul>
			</div>
			<div class="row mx-3 my-3 content-box">
			
				<c:choose>	
					
					<c:when test="${myPublicCount eq '0' }">
						<div class="col-sm-12 text-center">
						<div class="jumbotron jumbotron-fluid bg-white" style="padding:2rem 0; margin-bottom:-20px;">
						  <div class="container">
						    <h1 class="display-5">나의 일정이 비어있습니다...<i class="far fa-sad-tear"></i></h1>
						    <p class="lead">아래 버튼을 눌러 나만의 특별한 제주도 여행을 스케줄링하고 다른 사람들과 공유하세요!</p>
						  </div>
						</div>
							<a class="btn btn-outline-success btn-lg mb-5" href="${root }schedule/list?page=1">나만의 일정 만들기</a>
						</div>
					</c:when>
				
					<c:otherwise>
						<c:forEach var="planDTO" items="${myPlan }" >
							<c:if test="${planDTO.plan_private eq 'N' }">
								<div class="col-sm-3">
									<div class="card mb-3 card_hover">
										<span class="term">${planDTO.plan_term - 1 } 박 ${planDTO.plan_term } 일</span>
											<a href="#"><img src="${planDTO.plan_img }" class="card-img-top" height="120" alt="일정보기"></a>
										<div class="card-body">
											<a href="#">
												<p class="card-title lead ellipsis-title">${planDTO.plan_title }</p>
												<p class="card-text ellipsis-info">${planDTO.plan_info }</p>
											</a>
										</div>
									    <div class="card-footer text-center">
									    	<ul class="btn-group" style="display: table; margin: 0; padding:0; width: 100%; text-align: center; list-style: none;">
			                                    <li style="display: table-cell;">
			                                       <a href="#" class=" btn btn-sm btn-info btn-block text-white mr-1">수정하기</a>
			                                    </li>
			                                    <li style="display: table-cell;">
			                                       <a href="#" class=" btn btn-sm btn-danger btn-block text-white">삭제하기</a>
			                                    </li>
			                               </ul>
									    </div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:otherwise>
					

					
				</c:choose>


			</div>
		</div>
	</div>






			<!-- 하단 -->
			<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>