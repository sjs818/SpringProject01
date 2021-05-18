<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<!-- FontAwesome -->
	<link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet">
	<!-- T Map API -->
	<script	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxdc109d32e488487dbf0e29b9dfcf1a59"></script>
  <!-- DevExtreme -->
  <script type="text/javascript" src="https://cdn3.devexpress.com/jslib/20.2.7/js/dx.all.js"></script>
  <title>Document</title>
  <script type="text/javascript">
  	$(function() {
			var map = initTmap();
			var allInfo = [];
			var planTitle = $('#plan_title').text();
			var planNo = $('#planNo').val();
			var start = 9;
			var end = 10;
			var schedule = [];
			
			$('#plan-info').find('ul').find('input').each(function(){
				allInfo.push(JSON.parse($(this).val()));
			})
			
			var firstDate = allInfo[0].planDate.split('-');
			for(var i = 0; i < allInfo.length; i++) {
				var data = {};
				var date;
				data.text = allInfo[i].title;
				data.is_insertAfter = allInfo[i].is_insertAfter;
				if(allInfo[i].startDate =="" || allInfo[i].endDate=="") {
					date = allInfo[i].planDate.split('-');
					if(firstDate[0] != date[0] || firstDate[1] != date[1] || firstDate[2] != date[2]) {
						date = firstDate;
						start = 9;
						end = 10;
					}
					data.startDate =  new Date(date[0], (date[1]-1), date[2], start, 00);
					data.endDate = new Date(date[0], (date[1]-1), date[2], end, 00);
					start += 2;
					end += 2;
					schedule.push(data);
				} else {
					date = allInfo[i].startDate.split('-');
					data.startDate = new Date(date[0], (date[1]-1), date[2], date[3], date[4]);
					date = allInfo[i].endDate.split('-');
					data.endDate = new Date(date[0], (date[1]-1), date[2], date[3], date[4]);
					data.description = allInfo[i].descript;
					schedule.push(data);
				}
			}
			
			$('.dx-tab').on("click", function() {
				var type = $(this).find('span.dx-tab-text').text();
				if(type == 'agenda') {
					$('.dx-scheduler-navigator').css('visibility : visible;');
				} else {
					$('.dx-scheduler-navigator').css('visibility : hidden;');
				}
			});
			
			$('#btn-modify').click(function() {
				$('#modifyForm').submit();
			});
			
			$("#btn-plan").on("click",function(){
	      $("#btn-plan").attr("disabled",true);
	      $("#btn-planner").attr("disabled",false);
	      $('#planner-info').hide();
	      $('#plan-info').show();
			});

		  $("#btn-planner").on("click" , function(){
		    $("#btn-planner").attr("disabled",true);
		    $("#btn-plan").attr("disabled",false);
		    $('#planner-info').show();
		    $('#plan-info').hide();
		  });
		  
		  $("input[name='upload_img']").change(function() {
			  var form = new FormData(document.getElementById('upload-form'));
			  $.ajax({
	        url : "/schedule/upload",
	        type: "POST",
	        enctype: 'multipart/form-data',
	        processData: false,
	        contentType: false,
	        dataType : 'json',
	        data: form,
	        success : function(data) {
	           $("#img-planner").attr("src", data.plan_img);
	        }
			  });
		  });
		  
		  $("#modify-planner").on("")
		});
  	
  	function initTmap(){
  	  var map = new Tmapv2.Map("tmap_api", {
  	     center: new Tmapv2.LatLng(33.38260485180545, 126.57321166992229),
  	     width: "100%", 
  	     height: "400px",
  	     zoom: 10
  	  });
  	  return map;
  	} 
  </script>
  <style>
  	
  	.bottom-calendar { padding-top : 10%;}

		.right-planlist {overflow-y : hidden; overflow:auto; height:400px}
		
		ul { list-style:none; padding:0;}
		
		.right-planlist li { background : #e9ecef; border : none;}
  	
  </style>
</head>
<body>
	<input type="hidden" id="planNo" value="${plan_no }">
	<div class="container" style="margin-top:150px">
		<div class="row">
			<div class="col-md-8">
				<div id="tmap_api" style="width: 90%"></div>
			</div>
			<div class="col-md-4">
				<div class="row">
					<h3 id="plan_title">${planDTO.plan_title }</h3>
					<button type="button" id="btn-plan" style="border: 0; outline: 0; margin-left: 50%;">정보</button>
					<button type="button" id="btn-planner" style="border: 0; outline: 0">플래너</button>
				</div>
				<hr>
				<div id="plan-info">
					<c:forEach begin="1" end="${planTotalDate }" var="i">
						<div>
							<h4>Day ${i }</h4>
							<hr>
							<ul id="day${i }">
								<c:set var="day" value="${i }"/>
								<c:forEach items="${planList }" var="UserPlanDTO" varStatus="status">
									<c:if test="${UserPlanDTO.planDay == day}">
										<li class="ui-state-default" id='${status.index }'>
											<div class="row">
												<input type="hidden" name="planData" value='${UserPlanDTO }'>
												<div class="col-lg-5">
													<img class="img-responsive" id="r_photo${status.index }" onclick="" style="cursor: pointer;" src="${UserPlanDTO.img_src }" alt=""  width="100" height="75">
												</div>
												<div class="col-lg-7">
													<span id="r_title${status.index }" style="font-size: 12pt;">${UserPlanDTO.title }</span>
													<span id="r_addr${status.index }" style="font-size: 10pt;">${UserPlanDTO.addr }</span>
												</div>
											</div>
											<hr>
										</li>
									</c:if>
									<c:if test="${UserPlanDTO.is_insertAfter eq 'Y'}">
										<input type="hidden" name="scheduleData" value='${list }'>
									</c:if>
								</c:forEach>
							</ul>
							<button type="button" class="btn btn-primary optimize" value="optimize">최적화</button>
						</div>			
					</c:forEach>	
				</div>
				<div id="planner-info" style="display: none;">
					<div class="planner-img" style="padding-bottom: 10px;">
						<img id="img-planner" alt="" src="${planDTO.plan_img }" style="width: 50%">
					</div>
					<textarea name="plan_info" rows="3" style="width: 100%; max-height: 70px;">${planDTO.plan_info }</textarea>
					<form id="upload-form" method="post" action="" enctype="multipart/from-data">
						<input type="file" style="padding: 10px 0;" id="upload_img" name="upload_img">
						<input type="hidden" id="plan_no" name="plan_no" value="${plan_no }">
					</form>
					<button type="button" id="modify-planner" style="border: none; outline: none;">일정 수정</button>
				</div>
			</div>
			<div>
				<p id = "result"></p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="scheduler">
		
		</div>
	</div>
</body>
</html>