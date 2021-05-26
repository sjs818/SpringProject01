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
  <title>수정</title>
  <!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root}ckeditor/ckeditor.js"></script>
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
  </style>
  
</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/view/include/header.jsp"/>
	
	<!-- 메인 -->
  <div class="container" style="margin-top: 100px;">
     <h3 class="InputSubject">
      <b>글 수정</b>
    </h3>
    <hr>
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
        <div class="card shadow">
          <div class="card-body">
            <form:form action="${root}together/modifyProc" method="post" modelAttribute="togetherModifyDTO" class="form-horizontal">
              <form:hidden path="to_no" />
              <div class="form-group">
                <form:label path="to_title">제목</form:label>
                <form:input path="to_title" class="form-control" />
                <form:errors path="to_title" style="color:red;" />
              </div>
              <div class="form-group">
                <form:label path="to_content">공고문</form:label>
                <form:textarea path="to_content" class="form-control" rows="10" style="resize:none" />
                <form:errors path="to_content" style="color:red;" />
                <script>
                  CKEDITOR.replace('to_content');
                </script>
              </div>
              <div class="form-group">
                <div class="col-sm-15 text-right">
                  <form:button class="btn btn-primary">수정완료</form:button>
                  <a href="${root}together/read" class="btn btn-danger">취소</a>
                </div>
              </div>
            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>     

     