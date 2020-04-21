<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menubar</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
         	<li><a href="${ contextPath }/userList.ad"><img src = "${ contextPath }/resources/images/cart.png" width = 40px height = 40px></a></li>
         	<li><img src = "${ contextPath }/resources/images/open-menu.png" width = 40px height = 40px id = "menuBtn" onclick="openMenu();"></li>
         </ul>
      </div>
      
      <c:url var="ablist" value="ablist.ab"/>
      <c:url var="splist" value="splist.sp"/>
      <c:url var="aulist" value="aulist.au"/>
      
      <div id="menuShow" class="menulist">
			<a href="#" class="closeBtn" onclick="closeMenu();">X</a>
			<a href="${ ablist }">오디오북 shop</a>
			<a href="${ splist }">아동 후원</a>
			<a href="${ contextPath }/volView.vo">봉사 일정</a>
			<a href="${ aulist }">Reader 오디션 지원</a>
			<a href="${ contextPath }/recordView.re">녹음부스 예약</a>
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
   </script>
</body>
</html>