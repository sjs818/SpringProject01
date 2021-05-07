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
	          <div class="form-group">
	            <label for="to_writer">작성자</label>
	            <input type="text" id="to_writer" name="to_writer" class="form-control" value="${readTogetherDTO.to_writer}" disabled="disabled" /></div>
	          <div class="form-group">
	            <label for="to_writer">작성날짜</label>
	            <input type="text" id="to_date" name="to_date" class="form-control" value="${readTogetherDTO.to_date}" disabled="disabled" /></div>
	          <div class="form-group">
	            <label for="to_writer">글 제목</label>
	            <input type="text" id="to_title" name="to_title" class="form-control" value="${readTogetherDTO.to_title}" disabled="disabled" /></div>
	          <div class="form-group">
	            <label for="to_writer">글 내용</label>
	            <input type="text" id="to_content" name="to_content" class="form-control" value="${readTogetherDTO.to_content}" disabled="disabled" /></div>
	          <!-- 업로드한 파일이 있는 경우에만 실행하도록 함 -->
	          <c:if test="${readToghetherDTO.content_file != null }">
	            <div class="form-group">
	              <label for="board_file">첨부 이미지</label>
	              <img src="${root }upload/${readContentDTO.content_file}" width="100%" />
	            </div>
	          </c:if>
	          <div class="form-group">
	            <div class="text-right">
	              <a class="btn btn-primary" href="${root }together/list?page=${page }">목록 보기</a>
		  		  <a class="btn btn-info" href="${root }together/modify?page=${page }&together_no=${togetherDTO.to_no }">수정</a>
		  		  <a class="btn btn-danger" href="${root }together/delete?page=${page }&toghether_no=${togetherDTO.to_no }">삭제</a>
		  	    </div>
		  	  </div>    
	        </div>     
	      </div>
	    </div>
	    <div class="col-sm-3"></div>        
	  </div>          
	</div>
	
	<!--  하단 정보 -->
	<c:import url="/WEB-INF/view/include/footer.jsp" />  
	           
</body>
</html>