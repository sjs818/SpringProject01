  function markerClick(map, marker, Latlng, title, position) {
    if(position.overview == null) {
      position.overview = "";
    }
    marker.addListener("click", function(event){
      var content = '<div style="position: static; display: flex; flex-direct
    });
  }

  function setListItems(data, markers, map, pageNo) {
    var positions = [];
    $.each(data, function(i, result) {
      var overview = result.overview.replace(/'/g,"");
      var position = {title:result.title, lonlat:new Tmapv2.LatLng(result.mapX, result.mapY), addr:result.addr1, overview:overview, img:result.firstImage2, contentId:result.contentId, contentTypeId:result.contentTypeId};
      
      var content = '<li class="reco-ul"><hr><div class="row spot_info' + pageNo + '">'
                  + '<div class="col-lg-5"><img class="img-responsive"'
                  + 'style="cursor: pointer;" src="' + result.firstImage2 + '"alt="" width="150" height="100">'
                  + '</div><div class="col-lg-7">'
                  + '<h5>' + result.title + '</h5>'
                  + '<h6>' + result.addr1 + '</h6>'
                  + '</div></div></li>';
      
      positions.push(position);
      $('#imgForm').append(content);
    });
    $('.spot_info' + pageNo).each(function(i){
      var lonlat = positions[i].lonlat;
      var title = positions[i].title;
      if(positions[i].addr == null) {
        positions[i].addr = "주소 없음";
      }
      var marker = new Tmapv2.Marker({
        position : lonlat,
        map : map,
        visible : false,
        title : title
      });
      markerClick(map, marker, lonlat, title, position[i]);
      $(this).click(function(){
        for(var i = 0; i < markers.length; i++) {
          markers[i].setVisable(false);
        }
        marker.setVisible(true);
      });
      makers.push(marker);
    });
    return markers;
  }
  
  function callAjaxMain(param, main_markers, map){
    $.ajax({
      url : "${root}schedule/information",
      type : "get",
      dataType: "json",
      data : "param",
      success : function(data) {
        if(data.length == 0) {
          alert('더 이상 표시할 내용이 없습니다.');
        } else {
          main_markers = setListItems(data, main_markers, map, param.pageNo);
        }
        
      }
    });
    return main_markers;
  }

  $ (function() {
		var curr_markers = [];
		var main_markers = [];
		var search_markers = [];
		var map = initTmap();
		var keywordParam = {pageNo:1, numOfRaw:5, keyword:""};
		var category = 0;
		
		$.ajax({
			url : "${root}schedule/information",
			type : "get",
			dataType : "json",
			data : "param",
			success : function(data) {
				main_markers = setListItems(data, main_markers, map, param.pageNo);
				curr_markers = main_markers;
			}
		});
		
		$('.sidebar-menu').scroll(function() {
			if($('.sidebar-menu').prop('scrollHeight') == Math.ceil($('.sidebar-menu').scrollTop() + $('sidebar-menu').height())) {
				if(category == 0) {
					param.pageNo++;
					main_markers = callAjaxMain(param, main_markers, map);
					curr_markers = main_markers;
				}
				if(category == 2) {
					keywordParam.pageNo++;
					search_markers = 
				}
			}
		});
		
		$('#search').click(function(){
			
		});
	});