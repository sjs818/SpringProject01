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
      <b>${noticeDTO.notice_title}</b>
    </h3>
    <h5>${noticeDTO.content_notice_user_no}&nbsp;&nbsp;&nbsp;&nbsp;${noticeDTO.notice_date}</h5>
    <hr>
    <div class="row">
      <div class="col-sm-3"></div>
      <div class="col-sm-8">
        <div class="panel">
          <div class="panel-body">
            <form class="form-horizontal">
              <div class="form-group">
                <label for="content" class="control-label col-sm-2">글 내 용</label>
                <div class="col-sm-8">
                  <textarea id="content" class="form-control" rows=6 style="resize:none;" disabled>${noticeDTO.notice_content}</textarea>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-6">
                <a href="${root}notice/list" class="btn btn-info">목록보기</a>
                 <c:if test="${loginUserDTO.userLogin == true}">
                   <c:if test="${ loginUserDTO.user_no == noticeDTO.notice_user_no }" >
                    <a href="${root}notice/modify?content_idx=${noticeDTO.notice_no}" class="btn btn-success">수정하기</a>
                    <a href="${root}notice/delete" class="btn btn-danger">삭제하기</a>
                   </c:if>
                  </c:if>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>