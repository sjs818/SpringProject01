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
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" ></script>

<link href="${root }css/spot.css" rel="stylesheet">
<link rel="stylesheet" href="${root }css/styles.css">
<!-- 
<script>
$(function() {
    
	$("#review_btn").click(function(){
		
		var contentId = $("#review_contentId").val();
		var content = $("#review_content").val();
		var inputData = {"contentId" : contentId, "content" : content};
		
		
		$.ajax({				
			url : "/spot/write_proc",
			type : "get",
			dataType : "json",
			data : inputData,
			
			success :  function(data){				
				console.log("contentId : "+contentId);
				console.log("content : "+content);
	            
			},
			error : function(error) {
				alert("review - insert 실패");
			}
		}); 
	});
	

});

</script>
 -->
<style>

.plus {
	padding: 20px;
	border: 1px solid;
	text-align : center;
}

.left {
	width: 50%;
	height: 200px;
	padding: 20px;
	align: center;
}
.right {
	width: 50%;
	padding: 20px;
	border-left: 1px dashed #cfcbc0;
}

.overview {
	overflow: scroll;
	height: 700px;
	width: 100%;
}

</style>
</head>
<body>
	<!-- 상단 헤더 -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- 1개 클릭 시 세부사항 -->
	<div class="container bg-light" style="margin-top: 100px; margin-bottom: 100px;">		
		<table>
			<tr>
				<td>
					<div class="text-center">
						<h1 class="section-heading" style="font-size : 50px;">${information[1] }</h1>
						<h3 class="section-subheading text-muted">${information[3] } </h3><br><br>
					</div>
				</td>
				<td class="right" rowspan="3">
					<div class="overview">
						${information[2] }
					</div>
				</td>
			</tr>
			<tr>
				<td class ="left text-center">
					<img class="img-fluid photo" src="${information[0] }" alt="img"/>
				</td>
				
			</tr>
			<tr>
				<td class ="left text-center">
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
				</td>
			</tr>
		</table>				
	</div>
	
	
	
	<div class="container" style="margin-top:20px; margin-bottom: 100px;">		
		<c:if test="${loginCheck != 0}">
			<div class="input-group" >
				<input type="text" id="review_content" class="form-control search-menu" placeholder="리뷰 작성" style="background: #f9f9f9;">
				<input type="hidden" id="review_contentId" value="${contentId }"/>
				<div class="input-group-append" id="review_btn">
					<span class="input-group-text" style="background: #e9e9e9;">
						<i class="fas fa-pen"></i>
					</span>
				</div>
			</div>			
		</c:if>
		<div>
			<c:if test="${reviewSize != 0 }" >
				<div class="card-body">
					<table class="table table-hover" id='review_list'>
						<thead>
							<tr>
								<th class="text-center d-none d-md-table-cell">글번호</th>
								<th class="w-50">내용</th>
								<th class="text-center d-none d-md-table-cell">작성자</th>
								<th class="text-center d-none d-md-table-cell">작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="reviewDTO" items="${reviewList }">
								<tr>
									<td class="text-center d-none d-md-table-cell">${reviewDTO.review_idx }</td>			
									<td class="text-center d-none d-md-table-cell">${reviewDTO.review_content }</td>
									<td class="text-center d-none d-md-table-cell">${reviewDTO.user_no }</td>
									<td class="text-center d-none d-md-table-cell">${reviewDTO.review_date }</td>
								</tr>	
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
		</div>
	</div>
	 

	<!-- 하단 -->
	<%-- <c:import url="/WEB-INF/view/include/footer.jsp" /> --%>
	
	<!-- Bootstrap core JS-->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>