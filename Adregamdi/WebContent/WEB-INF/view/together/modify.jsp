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
</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/view/include/header.jsp"/>
	
	<!-- 메인 -->
	<div class="container" style="margin-top:75px">
	  <h3 class="inputSubject">
	    <b>글 수정</b>
	  </h3>
	  <hr>  
	  <div class="row">
	    <div class="col-sm-3"></div>
	    <div class="col_sm-6">
	      <div class="card shadow">
	        <div class="card-body">
	          <form:form action="${root }together/modify_proc" method="post" modelAttribute="modifyTogetherDTO" enctype="multipart/form-data">
	            <form:hidden path="to_no" />
	            
				  <div class="form-group">
				    <form:label path="to_date">접선 날짜</form:label>
					<form:input path="to_date" class="form-control" readonly="true" />
				  </div>
				  <div class="form-group">
				    <form:label path="to_title">동행자 공고</form:label>
					<form:input path="to_title" class="form-control" />
                    <form:errors path="to_title" style="color:red;"/>
				  </div>
				  <div class="form-group">
					<form:label path="to_content">내용</form:label>
					<form:textarea path="to_content" class="form-control" rows="10" style="resize:none" />
                    <form:errors path="to_content"  style="color:red;"/>
				  </div>
				  <div class="form-group">
					<div class="text-right">
					<form:button class="btn btn-success">수정완료</form:button>
					<a href="${root }together/read" class="btn btn-info">취소</a>
				  </div>
				</div>
			  </form:form>
		    </div>			
	      </div>
		</div>
		<div class="col-sm-3"></div>
	  </div>	
    </div>
<!-- 수정을 위한 주석 -->
    <!-- 하단 정보 -->  
    <c:import url="/WEB-INF/view/include/bottom_info.jsp" />


</body>
</html>
	          
	          
	          
	          