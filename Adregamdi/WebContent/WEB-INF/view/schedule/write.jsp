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
			
			// 사이드바
			$("input:checkbox").on('click', function() {
				if ( $(this).prop('checked') ) {
					$('.sidebar-wrapper').css("transform", "translateX(-100%)"); 
				} else {
					$('.sidebar-wrapper').css("transform", "translateX(0)"); 
				}
			});
			
			// 첫 데이터 불러오기
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
			
			// 무한 스크롤
			$('.sidebar-menu').scroll(function() {
			  if(Math.ceil($('.sidebar-menu').scrollTop() + $('.sidebar-menu').innerHeight()) >= $('.sidebar-menu')[0].scrollHeight) {
		    	if(category == 0) {
				  	param.pageNo++;
		      	main_markers = callAjaxMain(param, main_markers, map);
		      	curr_markers = main_markers;
		    	}
			  }
			});
		});
		
		// function 01 : setListItems(data, markers, map, pageNo)
		function setListItems(data, markers, map, pageNo) {
	    
			var positions = [];
	    
			$.each(data, function(i, result) {
	      var overview = result.overview.replace(/'/g, "");
	      
	      var position = { 
	    		  title : result.title,
	          lonlat : new Tmapv2.LatLng(result.mapX, result.mapY),
	          addr : result.addr1,
	          overview : overview,
	          img : result.firstImage2,
	          contentId : result.contentId,
	          contentTypeId : result.contentTypeId
	      };
	      
	      var content = '<li class="reco-ul">' +
	                    	'<hr>' +
	                    	'<div class="row spot_info' + pageNo + '">' +
	                      	'<div class="col-lg-5">' +
	                        	'<img class="img-responsive" style="cursor: pointer;" src="' + result.firstImage2 + '"alt="" width="135" height="90">' +
	                        '</div>' +
	                        '<div class="col-lg-7">' +
	                        	'<h6>' + result.title + '</h6>' +
	                          '<p>' + result.addr1 + '</p>' +
	                        '</div>' +
	                     	'</div>' +
	                  	'</li>';
	      
	      positions.push(position);
	      
	      $('#imgForm').append(content);
	    });
	    
	    $('.spot_info' + pageNo).each(function(i) {
    		
	    	var lonlat = positions[i].lonlat;
        var title  = positions[i].title;
        
        if(positions[i].addr == null) {
          positions[i].addr = "주소 없음";
        }
        
        // Tmap API 'Marker' Method (마커 생성)
        var marker = new Tmapv2.Marker({
          position : new Tmapv2.LatLng(lonlat.lng(), lonlat.lat()),
          map : map,
          title: title,
          visible: false
        });
        
        markerClick(map, marker, lonlat, title, positions[i]);
        
        $(this).click(function(){
        	for(var i = 0; i < markers.length; i++) {
        		markers[i].setVisible(false);
        	}
          marker.setVisible(true); 
          // 지도 위치 재설정
          map.setCenter(new Tmapv2.LatLng(lonlat.lng(), lonlat.lat() - 0.15));
        });
        
        markers.push(marker);
      });
	    return markers;
  	} // function 01 : setListItems(data, markers, map, pageNo)
 		
  	// function 02 : initTmap()
		function initTmap() {
			// Tmap API 'Map' Method (지도 생성)
			var map = new Tmapv2.Map("tmap_api", { 
				center : new Tmapv2.LatLng(33.387292, 126.427416),
			  width : "100%",
			  height : "82vh",
			  zoom : 11,
			  zIndexInfoWindow : 999
			});
			return map;
		} // function 02 : initTmap()
		
		// function 03 : callAjaxMain(param, main_markers, map)
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
		} // function 03 : callAjaxMain(param, main_markers, map)
		
		// function 04 : markerClick(map, marker, lonlat, title, position)
		function markerClick(map, marker, lonlat, title, position) {
	    
			if(position.overview == null) {
	      position.overview = "";
	    }
			
	    marker.addListener("click", function(event) {
	    	var content = "<div style='position: static; display: flex; flex-direction: column; font-size: 14px; border-radius: 10px; top: 410px; left : 800px; width : 250px; background: #FFFFFF 0% 0% no-repeat padding-box;'>" +
									    	"<div class='img-box' style='position: relative; width: 100%; height: 150px; border-radius: 10px 10px 0 0 ;'>" +
									    		"<img src='" + position.img + "' style='width: 100%; height: 150px;'>" +
					      		  	"</div>" +
									    	"<div class='info-box' style='padding: 10px;'>" +
									    		"<p style='margin-bottom: 7px; overflow: hidden;'><span class='tit' style=' font-size: 16px; font-weight: bold;'>"+ title +"</span></p>" +
									    		"<ul class='ul-info' style='list-style: none; padding: 0px;'>" +
									    			"<li class='li-addr' style='padding-left: 5px; margin-bottom: 5px;'>" +
									    				"<p class='new-addr'><i class='fas fa-map-marker-alt' style='padding-right: 3%'></i>" + position.addr + "</p>" +
									    			"</li>" +
									    			"<li class='li-overview' style='padding-left: 5px;'>" +
									    				"<p class='overview' style='overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 4; -webkit-box-orient: vertical;'><i class='fas fa-sticky-note' style='padding-right: 3%'></i>" + position.overview + "</p>" +
									    			"</li>" +
									    		"</ul>"+
									    		"<ul class='btn-group' style='display: table; padding: 10px 0; width: 100%; border-radius: 3px; height: 30px; border: 1px solid #EFEFEF; margin: 10px 0 0 0; text-align: center;'>"+
								      			"<li style='display: table-cell; vertical-align: middle; width: 50%; height: 100%; border-right: 1px solid #EFEFEF;'>" +
								      				"<a href='javascript:void(0)' id='detail' style='text-decoration: none;'><i class='fas fa-1x fa-info-circle'></i> 자세히 보기</a>" + 
								      			"</li>" +
								      			"<li style='display: table-cell; vertical-align: middle; width: 50%; height: 100%; border-right: 1px solid #EFEFEF;'>";
		    if($.isNumeric(position.liIndex)){
		       content = content + "<a href='javascript:void(0)' id='addList' style='text-decoration: none;'><i class='fas fa-1x fa-trash'></i> 삭제하기</a>" +
		                        "</li>" +
		                      "</ul>" +
		                    "</div>" +
		                    "<a href='javascript:void(0)' onclick='onClose()' class='btn-close' style='position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px;'><i class='fas fa-times' style='color:white;'></i></a>" +
		                  "</div>";
		       
		    } else {
		       content = content + "<a href='javascript:void(0)' id='addList' style='text-decoration: none;'><i class='fas fa-1x fa-plus-circle'></i> 추가하기</a>" +
		                        "</li>" +
		                      "</ul>" +
		                    "</div>" +
		                    "<a href='javascript:void(0)' onclick='onClose()' class='btn-close' style='position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px;'><i class='fas fa-times' style='color:white;'></i></a>" +
		                  "</div>";
		    }
		 		
		    // Tmap API 'InfoWindow' Method (팝업 생성)  
	      var infoWindow = new Tmapv2.InfoWindow({
	        position : new Tmapv2.LatLng(lonlat.lng(), lonlat.lat()),
	        content : content,
	        border : '0px solid #FF0000',
	        type : 2,
	        map : map
	      });
	   		// 지도 위치 재설정
	      map.setCenter(new Tmapv2.LatLng(lonlat.lng() - 0.11, lonlat.lat() - 0.055));	      
	 			
	      if(position.contentId != null) {
					$("#detail").click(function() {
						detailModal(position.contentId, position.contentTypeId);
						$("#title-Guide").html(title);
					});
				}
	      
	      $("#addList").unbind("click").bind("click", function(){
	    	  var diffrentTitle = true;
	    	  
	    	  if(diffrentTitle == true) {
	    		  addModal(position, map, marker);
	    	  }
	      })
	  	});
		}
		
		// function 04 : detailModal(contentId, contentTypeId)
		function detailModal(contentId, contentTypeId) {
			
			if($("#modal-contentId").val() == null) {
				$("#modalForm").append("<input id='modal-contentId' class='contentId' type='hidden' name='contentId' value="+contentId+">");
			}
			
			if($("#modal-contentTypeId").val() == null) {
				$("#modalForm").append("<input id='modal-contentTypeId' class='contentTypeId' type='hidden' name='contentTypeId' value="+contentTypeId+">");
			}
			
			$("#modalForm").submit();
			
			$("#modal-Guide").modal();
		} // function 04 : detailModal(contentId, contentTypeId)
		
		// function 05 : addModal(position, map, marker)
		function addModal(position, map, marker) {
			$("#addModal").modal("show");
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
  
  <!-- Modal -->
	  <!-- Detail Modal -->
	  <form id="modalForm" target="guide" method="get" action="${root }schedule/guide"></form>
	  
	  <div id="modal-Guide" style="height: 100%; display: none;" class="modal fade bs-example-modal-lg in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
			<div class="modal-dialog modal-lg" style="height: 98%">
				<div class="modal-content" style="height: 95%; border-radius: 0px;">
					<div class="modal-header">
						<h5 class="modal-title" id="title-Guide" style="font-weight: bold;"></h5>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					</div>
					<div class="modal-body" style="height: 94%; padding: 0px;">
						<iframe name="guide" id="if_guidebook"  width="100%" height="100%" src="${root }schedule/guide" style="border: none;"></iframe>
					</div>
				</div>
			</div>
		</div>
		
		<!-- AddList Modal -->
		<div class="modal fade" tabindex="-1" role="dialog"	aria-labelledby="mySmallModalLabel" id="addModal" aria-hidden="true">
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">${plan_title }</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>

				</div>
				<div class="modal-body">
					<input type="text" id=s_title name="spot_title" readonly><br> 
					<select id="day" name="days" required autofocus>
					    <option value="1" selected>1일차</option>
					<c:forEach var="i" begin="2" end="${total_date }">
					    <option value="${i }">${i }일차</option>
					</c:forEach>
					</select>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary confirm" type="button" id="confirm">예</button>
					<button class="btn btn-primary" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>