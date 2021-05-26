<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>어드레 감디</title>

<!-- Font awesome CDN -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<style>
   @font-face {
       font-family: 'Bazzi';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/Bazzi.woff') format('woff');
       font-weight: normal;
       font-style: normal;
      }
      
    body {
     font-family: 'Bazzi';
   }
   
  a {
     color : white;
     font-size: 25px;

  }
  
  a:hover{
       text-decoration: none;
       color:orange;
  }
  
  .wrapper {
     position: relative;
  }
  
  .wrapper .footer {
     position: absolute;
     bottom: 0;
     left: 0;
     background: rgba(000, 000, 000, 0.5);
     color: white;
     width: 100%;
     padding: 30px;
  }
  
  .footer h3, .footer h5{
  	color:#d3d3d3;
  }
  
  .wrapper .overview {
     position:absolute;
     top: 30%;
     left: 60%;
     color: white;
  }
  
  .wrapper .overview .button {
     display: block;
     height: 50px;
     font-size: 20px;
     border: 3px solid white;
     border-radius: 50px;
     text-align: center;
     line-height: 47px;
     margin-right:20px
  }
  
  .animate {
            animation-duration: 2s;
            animation-name: slideIn;
        }

        @keyframes slideIn {
            from {
                margin-left: 100%;
                width: 300%;
            }
            to {
                margin-left: 0%;
                width: 100%;
            }
        }
</style>
<body>
   
   <div class="wrapper">
      <img alt="" src="/images/jaje02.jpg" style="width: 100%; height: 100vh">
      <nav class="navbar navbar-expand-md navbar-white fixed-top" style="padding: 30px;">
         <a href="${root }" class="navbar-brand pr-5"><img src="${root }images/logo_2.png" style="height: 60px"></a>
         <div id="navMenu" class="collapse navbar-collapse">
            <ul class="navbar-nav">
               <li class="nav-item mr-3"><a class="nav-link" href="${root }spot/main">여행지</a></li>
               <li class="nav-item mr-3"><a class="nav-link" href="${root }schedule/list?page=1">여행일정</a></li>
               <li class="nav-item mr-3"><a class="nav-link" href="${root }together/list">같이가치</a></li>
               <li class="nav-item mr-3"><a class="nav-link" href="${root }freedom/list">자유게시판</a></li>
               <li class="nav-item mr-3"><a class="nav-link" href="${root }notice/list">공지사항</a></li>
            </ul>
          <ul class="navbar-nav ml-auto">
            <c:choose>
              <c:when test="${loginUserDTO.userLogin == true }">
                <li class="nav-item"><a href="${root }user/my_page"
                  class="nav-link">마이페이지</a></li>
                <li class="nav-item"><a href="${root }user/logout"
                  class="nav-link">로그아웃</a></li>
              </c:when>
              <c:otherwise>       
                <li class="nav-item"><a href="${root }user/login"
                  class="nav-link">로그인</a></li>
                <li class="nav-item"><a href="${root }user/join"
                  class="nav-link">회원가입</a></li>
              </c:otherwise>    
            </c:choose>
          </ul>
         </div>
      </nav>
      <div class="overview text-right">
         <h1 class="animate">어드레감디는...</h1>
         <h2 class="animate">"어디로 가느냐?"라는 뜻의 제주도 방언으로,<br> 제주도 여행에 대한 정보를 공유하는 커뮤니티입니다.</h2>
         <br>
         <a href="${root }schedule/list?page=1"><div class="button float-right" style="width:190px;">
         	<i class="fas fa-suitcase-rolling"></i>&nbsp나만의 일정 만들기</div></a>
         <a href="${root }spot/main"><div class="button float-right" style="width:180px;">
         	<i class="fas fa-plane"></i>&nbsp여행지 둘러보기</div></a>
      </div>
      <div class="footer">
         <h3>어드레감디?</h3>
         <h5>Copyright ⓒ 2021 ADREGAMDI. All rights reserved.</h5>
      </div>
   </div>
  
  
  
</body>
</html>