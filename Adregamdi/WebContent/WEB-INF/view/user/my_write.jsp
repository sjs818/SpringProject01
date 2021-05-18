<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP</title>

<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>


	<!-- 상단 -->
	<c:import url="/WEB-INF/view/include/header.jsp" />



<div class="container" style="margin-top: 120px;">
	<h3 class="BoardTitle mb-4">
		<b>내가쓴글</b>
	</h3>

	<div class="row">
		
		<div class="col-sm-3">
		<div class="card mb-3" >
			<img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the card
					</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
		</div>
		
		<div class="col-sm-3">
		<div class="card mb-3">
			<img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the card
					title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
		</div>
		
		<div class="col-sm-3">
		<div class="card mb-3" >
			<img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the card
					title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
		</div>

		<div class="col-sm-3">
		<div class="card mb-3" >
			<img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the card
					title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
		</div>
		
		<div class="col-sm-3">
		<div class="card mb-3" >
			<img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the card
					</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
		</div>
		
		<div class="col-sm-3">
		<div class="card mb-3">
			<img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the card
					title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
		</div>
		
		<div class="col-sm-3">
		<div class="card mb-3" >
			<img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the card
					title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
		</div>

		<div class="col-sm-3">
		<div class="card mb-3" >
			<img src="${root }images/logo_icon.png" class="card-img-top" height="120" alt="">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">Some quick example text to build on the card
					title and make up the bulk of the card's content.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
		</div>
				
	</div>
	
</div>






	<!-- 하단 -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />





</body>
</html>