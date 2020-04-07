<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allUserList</title>
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
	margin: 70px;
	margin-bottom:50px;
	text-align: center;
	font-size: 45px;
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

#chooseDate{text-align:right; margin-bottom: 30px;}

.dateStyle{
	border-radius: 4px; vertical-align: middle; border: 1px solid #ced4da;
	padding: 0.5rem 0.6rem; font-size: 13px; width: 60px;
	position: relative; right: 120px;
}

.coin{
	margin: auto;
	text-align: center;
	
}

.tableStyle{
	margin: auto;
}

.totalCoin{
	font-size: 50px;
	font-weight: bold;
	padding: 15px;
	background: rgb(251, 231, 193);
}

.distribution{
	width: 200px;
	font-size: 20px;
	font-weight: bold;
	padding-top: 40px;
	padding-bottom: 10px;
}

.distriCoin{
	font-size: 25px;
	background: rgb(251, 249, 193);
	padding: 10px;
	border: 4px solid white;
}

.searchBtn{
	width: 35px;
	height: 100%;
	border: 0px;
	background: #C6C618;
	outline: none;
	vertical-align: middle;
	color: white;
	padding: 3px;
	border-radius: 4px;
	position: relative; right: 120px;
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
			<div id="title">전체 수익 현황</div>
			<div id="chooseDate">
				<input type="number" class="dateStyle dateYear" min="1900" max="2020" placeholder="연도">
				<input type="number" class="dateStyle dateMonth" min="1" max="12" placeholder="월">
				<button class="searchBtn"><img src="${ contextPath }/resources/images/search2.png" width="25px"></button>
			</div>
			<div class="coin">
				<table class="tableStyle">
					<tr>
						<td colspan="3" class="totalCoin">1,234,567,890</td>
					</tr>
					<tr>
						<td class="distribution">RFC</td>
						<td class="distribution">Reader</td>
						<td class="distribution">Sponsor</td>
					</tr>
					<tr>
						<td class="distriCoin">123,456,789</td>
						<td class="distriCoin">123,456,789</td>
						<td class="distriCoin">123,456,789</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>