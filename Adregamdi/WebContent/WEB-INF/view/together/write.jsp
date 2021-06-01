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

<script>

	$(function() {
		
		var keywordParam = { "pageNo" : 1, "numOfRow" : 5, "keyword" : ""};
		
		$("#btn-search").click(function(){
			
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
									+'<a href="#" class="card-btn btn btn-dark" style="float:right;">추가하기</a>'
									+'<span style="display: none" id="searchContentId'+key+'">'+data[key].contentId+'</span> '
									+'<span style="display: none" id="searchContentTypeId'+key+'">'+data[key].contentTypeId+'</span>'
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
	});
	
	
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

.left {
	float: left;
	top: 0px;
	width: 100%;
	padding-right : 10px;
}


.right {
	float: right;
}

#search_view {
	display: flex;
	justify-content: center;	
}

.list-group-item {
	margin : 0px;
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
					<h6> 여행지 검색</h6>
					<div class="left">
						<div class="input-group" >
							<input type="text" class="form-control search-menu" id="search-field" placeholder="검색..." style="background: #f9f9f9; ">
							<div class="input-group-append" id="btn-search">
								<!-- 여기에요 여기!! -->
								<span class="input-group-text" style="background: #e9e9e9;">
									<i class="fa fa-search" aria-hidden="true"></i>
								</span>
							</div>
						</div>
						<br>	
						<div id="search_view" class="row">			
						</div>
					</div>
				</td>
				<td class="rowLine">
					<div class="right">
						<form:form action="${root}together/writeProc" method="post"
							modelAttribute="togetherWriteDTO" class="form-horizontal">
							<form:hidden path="to_no" />
							<div class="form-group">
								<form:label path="to_title">제목</form:label>
								<form:input path="to_title" class="form-control" />
								<form:errors path="to_title" style="color:red;" />
							</div>
							<%-- <div class="form-group">
								<form:label path="to_meet">여행 날짜</form:label>
							</div>
							<div class="form-group">
								<form:label path="to_total">모집인원</form:label>
								<form:input path="to_total" class="form-control"/>
							</div> --%>
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