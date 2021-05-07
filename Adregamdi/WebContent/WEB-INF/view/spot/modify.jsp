<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용 수정</title>

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
					
						<form:form action="${root }spot/write_proc" method="post" modelAttribute="modifySpotDTO" enctype="multipart/form-data">
							<div class="form-group">
								<form:label path="spot_name">여행지명</form:label>
								<form:input path="spot_name" class="form-control"/>
							</div>
							<div  class="form-group">
								<form:label path="local_no" >지역</form:label>
								<form:select path="local_no">
									<form:option value="0">--지역--</form:option>
									<form:option value="1">제주시</form:option>
									<form:option value="2">서귀포시</form:option>
								</form:select>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<form:label path="thema_no" >테마</form:label>
								<form:select path="thema_no">
									<form:option value="0">--테마--</form:option>
									<form:option value="1">볼거리</form:option>
									<form:option value="2">먹거리</form:option>
									<form:option value="3">놀거리</form:option>
								</form:select>
							</div>
							
							<div class="form-group">
								<form:label path="spot_addr">주소</form:label>
								<form:input path="spot_addr" class="form-control"/>
							</div>
							
							<div class="form-group">
								<form:label path="spot_content">관광지 설명</form:label>
								<form:textarea path="spot_content" rows="10"  class="form-control" placeholder="입력하세요." style="resize:none"></form:textarea>
							</div>
							
							<div class="form-group">
								<form:label path="upload_file">첨부 이미지</form:label>
								<form:input type="file" path="upload_file" class="form-control" accept="images/*"/>
							</div>
							<div class="form-group">
								<div class="text-right">
									<form:button type="submit" class="btn btn-dark" >작성완료</form:button>
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
	<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>