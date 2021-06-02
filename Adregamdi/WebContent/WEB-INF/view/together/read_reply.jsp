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
  <title>어드레 감디 | 같이가치</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script type="text/javaScript" src="${root}js/together.js"></script>
  <script type="text/javaScript">
  function delContent(){
	let result = confirm("작성하신 공고을 삭제하시겠습니까?") 
	if(result == true){
		location.href="${root}together/deleteProc?content_idx=${readContentDTO.to_no}";		
	}
  }
  </script>
  <style>
		@font-face {
	    font-family: 'Bazzi';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/Bazzi.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		
  	body {
      font-family: 'Bazzi';
    }
    
    #btnReplySave {
  		height: 78px;
  		width: 100%;
  	}
  	
  	#reply_content {
  		width: 100%;
  	}
    
    ::-webkit-scrollbar {
		  width: 5px;
		  height: 7px;
		}
		
		::-webkit-scrollbar-button {
		  width: 0px;
		  height: 0px;
		}
		
		::-webkit-scrollbar-thumb {
		  background: #525965;
		  border: none;
		}
  </style>  
</head>
<body>
	<!-- Header Import -->
	<c:import url="/WEB-INF/view/include/header.jsp" />
	
	<input type="hidden" id="content_idx" value="${content_idx }" >
	<div class="container" style="margin-top: 150px; margin-bottom: 150px;">
	<div class="card shadow">
		<div class="card-header" style="padding:30px;">
			<h3 class="InputSubject">
      		<b>${readContentDTO.to_title}</b>
    		</h3>
    		<h5 class="InputSubject">
    		<b>${readContentDTO.to_place_name}</b>
    		</h5>
    		<h6>${readContentDTO.to_writer}&nbsp;&nbsp;&nbsp;&nbsp;${readContentDTO.to_date}</h6>
		</div>
		<div class="card-body" style="margin-top:10px; padding:40px;">
			<form class="form-horizontal" name="togetherWriteDTO" id="togetherWriteDTO" action="${root}together/writeProc" method="POST">
    			<input type="hidden" id="loginState" name="loginState" value="${loginUserDTO.userLogin}" />
        		<input type="hidden" id="provider" name="provider" value="${loginUserDTO.user_provider}" />	
    		<div class="form-group" style="margin-bottom: 30px;">
      			<div class="mb-3">
        			${readContentDTO.to_content}
      			</div>
    		</div>
    		<hr><br>
    	<div class="form-group float-right">
    	    <a href="${root}together/list" class="btn btn-info" style="margin-right : 5px;">목록보기</a>
    	    <c:if test="${loginUserDTO.userLogin == true}">
              <c:if test="${ loginUserDTO.user_id == readContentDTO.to_writer || loginUserDTO.user_provider == 0}" >
                <a href="${root}together/modify?content_idx=${readContentDTO.to_no}" class="btn btn-success"
      			style="margin-right : 5px;">수정하기</a>
                <button type="button" class="btn btn-danger" style="margin-right : 5px;" onclick="delContent();">삭제하기</button>
              </c:if>
            </c:if>
    	</div>
    	</form>
		</div> 
	</div>
    <div class="card shadow" style="margin-top: 50px">
      <div class="card-body" style="padding: 40px;">
	      <h6><b>댓글 등록</b></h6>
	      <hr>
	      <div class="form-group" style="padding-top : 20px;">
	        <form:form method="post" modelAttribute="replyWriteDTO" class="form-horizontal">
	        	<form:hidden path="reply_writer" id="reply_writer" value="${loginUserDTO.user_id}" />
	        	<form:hidden path="together_num" id="together_num" value="${readContentDTO.to_no}" />
		        <div class="row" style="padding-bottom: 24px;">	
		        	<div class="col-sm-11">
		        		<form:textarea path="reply_content" id="reply_content" rows="3"></form:textarea>
		        	</div>
		        	<div class="col-sm-1" style="padding: 0px;" >
		        		<form:button type="button" path="btnReplySave" id="btnReplySave" class="btn btn-primary" onclick="">댓글 등록</form:button>
		        	</div>
		        </div>
	        </form:form>
	        <!-- Reply List {s}-->
				  <h6 class="border-bottom" style="padding-bottom: 16px; margin: 0px;"><b>댓글 목록 (<span id="replyCount"></span>)</b></h6>
		 	  	<div id="replyList"></div>
		 	  	<span id="noneReply"></span>
		    	</div>
		    </div>
      </div>
   </div>
    <!-- Footer -->
	 <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>