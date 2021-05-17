<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adregamdi 회원가입</title>
<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>


<script type="text/javascript">
	/* 아이디 중복 검사 */
  function checkID(){
    const user_id = $("#user_id").val();
    
    if(user_id.length == 0){
      alert('아이디를 입력해 주세요');
      return;
    }
    
    $.ajax({
      url: '${root}user/checkID/'+ user_id, 
      type: 'get',
      dataType: 'json',
      success: function(result){       	
      	if(result.trim() == "true"){
      	  alert('사용할 수 있는 아이디입니다');
      	  $('#inputUserID').val('true');
      	}else{
      	  alert('이미 존재하는 아이디입니다');
      	  $('#inputUserID').val('false');
      	}
      }
    })
  }
  function resetinputUserID(){
  	$("#inputUserID").val('false');
  }
</script>




<div class="container" style="margin-top:140px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<header class="card-header">
					<a href="${root }user/login" class="float-right btn btn-outline-info btn-sm mt-2">로그인</a>
					<h4 class="card-title mt-2">회원가입</h4>
				</header>
				<div class="card-body" style="background-color: #F7F7F7;">
					<div class="text-center">
						<a href="${root}"><img class="mb-4" src="${root }images/logo.png" height="75"></a>
					</div>
                    <form:form action="${root }user/join_proc" method="post" modelAttribute="joinUserDTO">
                    <form:hidden path="inputUserID" />
                    <div class="form-group" >
                    	<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-id-card"></i></span>
							</div>
	                      <form:input path="user_name" class="form-control" placeholder="이름"/>
						</div>
                      <small id="pwHelp" class="form-text text-muted">&nbsp* 이름은 다른 유저에게 노출되지 않습니다.</small>
                      <form:errors path="user_name" class="small" style="color:red;" />
                    </div>    
                    <div class="form-group" >
                      <div class="input-group">
                        <form:input path="user_id" class="form-control" placeholder="ID" onkeypress="resetinputUserID()"/>
                        <div class="input-group-append">
                          <button type="button" class="btn btn-secondary" onClick="checkID();">&nbsp<i class="fas fa-user-check"></i>&nbsp</button>
                        </div>
                      </div>
                      <form:errors path="user_id" class="small" style="color:red;" />
                    </div>                
                    <div class="form-group">
                    	<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
	                      <form:password path="user_pw" class="form-control" placeholder="비밀번호" />
						</div>
                      <small id="pwHelp" class="form-text text-muted">&nbsp* 숫자, 영문자 조합하여 최소 8자리</small>
                      <form:errors path="user_pw" class="small" style="color:red;" />
                    </div>                   
                    <div class="form-group">
                      <div class="input-group">
                       	<div class="input-group-prepend">
                          	<span class="input-group-text"><i class="fas fa-at"></i></span>
                       	</div>
	                    <form:input path="user_email" type="email" class="form-control" placeholder="useremail@email.com" />
                      </div>
                      <form:errors path="user_email" class="small" style="color:red;" />
                    </div>                   
                    <div class="form-group">
                      <div class="input-group">
                       	<div class="input-group-prepend">
                          	<span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
                       	</div>
	                    <form:input path="user_phone" class="form-control" placeholder="'-' 을 제외한 11자리 연락처" />
                      </div>
                      <form:errors path="user_phone" class="small" style="color:red;" />
                    </div>   
                    <hr>               
                    <div class="form-group text-right">
                        <form:button class="btn btn-success col-sm-3"><i class="fas fa-check"></i></form:button>
                    </div>                  
                    </form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>






</body>
</html>