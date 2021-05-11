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
  <title>같이가치</title>
  <!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<c:import url="/WEB-INF/view/include/header/jsp"/>
	
	<!-- 메인 -->
	<div class="container" style="margin-top:100px">
	  <div class="row">
	    <div class="col-sm-3"></div>
	    <div class="col-sm-6">
	      <div class="card shadow">
	        <div class="card-body">
	          <form:form action="${root }together/write_proc" method="post" modelAttribute="writeTogetherDTO" enctype="multipart/form-data">
	            <div class="form-group">
	              <form:label path ="to_title">동행자 구인공고</form:label>
	              <form:input path ="to_title" class="form-control"/>
	              <form:errors path ="to_title" style="color:red"/>
	            </div>  
	            <div class="form-group">
	              <form:label path="to_content">내용</form:label>
	              <form:textarea path="to_content" class="form=control" rows="10" style="resize:none" />
	              <form:errors path ="to_content" style="color:red"/>
 	            </div>
 	            <div class="form-group">
 	              <form:label path ="upload_file">첨부파일</form:label>
 	              <form:input type="file" path="upload_file" class="form-control" accept="image/*" />
	            </div>
	            <div class="form-group">
	              <div class="text-right">
	                <form:button class="btn btn-primary">작성하기</form:button>
	              </div>
	            </div>
	            </form:form>
	          </div>  
	        </div>        
	      </div>
	      <div class="col-sm-3"></div>
	    </div>
	  </div>
	  
	  <!-- 하단 -->
	  <c:import url="/WEB-INF/view/include/footer.jsp" /> 
</body>
</html>