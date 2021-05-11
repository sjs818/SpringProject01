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
			
		});
		
		function setListItems(data, markers, map, pageNo) {
	    var positions = [];
	    $.each(data, function(i, result) {
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
	                          + 'style="cursor: pointer;" src="' + result.firstImage2 + '"alt="" width="150" height="100">'
	                        + '</div>'
	                        + '<div class="col-lg-7">'
	                          + '<h5>' + result.title + '</h5>'
	                          + '<h6>' + result.addr1 + '</h6>'
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
				center : new Tmapv2.LatLng(33.38260485180545, 126.57321166992229),
			  width : "100%",
			  height : "925px",
			  zoom : 11,
			  zIndexInfoWindow : 999
			});
			return map;
		}
	</script>
	<title>Document</title>
</head>
<body>
	<!-- Header -->
  <c:import url="/WEB-INF/view/include/header.jsp"/>
  
  <!-- Main -->

    <!-- SideBar -->
    <div class="sidebar-wrapper shadow" style="margin-top:55px">
      <div class="sidebar-content">
        <div class="sidebar-brand" style="background: #258fff;">
          <h1>title</h1>
          <p>explanation</p>
        </div>
        <div class="sidebar-search" style="background: #258fff;">
          <div class="input-group">
            <input type="text" class="form-control search-menu" placeholder="">
            <div class="input-group-append" id="search">
              <span class="input-group-text">
                <i class="fa fa-search"></i>
              </span>
            </div>
          </div>
        </div>
        <div class="sidebar-menu" style="background: #f5f5f5;">
          <!-- 기본 -->
          <ul style="padding: 10px 20px;">
            <li class="header-menu">
            	<span>관광지 리스트</span>
            </li>
						<form method="get" name="imgForm" id="imgForm"></form>
          </ul>
          <!-- 검색 -->
          <ul style="display: none; padding: 10px 20px">
            <li class="header-menu">
              <span>검색 결과</span>
            </li>
            <form method="get" name="keywordForm" id="keywordForm"></form>
          </ul>
        </div>
      </div>
      <div class="sidebar-footer" style="background: #e9e9e9; border-top: 1px solid #ddd;">
      	<form action="${root }schedule/write_proc" method="post">
					<button type="button" class="btn btn-primary">저장</button>
				</form>
      </div>
    </div>

    <!-- Content -->
    <div class="page-content">
      <div class="container">
        <div id="tmap_api"></div>
      </div>  
    </div>

    <!-- Modal -->

  <!-- Footer -->
  <c:import url="/WEB-INF/view/include/footer.jsp" />
</body>
</html>