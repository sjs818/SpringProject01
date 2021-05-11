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
</head>

<body>
<!-- Header Import -->
<c:import url="/WEB-INF/view/include/header.jsp" />
  <div class="container" style="margin-top: 80px;">
    <h3 class="InputSubject">
      <b>${freedomDeleteDTO.free_title}</b>
    </h3>
    <h5>${freedomDeleteDTO.content_writer_id}&nbsp;&nbsp;&nbsp;&nbsp;${freedomDeleteDTO.content_date}</h5>
    <hr>
    <div class="row">
      <div class="col-sm-8">
        <div class="panel">
          <div class="panel-body">
            <form:form action="${root}freedom/deleteProc?content_idx=${freedomDeleteDTO.free_no}" 
            method="post" modelAttribute="inputPwUserDTO">
            	<div class="form-group row">
            		<form:label path="user_pw" class="text-sm-right"><b>비밀번호</b></form:label>
            		  <div class="col-sm-3">
            		    <form:password path="user_pw" class="form-control" />
            		  </div>
            		  <button class="btn btn-danger">삭제하기</button>
            	</div>
            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>