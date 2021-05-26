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
      	<b>${readContentDTO.to_title}</b>
    	</h3>
    	<h6>&nbsp;&nbsp;&nbsp;&nbsp;${readContentDTO.to_date}</h6>
    	<hr><br>
    	<form class="form-horizontal" name="togetherWriteDTO" id="togetherWriteDTO" action="${root}together/writeProc" method="POST">
    	<div class="form-group" style="margin-bottom: 30px;">
      		<div class="mb-3">
        		${readContentDTO.to_content}
      		</div>
    	</div>
    	<hr><br>
    	<div class="form-group float-right">
    	    <a href="${root}together/list" class="btn btn-info" style="padding : 4px; margin-right : 5px;">목록보기</a>
    	    <c:if test="${loginUserDTO.userLogin == true}">
              <c:if test="${ loginUserDTO.user_no == readContentDTO.to_writer || loginUserDTO.user_provider == 0}" >
                <a href="${root}together/modify?content_idx=${readContentDTO.to_no}" class="btn btn-success"
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
      <div class="form-group" style="padding-top : 20px;">
        <form:form method="post" modelAttribute="replyWriteDTO" class="form-horizontal">
        	<form:hidden path="reply_writer" id="reply_writer" value="${loginUserDTO.user_id}" />
        	<form:hidden path="together_num" id="together_num" value="${readContentDTO.to_no }" />
        	<div class="col-sm-9" style="margin : 10px">
        		<form:textarea path="reply_content" id="reply_content" rows="3" cols="100" ></form:textarea>
        	</div>
        	<form:button type="button" path="btnReplySave" id="btnReplySave" class="col-sm-2 btn btn-primary" style="margin: 30px;" onclick="">댓글등록</form:button>
        </form:form> 
        <!-- Reply List {s}-->
	 	  <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
			 <h6 class="border-bottom pb-2 mb-0"><b>달린 댓글</b></h6>
	 	  <div id="replyList"></div>
	    </div>
      </div>
   </div>
   <script type="text/javascript">
   //페이지 로딩이 완료되면 함수 실행
    $(document).ready(function(){
	    getShowReplyList();
    });
   
   //btnReplySave버튼 누르는 이벤트 발생시 처리부분
  	$(document).on('click', '#btnReplySave', function(){
  		let replyWriter = $('#reply_writer').val();
  		let together_num = $('#together_num').val();
  		let replyContent = $('#reply_content').val();
  		let url ="${root}togetherReply/replyWriteProc"  		
  		let paramData = JSON.stringify({'reply_writer' : replyWriter, 'together_num' : together_num, 'reply_content' : replyContent});
  		let headers = {'Content-Type':"application/json", "X-HTTP-Method-Override" : "POST"};
  		console.log(replyWriter);
  		console.log(together_num);
  		console.log(replyContent);
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
  	});
  	
   	//댓글 목록 가져오는 함수
  	function getShowReplyList(){
  		let url ="${root}togetherReply/replyGetList";
  		let together_num = $('#together_num').val();
  		let paramData = {"together_num" : "${readContentDTO.to_no}"};
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
					listReply += '<a href="javascript:void(0)" onclick="DeleteReply(' + this.reply_num + ', ' + this.together_num + ');">삭제</a>';
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
			let loginState = ${loginUserDTO.userLogin};
			let loginUserID = "${loginUserDTO.user_id}";
			let toNum = $('#together_num').val();
			let userGrantInfo = "${loginUserDTO.user_provider}";
			if(loginState == true){
			  if(reply_writer == loginUserID || userGrantInfo == 0){
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
			    modifyHtml += '<a href="javascript:void(0)" onclick="SaveModiReply(' + reply_num + ',' + toNum + ',\'' + reply_writer + '\')" style="padding-right:5px">저장</a>';
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
  	function SaveModiReply(reply_num, toNum, reply_writer){
  		let reply_content = $('#replyContent').val();
  		let paramData = JSON.stringify({'reply_writer':reply_writer, 'together_num':toNum, 'reply_content':reply_content, 'reply_num':reply_num});
  		let headers = {'Content-Type':"application/json", "X-HTTP-Method-Override" : "POST"};
  		let url ="${root}togetherReply/replyModifyProc";
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
   	function DeleteReply(reply_num, together_num) {
   		let paramData = JSON.stringify({'reply_num':reply_num, 'together_num':together_num});
   		let headers = {'Content-Type':"application/json", "X-HTTP-Method-Override":"POST"};
   		let url = "${root}togetherReply/replyDeleteProc";
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
   	}
  </script>
</body>
</html>