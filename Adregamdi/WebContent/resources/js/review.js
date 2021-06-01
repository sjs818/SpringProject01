function printMap() {
	
	var mapx = $("#mapx").val();
	var mapy = $("#mapy").val();
	var title = $("#printTitle").val();
	
	var container = document.getElementById('map'); 	//지도를 담을 영역의 DOM 레퍼런스
	var options = { 									//지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(mapy, mapx), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

}
function writeReview() {
	
	var contentId = $("#contentId").val();
	var content = $("#review_content").val();
	var param = {"contentId" : contentId, "content" : content};
	
	console.log("contentId : " + contentId);
	
	$.ajax({
		
		url: "/spot/write_proc",
		type: "get",
		dataType: "json",
		data: param,
		success:function(data) {
			
			console.log('댓글이 등록되었습니다 - !');
			
		}, 
		error: function(error) {
			//alert('write 에러');
		}
	});
	location.reload();
}

function deleteReview(review_idx) {
	
	var review_idx = review_idx;
	var contentId = $("#hcontentId").val();
	var param = {"review_idx" : review_idx, "contentId" : contentId};
	
	$.ajax({
		
		url: "/spot/delete_proc",
		type: "get",
		dataType: "json",
		data: param,
		success:function() {
			alert("delete 완료!");
		}, 
		error: function(error) {
			//alert('delete 에러');
		}
	});
	location.reload();
}