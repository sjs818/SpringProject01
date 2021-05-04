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
  <title>Document</title>
</head>
<body>
	<!-- Header -->
  <c:import url="/WEB-INF/view/include/header.jsp"/>
  
  <!-- Main -->
  <div>
  	<div>
  		<h1>title</h1>
  		<p>explanation</p>
  	</div>
  	
  	<%--
  	<div>
  		<form:form action="${root }board01/write_proc" method="post" modelAttribute="" enctype="">
  			<div>
  				<form:label path="">제목</form:label>
  				<form:input path=""/>
  			</div>
  			<div>
  				<form:label path="">기간</form:label>
  				<form:input path=""/>
  				<form:input path=""/>
  			</div>
  			<div>
  				<form:label path="">내용</form:label>
  				<form:textarea path=""></form:textarea>
  			</div>
  			<div>
  				<form:button>등록하기</form:button>
  			</div>
  		</form:form>
  	</div>
  	--%>
  	
  	<div>
  		<form action="${root }schedule/write_proc" method="post" >
  			
  			<div>
  				<label for="schedule_title">제목</label>
  				<input type="text" id="schedule_title" name="schedule_title">
  			</div>
  			
  			<div>
  				<label>기간</label>
  				출발 : <input type="date" id="schedule_start" name="schedule_start">
  				도착 : <input type="date" id="schedule_end" name="schedule_end">
  			</div>
  			
  			<div>
  				<label for="schedule_content">내용</label>
  				<textarea id="schedule_content" name="schedule_content" rows="30" cols="50"></textarea>
  			</div>
  			
  			<div>
  				<input type="submit" value="등록하기">
  			</div>
  			
  		</form>
  	</div>
  </div>
  
  <!-- Footer -->
  <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>