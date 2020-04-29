<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menubar</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.menulist {
		height: 100%;
	    width: 0;
	    position: fixed;
	    z-index: 1;
	    top: 0;
	    right: 0;
	    background-color: white;
	    overflow-y: hidden;
	    transition: 0.5s;
	    padding-top: 60px;
	}
	.menulist a {
	    padding: 8px 8px 8px 30px;
	    text-decoration: none;
	    font-size: 20px;
	    color: #1C1C1C;
	    display: block;
	    transition: 0.3s;
	}
	/* .menulist  */.closeBtn {
	    position: absolute;
	    top: 0;
	    right: 25px;
	    font-size: 36px;
	    margin-left: 50px;
	}
#menuBtn {
		cursor : pointer;
	} 
	
	/*  */
/* #menuBtn {
  visibility: hidden;
}

label {
  width: 40px;
  height: 5px;
  border-radius: 5px;
  background: #191818;
  cursor: pointer;
  transition: .6s;
  position: fixed;
  top: 5%;
  right: 1%;
  /* margin-left: -50px;
  margin-top: -7.5px; */
}/*

/* label:before {
  content: "";
  width: 40px;
  height: 5px;
  background: #191818;
  position: absolute;
  transform: translateY(-12px);
  -webkit-transform: translateY(-12px);
  border-radius: 5px;
  -webkit-transition: .6s;
  transition: .6s;
}

label:after {
  content: "";
  width: 40px;
  height: 5px;
  background: #191818;
  position: absolute;
  transform: translateY(12px);
  -webkit-transform: translateY(12px);
  border-radius: 5px;
  transition: .6s;
  -webkit-transition: .6s;
}

#menuBtn:checked + label {
  width: 0;
}

#menuBtn:checked + label:before {
  transform: rotate(45deg) translate(0px);
  -webkit-transform: rotate(45deg) translate(0px);
}

#menuBtn:checked + label:after {
  transform: rotate(-45deg) translate(0px);
  -webkit-transform: rotate(-45deg) translate(0px);
} */
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<header>
      <div class = "mainheader clear-fix">
         <h2 class = "logo">
            <a href="${ contextPath }/index.jsp"><img src="${ contextPath }/resources/images/logo2.png" width = 130px height = 130px/></a>
         </h2>
         <ul class='util'>
         	<li><a href="${ contextPath }/calist.li"><img src = "${ contextPath }/resources/images/cart.png" width = 40px height = 40px ></a></li>
         	<!-- <li>
         		<input id="menuBtn" type="checkbox" onclick="openMenu();">
				<label for="menuBtn"></label>
			</li> -->
         	<li><img src = "${ contextPath }/resources/images/open-menu.png" width = 40px height = 40px id = "menuBtn" onclick="openMenu();"></li>
         </ul>
      </div>
     
      <c:url var="ablist" value="ablist.ab"/>
      <c:url var="splist" value="splist.sp"/>
      <c:url var="aulist" value="aulist.au"/>
       <c:url var="calist" value="calist.li"/>
      <div id="menuShow" class="menulist">
			<a href="#" class="closeBtn" onclick="closeMenu();">X</a>
			<a href="${ ablist }">오디오북 shop</a>
			<a href="${ splist }">아동 후원</a>
			<a href="${ contextPath }/volView.vo">봉사 일정</a>
			<a href="${ aulist }">Reader 오디션 지원</a>
			<a href="javascript:void(0)" id="recBtn">녹음부스 예약</a>
			<%-- <a href="${ contextPath }/recordView.re" id="recBtn">녹음부스 예약</a> --%>
			<a href="${ contextPath }/eventList.ev">진행 중인 이벤트</a>
			<a href="#">공지사항</a>
			<a href="${ contextPath }/chatView.ch">Q&A</a>
		</div>
   </header>
   <script>
	   function openMenu() {
		    document.getElementById("menuShow").style.width = "230px";
		}
	   function closeMenu() {
		    document.getElementById("menuShow").style.width = "0";
		}
	   
	   $(function(){
		  console.log("${ loginUser.division }") 
	   });
	   
	   $("#recBtn").click(function(){
		  	var userId = "${ loginUser.userId }";
			var division = "${ loginUser.division }";
			
			if(userId == "") {
				swal("로그인 후 이용해주세요.");
				location.href="home.do";
			} else if(division == "1") {
				swal("리더 회원만 예약할 수 있습니다.");
			} else {
				location.href="recordView.re";
			}
	   });
   </script>
</body>
</html>