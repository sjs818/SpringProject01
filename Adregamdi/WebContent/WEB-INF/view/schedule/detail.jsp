<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<script type="text/javascript">
		$(function() {
			var contentId = $("#contentId").val();
			var contentTypeId = $("#contentTypeId").val();
			var info_data = [];
			var param = {"contentId" : contentId, "contentTypeId" : contentTypeId};
			firstAjax(param, contentTypeId);
		});
		
		function firstAjax(param, contentTypeId) {
			$.ajax({
				url : "/schedule/detail",
				type : "get",
				dataType : "json",
				data : param,
				success : function(data) {
					insertData(data, contentTypeId);
				}
			});
		}
		
		function insertData(data, contentTypeId) {
			for(var i = 0; i < data.length; i++) {
				if(data[i] == null) {
					data[i] = "";
				}
			}
			$("#main-img").attr("src",data[0]);
			$(".title").text(data[1]);
			$("#overview").html(data[2]);
			$(".address").html("<i class='fas fa-map-pin'></i> " + data[3]);
			switch(contentTypeId) {
				case "12" :
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-info-circle'></i> 문의 및 안내<br>"+data[6]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-calendar-alt'></i> 쉬는날 : "+data[7]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-clock'></i> 이용시간 : "+data[8]+"</p>");
					break;
				case "14" :
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-info-circle'></i>문의 및 안내 : "+data[6]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-won-sign'></i> 이용요금 : "+data[7]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-clock'> 이용시간 : "+data[8]+"</p>");
					break;
				case "15" :
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-info-circle'></i>행사 홈페이지 : "+data[6]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-phone-alt'></i> 연락처 : "+data[7]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-clock'> 공연시간 : "+data[8]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-won-sign'></i>이용요금 : "+data[9]+"</p>");//여기까지
					break;
				case "25" :
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-info-circle'></i>문의 및 안내 : "+data[6]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-clock'> 코스 예상 소요시간 : "+data[7]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-question-circle'></i> 코스 테마 : "+data[8]+"</p>");
					break;
				case "28" :
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-info-circle'></i> 문의 및 안내 : "+data[6]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-calendar-alt'></i> 쉬는날 : "+data[7]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-won-sign'></i> 이용요금 : "+data[8]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-clock'> 이용시간 : "+data[9]+"</p>");
					break;
				case "32" :
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-info-circle'></i> 문의 및 안내 : "+data[8]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-clock'> 체크인 : "+data[6]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-clock'> 체크아웃 : "+data[7]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-link'></i> 홈페이지 : "+data[9]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-question-circle'></i> 예약안내 : "+data[10]+"</p>");
					break;
				case "38" :
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-info-circle'></i> 문의 및 안내 : "+data[6]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-clock'> 영업시간 : "+data[7]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-calendar-alt'></i>쉬는날 : "+data[8]+"</p>");
					break;
				case "39" :
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-info-circle'></i> 문의 및 안내 <br>"+data[7]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='fas fa-1x fa-utensils'></i> 대표 메뉴 : "+data[6]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-clock'> 영업시간 : "+data[8]+"</p>");
					$(".details").append("<p style='font-weight:bold;'><i class='far fa-1x fa-calendar-alt'></i> 쉬는날 : "+data[9]+"</p>");
					break;
			}
		}
	</script>
	<style>
  
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  
  section {
    margin : 10px 0 0;
    padding-top : 10px;
    padding-bottom : 25px;
    background : #FEFEFE;
  }
  
  .wrapping {
    position: relative;
      width: 100%;
      min-height: 100%;
  }
  
  .inner_wrap {
      position: relative;
      width: 100%;
      height: 100%;
      overflow: visible;
      margin: 0 auto;
  }
  
  .banner {
      margin: 50px 0 0;
      padding: 0 0 25px;
      border-bottom: none;
  }
  
  main {
      margin: 0;
      padding: 0;
      background : #F0f0f0;.
  }
  
  .banner .photo {
      position: relative;
      width: 100%;
      padding-top: 54%;
      overflow: hidden;
  }
  
  img.fw {
      position: absolute;
      width: 100%;
      height: auto;
      top: -100%;
      right: -100%;
      bottom: -100%;
      left: -100%;
      margin: auto;
  }
  
  .banner .info {
    position: relative;
    padding: 20px 20px 0;
  }
  
  .titleArea {
  	position: relative;
  }  
  
  .titleArea .address {
  	padding: 20px 10px;
  	border: 3px solid #F0f0f0;
  }  
	
	.overview {
		padding: 5px;
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
  <title>Document</title>
</head>
<body>
	<input type="hidden" name="contentId" id="contentId" value="${contentId }">
	<input type="hidden" name="contentTypeId" id="contentTypeId" value="${contentTypeId }">
	
	<div class="wrapping">
		<main>
			<section class="banner" style="margin-top: 0px; padding-top: 0px;">
				<div class="inner_wrap">
					<div class="photo">
						<img class="fw lazyloaded" id="main-img" src="">
					</div>
					<!--Main Info-->
					<div class="info">
						<div class="titleArea">
							<h5 style="font-weight: bold;" class="address"></h5>
						</div>
						<div class="overview">
							<p id="overview"></p>
						</div>
					</div>
				</div>
			</section>
			
			<section class="stu_section stu_exp_list stu_clearfix" style="margin-bottom: 10px;">
				<div class="inner_wrap">
					<div style="padding-left: 20px; padding-right: 20px" class="details">

					</div>
				</div>
			</section>
		</main>
	</div>
</body>
</html>