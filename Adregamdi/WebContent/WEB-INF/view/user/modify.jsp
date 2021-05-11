<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>

<c:import url="/WEB-INF/view/include/header.jsp"/>

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<form:form action='${root }user/modify_proc' method='post' modelAttribute="modifyUserDTO">
						<div class="form-group">
							<form:label path="user_name">이름</form:label>
							<form:input path="user_name" class='form-control' readonly="true"/>
						</div>
						<div class="form-group">
							<form:label path="user_id">아이디</form:label>
							<form:input path="user_id" class='form-control' readonly="true"/>
						</div>
						<div class="form-group">
							<form:label path="user_pw">비밀번호</form:label>
							<form:password path="user_pw" class='form-control'/>
							<form:errors path='user_pw' style='color:red'/>
						</div>
						<div class="form-group">
							<form:label path="user_email">이메일</form:label>
							<form:input path="user_email" class='form-control'/>
							<form:errors path='user_email' style='color:red'/>
						</div>
						<div class="form-group">
							<form:label path="user_phone">연락처</form:label>
							<form:input path="user_phone" class='form-control'/>
							<form:errors path='user_phone' style='color:red'/>
						</div>
						<div class="form-group">
							<div class="text-right">
								<form:button class='btn btn-info'>정보수정</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>

<c:import url="/WEB-INF/view/include/footer.jsp"/>

</body>
</html>
    