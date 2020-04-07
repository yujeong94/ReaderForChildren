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

.listTable{
	margin: auto;
	font-size: 18px;
	text-align: center;
	background: #E9EDE4;
}

.tableDiv{
	height: 420px;
	width: 760px;
	margin: auto;
	margin-bottom: 40px;
	overflow: auto;
}

#listTitle{
	font-weight: bold;
}

table > thead > tr > th {
	background: #233C0B;
	color: white;
	padding: 5px;
	font-size: 20px;
}

table > tbody > tr > td {
	padding: 4px;
}

/* .tableDiv::-webkit-scrollbar-thumb { background-color: pink; } */

.fixedHeader{
	position: sticky;
	top: 0;
}

.NOtd{
	width: 200px;
}

.IDtd{
	width: 250px;
}

.NAMEtd{
	width: 300px;
}

/* 검색창 */
.search{
	height: 35px;
	width: 260px;
	border: 1px solid #C6C618;
	margin-bottom: 10px;
	position: relative;
	left: 520px;
}

.searchInput{
	font-size: 12px;
	width: 180px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

.searchBtn{
	width: 45px;
	height: 100%;
	border: 0px;
	background: #C6C618;
	outline: none;
	float: right;
	color: white;
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
			<div id="title">전체 회원 리스트</div>
			<div class="search">
				<input type="text" class="searchInput" placeholder="아이디 입력">
				<button class="searchBtn"><img src="${ contextPath }/resources/images/search2.png" width="22px"></button>
			</div>
			<div class="tableDiv">
				<table class="listTable">
					<thead>
					<tr id="listTitle">
						<th class="NOtd fixedHeader">No</th>
						<th class="IDtd fixedHeader">ID</th>
						<th class="NAMEtd fixedHeader">NAME</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach begin="1" end="30" step="1" var="i">
						<tr>
							<td class="NOtd"><c:out value="${ i }"/></td>
							<td class="IDtd">user<c:out value="${ i }"/></td>
							<td class="NAMEtd">홍길동</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(function(){
			$('.listTable td').mouseover(function(){
				$(this).parent().css({'color':'#0FB07A', 'cursor':'pointer', 'font-weight':'bold'});
			}).mouseout(function(){
				$(this).parent().css({'color':'black','font-weight':'normal'});
			});
		});
	</script>
	
</body>
</html>