<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어드레 감디 | 같이가치</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}ckeditor/ckeditor.js"></script>
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" ></script>

<!-- 달력 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script>
	$(function() {
		
		var keywordParam = { "pageNo" : 1, "numOfRow" : 5, "keyword" : ""};
		
		$(".flatpickr").flatpickr({
			enableTime:true,
			minDate: "today",
			dateFormat: "Y-m-d H:i"			
		});
		
		
		$(".btn-search").click(function(){
			
			keywordParam.pageNo = 1;
			
			var keyword = $("#search-field").val();
			
			console.log("keyword : "+keyword);
			if(keyword == "") {
				alert('키워드를 입력하세요');
				$("#search-field").focus();
				return false;
			}
			
			keywordParam.keyword = keyword;		
			
			$.ajax({
				url : "/together/keyword",
				type : "get",
				dataType : "json",
				data : keywordParam,
				
				success : function(data) {
					
					$("#search_view").empty();
					
					var content = '<ul class="list-group">';
					$.each(data, function(key, val) {
						
						content = '<li class="list-group-item" style="width: 90%;">'
									+'<h2><b>'+data[key].title+'</b></h2>'+data[key].addr1
									+'<a href="#" class="card-btn btn btn-dark" onclick="addSpotId('+key+')" style="float:right;">추가하기</a>'
									+'<span style="display: none" id="getContentId'+key+'">'+data[key].contentId+'</span> '
									+'<span style="display: none" id="getTitle'+key+'">'+data[key].title+'</span>'
									+'</li>';				
						$("#search_view").append(content);
					});
					$("#search_view").append("</ul>");
				},
				
				error : function(error) {
					alert("keyword 실패 - !");
				}				
			});			
		});	
		
		
		
		
		
		// 무한 스크롤
		$('.sidebar-menu').scroll(function() {
			
			if(Math.ceil($('.sidebar-menu').scrollTop() + $('.sidebar-menu').innerHeight()) == $('.sidebar-menu')[0].scrollHeight) {
		    	
				keywordParam.pageNo++;
				
				$.ajax({
					url : "/together/keyword",
					type : "get",
					dataType : "json",
					data : keywordParam,
					
					success : function(data) {
						
						var content = '<ul class="list-group">';
						$.each(data, function(key, val) {
							
							content = '<li class="list-group-item" style="width: 90%;">'
										+'<h2><b>'+data[key].title+'</b></h2>'+data[key].addr1
										+'<a href="#" class="card-btn btn btn-dark" onclick="addSpotId('+key+')" style="float:right;">추가하기</a>'
										+'<span style="display: none" id="getContentId'+key+'">'+data[key].contentId+'</span> '
										+'<span style="display: none" id="getTitle'+key+'">'+data[key].title+'</span>'
										+'</li>';				
							$("#search_view").append(content);
						});
						$("#search_view").append("</ul>");
					},
					
					error : function(error) {
						alert("keyword 실패 - !");
					}				
				});			
		    	
			  }
		});
	});
	
	function addSpotId(key) {
		var contentId = $("#getContentId"+key).html();
		var title = $("#getTitle"+key).html();
		
		$(".sidebar-menu").hide();
		$(".input-group").hide();
		$("#printSpot").show();
		$("#fixedSpotTitle").attr("value", title);
		$("#fixedSpotContentId").attr("value", contentId);
		$(".calendar").show();
		$("#number").hide();
	}
	
	function modifySpot() {
		$(".sidebar-menu").show();
		$(".input-group").show();
		$("#search_view").empty();
		$("#search-field").attr("value", "");
		$("#printSpot").hide();
		$(".calendar").hide();
		$("#number").hide();
	}
	
	function writeMeetDate() {
		var meetDate = $("#meetDate").val();
		
		if(meetDate=="") {
			alert("날짜를 입력하세요 - !");
			return;
		}
		
		$("#number").show();
	}
	
	function writePersonNumber() {
		
		var contentId = $("#fixedSpotContentId").val();
		var spotTitle = $("#fixedSpotTitle").val();
		var meetDate = $("#meetDate").val();
		var personNumber = $("#personNumber").val();
		
		console.log("contentId : "+contentId);
		console.log("meetDate : "+meetDate);
		console.log("personNumber : "+personNumber);
		
		
		$("#to_place").attr("value", contentId);
		$("#to_place_name").attr("value", spotTitle);
		$("#to_meet").attr("value", meetDate);
		$("#to_total").attr("value", personNumber);
	}
	
	function formSubmit(){
			const check_title = $("#to_title").val();
		const check_content = CKEDITOR.instances.to_content.getData();
			
		if(check_title == ""){
				alert("제목을 입력해주세요 !");
				event.preventDefault();
				return;
			} else if(check_content == ""){
				alert("내용을 입력해주세요 !");
				event.preventDefault();
				return;
			} else if(check_title != "" && check_content != ""){
				$("#togetherWriteDTO").submit();
			} 
	}

	function cancelfunc(){
		const choice = confirm("작성하시는 글은 저장이 안됩니다 나가시겠습니까?");
		if(choice == true){
			location.href="${root}together/list";	
		} else {
			return;
		}		
	}
	
	
</script>
<script>
  function submit() {
	  $("#togetherWriteDTO").submit();
  }
  </script>

<style>
@font-face {
	font-family: 'Bazzi';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/Bazzi.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'Bazzi';
}

td {
	vertical-align: top;
}
::-webkit-scrollbar {
	width: 5px;
	height: 7px;
}

::-webkit-scrollbar-button {
	width: 0px;
	height: 0px;
}

::-webkit-scrollbar-thumb {
	background: #525965;
	border: none;
}

.rowLine {
	top: 0px;
	width: 50%;
	pading: 15px;
}

.left_col {
	top: 0px;
	width: 100%;
	padding-right : 10px;
	vertical-align: center;
}


.right_col {
	float: right;
}

#search_view {
	display: flex;
	justify-content: center;
	margin: 0px 5px;	
}

.list-group-item {
	margin : 0px;
}

.sidebar-menu {
	height: 400px;
	overflow: auto;
}

</style>

</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- 메인 -->
	<div class="container" style="margin-top: 150px; margin-bottom: 150px;">
		<h3 class="InputSubject">
			<b>동행자 구인 공고</b>
		</h3>
		<hr>
		<table>
			<tr>
				<td class="rowLine">
					<div class="left_col">
						<h6>여행지 </h6>
						<div class="input-group" >
							<input type="text" class="form-control search-menu" id="search-field" placeholder="검색..." style="background: #f9f9f9; ">
							<div class="input-group-append btn-search">
								<!-- 여기에요 여기!! -->
								<span class="input-group-text" style="background: #e9e9e9;">
									<i class="fa fa-search" aria-hidden="true"></i>
								</span>
							</div>
						</div>
						<div class="sidebar-menu">
							<div id="search_view" class="row">			
							</div>
						</div>
						<div id="printSpot" style="display:none">
							<input type="text" class="form-control" id="fixedSpotTitle" style="background: #f9f9f9; " disabled/>
							<input type="hidden" id="fixedSpotContentId"/>
							<br>
							<a href="#" class="card-btn btn btn-dark" onclick="modifySpot()" style="float:right;">수정하기</a>
						</div>
						<br>
						<div class="calendar"  style="display:none">
							<br><br>
							<h6>여행 날짜</h6>
							<input id="meetDate" class="form-control flatpickr flatpickr-input active" type="text" placeholder="Select Date.." data-id="minMaxTime" readonly="readonly">
							<br>
							<a href="#" class="card-btn btn btn-dark" onclick="writeMeetDate()" style="float:right;">날짜 입력하기</a>
						</div>
						<div id="number" style="display:none">
							<br><br>
							<h6>모집 인원</h6>
							<input id="personNumber" class="form-control" style="width:50%;"type="number" value="1"/>
							<br>
							<a href="#" class="card-btn btn btn-dark" onclick="writePersonNumber()" style="float:right;">인원 입력하기</a>							
						</div>
					</div>
				</td>
				<td class="rowLine">
					<div class="right_col">
						<form:form action="${root}together/writeProc" method="post" modelAttribute="togetherWriteDTO" class="form-horizontal">
							<form:hidden path="to_no" />
							<form:hidden path="to_place"/>
							<form:hidden path="to_place_name"/>
							<form:hidden path="to_meet"/>
							<form:hidden path="to_total"/>
							<div class="form-group">
								<form:label path="to_title">제목</form:label>
								<form:input path="to_title" class="form-control" />
								<form:errors path="to_title" style="color:red;" />
							</div>
							<div class="form-group">
								<form:label path="to_content">공고문</form:label>
								<form:textarea path="to_content" class="form-control" rows="10"
									style="resize:none" />
								<form:errors path="to_content" style="color:red;" />
								<script>
				          		CKEDITOR.replace('to_content');
				        </script>
							</div>
							<div class="form-group">
								<div class="col-sm-15 text-right">
									<form:button class="btn btn-success" style="margin-right: 5px;">작성완료</form:button>
									<a href="${root}together/list" class="btn btn-danger">취소</a>
								</div>
							</div>
						</form:form>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<!-- Footer -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>