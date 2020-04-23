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

.listTable{
	margin: auto;
	font-size: 18px;
	text-align: center;
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

.borderTd{
	border-bottom: 1px solid black;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 내용 -->
	<div class="contents">
		<%@ include file="../common/adminMenubar.jsp" %>
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
					<c:if test="${ !empty list }">
						<c:forEach var="u" items="${ list }" varStatus="s">
							<tr>
								<td class="NOtd borderTd" id="bNo">${ s.count }</td>
								<td class="IDtd borderTd">${ u.userId }</td>
								<td class="NAMEtd borderTd">${ u.userName }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ empty list }">
						<tr>
							<td colspan="3">검색 결과가 없습니다.</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
	
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(function(){
			$('.listTable td').mouseover(function(){
				$(this).parent().css({'color':'#233C0B', 'background':'#E9EDE4', 'cursor':'pointer', 'font-weight':'bold'});
			}).mouseout(function(){
				$(this).parent().css({'color':'black', 'background':'none','font-weight':'normal'});
			}).click(function(){
				var userId = $(this).eq(0).text();
				
				location.href="userInfo.ad?userId="+userId;
			});
		});
		
		$('.searchBtn').click(function(){
			$(this).css('background','green');
			var searchUserId = $('.searchInput').val().trim();
			
			location.href="userSearch.ad?userId="+searchUserId;
		});
		
	</script>
	
</body>
</html>