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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
  <div class="container" style="margin-top: 80px;">
    <h3 class="InputSubject">
      <b>게시글 작성</b>
    </h3>
    <hr>
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
        <div class="panel">
          <div class="panel-body">
            <form:form action="${root}freedom/modifyProc" method="post" modelAttribute="FreedomWriteDTO" class="form-horizontal">
              <div class="form-group">
                <label for="identification" class="control-label col-sm-2">글 제 목</label>
                <div class="col-sm-8">
                  <input type="text" id="identification" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label for="content" class="control-label col-sm-2">글입력</label>
                <div class="col-sm-8">
                  <textarea id="content" class="form-control" rows=6 style="resize:none;"></textarea>
                </div>
              </div>
              <div class="form-group">
                <label for="pw" class="control-label col-sm-2">첨부파일</label>
                <div class="col-sm-8">
                  <input type="password" id="pw" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-10 text-right">
                  <button type="button" class="btn btn-success">수정완료</button>
                  <a href="${root}freedom/read" class="btn btn-danger">취소</a>
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