<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script>
	function delContent(){
		const del_res = confirm("삭제하면 작성한 글은 복구할 수 없습니다 그래도 삭제 하시겠습니까?")
		if(del_res == true){
			location.href="${root}freedom/deleteProc?content_idx=${readContentDTO.free_no}"
		} else {
			return;
		}
  	}
  </script>
</head>
<body>
	<!-- Header Import -->
	<c:import url="/WEB-INF/view/include/header.jsp" />
	
	<div class="container" style="margin-top: 120px;">
    	<h3 class="InputSubject">
      	<b>${readContentDTO.free_title}</b>
    	</h3>
    	<h6>${readContentDTO.content_writer_id}&nbsp;&nbsp;&nbsp;&nbsp;${readContentDTO.content_date}</h6>
    	<hr><br>
    	<form class="form-horizontal" name="freedomWriteDTO" id="freedomWriteDTO" action="${root}freedom/writeProc" method="POST">
    	<div class="form-group" style="margin-bottom: 30px;">
      		<div class="mb-3">
        		${readContentDTO.free_content}
      		</div>
    	</div>
    	<hr><br>
    	<div class="form-group float-right">
    	    <a href="${root}freedom/list" class="btn btn-info" style="padding : 4px; margin-right : 5px;">목록보기</a>
    	    <c:if test="${loginUserDTO.userLogin == true}">
              <c:if test="${ loginUserDTO.user_no == readContentDTO.free_content_writer_idx || loginUserDTO.user_provider == 0}" >
                <a href="${root}freedom/modify?content_idx=${readContentDTO.free_no}" class="btn btn-success"
      			style="padding : 4px; margin-right : 5px;">수정하기</a>
                <button type="button" class="btn btn-danger" 
                style="padding : 4px; margin-right : 5px;" onclick="delContent();">삭제하기</button>
              </c:if>
            </c:if>
    	</div>
    	<%-- <div class="text-right">
		    <c:if test="${loginUserDTO.userLogin == true}">
      			<a href="${root}freedom/write" class="btn btn-info">글 쓰 기</a>
      		</c:if>
    	  </div> --%>
  </form>
    </div>
</body>
</html>