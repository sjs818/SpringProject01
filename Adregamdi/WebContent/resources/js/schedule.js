$(function() {
  var curr_markers = [];
  var main_markers = [];
  var search_markers = [];
  var map = initTmap();
  var param = {pageNo: 1, numOfRow: 5};
  var keywordParam = {pageNo:1, numOfRow:5, keyword:""};
  var keyword_flag = false;
  var category = 0;
  var plan_data=[];
  
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
  
  $('.sidebar-menu').scroll(function() {
    if($('.sidebar-menu').prop('scrollHeight') == Math.ceil($('.sidebar-menu').scrollTop() + $('sidebar-menu').height())) {
      if(category == 0) {
        param.pageNo++;
        main_markers = callAjaxMain(param, main_markers, map);
        curr_markers = main_markers;
      }
      if(category == 2) {
        keywordParam.pageNo++;
        search_markers = callAjaxKeyword(keywordParam, search_markers, map);
        curr_markers = search_markers;
      }
    }
  });
  
  $('#search').click(function(){
    
  });
});

  function markerClick(map, marker, latlng, title, position) {
    if(position.overview == null) {
      position.overview = "";
    }
    marker.addListener("click", function(event){
      var content = '<div style="position: static; display: flex; flex-direction: column; font-size: 14px; box-shadow: 5px 5px 5px #00000040; border-radius: 10px; top: 410px; left : 800px; width : 250px; background: #FFFFFF 0% 0% no-repeat padding-box;">'
                    + '<div class="img-box" style="position: relative; width: 100%; height: 150px; border-radius: 10px 10px 0 0;">'
                      + '<img src="' + position.img + '" style="width: 100%; height: 150px;">'
                    + '</div>'
                    + '<div class="info-box" style="padding: 10px;">'
                      + '<p style="margin-bottom: 7px; overflow: hidden;">'
                        + '<span class="title" style="font-size: 16px; font-weight: bold;">' + title + '</span>'
                        + '<a href="http://tmapapi.sktelecom.com/" target="_blank" class="link" style="color: #3D6DCC; font-size: 13px; float: right">홈페이지</a>'
                      + '</p>'
                      + '<ul class="ul-info" style="list-style-type: none; padding: 0px;">'
                        + '<li class="li-addr" style="padding-left: 20px; margin-bottom: 5px;">'
                          + '<p class="new-addr"><i class="fas fa-map-marker-alt" style="padding--right:3%"></i>' + position.addr + '</p>'
                        + '</li>'
                        + '<li class="li-overview" style="padding-left: 20px;">'
                          + '<p class="overview" style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 4; -webkit-box-orient: vertical;">'
                          + '<i class="far fa-sticky-note" style="padding-right: 3%;"></i>' + position.overview + '</p>'
                        + '</li>'
                      + '</ul>'
                      + '<ul class="btn-group" style="display: table; width: 100%; padding: 0; border-radious: 3px; height: 30px; border: 1px solid #EFEFEF; margin-top: 10px;">'
                        + '<li class="li-datail" style="display: table-cell; vertical-align: middle; width: 50%; height: 100%; border-right: 1px solid #EFEFEF;">'
                          + '<a href="javascript: void(0)" title="더 보기"><i class="fas fa-1x fa-info-circle"></i></a>'
                        + '<li class="addList" style="display: table-cell; vertical-align: middle; width: 50%; height: 100%; border-right: 1px solid #EFEFEF;">'
                          + '<a href="javascript: void(0)" title="공유하기">'
      if($.isNumeric(position.liIndex)){
        content = content + '<i class="fas fa-1x fa-trash"></i></a></li>'
                      + '</ul>'
                    + '</div>'
                    + '<a href="javascript: void(0)" onclick="onClose()" class="btn-close" style="position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px;"><i class="fas fa-times"></i></a>'
                  + '</div>';
      } else {
        content = content + '<i class="fas fa-1x fa-plus-circle"></i></a></li>'
                      + '</ul>'
                    + '</div>'
                    + '<a href="javascript: void(0)" onclick="onClose()" class="btn-close" style="position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px;"><i class="fas fa-times"></i></a>'
                  + '</div>';
      }
      
      infoWindow = new Tmapv2.infoWindow({
        position: latlng,
        content: content,
        border: '0px solid #FF0000',
        type: 2,
        map: map
      });

      if(position.contentId != null){
        $(".li-detail").click(function(){
          detailModal(position.contentId, position.contentTypeId);
        });
      }

      $('.addList').unbind('click').bind('click', function(){
        var diff_title = true;
        $('.plan_title').each(function(i){
          if($(this).text() == title) {
            diff_title = false;
            if(confirm("이미 추가된 관광지입니다. \n삭제하시겠습니까?")) {
              marker.setMap(null);
              $('.day' + position.planDay + '-' + position.liIndex).remove();
              position.liIndex = 'false';
              delete position['positionData'];
            }
            return false;
          } 
        });
        if(diff_title == true) {
          addModal(position, map, marker);
        }
      });
    });
  }

  function addModal(position, map, marker) {
    $('#addModal').modal('show');
    $('#s_title').val(position.title);
    $('.confirm').unbind('click').bind('click',function(){
      var dayNum = $('#day').val();
      var liIndex = $('.sub-plan' + $('#day').val()).find('li').length + 1;
      var content = $('<li class="list_add_content day' + dayNum + '-' + liIndex + '"><hr><div class="row testRemove">'
                       + '<div class="col-lg-5" style="background-color: #f5f5f5"><img class="img-responsive" class="plan_photo"'
                       + 'style="cursor: pointer;" src="' + position.img + '" alt="" width="150" height="100">'
                       + '</div>'
                       + '<div class="col-lg-7" style="background-color : #f5f5f5">'
                         + '<h5 class="plan_title">' + position.title + '</h5>'
                         + '<h6 class="plan_addr">' + position.addr + '</h6>'
                         + '<span style="float: right;"><i class="fas fa-1x fa-trash"></i></span>'
                       + '</div>'
                     + '</div></li>');
      content.appendTo($('#day' + $('#day').val() + '.sub-play' + $('#day').val()));

      $('.day' + dayNum + '-' + liIndex + ' span').click(function(){
        marker.setMap(null);
        $('.day' + position.planDay + '-' + position.liIndex).remove();
        position.liIndex = "false";
        delete position['positionData'];
        alert('삭제되었습니다!')
      });

      $('#addModal').modal('hide');
      var strArr= $('#plan_date').val();
      var startDate = new Date(parseInt(date.substr(0,4)), parseInt(date.substr(5,2))-1, parseInt(date.substr(8,2)));
      startDate.setDate(startDate.getDate() + ($('#day').val() - 1));
      var month = ((startDate.getMonth() + 1) < 10? '0' : '') + (startDate.getMonth() + 1);
      var day = (startDate.getDate() < 10? '0' : '') + startDate.getDate();
      var split_date = startDate.getFullYear() + '-' + month + '-' + day;

      position.planDate = split_date;
      position.planDay = $('#day').val();
      position.planTotalDate = $('#totaldate').val();
      position.planno = $('#planno').val();
      position.liIndex = liIndex;
      var marker = new Tmapv2.Marker({
        position: position.latlng,
        icon: "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_p.png",
        map: map,
        title : "[" + position.planDay + "일차]" + position.title 
      });
      markerClick(map, marker, lonlat, position.title, position);
      var position_data = JSON.stringify(position);
      position.positionData = position_data;

      var input = $('<input type="hidden" class="position-data day' + dayNum + '-' + liIndex + '" value="' + position_data + '">');
      input.appendTo($('#day' + $('#day').val() + '.sub-play' + $('#day').val()));
      $('#addModal').modal('hide');
    });
  }

  function onClose(popup) {
    $('.cid').remove();
	  $('.ctid').remove();
	  infoWindow.setVisible(false);
  }

  function initTmap() {
    var map = new Tmapv2.Map("map_div", {
      center : new Tmapv2.LatLng(33.38260485180545, 126.57321166992229),
      width : "100%",
      height : "925px",
      zoom : 11,
      zIndexInfoWindow : 999
    });
    markerLeave(map);
    return map;
  }

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
  };

  function callAjaxKeyword(keywordParam, search_markers, map) {
    $.ajax({
      url : "/schedule/keyword",
      type : "get",
      dataType : "json",

    })
  }

  