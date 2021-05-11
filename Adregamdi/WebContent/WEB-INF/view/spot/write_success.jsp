<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }/"/>

<script>
	alert("글쓰기 완료!")
	location.href="${root}spot/read?spot_idx=${writeSpotDTO.spot_idx}"
</script>
    