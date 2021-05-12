$(document).ready(function() {

    var sigungu = $("#sigunguCode").val();
    var contentType = $("#contentTypeId").val();
    var pNum = $('input[name=pageNum]').val()

    var allData = { "pageNo": pNum, "sigunguCode": sigungu, "contentTypeId": contentType, "numOfRow": 10 };

    $.ajax({
        url: "/spot/information",
        type: "get",
        dataType: "json",
        data: allData,
        success: function(data) {
			
            $.each(data, function(key, val) {
                
				$("#photo" + key).attr("src", data[key].firstImage2);
				$("#title" + key).text(data[key].title);
                $("#addr" + key).text(data[key].addr1);
                $("#overview" + key).html(data[key].overview);

				$("#photo" + key).attr("src", data[key].firstImage2);
				$("#title" + key).text(data[key].title);
                $("#addr" + key).text(data[key].addr1);
                $("#overview" + key).html(data[key].overview);
            });
        },
        error: function(error) {
            alert('첫 페이지 에러');
        }
    });
});



$("#clickModal").click(function(){
	alert("클릭되었습니다.");
});

