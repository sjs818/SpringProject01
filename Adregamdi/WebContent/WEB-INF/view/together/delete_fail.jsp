<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath }/" />   
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인 실패</title>
</head>
<body>
  <script type="text/javascript">
	alert("삭제 실패! 비밀번호를 확인하세요.");
	location.href='${root}together/delete?content_idx=${content_idx}';
  </script>
  
</body>
</html>