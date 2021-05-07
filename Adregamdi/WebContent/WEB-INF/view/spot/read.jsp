<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 관광지</title>

<!-- Bootstrap CDN -->
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>

<body>
	<!-- 상단 메뉴바  -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- 글 읽기 -->
	<div class="container" style="margin-top: 100px">
		<div class="row"> 
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="spot_writer">작성자</label> 
							<input type="text" id="spot_writer" name="spot_writer" class="form-control" value=${readSpotDTO.spot_writer } disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="spot_name">여행지명</label> 
							<input type="text" id="spot_name" name="spot_name" class="form-control" value=${readSpotDTO.spot_name } disabled="disabled" />
						</div>

						<div class="form-group">
							<label for="spot_addr">주소</label> 
							<input type="text" id="spot_addr" name="spot_addr" class="form-control" value=${readSpotDTO.spot_addr } disabled="disabled" />
						</div>

						<c:if test="${readSpotDTO.content_file != null }">
							<div class="form-group">
								<label for="board_file">첨부 이미지</label> 
								<img src="${root }upload/${readSpotDTO.content_file}" width="100%" />
							</div>
						</c:if>
						
						<div class="form-group">
							<label for="spot_content">내용</label>
							<textarea id="spot_content" name="spot_content" class="form-control" rows="3" style="resize:none" disabled="disabled">${readSpotDTO.spot_content }</textarea>
						</div>

					</div>
				</div>
				
			</div>
	

		</div>
		
		<br><br>
		
		<form class="form-group">
				<div class="text-center">
					<!-- spotDTO의 check값 확인해서 1이면 local_detail페이지로 2면 thema_detail로 -->
					<%-- <c:if test="${check == 1 }" > 
						<a href="${root}spot/local_detail?check=${check}&local_no=1" class="btn btn-secondary">뒤로가기</a>
					</c:if>
					<c:if test="${check == 2 }" >
						<a href="${root}spot/local_detail?check=${check}&local_no=1" class="btn btn-secondary">뒤로가기</a>
					</c:if>	 --%>
					<a href="${root}spot/local_detail?check=${check}&local_no=1" class="btn btn-secondary">뒤로가기</a>
					<a href="${root }spot/modify?spot_idx=${spot_idx}" class="btn btn-info">수정하기</a>
					<a href="${root }spot/delete?spot_idx=${spot_idx}" class="btn btn-danger">삭제하기</a>
				</div>
			</form>
	</div>

	<br><br>

	<!-- 하단 -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>