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
	<!-- flatpickr -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script>
		$(function() {
			$('#newPlan').click(function(){
				$('#newPlanModal').modal("show");
			});
			
			$("#plan_date").flatpickr({
				mode: "range",
			  minDate: "today",
			  inline: true,
			  static : true
			});
			
			$("#submit").click(function(){
				if($("#plan_title").val() == '' || $("#plan_date").val() == '') {
			  	alert("내용을 입력해주세요!");
			    $("#plan_title").focus();
			  } else {
				  var term = 0;
			  	var date = $("#plan_date").val();
			    var startDate = new Date(parseInt(date.substr(0,4)), parseInt(date.substr(5,2))-1, parseInt(date.substr(8,2)));
			    if(date.length > 10) {
			    	var endDate = new Date(parseInt(date.substr(14,4)), parseInt(date.substr(19,2))-1, parseInt(date.substr(22,2)));
			      term = (endDate.getTime() - startDate.getTime()) / (1000*60*60*24)+1;
			    } else {
			    	term = 1;
			    }
			  	document.getElementById("plan_term").value= term;
			  	$("#writeNewPlan").submit();
			  }
			});
		});
	</script>
	<title>Document</title>
</head>
<body>

	<!-- Header -->
  <c:import url="/WEB-INF/view/include/header.jsp"/>
  
  <!-- Main -->
		
		<!-- Content -->
		<div class="container" style="margin-top:200px"> 
			<div class="card shadow">
			  
			  <div class="card-header">
			  	<h1>title</h1>
			  	<p>explanation</p>
			  </div>
			 	
			 	<div class="card-body">
				  <div class="row">
					  
				  </div>
				  
					<div class="d-none d-md-block" style="margin-top:20px;">
				 		<ul class="pagination justify-content-center">
				  		<c:if test="${pageDTO.prevPage!=0 }">
				  			<li class="page-item"><a class="page-link" href="${root }schedule/list?page=${pageDTO.prevPage}">이전</a></li>
				  		</c:if>
				  		<c:forEach var="idx" begin="${pageDTO.min }" end="${pageDTO.max }">
				  			<c:choose>
				  				<c:when test="${pageDTO.currentPage==idx }">	
				  					<li class="page-item active"><a class="page-link" href="${root }schedule/list?page=${idx }">${idx }</a></li>
				  				</c:when>
				  				<c:otherwise>
				  					<li class="page-item"><a class="page-link" href="${root }schedule/list?page=${idx }">${idx }</a></li>
				  				</c:otherwise>
				  			</c:choose>
				  		</c:forEach>
				  		<c:if test="${pageDTO.nextPage!=pageDTO.pageCount && pageDTO.pageCount > 10}">
				  			<li class="page-item"><a class="page-link" href="${root }schedule/list?page=${pageDTO.nextPage}">다음</a></li>
				  		</c:if>
				  	</ul>
					</div>
				  
				  <div class="text-right" style="margin-top:20px;">
				  	<button class="btn btn-primary" id="newPlan">여행 일정 만들기</button>
				  </div>
			  </div>
			  
		  </div>
	  </div>
  	
  	<!-- Modal -->
	  <div class="modal" id="newPlanModal">
	  	<div class="modal-dialog" style="width:342px;">
	  		<div class="modal-content">
	  			<div class="modal-header">
	  				<h4>새로운 일정 만들기</h4>
	  				<button type="button" class="close" data-dismiss="modal" aria-label="close">×</button>
	  			</div>
	  			<form id="writeNewPlan" action="${root }schedule/write" method="post">
	  				<div class="modal-body">
	  					<input type="hidden" id="plan_term" name="plan_term">
	  					<input type="hidden" name="plan_info" value="temporary">
	  					<input type="hidden" name="plan_img" value="/images/thumbnail.png">
	  					<div class="form-group">
	  						<label for="plan_title">일정 제목</label>
	  						<input type="text" class="form-control" id="plan_title" name="plan_title" style="width:100%">
	  					</div>
	  					<div class="form-group">
	  						<label for="plan-date">여행 기간</label>
	  						<input type="text" class="form-control" id="plan_date" name="plan_date" style="width:100%" readonly>
	  					</div>
	  				</div>
	  			</form>
	  			<div class="modal-footer">
	  				 <button class="btn btn-primary" type="button" id="submit">만들기</button>
	           <button class="btn btn-danger" type="button" data-dismiss="modal">취소</button>
	  			</div>
	  		</div>
	  	</div>
	  </div>
	  
  <!-- Footer -->
  <c:import url="/WEB-INF/view/include/footer.jsp" />
  
</body>
</html>