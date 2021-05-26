//페이지 로딩이 완료되면 함수 실행
  $(document).ready(function(){
	    getShowReplyList();
  });
 
 //btnReplySave버튼 누르는 이벤트 발생시 처리부분
	$(document).on('click', '#btnReplySave', function(){
		let loginState = $('#loginState').val();
		let replyWriter = $('#reply_writer').val();
		let freedom_num = $('#freedom_num').val();
		let replyContent = $('#reply_content').val();
		let url ="/freedomReply/replyWriteProc"  		
		let paramData = JSON.stringify({'reply_writer' : replyWriter, 'freedom_num' : freedom_num, 'reply_content' : replyContent});
		let headers = {'Content-Type':"application/json", "X-HTTP-Method-Override" : "POST"};
		if(loginState == "true"){
			if(replyContent != null){
				$.ajax({
		  			url : url,
		  			headers : headers,
		  			data : paramData,
		  			type : 'POST',
		  			dataType : 'text',
		  			success : function(result){
		  				getShowReplyList();
		  				$('#reply_content').val('');
		  			},
		  			error : function(error){
		  				console.log("에러 : " + error);
		  			}
		  		});		
			} else {
				alert("댓글을 입력해주세요!");
			}
		} else {
			alert("로그인 후 이용해주세요!");
		}
	});
	
 	//댓글 목록 가져오는 함수
	function getShowReplyList(){
		let url ="/freedomReply/replyGetList";
		let freedom_num = $('#freedom_num').val();
		let paramData = {"freedom_num" : freedom_num};
		$.ajax({
			type:"post",
			url: url,
			data: paramData,
			dataType:'json',
			success:function(result){
				let listReply = "";
				$(result).each(function(){
					listReply += '<div class="media text-muted pt-3" id="reNum' + this.reply_num + '">';
					listReply += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32X32">';
					listReply += '<title>Placeholder</title>';
					listReply += '<rect width="100%" height="100%" fill="#007bff"></rect>';
					listReply += '<text x="50%" fill="#007bff" dy=".3em">32X32</text>';
					listReply += '</svg>';
					listReply += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
					listReply += '<span class="d-block">';
					listReply += '<strong class="text-gray-dark">'+ this.reply_writer + '</strong>';
					listReply += '<span style="padding-left:7px; font-size:9pt">';
					listReply += '<a href="javascript:void(0)" onclick="EditModiReply(' + this.reply_num + ',\'' + this.reply_writer + '\', \'' + this.reply_content + '\');" style="padding-right:5px">수정</a>';
					listReply += '<a href="javascript:void(0)" onclick="DeleteReply(' + this.reply_num + ', ' + this.freedom_num + ',\'' + this.reply_writer + '\');">삭제</a>';
					listReply += '</span>';
					listReply += '</span>';
					listReply += this.reply_content;
					listReply += '</p>';
					listReply += '</div>';
				});
				$('#replyList').html(listReply);
			}
		});
	}
 	
 	//수정버튼 눌렀을때 수정하는 폼으로 바꾸어 주는 함수
	function EditModiReply(reply_num, reply_writer, reply_content){
			let loginState = $('#loginState').val();
			let loginUserID = $('#reply_writer').val();
			let freeNum = $('#freedom_num').val();
			let userGrantInfo = $('#provider').val();
			if(loginState == "true"){
			  if(reply_writer === loginUserID || userGrantInfo == "0"){
				let modifyHtml = "";
				modifyHtml += '<div class="media text-muted pt-3" id="reNum' + reply_num + '">';
			    modifyHtml += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32X32">';
		  	    modifyHtml += '<title>Placeholder</title>';
			    modifyHtml += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		        modifyHtml += '<text x="50%" fill="#007bff" dy=".3em">32X32</text>';
			    modifyHtml += '</svg>';
			    modifyHtml += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
			    modifyHtml += '<span class="d-block">';
			    modifyHtml += '<strong class="text-gray-dark">'+ reply_writer + '</strong>';
			    modifyHtml += '<span style="padding-left:7px; font-size:9pt">';
			    modifyHtml += '<a href="javascript:void(0)" onclick="SaveModiReply(' + reply_num + ',' + freeNum + ',\'' + reply_writer + '\')" style="padding-right:5px">저장</a>';
			    modifyHtml += '<a href="javascript:void(0)" onclick="getShowReplyList()">취소</a>';
			    modifyHtml += '</span>';
			    modifyHtml += '</span>';
			    modifyHtml += '<textarea name="replyContent" id="replyContent" class="form-control" rows="3">';
			    modifyHtml += reply_content;
			    modifyHtml += '</textarea>';
			    modifyHtml += '</p>';
			    modifyHtml += '</div>';
			  
			  $('#reNum' + reply_num).replaceWith(modifyHtml);
			  $('#reNum' + reply_num + '#replyContent').focus();
			  
			  } else {
				alert("해당 댓글은 작성자 또는 관리자만 접근이 가능합니다!");
			  }
			} else {
				alert("로그인 후 이용해주세요!");
			}
	}
	
 	//수정된 댓글을 저장하는 함수
	function SaveModiReply(reply_num, freeNum, reply_writer){
		let reply_content = $('#replyContent').val();
		let paramData = JSON.stringify({'reply_writer':reply_writer, 'freedom_num':freeNum, 'reply_content':reply_content, 'reply_num':reply_num});
		let headers = {'Content-Type':"application/json", "X-HTTP-Method-Override" : "POST"};
		let url ="/freedomReply/replyModifyProc";
		$.ajax({
			type:"post",
			url: url,
			data: paramData,
			dataType:'json',
			headers : headers,
			success:function(result){
				console.log(result);
				getShowReplyList();
			},
			error:function(error){
				console.log("에러 : " + error);
			}
		});
	}
 	
 	//저장된 댓글을 삭제하는 함수
 	function DeleteReply(reply_num, freedom_num, reply_writer) {
 		let loginState = $('#loginState').val();
 		let loginUserID = $('#reply_writer').val();
 		let userGrantInfo = $('#provider').val();
 		let paramData = JSON.stringify({'reply_num':reply_num, 'freedom_num':freedom_num});
 		let headers = {'Content-Type':"application/json", "X-HTTP-Method-Override":"POST"};
 		let url = "/freedomReply/replyDeleteProc";
 		if(loginState == "true"){
 			if(reply_writer === loginUserID || userGrantInfo == "0"){
 				$.ajax({
 	   	   			type: "post",
 	   	   			url: url,
 	   	   			data: paramData,
 	   	   			dataType:'json',
 	   	   			headers : headers,
 	   	   			success:function(result){
 	   	   				console.log(result);
 	   	   				getShowReplyList();
 	   	   				alert("댓글이 삭제되었습니다!");
 	   	   			},
 	   	   			error:function(error){
 	   	   				console.log("에러 : " + error);
 	   	   			}
 	   	   		});
 			} else {
 				alert("해당 댓글은 작성자나 관리자만 접근 가능합니다!");
 			}
 		} else {
 			alert("로그인 후 이용해주세요!");
 		}
 	}