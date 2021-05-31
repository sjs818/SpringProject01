<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"></script>

<link href="${root }css/review.css" rel="stylesheet">
<script type="text/javascript" src="${root }js/review.js"></script>

</head>
<body>
	<!-- 상단 헤더 -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- 1개 클릭 시 세부사항 -->
	<div class="container bg-light" style="margin-top: 120px; margin-bottom: 150px; font-color: black;">
		<table id="table">
			<tr>
				<td class="left">
					<div class="text-center">
						<h1 class="section-heading" style="font-size: 50px;"><b>${information[1] }</b></h1>
						<h3 class="section-subheading text-muted">${information[3] } </h3>
					</div>
				</td>
				<td class="right" rowspan="3">	
								
					<div class="accordion" id="SpotMap">
						<div class="card">
							<div class="card-header" id="headingOne">
								<h5 class="mb-0">
									<button class="btnText btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-map" viewBox="0 0 16 16">
	                            			<path fill-rule="evenodd" d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98 4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z" />
	                          			</svg>&nbsp;&nbsp;지도보기
									</button>
								</h5>
							</div>

							<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
								<div class="card-body">
									<div class="mapPrint">
										지도 첨가하기
									</div>
								</div>
							</div>
						</div>



						<div class="card">
							<div class="card-header" id="headingTwo">
								<h5 class="mb-0">
									<button class="btnText btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
	                            			<path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
	                          			</svg>&nbsp;&nbsp;여행지 설명
									</button>
								</h5>
							</div>
							<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
								<div class="card-body">
									<div class="overview">${information[2] }</div>
								</div>
							</div>
						</div>



						<div class="card">
							<div class="card-header" id="headingThree">
								<h5 class="mb-0">
									<button class="btnText btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-justify-left" viewBox="0 0 16 16">
	                            			<path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z" />
	                          			</svg>&nbsp;&nbsp;리뷰
									</button>
								</h5>
							</div>
							<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
								<div class="card-body">
									<div class="reviewPrint" style="margin-top: 20px; margin-bottom: 100px;">
										<c:if test="${loginCheck != 0}">
											<div class="input-group">
												<input type="text" id="review_content"
													class="form-control search-menu" placeholder="리뷰 작성"
													style="background: #f9f9f9;"> <input type="hidden"
													id="contentId" value="${contentId }" />
												<div class="input-group-append" onClick="writeReview()">
													<span class="input-group-text" style="background: #e9e9e9;">
														<i class="fas fa-pen"></i>
													</span>
												</div>
											</div>
										</c:if>
										<div>
											<c:if test="${reviewSize != 0 }">
												<div class="card-body">
													<table class="table table-hover" id='review_list'>
														<thead>
															<tr>
																<th></th>
																<th class="text-center d-none d-md-table-cell">내용</th>
																<th class="text-center d-none d-md-table-cell">작성자</th>
																<th class="text-center d-none d-md-table-cell">작성날짜</th>
																<th style="width: 30px;"></th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="reviewDTO" items="${reviewList }">
																<input type="hidden" id="hcontentId"
																	value="${reviewDTO.content_id }" />
																<tr>
																	<td></td>
																	<td class="text-center d-none d-md-table-cell">${reviewDTO.review_content }</td>
																	<td class="text-center d-none d-md-table-cell">${reviewDTO.user_id }</td>
																	<td class="text-center d-none d-md-table-cell">${reviewDTO.review_date }</td>
																	<td style="width: 30px;"><c:if
																			test="${loginCheck eq reviewDTO.user_no }">
																			<div style="float: left;"
																				onClick="deleteReview(${reviewDTO.review_idx})">
																				<i class="far fa-trash-alt"></i>
																			</div>
																		</c:if></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>


			<tr>
				<td class="left text-center">
					<img class="img-fluid photo" src="${information[0] }" alt="img" />
				</td>
			</tr>


			<tr>
				<td class="left text-center">
					<ul class="plus">
						<c:choose>
							<c:when test="${contentTypeId eq 12 }">
								<li>문의 및 안내 : ${information[6] }</li>
								<br>
								<li>쉬는 날 : ${information[7] }</li>
								<br>
								<li>이용시간 : ${information[8] }</li>
								<br>
							</c:when>
							<c:when test="${contentTypeId eq 14 }">
								<li>문의 및 안내 : ${information[6] }</li>
								<br>
								<li>쉬는 날 : ${information[7] }</li>
								<br>
								<li>이용시간 : ${information[8] }</li>
								<br>
							</c:when>
							<c:when test="${contentTypeId eq 15 }">
								<li>행사 홈페이지 : ${information[6] }</li>
								<br>
								<li>연락처 : ${information[7] }</li>
								<br>
								<li>공연시간 : ${information[8] }</li>
								<br>
								<li>이용 요금 : ${information[9] }</li>
								<br>
							</c:when>
							<c:when test="${contentTypeId eq 25 }">
								<li>문의 및 안내 : ${information[6] }</li>
								<br>
								<li>코스 예상 소요시간 : ${information[7] }</li>
								<br>
								<li>코스 테마 : ${information[8] }</li>
								<br>
							</c:when>
							<c:when test="${contentTypeId eq 28 }">
								<li>문의 및 안내 : ${information[6] }</li>
								<br>
								<li>쉬는 날 : ${information[7] }</li>
								<br>
								<li>이용 요금 : ${information[8] }</li>
								<br>
								<li>이용 시간 : ${information[9] }</li>
								<br>
							</c:when>
							<c:when test="${contentTypeId eq 32 }">
								<li>문의 및 안내 : ${information[6] }</li>
								<br>
								<li>체크인 : ${information[7] }</li>
								<br>
								<li>체크아웃 : ${information[8] }</li>
								<br>
								<li>홈페이지 : ${information[9] }</li>
								<br>
								<li>예약안내 : ${information[10] }</li>
								<br>
							</c:when>
							<c:when test="${contentTypeId eq 38 }">
								<li>문의 및 안내 : ${information[6] }</li>
								<br>
								<li>영업 시간 : ${information[7] }</li>
								<br>
								<li>쉬는 날 : ${information[8] }</li>
								<br>
							</c:when>
							<c:when test="${contentTypeId eq 39 }">
								<li>문의 및 안내 : ${information[6] }</li>
								<br>
								<li>대표 메뉴 : ${information[7] }</li>
								<br>
								<li>영업 시간 : ${information[8] }</li>
								<br>
								<li>쉬는 날 : ${information[9] }</li>
								<br>
							</c:when>
						</c:choose>
					</ul>
				</td>
			</tr>
		</table>
	</div>


	<!-- 하단 -->
	<%-- <c:import url="/WEB-INF/view/include/footer.jsp" /> --%>

	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>