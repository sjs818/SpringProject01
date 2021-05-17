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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Stylish&display=swap"
	rel="stylesheet">

<!-- x 아이콘 -->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" ></script>

<link href="${root }css/spot.css" rel="stylesheet">

<script>
$(function() {

    var sigungu = $("#sigunguCode").val();
    var contentType = $("#contentTypeId").val();
    var pNum = $('input[name=currentPage]').val();

    var allData = { "pageNo": pNum, "sigunguCode": sigungu, "contentTypeId": contentType, "numOfRow": 10 };

    /* 검색에 필요한 변수 추가 */
    var keyword_markers=[];
    // var map = initTmap();
    var keywordParam = { "pageNo" : 1, "numOfRow" : 10, "keyword" : ""};
    var keyword_flag = false;
    
    
    // 무조건 화면에 띄워야함.
    $.ajax({
        url: "/spot/information",
        type: "get",
        dataType: "json",
        data: allData,
        success: function(data) {
            
        	$("#total_view").show();
    		$("#search_view").hide();
    		$("#total_page").show();
        	
            // 반복함수
            $.each(data, function(key, val) {  
            	$("#cnt").data.length;
            	
            	$("#contentId" + key).html(data[key].contentId);
            	$("#contentTypeId" + key).html(data[key].contentTypeId);
				$("#photo" + key).attr("src", data[key].firstImage);
				$("#title" + key).text(data[key].title);
                $("#addr" + key).text(data[key].addr1);
            });
        },
        error: function(error) {
            alert('첫 페이지 에러');
        }
    });
    
    var actionForm = $("#actionForm");

    $(".paginate_button a").on("click", function(e) {
        e.preventDefault();
        actionForm.find("input[name='currentPage']").val($(this).attr("href"));
        actionForm.submit();
    });
    
	$("#btn-search").click(function(){
		
		keywordParam.pageNo = 1;
				
		$("#total_view").hide();
		$("#search_view").show();
		$("#total_page").hide();
		
		var keyword = $("#search-field").val();
		
		if(keyword == "") {
			alert('키워드를 입력하세요');
			$("#search-field").focus();
			return false;
		}
		
		keywordParam.keyword = keyword;
		console.log("keyword : " + keyword);
		
		$.ajax({	
			
			url : "/spot/keyword",
			type : "get",
			dataType : "json",
			data : keywordParam,
			
			success :  function(data){
				
				
				$("#search_view").empty();
				
				$.each(data, function(key, val) {  
					
					var content = '<div class="col-lg-4 col-sm-6 mb-4">'
								+'<div class="portfolio-item">'
								+'<a class="portfolio-link" data-toggle="modal"href="#portfolioModal" onclick="detail('+key+');">'
								+'<div class="portfolio-hover">'
								+'<div class="portfolio-hover-content">'
								+'<i class="fas fa-plus fa-3x"></i></div></div> '
								+'<img class="img-fluid photo" id="searchPhoto" src="'+data[key].firstImage+'" alt="..."></a>'
								+'<div class="portfolio-caption"><div id="searchTitle" class="portfolio-caption-heading">'+data[key].title+'</div>'
								+'<div id="searchAddr" class="portfolio-caption-subheading text-muted">'+data[key].addr1+'</div>'
								+'<span style="display: none" id="searchContentId">'+data[key].contentId+'</span> '
								+'<span style="display: none" id="searchContentTypeId">'+data[key].contentTypeId+'</span></div></div></div>';
								
								
	                $("#search_view").append(content);
	            });
	
			},
			error : function(error) {
				alert("keyword 실패");
			}
		}); 
	});
});

function detail(idx) {
	
	var contentId = $("#contentId"+idx).html();
	var contentTypeId = $("#contentTypeId"+idx).html();
	var param = {"contentId" : contentId, "contentTypeId" : contentTypeId};
	
	$.ajax({
		
		url: "/spot/details",
		type: "get",
		dataType: "json",
		data: param,
		success:function(data) {
			
			testData(data,contentTypeId);
		}, 
		error: function(error) {
			alert('detail 에러');
		}
	});
}

function testData(data,contentTypeId) {
	for(var i=0;i<data.length;i++){
		if(data[i] == null){
			data[i] = "";
		}
	}		
	$("#modalPhoto").attr("src",data[0]);
	$("#modalTitle").text(data[1]);
	$("#modalOverview").html(data[2]);
	$(".details").empty().append("<li id='addr'>주소 : "+data[3]+"</li><br>");
	switch(contentTypeId) {
	case "12" :
		$(".details").append("<li>문의 및 안내 : "+data[6]+"</li><br>");
		$(".details").append("<li>쉬는날 : "+data[7]+"</li><br>");
		$(".details").append("<li>이용시간 : "+data[8]+"</li><br>");
		break;
	case "14" :
		$(".details").append("<li>문의 및 안내 : "+data[6]+"</li><br>");
		$(".details").append("<li>이용요금 : "+data[7]+"</li><br>");
		$(".details").append("<li>이용시간 : "+data[8]+"</li><br>");
		break;
	case "15" :
		$(".details").append("<li>행사 홈페이지 : "+data[6]+"</li><br>");
		$(".details").append("<li>연락처 : "+data[7]+"</li><br>");
		$(".details").append("<li>공연시간 : "+data[8]+"</li><br>");
		$(".details").append("<li>이용요금 : "+data[9]+"</li><br>");//여기까지
		break;
	case "25" :
		$(".details").append("<li>문의 및 안내 : "+data[6]+"</li><br>");
		$(".details").append("<li>코스 예상 소요시간 : "+data[7]+"</li><br>");
		$(".details").append("<li>코스 테마 : "+data[8]+"</li><br>");
		break;
	case "28" :
		$(".details").append("<li>문의 및 안내 : "+data[6]+"</li><br>");
		$(".details").append("<li>쉬는날 : "+data[7]+"</li><br>");
		$(".details").append("<li>이용요금 : "+data[8]+"</li><br>");
		$(".details").append("<li>이용시간 : "+data[9]+"</li><br>");
		break;
	case "32" :
		$(".details").append("<li>문의 및 안내 : "+data[8]+"</li><br>");
		$(".details").append("<li>체크인 : "+data[6]+"</li><br>");
		$(".details").append("<li>체크아웃 : "+data[7]+"</li><br>");
		$(".details").append("<li>홈페이지 : "+data[9]+"</li><br>");
		$(".details").append("<li>예약안내 : "+data[10]+"</li><br>");
		break;
	case "38" :
		$(".details").append("<li>문의 및 안내 : "+data[6]+"</li><br>");
		$(".details").append("<li>영업시간 : "+data[7]+"</li><br>");
		$(".details").append("<li>쉬는날 : "+data[8]+"</li><br>");
		break;
	case "39" :
		$(".details").append("<li>문의 및 안내 : "+data[7]+"</li><br>");
		$(".details").append("<li>대표 메뉴 : "+data[6]+"</li><br>");
		$(".details").append("<li>영업시간 : "+data[8]+"</li><br>");
		$(".details").append("<li>쉬는날 : "+data[9]+"</li><br>");
		break;
	}
}

</script>

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
					수 있습니다. 각 지역의 Top3 유명지를 소개합니다.</h3>
			</div>

			<!-- Best 여행지  -->
			<div class="row" style="margin-top: 50px">
				<c:forEach var="order" begin="0" end="2">
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="portfolio-item">
							<a class="portfolio-link" data-toggle="modal"
								href="#portfolioModal${order }">
								<div class="portfolio-hover">
									<div class="portfolio-hover-content">
										<svg class="svg-inline--fa fa-plus fa-w-14 fa-3x" aria-hidden="true" focusable="false" data-prefix="fas"
											data-icon="plus" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg="">
											<path fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg>
									</div>
								</div> <img class="img-fluid" src="${root }images/spot/jeju.jpg"
								alt="...">
							</a>
							<div class="portfolio-caption">
								<div class="portfolio-caption-heading">Top ${order +1 }</div>
								<div class="portfolio-caption-subheading text-muted">Graphic
									Design</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<hr style="width: 80%;">

		<!-- 전체 여행지 보기 -->
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


			<!-- 검색 -->
			<div class="input-group" style="background: #258fff;">
				<input type="text" class="form-control search-menu"
					id="search-field" placeholder="검색..." style="background: #f9f9f9;">
				<div class="input-group-append" id="btn-search">
					<!-- 여기에요 여기!! -->
					<span class="input-group-text" style="background: #e9e9e9;">
						<i class="fa fa-search" aria-hidden="true"></i>
					</span>
				</div>
			</div>

			<br> <br>


			<!-- 전체 내용 출력 -->
			<div id="total_view" class="row">
				<c:forEach var="i" begin="0" end="8">
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="portfolio-item">
							<a class="portfolio-link" data-toggle="modal" href="#portfolioModal" onclick="detail(${i});">
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
								<span style="display: none" id="contentId${i }"></span> <span
									style="display: none" id="contentTypeId${i }"></span>
							</div>
							<div class="icon_outside">
								<div class="icon" style="margin-right: 60px;">
							        <a href="#" ><i class="far fa-thumbs-up" style="font-size:30px;"></i></a>
							        <!-- <a href="#"><i class="fas fa-thumbs-up" style="font-size:30px;"></i></a> -->
							        <span style="font-size: 10px;">좋아요</span>
							        <span style="font-size: 10px;">208</span>
							    </div>
							    <div class="icon">
							        <a href="#"><i class="far fa-file-alt" style="font-size:30px;"></i></a>
							        <span style="font-size: 10px;">리뷰쓰기</span>        
							        <span style="font-size: 10px;" >100</span>
							    </div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 검색어를 통한 결과값 출력 -->
			<div id="search_view" class="row">			
			</div>

			<!-- 페이지 처리 -->

			<div id="total_page" class="row text-center"
				style="margin: 1rem auto; padding-right: 5%; padding-left: 5%">
				<div class="col-sm-12">
					<ul class="pagination" id="pagination-demo">
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a
								href="${pageMaker.min -1 }">&laquo;</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.min }"
							end="${pageMaker.max }">
							<li
								class="paginate_button ${pageMaker.currentPage == num ? 'active':'' }">
								<a href="${num }">${num} </a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next"><a
								href="${pageMaker.max +1 }">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
				<form id='actionForm' action="/spot/main" method='get'>
					<input type='hidden' name='currentPage'
						value='${pageMaker.currentPage }'> <input type="hidden"
						name="sigunguCode" id="sigu" value="${sigunguCode }" /> <input
						type="hidden" name="contentTypeId" id="cont"
						value="${contentTypeId }" />
				</form>
			</div>
			
			
		</div>
	</section>




	<!-- 1개 클릭 시 세부사항 -->
	<div class="portfolio-modal modal fade" id="portfolioModal"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<img src="${root }images/spot/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<h2 id="modalTitle"></h2>
								<p id="modalAddr" class="item-intro text-muted"></p>
								<img id="modalPhoto" class="img-fluid d-block mx-auto" src=""
									alt="..." />
								<p id="modalOverview"></p>
								<ul class="details">
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