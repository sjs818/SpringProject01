<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />
  
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>어드레 감디 | 같이가치</title>
  <!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}ckeditor/ckeditor.js"></script>
<script>
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
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/Bazzi.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		
  	body {
      font-family: 'Bazzi';
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
  </style>
  
</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/view/include/header.jsp"/>
	
	<!-- 메인 -->
	<div class="container" style="margin-top: 150px; margin-bottom: 150px;">
    <h3 class="InputSubject">
      <b>동행자 구인 공고</b>
    </h3>
    <hr>
		<br>
    <form:form action="${root}together/writeProc" method="post" modelAttribute="togetherWriteDTO" class="form-horizontal">
      <form:hidden path="to_no" />
      <div class="form-group">
        <form:label path="to_title">제목</form:label>
        <form:input path="to_title" class="form-control" />
        <form:errors path="to_title" style="color:red;" />
      </div>
      <div class="form-group">
        <form:label path="to_content">공고문</form:label>
        <form:textarea path="to_content" class="form-control" rows="10" style="resize:none"/>
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
   <!-- Footer -->
	 <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>