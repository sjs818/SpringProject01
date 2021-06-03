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
  <script>
  function detail() {
		
		var contentId = $("#contentId").val();
		var contentTypeId = $("#contentTypeId").val();
		var param = {"contentId" : contentId, "contentTypeId" : contentTypeId};
		
		$.ajax({
			url : "/spot/details",
			type : "get",
			dataType : "json",
			data : param,
			success :function(data) {
				addModal(data, contentTypeId, contentId);
			}
		});
		
		$('#portfolioModal').modal("show");
	}
  
  function addModal(data, contentTypeId, contentId) {
		
		for(var i = 0; i < data.length; i++) {
			if(data[i] == null){
				data[i] = "";
			}
		}		
		
		$("#modalPhoto").attr("src",data[0]);
		$("#modalTitle").text(data[1]);
		$("#modalOverview").html(data[2]);
		$("#modalAddr").html(data[3]);
		$(".details").empty();
		
		switch(contentTypeId) {
		case "12" :
			$(".details").append("<li>문의 및 안내 : "+data[6]+"</li>");
			$(".details").append("<li>쉬는날 : "+data[7]+"</li>");
			$(".details").append("<li>이용시간 : "+data[8]+"</li>");
			break;
		case "14" :
			$(".details").append("<li>문의 및 안내 : "+data[6]+"</li>");
			$(".details").append("<li>이용요금 : "+data[7]+"</li>");
			$(".details").append("<li>이용시간 : "+data[8]+"</li>");
			break;
		case "15" :
			$(".details").append("<li>행사 홈페이지 : "+data[6]+"</li>");
			$(".details").append("<li>연락처 : "+data[7]+"</li>");
			$(".details").append("<li>공연시간 : "+data[8]+"</li>");
			$(".details").append("<li>이용요금 : "+data[9]+"</li>");
			break;
		case "25" :
			$(".details").append("<li>문의 및 안내 : "+data[6]+"</li>");
			$(".details").append("<li>코스 예상 소요시간 : "+data[7]+"</li>");
			$(".details").append("<li>코스 테마 : "+data[8]+"</li>");
			break;
		case "28" :
			$(".details").append("<li>문의 및 안내 : "+data[6]+"</li>");
			$(".details").append("<li>쉬는날 : "+data[7]+"</li>");
			$(".details").append("<li>이용요금 : "+data[8]+"</li>");
			$(".details").append("<li>이용시간 : "+data[9]+"</li>");
			break;
		case "32" :
			$(".details").append("<li>문의 및 안내 : "+data[8]+"</li>");
			$(".details").append("<li>체크인 : "+data[6]+"</li>");
			$(".details").append("<li>체크아웃 : "+data[7]+"</li>");
			$(".details").append("<li>홈페이지 : "+data[9]+"</li>");
			$(".details").append("<li>예약안내 : "+data[10]+"</li>");
			break;
		case "38" :
			$(".details").append("<li>문의 및 안내 : "+data[6]+"</li>");
			$(".details").append("<li>영업시간 : "+data[7]+"</li>");
			$(".details").append("<li>쉬는날 : "+data[8]+"</li>");
			break;
		case "39" :
			$(".details").append("<li>문의 및 안내 : "+data[7]+"</li>");
			$(".details").append("<li>대표 메뉴 : "+data[6]+"</li>");
			$(".details").append("<li>영업시간 : "+data[8]+"</li>");
			$(".details").append("<li>쉬는날 : "+data[9]+"</li>");
			break;
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
	
	<!-- Main -->
	<div class="container" style="margin-top: 150px; margin-bottom: 150px;">
	  <h3 class="BoardTitle">
	     <b>${togetherDTO.to_title }</b>
	  </h3>
	  <h6 style="margin-top: 15px">${togetherDTO.to_writer }&nbsp;&nbsp;&nbsp;&nbsp;${togetherDTO.to_date}</h6>
    <hr>
    <br>
    <div class="row no-gutters">
    	<div class="col-md-7">
       	<div class="card mr-3">
	        <div class="card-header">
	          <h6 class="card-title" style="padding: 0; margin: 0;">${place.title }</h6>
	          <span><a href="#" onclick="detail();" style="color: #8c8c8c;">+ 더 보기</a></span>
	        </div>
	        <div class="row no-gutters">
	          <div class="col-md-4">
	          	<img alt="" src="${place.firstImage2 }" style="width: 100%;">
	          </div>
	          <div class="col-md-8">
	            <div class="card-body">
	              <p class="card-text">${place.addr1 }</p>
	              <p class="card-text">${place.overview }</p>
	              <input type="hidden" id="contentId" value="${place.contentId }">
	              <input type="hidden" id="contentTypeId" value="${place.contentTypeId }">
	            </div>
	          </div>
	        </div>
	      </div>
		    <div class="card mt-3 mr-3" style="padding: 20px;">
		      <div id="planner-info">
		        <div class="form-group">
		          <label for="plan_info">동행할 일정</label>
		          <input type="text" id="plan_title" class="form-control" name="plan_title" value="${togetherDTO.to_meet }" style="width: 100%; max-height: 70px;" disabled>
		        </div>
		        <div class="form-group">
		          <label for="plan_info">동행 내용</label>
		          <textarea id="plan_info" class="form-control" name="plan_info" rows="5" style="width: 100%; max-height: 70px;" disabled>${togetherDTO.to_content }</textarea>
		        </div>
		      </div>
		    </div>
		    <c:choose>
		    	<c:when test="${togetherDTO.to_writer_no != loginUserDTO.user_no && loginUserDTO.user_no != 0 }">
				    <div class="card mt-3 mr-3">
				      <div class="card-body" style="padding: 20px;">
				      	<form action="/together/subcription">
				      		<input type="hidden" name="to_writer_no" id="to_writer_no" value="${togetherDTO.to_writer_no }">
				      		<input type="hidden" name="sub_writer" id="sub_writer" value="${loginUserDTO.user_no }">
				      		<label for="sub_message">동행 신청</label>
					        <div class="input-group">
			              <input type="text" class="form-control" id="sub_message" name="sub_message" placeholder="자신을 간단하게 소개해주세요...">
			              <div class="input-group-append">
				            	<button type="button" id="btnReplySave" class="btn btn-primary" onclick="">신청</button>
			            	</div>
			            </div>
					      </form> 
				      </div>
				   	</div>
			   	</c:when>
			   	<c:when test="${loginUserDTO.user_no == 0 }">
			   		<div class="card mt-3 mr-3">
				      <div class="card-body" style="padding: 20px;">
				      	<form action="${root }together/subcription" method="post">
				      		<input type="hidden" name="to_writer_no" id="to_writer_no" value="${togetherDTO.to_writer_no }">
				      		<input type="hidden" name="sub_writer" id="sub_writer" value="${loginUserDTO.user_no }">
				      		<label for="sub_message">동행 신청</label>
					        <div class="input-group">
			              <input type="text" class="form-control" id="sub_message" name="sub_message" value="동행 신청은 로그인 후에 가능합니다..." disabled>
			              <div class="input-group-append">
				            	<button type="button" id="btnReplySave" class="btn btn-primary" onclick="" disabled>신청</button>
			            	</div>
			            </div>
					      </form> 
				      </div>
				   	</div>
			   	</c:when>
			   	<c:otherwise>
			   		<div class="card mt-3 mr-3">
				      <div class="card-body" style="padding: 20px;">
				      	<label>동행 참가자 목록</label>
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">아이디</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>sjshi</td>
											<td>
											</td>
										</tr>
									</tbody>
								</table>
				      </div>
				   	</div>
			   	</c:otherwise>
		   	</c:choose>
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
     
  <!-- Modal -->
  <div class="portfolio-modal modal fade center" id="portfolioModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
	 				<h4 id="modalTitle" style="margin: 0;"></h4>
	 				<button type="button" class="close" data-dismiss="modal" aria-label="close">×</button>
	 			</div>
				<div class="container">
					<div class="modal-body">
						<img id="modalPhoto" class="img-fluid d-block mx-auto" src="" alt="..." />
						<h5 id="modalAddr" class="item-intro" style="margin: 20px 0;"></h5>
						<ul class="details" style="border: 3px solid #f5f5f5; border-radius: 10px; padding: 15px; margin: 0; list-style: none;">
						</ul>
						<div id="modalOverview" style="margin: 20px 0;">
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