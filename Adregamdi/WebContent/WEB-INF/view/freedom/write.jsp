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
  <title>글 작 성</title>
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
      <b>게시글 작성</b>
    </h3>
    <hr>
    <div class="row">
      <div class="col-sm-3"></div>
      <div class="col-sm-8">
        <div class="panel">
          <div class="panel-body">
            <form:form action="${root}freedom/writeProc" method="post" modelAttribute="freedomWriteDTO" class="form-horizontal">
              <div class="form-group">
                <form:label path="free_title">글 제 목</form:label>
                <form:input path="free_title" class="form-control" />
                <form:errors path="free_title" style="color:red;" />
              </div>
              <div class="form-group">
                <form:label path="free_content">글 내 용</form:label>
                <form:textarea path="free_content" class="form-control" rows="10" style="resize:none"/>
                <form:errors path="free_content" style="color:red;" />
              </div>
              <div class="form-group">
              	 <div class="text-center">
              	 	<form:button class="btn btn-success">작성완료</form:button>
                 	<a href="${root}freedom/list" class="btn btn-danger">취소</a>
              	 </div>
              </div>
            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>