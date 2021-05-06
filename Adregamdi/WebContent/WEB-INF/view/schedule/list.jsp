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
	 	
	 	<div>
	  	<a href="${root }schedule/write">글쓰기</a>
	  </div>
	  
	  <div>
	  	<table>
	  		<thead>
	  			<tr>
	  				<th>글번호</th>
	  				<th>제목</th>
	  				<th>작성자</th>
	  				<th>작성일</th>
	  				<th>조회수</th>
	  				<th>추천수</th>
	  			</tr>
	  		</thead>
	  		<tbody>
	  			<tr>
	  				<td>01</td>
	  				<td><a href="${root }schedule/read">SAMPLE</a></td>
	  				<td>ADMIN</td>
	  				<td>0000-00-00</td>
	  				<td>00</td>
	  				<td>00</td>
	  			</tr>
	  		</tbody>
	  	</table>
	  </div>
	  
	  <div>
	  	<ul>
	  		<li>이전</li>
	  		<li>1</li>
	  		<li>2</li>
	  		<li>3</li>
	  		<li>4</li>
	  		<li>5</li>
	  		<li>6</li>
	  		<li>7</li>
	  		<li>8</li>
	  		<li>9</li>
	  		<li>10</li>
	  		<li>다음</li>
	  	</ul>
	  </div>
	  
	  <div>
	  	<a href="${root }schedule/write">글쓰기</a>
	  </div>
  </div>
  
  <!-- Footer -->
  <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>