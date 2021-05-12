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
      	if(result.trim() == 'true'){
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



  <!-- 상단 메뉴 부분 -->
<c:import url="/WEB-INF/view/include/header.jsp" />



<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
                    <form:form action="${root }user/join_proc" method="post" modelAttribute="joinUserDTO">
                    <form:hidden path="inputUserID" />
                    <div class="form-group" >
                      <form:label path="user_name">이름</form:label>
                      <form:input path="user_name" class="form-control" placeholder="한글 이름"/>
                      <form:errors path="user_name" style="color:red;" />
                    </div>    
                    <div class="form-group" >
                      <form:label path="user_id">아이디</form:label>
                      <div class="input-group">
                        <form:input path="user_id" class="form-control" onkeypress="resetinputUserID()"/>
                        <div class="input-group-append">
                          <button type="button" class="btn btn-success" onClick="checkID();">중복확인</button>
                        </div>
                      </div>
                      <form:errors path="user_id" style="color:red;" />
                    </div>                
                    <div class="form-group">
                      <form:label path="user_pw">비밀번호</form:label>
                      <form:password path="user_pw" class="form-control" />
                      <small id="pwHelp" class="form-text text-muted">* 숫자, 영문자 조합하여 최소 8자리</small>
                      <form:errors path="user_pw" style="color:red;" />
                    </div>                   
                    <div class="form-group">
                      <form:label path="user_email">이메일</form:label>
                      <form:input path="user_email" type="email" class="form-control" placeholder="email@email.com" />
                      <form:errors path="user_email" style="color:red;" />
                    </div>                   
                    <div class="form-group">
                      <form:label path="user_phone">연락처</form:label>
                      <form:input path="user_phone" class="form-control" placeholder="'-' 을 제외한 11자리" />
                      <form:errors path="user_phone" style="color:red;" />
                    </div>                  
                    <div class="form-group">
                      <div class="text-right">
                        <form:button class="btn btn-success">회원가입</form:button>
                      </div> 
                    </div>                  
                    </form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>



<!-- 하단 정보 -->  
<c:import url="/WEB-INF/view/include/footer.jsp" />



</body>
</html>