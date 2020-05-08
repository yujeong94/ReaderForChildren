<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.ap_menubar{
	display: inline-block;
	width: 249px;
	height: 100%;
	border-right: 2px solid lightgray;
	vertical-align: middle;
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
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
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
				<a href="${ contextPath }/eventWinner.ad" class="smallCategory">당첨자 추첨</a>
			</div>
		</div>
</body>
</html>