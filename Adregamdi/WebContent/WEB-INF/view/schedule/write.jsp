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
	<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxdc109d32e488487dbf0e29b9dfcf1a59"></script>
	<!-- JavaScript -->
	<%-- <script src="${root }js/schedule.js"></script> --%>
	<script type="text/javascript">
		
		$(function() {
			var param = {pageNo: 1, numOfRow: 5};
			var main_markers = [];
			var curr_markers = [];
			var map = initTmap();
			var category = 0;
			
			$("input:checkbox").on('click', function() {
				if ( $(this).prop('checked') ) {
					$('.sidebar-wrapper').css("transform", "translateX(-100%)"); 
				} else {
					$('.sidebar-wrapper').css("transform", "translateX(0)"); 
				}
			});
			
			$.ajax({
			    url : "/schedule/information",
			    type : "get",
			    dataType : "json",
			    data : param,
			    success : function(data) {
			      main_markers = setListItems(data, main_markers, map, param.pageNo);
			      curr_markers = main_markers;
			    }
			});
			
			$('.sidebar-menu').scroll(function() {
				console.log("스크롤", $('.sidebar-menu').scrollTop() + $('.sidebar-menu').innerHeight() + 10);
				console.log("결과", $('.sidebar-menu')[0].scrollHeight);
			  if(Math.ceil($('.sidebar-menu').scrollTop() + $('.sidebar-menu').innerHeight()) >= $('.sidebar-menu')[0].scrollHeight) {
		    	param.pageNo++;
		      main_markers = callAjaxMain(param, main_markers, map);
		      curr_markers = main_markers;
			  }
			});
		});
		
		function setListItems(data, markers, map, pageNo) {
	    var positions = [];
	    $.each(data, function(i, result) {
	    	console.log(result.title);
	      var overview = result.overview.replace(/'/g, "");
	      var position = { title: result.title,
	                       lonlat: new Tmapv2.LatLng(result.mapX, result.mapY),
	                       addr: result.addr1,
	                       overview: overview,
	                       img: result.firstImage2,
	                       contentId: result.contentId,
	                       contentTypeId: result.contentTypeId
	                     };
	      var content = '<li class="reco-ul">'
	                    + '<hr>'
	                      + '<div class="row spot_info' + pageNo + '">'
	                        + '<div class="col-lg-5">'
	                          + '<img class="img-responsive"'
	                          + 'style="cursor: pointer;" src="' + result.firstImage2 + '"alt="" width="135" height="90">'
	                        + '</div>'
	                        + '<div class="col-lg-7">'
	                          + '<h6>' + result.title + '</h6>'
	                          + '<p>' + result.addr1 + '</p>'
	                        + '</div>'
	                      + '</div>'
	                  + '</li>';
	      positions.push(position);
	      $('#imgForm').append(content);
	    });
	    return markers;
  	}
		
		function initTmap() {
			var map = new Tmapv2.Map("tmap_api", { 
				center : new Tmapv2.LatLng(33.387292, 126.427416),
			  width : "100%",
			  height : "82vh",
			  zoom : 11,
			  zIndexInfoWindow : 999
			});
			return map;
		}
		
		function callAjaxMain(param, main_markers, map){			
	    $.ajax({
	      url : "/schedule/information",
	      type : "get",
	      dataType: "json",
	      data : param,
	      success : function(data) {
	        if(data.length == 0) {
	          alert('더 이상 표시할 내용이 없습니다.');
	        } 
	        if(data.length != 0) {
	          main_markers = setListItems(data, main_markers, map, param.pageNo);
	        }
	      }
	    });
		  return main_markers;
		}
	</script>
		<style>
    .page-wrapper {
      height: 100vh;
    }
    
    .page-header {
      height: 86px;
    }
    
    .page-main {
      height: 82vh;
    }
    
    .page-footer {
    	position: relative;
      height: 6vh;
      background: #f5f5f5;
    }
    
    .page-footer span {
    	position: absolute;
    	top: 12px;
    	right: 145px;
    	font-size: 14px;
    	font-weight: bold;
    	color: #737373;

    }
    
    .page-footer input {
    	display: none;
    }
    
    .page-footer label {
    	display: inline-block;
    	width: 40px;
    	height: 24px;
    	cursor: pointer;
    	position: absolute;
    	top: 10px;
    	right: 100px;
    	background: #ccc;
    	border-radius: 12px;
    }
    
    .page-footer label::before {
    	content: '';
    	display: block;
    	width: 16px;
    	height: 16px;
    	left: 4px;
    	bottom: 4px;
    	position: absolute;
    	background: white;
    	transition: 0.3s;
    	border-radius: 8px;
    }
    
    .page-footer input:checked + label {
    	background: #2196f3;
    }
    
    .page-footer input:checked + label:before {
    	transform: translateX(16px);
    }
    
    .page-footer .btn {
    	position: absolute;
    	top: 7px;
    	right: 20px;
    	height: 30px;
    	line-height: 18px;
    	background: #258fff;
    	font-weight: 700;
    }
    
    .sidebar-wrapper {
      position: absolute;
      width: 25%;
      height: 82vh;
      max-height: 82vh;
      background: #258fff;
      z-index: 1;
      border-radius: 0 10px 0px 0px;
      transition: 0.3s;
    }

    .sidebar-wrapper ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .sidebar-wrapper a {
      text-decoration: none;
    }

    .sidebar-wrapper .sidebar-header {
      padding: 15px 20px 0 20px;
      color: #f5f5f5;;
    }
    
    .sidebar-wrapper .sidebar-search > div {
      padding: 10px;
    }
    
    .sidebar-wrapper .sidebar-menu {
      width: 100%;
      height: 487px;
      background: #f5f5f5;
      overflow: auto;
    }
		
		.sidebar-wrapper .sidebar-menu h6 {
			font-weight: bold;
			font-size: 14px;
		}
		
		.sidebar-wrapper .sidebar-menu p {
			font-size: 14px;
		}
		
		.sidebar-wrapper .sidebar-menu hr {
			margin: 8px 0;
		}
		
    .sidebar-wrapper .sidebar-menu .header-menu span {
      font-weight: bold;
      font-size: 16px;
      display: inline-block;
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
	<!-- Header -->
  <c:import url="/WEB-INF/view/include/header.jsp"/>
  
  <!-- Main -->
  <div class="page-wrapper">
    <div class="page-header"></div>
    <div class="page-main" id="tmap_api">
      <!-- SideBar -->
      <div class="sidebar-wrapper">
        <div class="sidebar-header">
          <h5>title</h5>
        </div>
        <div class="sidebar-search">
          <div class="input-group">
            <input type="text" class="form-control search-menu" placeholder="">
            <div class="input-group-append" id="search">
              <span class="input-group-text">
                <i class="fa fa-search"></i>
              </span>
            </div>
          </div>
        </div>
        <div class="sidebar-menu">
          <!-- 기본 -->
          <ul style="padding: 10px 20px;">
            <li class="header-menu">
            	<span>관광지 리스트</span>
            </li>
						<form action="" method="get" name="imgForm" id="imgForm">
						
						</form>
          </ul>
          <!-- 검색 -->
          <ul style="display: none; padding: 10px 20px">
            <li class="header-menu">
              <span>검색 결과</span>
            </li>
            <form method="get" name="keywordForm" id="keywordForm">
            
            </form>
          </ul>
        </div>
      </div>
    </div>
    <div class="page-footer">
    	<form action="${root }schedule/write_proc" method="get">
    		<span>지도 켜기</span>
    		<input type="checkbox" id="switch">
    		<label for="switch"></label>
      	<button id="save_btn" type="button" class="btn btn-primary">저장</button>
      </form>
    </div>
  </div>
</body>
</html>