<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Reader For Children</title>
<link rel="stylesheet" href="resources/css/common.css">
<style>
	table { margin-left : 50px; margin-bottom : 10px;}
	th { width : 100px; height : 50px; font-weight : bold; font-size : 14px; }
	#joinBtn,#loginBtn { float : right; font-size : 12px; }
	#joinBtn { margin-left : 10px; background : #848484; }
	#loginBtn { background : #2E2E2E; }
	#findId,#findPwd { margin-top : 10px; float : right; cursor : pointer; font-weight : bold; }
	#findId { margin-right : 10px;}
	
	#welcome{
		font-weight : bold;
		font-size : 25px;
		margin-top : 500px;
	}
	
	.loginMenu{
		font-size : 15px;
		text-align : right;
		font-weight : bold;
		color : brown;
		padding-top: 10px;
	}	
a:link { color: yellowgreen; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { text-decoration: none; cursor : pointer;}
#namehover:hover{color:yellowgreen;}

#a123{
	margin-top: 60px;
}

.home_contents{
	height: 550px;
	margin-top: 0px;
}

#homeDiv{
	padding-top: 320px;
}
	
	#logoutBtn{
      text-decoration: none;
      color : black;
      padding:5px 10px 5px 10px;
      font-size : 10px;
      margin-top : 10px;
      display:inline-block;
      border-radius: 5px;
      background-color: white;
    }
    
    
    /*  */

.arrowDiv{
	display: inline-block;
	margin: 10px;
	margin-top: 300px;
}

 #slider {
 	position: relative;
 	left: 300px;
 	height: 550px;
 	display: inline-block;
 }   
    .mySlides {display: none}
    
    
.sImg {vertical-align: middle; width: 600px; height: 450px;}

/* Slideshow container */
.slideshow-container {
  max-width: 600px;
  /* position: absolute; */
  margin-top: 10px;
  display: inline-block;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  /* position: absolute;
  top: 70%; */
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: black;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 200px;
  border-radius: 3px;
}

.prev {
	left: 600px;
	border-radius: 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  /* background-color: rgba(0,0,0,0.8); */
  background-color: yellow;
}

/* Caption text */
/* .text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center; */
} 

/* Number text (1/3 etc) */
.numbertext { 
  
 } 

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.dotDiv{
	text-align:center;
	margin-top: 10px;
}

.active, .dot:hover {
  background-color: white;
}
    

</style>
</head>
<body>
<div class="outer">
	<jsp:include page="common/menubar.jsp"/>
	<div class="home_contents">
		<div id="homeDiv" style="float: left;">
		<c:if test="${ empty sessionScope.loginUser && empty sessionScope.adminUser }">	
			<form class="home_login" action="login.me" method="post" id = "goLogin">
				<table>
				<tr>
					<th>ID</th>
					<td><input type="text" id="inputId" name="userId"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" id="inputPwd" name="userPwd"></td>
				</tr>
				</table>
				<div class="btnBox">
					<button type="button" class="defaultBtn" id="joinBtn" onclick="location.href='join.me'">Join</button>
					<button class="defaultBtn" id="loginBtn">Login</button>
					<br clear="all">
					<span id="findPwd" onclick="location.href='pwdView.me'">Find Password</span>
					<span type="button" id="findId" onclick="location.href='idView.me'">Find ID</span>
				</div>
			</form>
			<script>
			$('#loginBtn').click(function(){
				if($('#inputId').val() == 'admin'){
					$('#goLogin').attr("action","loginAdmin.ad");
				}else{
					$('#goLogin').submit();
				}
			})
			</script>
		</c:if>
		
		<c:if test="${ !empty sessionScope.loginUser || !empty sessionScope.adminUser }">
			<table id = "a123">
				<tr>
					<c:if test = "${ !empty sessionScope.loginUser }">
					<td colspan = '2'><label id = "welcome"><a href = "myinfo.me" id = "logincu"><span id = "namehover">${ sessionScope.loginUser.userName }</span></a>님 환영합니다.</label></td>
					</c:if>
					<c:if test = "${ !empty sessionScope.adminUser }">
					<td colspan = '2'><label id = "welcome"><a href = "myinfo.me" id = "logincu"><span id = "namehover">${ sessionScope.adminUser.userName }</span></a>님 환영합니다.</label></td>
					</c:if>
				</tr>
				<tr>
					<td class = "loginMenu"><a id = "logoutBtn" >로그아웃</a></td>
				</tr>
			</table>
		</c:if>
		</div>
		<!-- 시작 -->
		
		
		
		<div id="slider">
		
		<div class="arrowDiv"><a class="prev" onclick="plusSlides(-1)">&#10094;</a></div>
<div class="slideshow-container">

	<div class="mySlides fade">
	  <!-- <div class="numbertext">1 / 3</div> -->
	  <img src="${ contextPath }/resources/images/slide1.jpg" class="sImg">
	  <!-- <div class="text">Caption Text</div> -->
	</div>
	
	<div class="mySlides fade">
	  <div class="numbertext">2 / 3</div>
	  <img src="${ contextPath }/resources/uploadFiles/20200421223319.png" onclick="location.href='eventDetail.ev?eNum=4'" class="sImg">

	</div>
	
	<div class="mySlides fade">
	  <!-- <div class="numbertext">3 / 3</div> -->
	  <!-- <img src="http://placehold.it/300x100" class="sImg"> -->
	  <div class="sImg" style="background: white;">
	  	합격자를 발표합니다!!!!!!! gogo!!! <button onclick="location.href='passView.au'">눌러주세요</button>
	  </div>
	</div>

</div>
<div class="arrowDiv"><a class="next" onclick="plusSlides(1)">&#10095;</a></div>
<br>

<div class="dotDiv">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>
</div>
		<!-- 끝 -->
		
		
		
		
		<br clear="both">
	</div>
	<jsp:include page="common/footer.jsp"/>
</div>

<script>
	$(function(){
		if("${ adminUser.userId }" == "admin"){
			$('#logincu').prop('href', "userList.ad");
			
			$('#logoutBtn').click(function(){
				var an = confirm("로그아웃 하시겠습니까?");
				if(an){
					location.href='logout.ad';
				}else{
					return false;
				}
			});
		}else{
			$('#logoutBtn').click(function(){
				var an = confirm("로그아웃 하시겠습니까?");
				if(an){
					location.href='logout.me';
				}else{
					return false;
				}
			})
		}
	});

</script>



<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

</body>
</html>
