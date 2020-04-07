<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auditionForm</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>
.contents {
	width: 1100px;
	height: 600px;
	background: white;
	margin: auto;
	margin-bottom: 100px;
}

.ap_menubar{
	display: inline-block;
	width: 249px;
	height: 100%;
	border-right: 2px solid lightgray;
	vertical-align: middle;
}

.ap_content{
	display: inline-block;
	width: 843px;
	height: 100%;
	vertical-align: middle;
}

#title {
	margin: 50px;
	margin-bottom:30px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

.menubarInDiv{
	margin-top: 30px;
}

.ap_menubar a {
	    text-decoration: none;
	    color: #1C1C1C;
	    display: block;
	    transition: 0.3s;
	}

.bigCategory{
	font-size: 25px; font-weight: bold;
	padding: 8px 8px 10px 30px;
}

.smallCategory{
	font-size: 16px;
	padding: 5px 8px 5px 30px;
}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 내용 -->
	<div class="contents">
		<div class="ap_menubar">
			<div class="menubarInDiv">
				<a href="#" class="bigCategory">회원 관리</a>
				<a href="${ contextPath }/userList.ad" class="smallCategory">전체 회원 리스트</a>
				<a href="${ contextPath }/buyerList.ad" class="smallCategory">구매자 리스트</a>
				<a href="${ contextPath }/sponsorList.ad" class="smallCategory">후원자 리스트</a>
				<a href="${ contextPath }/revenue.ad" class="smallCategory">전체 수익 현황</a>
				<br>
				<a href="#" class="bigCategory">오디션</a>
				<a href="${ contextPath }/auditionList.ad" class="smallCategory">지원자 리스트</a>
				<br>
				<a href="#" class="bigCategory">이벤트</a>
				<a href="${ contextPath }/eventInsert.ev" class="smallCategory">이벤트 등록</a>
				<a href="${ contextPath }/eventWinner.ad" class="smallCategory">당첨자 리스트</a>
			</div>
		</div>
		<div class="ap_content">
			<div id="title">지원서</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>