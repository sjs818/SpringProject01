<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <title>Document</title>
</head>
<body>
  <!-- Header -->
  <c:import url="/WEB-INF/view/include/header.jsp"/>
  
  <!-- Main -->
  <div class="container" style="margin-top:100px">
  	<div class="card shadow">
	  	<div class="card-header">
	  		<h1>title</h1>
	  		<p>explanation</p>
	  	</div>
  	
  		<div class="card-body">
	  		<form action="${root }schedule/modify_proc" method="post" >
	  			
	  			<div class="form-group">
	  				<label for="schedule_title">제목</label>
	  				<input class="form-control" type="text" id="schedule_title" name="schedule_title" value="${scheduleDTO.schedule_title }">
	  			</div>
	  			
	  			<div class="row">
		  			<div class="form-group col-6">
		  				<label>출발</label>
		  				<input class="form-control" type="date" id="schedule_start" name="schedule_start" value="${scheduleDTO.schedule_start }">
		  			</div>
		  			
		  			<div class="form-group col-6">
		  				<label>도착</label>
		  				<input class="form-control" type="date" id="schedule_end" name="schedule_end" value="${scheduleDTO.schedule_end }">
		  			</div>
		  		</div>
		  		
	  			<div class="form-group">
	  				<label for="schedule_content">내용</label>
	  				<textarea id="schedule_content" class="form-control" name="schedule_content" rows="30" cols="50">${scheduleDTO.schedule_content }</textarea>
	  			</div>
	  			
	  			<div class="text-right">
	  				<input class="btn btn-primary" type="submit" value="수정하기">
	  				<a class="btn btn-danger" href="${root }schedule/list?page=${page }">취소</a>
	  			</div>
	  			
	  		</form>
  		</div>
  	</div>
  </div>
  <!-- Footer -->
  <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>