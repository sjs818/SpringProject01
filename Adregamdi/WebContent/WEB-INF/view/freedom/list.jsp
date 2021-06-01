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
<title>어드레 감디 | 자유게시판</title>

<!-- BootStarp CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" 
crossorigin="anonymous">

<link rel="stylesheet" href="${root}css/freedomBoard.css">
<script type="text/javaScript">
	function WriteDoc(){
		location.href='${root}freedom/write';
	}
	
	function SearchBoard(){
		let searchType=$('#searchType').val();
		let keyword = $('#keywords').val();
		
		
	}
</script>
</head>
<body>
	<!-- Header Import -->
	<c:import url="/WEB-INF/view/include/header.jsp" />

	<!-- 자유 게시판 리스트 -->
	<div class="container" style="margin-top: 150px; margin-bottom: 150px;">
		<h3 class="BoardTitle">
			<b>자유게시판</b>
		</h3><hr>
		<nav class="navbar navbar-light bg-light" style="margin-top:-5px;">
		  <a class="navbar-brand"></a>
		  <form class="form-inline">
		    <select id="searchType" class="form-control" style="margin-right:8px;">
		    	<option id="object" value="object">제목</option>
		    	<option id="objcon" value="objcon">제목 + 내용</option>
		    	<option id="writerID" value="writerID">아이디</option>
		    </select>
		    <input class="form-control mr-sm-2" id="keywords" type="search" placeholder="Search" aria-label="Search">
		    <button type="button" class="btn btn-secondary" onclick="SearchBoard();">
		    	<i class="fas fa-search"></i>
		    </button>
		  </form>
		</nav>
		<table class="table table-hover">
			<thead>
				<tr>
			      <th class="text-center" style="width:8%">글번호</th>
        		  <th class="text-center" style="width:55%">글제목</th>
                  <th class="text-center" style="width:10%">작성자</th>
                  <th class="text-center" style="width:8%">조회수</th>
                  <th class="text-center" style="width:15%">작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="FreedomBoardDTO" items="${contentList}">
					<tr>
						<td class="text-center">${FreedomBoardDTO.free_no }</td>
						<td class="text-center"><a href="${root}freedom/read?content_idx=${FreedomBoardDTO.free_no}">${FreedomBoardDTO.free_title} (${FreedomBoardDTO.reply_count})</a></td>
						<td class="text-center">${FreedomBoardDTO.content_writer_id }</td>
						<td class="text-center">${FreedomBoardDTO.free_cnt }</td>
						<td class="text-center">${FreedomBoardDTO.content_date }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pageNevigation" style="margin-top: 50px;">
			<ul class="pagination justify-content-center">
				<!-- 맨 처음 페이지인 경우에는 이전 페이지가 비활성화 하게 함 -->
				<c:choose>
					<c:when test="${pageDTO.prevPage <= 0 }">
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a href="${root}freedom/list?page=${pageDTO.prevPage}" class="page-link">이전</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="idx" begin="${pageDTO.min}" end="${pageDTO.max}">
					<c:choose>
						<c:when test="${idx == pageDTO.currentPage}">
						<li class="page-item active">
							<a href="${root }freedom/list?page=${idx}" class="page-link">${idx}</a>
						</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }freedom/list?page=${idx}" class="page-link">${idx}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 맨 마지막일 경우 다음페이지를 비활성화 시킴 -->
				<c:choose>
					<c:when test="${pageDTO.max >= pageDTO.pageCount }">
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a href="${root}freedom/list?page=${pageDTO.nextPage}" class="page-link">다음</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		  <div class="text-right">
		    <c:if test="${loginUserDTO.userLogin == true}">
      			<button type="button" class="btn btn-info" onclick="WriteDoc();">글 쓰 기</button>
      		</c:if>
    	  </div>
	 </div>
	 <!-- Footer -->
	 <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>