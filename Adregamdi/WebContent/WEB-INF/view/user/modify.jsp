<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Adregamdi 정보수정</title>
<!-- Font Awesome CDN -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
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



	<div class="container" style="margin-top: 140px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<header class="card-header">
						<a href="${root }user/delete" class="float-right btn btn-outline-danger mt-2 btn-sm">회원탈퇴</a>
						<h4 class="card-title mt-2">정보수정</h4>
					</header>
					<div class="card-body" style="background-color: #F7F7F7;">
						<div class="text-center">
							<a href="${root}"><img class="mb-4" src="${root }images/logo.png" height="75"></a>
						</div>
						<form:form action='${root }user/modify_proc' method='post'
							modelAttribute="modifyUserDTO">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-id-card"></i></span>
									</div>
									<form:input path="user_name" class='form-control' readonly="true" />
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<form:input path="user_id" class='form-control' readonly="true" />
								</div>
							</div>
							<c:if test="${loginUserDTO.user_provider ne 2 }">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-key"></i></span>
										</div>
										<form:password path="user_pw" class='form-control' />
									</div>
									<form:errors path='user_pw' style='color:red' />
								</div>
							</c:if>

							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-at"></i></span>
									</div>
									<form:input path="user_email" class='form-control' />
								</div>
								<form:errors path='user_email' style='color:red' />
							</div>

							<div class="form-group">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="fas fa-mobile-alt"></i></span>
									</div>
									<form:input path="user_phone" class='form-control' />
								</div>
								<form:errors path='user_phone' style='color:red' />
							</div>

							<c:choose>
								<c:when test="${loginUserDTO.user_provider ne 2  }">
									<div class="form-group">
										<div class="text-right">
											<form:button class='btn btn-info'>정보수정</form:button>
										</div>
									</div>
								</c:when>
								<c:when test="${loginUserDTO.user_provider eq 2  }">
									<br>
									<small class="form-text text-muted text-right">
										* 네이버 회원은 고객센터를 통해 정보수정이 가능합니다. </small>
								</c:when>
							</c:choose>

						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>


</body>
</html>
