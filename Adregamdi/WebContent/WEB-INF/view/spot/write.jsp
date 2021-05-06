<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 등록</title>

<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/view/include/header.jsp" />
	
	<!-- 관광지 등록 하는 부분(게시판) -->
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form:form action="${root }spot/write_proc" method="post" modelAttribute="writeSpotDTO" enctype="multipart/form-data">
							<div class="form-group">
								<form:label path="spot_name">관광지명</form:label>
								<form:input path="spot_name" class="form-control"/>
								<%-- <form:errors path="content_subject" style="color:red;"/> --%>
							</div>
							<div class="form-group">
								<form:select path="local_no">
									<form:option value="1" label="제주시"/>
									<form:option value="2" label="서귀포시"></form:option>
								</form:select>
							</div>
							<div>
								<form:select path="thema_no">
									<form:option value="1" label="볼거리"/>
									<form:option value="2" label="먹거리"/>
									<form:option value="3" label="놀거리"/>
								</form:select>
							</div>
							<div class="form-group">
								<form:label path="spot_addr">주소</form:label>
								<form:input path="spot_addr" class="form-control"/>
								<%-- <form:errors path="content_subject" style="color:red;"/> --%>
							</div>
							<div class="form-group">
								<form:label path="spot_content">내용</form:label>
								<form:textarea path="spot_content" class="form-control" rows="10" style="resize:none"></form:textarea>
								<%-- <form:errors path="content_text" style="color:red;" /> --%>
							</div>
							<div class="form-group">
								<form:label path="upload_file">첨부 이미지</form:label>
								<form:input type="file" path="upload_file" class="form-control" accept="image/*"/>
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
	
	<!-- 하단 부분 -->
	<c:import url="WEB-INF/view/include/footer.jsp" />
</body>
</html>