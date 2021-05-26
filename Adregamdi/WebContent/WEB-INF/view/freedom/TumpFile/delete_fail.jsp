<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<script type="text/javascript">
	alert("삭제 실패 - 비밀번호 불일치!!!!");
	location.href='${root}freedom/delete?content_idx=${content_idx}';
</script>