<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 절대 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="check" value="${readSpotDTO.check }" />

<script>
   alert('삭제되었습니다');
   
   /* if(check==1) {
   	location.href='${root}spot/local_detail';
   } else {
	   location.href='${root}spot/thema_detail';
   } */
   location.href='${root}spot/local?local_no=1';
</script>