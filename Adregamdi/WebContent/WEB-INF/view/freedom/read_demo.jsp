<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Header Import -->
	<c:import url="/WEB-INF/view/include/header.jsp" />
	
	<div class="container" style="margin-top: 120px;">
    	<h3 class="InputSubject">
      	<b>${readContentDTO.free_title}</b>
    	</h3>
    	<h6>${readContentDTO.content_writer_id}&nbsp;&nbsp;&nbsp;&nbsp;${readContentDTO.content_date}</h6>
    	<hr><br>
    	<form class="form-horizontal" name="freedomWriteDTO" id="freedomWriteDTO" action="${root}freedom/writeProc" method="POST">
    	<div class="form-group" style="margin-bottom: 30px;">
      		<div class="mb-3">
        		${readContentDTO.free_content}
      		</div>
    	</div>
    	<hr><br>
    	<div class="form-group float-right">
    	    <a href="${root}freedom/list" class="btn btn-info" style="padding : 4px; margin-right : 5px;">목록보기</a>
    	    <c:if test="${loginUserDTO.userLogin == true}">
              <c:if test="${ loginUserDTO.user_no == readContentDTO.free_content_writer_idx || loginUserDTO.user_provider == 0}" >
                <a href="${root}freedom/modify?content_idx=${readContentDTO.free_no}" class="btn btn-success"
      			style="padding : 4px; margin-right : 5px;">수정하기</a>
                <button type="button" class="btn btn-danger" style="padding : 4px; margin-right : 5px;" onclick="delContent();">삭제하기</button>
              </c:if>
            </c:if>
    	</div>
    	</form>
      <br>
      <br>
      <h6><b>댓글등록</b></h6>
      <hr>
      <form name="replyWriteDTO" id="replyWriteDTO" method="POST">
      <div class="form-group row" style="padding-top : 20px;">
      	<div class="col-sm-9" style="margin : 10px;">
          <textarea name="reply_content" id="reply_content" rows="4" cols="100"></textarea>
        </div>
        <button type="button" class="col-sm-2 btn btn-primary" id="btnReplySave" style="margin: 30px;" onclick="WriteReply();">댓글등록</button>
      </div>
      </form> 
	  	  <!-- Reply List {s}-->
	 	  <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
			 <h6 class="border-bottom pb-2 mb-0"><b>달린 댓글</b></h6>
	 	  <div id="replyList"></div>
	    </div> 
   </div>
   <script>
  	$(function(){
  		readReply();
	});
  
	function delContent(){
		const del_res = confirm("삭제하면 작성한 글은 복구할 수 없습니다 그래도 삭제 하시겠습니까?")
		if(del_res == true){
			location.href="${root}freedom/deleteProc?content_idx=${readContentDTO.free_no}"
		} else {
			return;
		}
  	}
	
	function WriteReply(){
		//가지고 갈 데이터
		let replyContent = $("#reply_content").val();
		let freedomNum = "${readContentDTO.free_no}";
		let reply_writer = "${loginUserDTO.user_id}";
		let paramData = JSON.stringify({"freedom_num" : freedomNum, "reply_writer" : reply_writer, "reply_content" : replyContent});
		let headers = {"Content-Type": "application/json; charset=UTF-8; ", "X-HTTP-Method-Override" : "POST"};
		
		//로그인 유효성 확인 차원
		let loginState = ${loginUserDTO.userLogin};
		if(loginState == true){
			$.ajax({
				url : "${root}freedomReply/replyWriteProc",
				headers : headers,
				data : paramData,
				type : "POST",
				dataType : 'text',
				succuess : function(result){
					alert("댓글이 등록되었습니다.");
					readReply();
				}
			});	
		} else {
			alert("로그인후 이용해주세요!");
		}
	}
	
	function readReply(){
		let url = "${root}freedomReply/replyGetList";
		let paramData = {"freedom_num" : "${readContentDTO.free_no}"};
		$.ajax({
			type:"POST",
			url:"${root}freedomReply/replyGetList",
			data : paramData,
			dataType : 'json',
			success:function(result){
				let listReply = "";
				$.each(result, function(){
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
					listReply += '<a href="javascript:void(0)" onclick="modifyReply(' + this.reply_num + ',\'' + this.reply_writer + '\', \'' + this.reply_content + '\')" style="padding-right:5px">수정</a>';
					listReply += '<a href="javascript:void(0)" onclick="deleteReply()">삭제</a>';
					listReply += '</span>';
					listReply += '</span>';
					listReply += this.reply_content;
					listReply += '</p>';
					listReply += '</div>';
				}); // each end
				$("#replyList").html(listReply);
			} // success end
		}); // ajax end
	}
	
	function modifyReply(reNum, reWriter, reContent){
		let loginState = ${loginUserDTO.userLogin};
		let loginUserID = "${loginUserDTO.user_id}";
		let freeNum = ${readContentDTO.free_no};
		let userGrantInfo = "${loginUserDTO.user_provider}";
		if(loginState == true){
		  if(reWriter == loginUserID || userGrantInfo == 0){
			  let modifyHtml = "";
			  modifyHtml += '<div class="media text-muted pt-3" id="reNum' + reNum + '">';
			  modifyHtml += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32X32">';
			  modifyHtml += '<title>Placeholder</title>';
			  modifyHtml += '<rect width="100%" height="100%" fill="#007bff"></rect>';
			  modifyHtml += '<text x="50%" fill="#007bff" dy=".3em">32X32</text>';
			  modifyHtml += '</svg>';
			  modifyHtml += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
			  modifyHtml += '<span class="d-block">';
			  modifyHtml += '<strong class="text-gray-dark">'+ reWriter + '</strong>';
			  modifyHtml += '<span style="padding-left:7px; font-size:9pt">';
			  modifyHtml += '<a href="javascript:void(0)" onclick="modifySaveReply(' + reNum + ',' + freeNum + ',\'' + reWriter + '\', \'' + reContent + '\')" style="padding-right:5px">저장</a>';
			  modifyHtml += '<a href="javascript:void(0)" onclick="cancelModifyReply(' + reNum + ',\'' + reWriter + '\', \'' + reContent + '\')">취소</a>';
			  modifyHtml += '</span>';
			  modifyHtml += '</span>';
			  modifyHtml += '<textarea name="replyContent" id="replyContent" class="form-control" rows="3">';
			  modifyHtml += reContent;
			  modifyHtml += '</textarea>';
			  modifyHtml += '</p>';
			  modifyHtml += '</div>';
			  
			  $('#reNum' + reNum).replaceWith(modifyHtml);
			  $('#reNum' + reNum + '#reContent').focus();
		  } else {
			  alert("해당 댓글은 작성자 또는 관리자만 접근이 가능합니다!");
		  }
		} else {
			alert("로그인 후 이용해주세요!");
		}
	}
	
	function modifySaveReply(reNum, freeNum, reWriter, reContent){
		let params = {"reply_num" : reNum, "freedom_num" : freeNum, "reply_writer" : reWriter, "reply_content" : reContent};
		$.ajax({
			type : "POST",
			url : "${root}freedomReply/replyModifyProc",
			dataType : 'JSON',
			data : params,
			succuess : function(result){
				alert("댓글이 수정되었습니다.");
				readReply();
			}
		});	
	}
	
	function cancelModifyReply(reNum, reWriter, reContent){
		let listReply = "";
		listReply += '<div class="media text-muted pt-3" id="reNum' + reNum + '">';
		listReply += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32X32">';
		listReply += '<title>Placeholder</title>';
		listReply += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		listReply += '<text x="50%" fill="#007bff" dy=".3em">32X32</text>';
		listReply += '</svg>';
		listReply += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		listReply += '<span class="d-block">';
		listReply += '<strong class="text-gray-dark">'+ reWriter + '</strong>';
		listReply += '<span style="padding-left:7px; font-size:9pt">';
		listReply += '<a href="javascript:void(0)" onclick="modifyReply(' + reNum + ',\'' + reWriter + '\', \'' + reContent + '\')" style="padding-right:5px">수정</a>';
		listReply += '<a href="javascript:void(0)" onclick="deleteReply()">삭제</a>';
		listReply += '</span>';
		listReply += '</span>';
		listReply += reContent;
		listReply += '</p>';
		listReply += '</div>';
		
		$('#reNum' + reNum).replaceWith(listReply);
	}
	
	function deleteReply(){
		let loginState = ${loginUserDTO.userLogin};
		if(loginState == true){
			
		} else {
			
		}
	}
  </script>
</body>
</html>