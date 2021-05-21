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
	
	function readReply(){
		$.ajax({
			type:"GET",
			url:"${root}freedomReply/replyWriteProc?freedom_num=${readContentDTO.free_no}",
			success:function(result){
				let listReply = "";
				$.each(result, function(){
					listReply += '<div class="media text-muted pt-3">';
					listReply += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32X32">';
					listReply += '<title>Placeholder</title>';
					listReply += '<rect width="100%" height="100%" fill="#007bff"></rect>';
					listReply += '<text x="50%" fill="#007bff" dy=".3em">32X32</text>';
					listReply += '</svg>';
					listReply += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
					listReply += '<span class="d-block">';
					listReply += '<strong class="text-gray-dark">'+ this.reply_writer + '</strong>';
					listReply += '<span style="padding-left:7px; font-size:9pt">';
					listReply += '<a href="javascript:void(0)" onclick="fn_editReply()" style="padding-right:5px">수정</a>';
					listReply += '<a href="javascript:void(0)" onclick="fn_deleteReply()">삭제</a>';
					listReply += '</span>';
					listReply += '</span>';
					listReply += this.reply_content;
					listReply += '</p>';
					listReply += '</div>';
				});
				$("#replyList").html(listReply);
				console.log(result);
			}
		});
	}
  </script>
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
      <br>
      <br>
      <h6><b>댓글등록</b></h6>
      <hr>
      <form:form name="replyForm" id="replyForm" method="POST" modelAttribute="replyWriteDTO">
      <div class="form-group row" style="padding-top : 20px;">
      	<div class="col-sm-9" style="margin : 10px;">
          <form:textarea path="reply_content" rows="4" cols="100" />
        </div>
        <form:button class="col-sm-2 btn btn-primary" id="btnReplySave" style="margin: 30px;">댓글등록</form:button>
      </div>
      </form:form> 
	  	  <!-- Reply List {s}-->
	 	  <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
			 <h6 class="border-bottom pb-2 mb-0"><b>달린 댓글</b></h6>
	 	  <div id="replyList"></div>
	    </div> 
  	  </form>
   </div>
</body>
</html>
<!-- /* const htmls="";
				if(result.length < 1){
					html.push("등록된 댓글이 없습니다.");
				} else {
					$(result).each(fuction(){
						htmls += '<div class="media text-muted pt-3" id="reply_num' + this.reply_num: + '">';
						htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="placeholder:32X32">';
						htmls += '<title>Placeholder</title>';
						htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
						htmls += '<text x="50%" fill="#007bff" dy=".3em">32X32</text>';
						htmls += '</svg>';
						htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
						htmls += '<span class="d-block">';
						htmls += '<strong class="text-gray-dark">' + this.reply_writer + '</strong>'
						htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                    htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.reply_num + ', \'' + this.reply_writer + '\', \'' + this.reply_content + '\' )" style="padding-right:5px">수정</a>';
	                    htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.reply_num + ')" >삭제</a>';
	                    htmls += '</span>';
	                    htmls += '</span>';
	                    htmls += this.content;
	                    htmls += '</p>';
	                    htmls += '</div>';
					  });
					}
				$("#replyList").html(htmls);
				} */ -->