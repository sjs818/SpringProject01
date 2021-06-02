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
  <!-- Font Awesome CDN -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

	<!-- Bootstrap CDN -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
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
  		width: 100%;
  	}
  	
  	#reply_content {
  		width: 100%;
  	}
		.card-header {
			position: relative;
		}
		.card-header span {
			position: absolute;
			top: 11px;
			right: 20px;
			color: #8c8c8c;
		}
  	.card-body .card-text {
			white-space: normal;
			display: -webkit-box;
			-webkit-line-clamp: 2;
			-webkit-box-orient: vertical;
			overflow: hidden;
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
	
	<div class="container" style="margin-top: 150px; margin-bottom: 150px;">
	  <h3 class="BoardTitle">
	     <b>${togetherDTO.to_title }</b>
	  </h3>
    <hr>
    <br>
    <div class="row no-gutters">
    	<div class="col-md-7">
       	<div class="card mr-3">
	        <div class="card-header">
	          <h6 class="card-title" style="padding: 0; margin: 0;">${place.title }</h6>
	          <span><a href="" class="">+ 더 보기</a></span>
	        </div>
	        <div class="row no-gutters">
	          <div class="col-md-4">
	          	<img alt="" src="${place.firstImage2 }" style="width: 100%;">
	          </div>
	          <div class="col-md-8">
	            <div class="card-body">
	              <p class="card-text">${place.addr1 }</p>
	              <p class="card-text">${place.overview }</p>
	            </div>
	          </div>
	        </div>
	      </div>
	    <div class="card mt-3 mr-3" style="padding: 20px;">
	      <div id="planner-info">
	        <div class="form-group">
	          <label for="plan_info">일정</label>
	          <input type="text" id="plan_title" class="form-control" name="plan_title" value="2021-05-31" style="width: 100%; max-height: 70px;">
	        </div>
	        <div class="form-group">
	          <label for="plan_info">일정 소개</label>
	          <textarea id="plan_info" class="form-control" name="plan_info" rows="5" style="width: 100%; max-height: 70px;">5월 31일에 만장굴 같이 가실 분 구합니다.</textarea>
	        </div>
	      </div>
	    </div>
	    <div class="card mt-3 mr-3">
	      <div class="card-body" style="padding: 20px;">
	      	<form action="/together/subcription">
	      		<label for="sub_message">동행 신청</label>
		        <div class="input-group">
              <input type="text" class="form-control" id="sub_message" name="sub_message" >
              <div class="input-group-append">
	            	<button type="button" id="btnReplySave" class="btn btn-primary" onclick="">신청</button>
            	</div>
            </div>
		       </form> 
		     </div>
		   </div>
	        
	  	</div>
           <div class="col-md-5 ">
           <div class="card">
              <div class="card-header">채팅</div>
              <div class="card-body">
                 <div class="card-text">
                    <p>채팅내용</p>
                 </div>
              </div>
           </div>
           </div>
        </div>
     </div>
    <!-- Footer -->
	 <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>