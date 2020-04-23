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
	margin: 40px;
	margin-bottom:30px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}


.listTable{
	margin: auto;
	font-size: 15px;
	text-align: center;
	background: #F6E3E3;
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
	background: #A73232;
	color: white;
	padding: 5px;
	font-size: 18px;
}

table > tbody > tr > td {
	padding: 4px;
}

/* .tableDiv::-webkit-scrollbar-thumb { background-color: pink; } */

.fixedHeader{
	position: sticky;
	top: 0;
}

.Datetd{
	width: 200px;
}

.Titletd{
	width: 350px;
}

.AnnDatetd{
	width: 100px;
}

.Replytd{
	width: 100px;
}

/* 검색창 */
.search{
	width: 160px;
	margin-bottom: 10px;
	position: relative;
	left: 625px;
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

#category{
	width: 160px;
	padding: .5em .5em;
	border: 1px solid #A73232;
	font-family: inherit;
	border-radius: 0px;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 내용 -->
	<div class="contents">
		<%@ include file="../common/adminMenubar.jsp" %>
		<div class="ap_content">
			<div id="title">이벤트 리스트</div>
			<div class="search">
				<select size="1" id="category" name="event_status">
					<option value="전체" selected>전체 이벤트</option>
					<option value="진행">진행 중인 이벤트</option>
					<option value="종료">종료된 이벤트</option>
				</select>
			</div>
			<div class="tableDiv">
				<table class="listTable">
					<thead>
					<tr id="listTitle">
						<th class="Datetd fixedHeader">기간</th>
						<th class="Titletd fixedHeader">제목</th>
						<th class="AnnDatetd fixedHeader">발표날짜</th>
						<th class="Replytd fixedHeader">상태</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach begin="1" end="30" step="1" var="i">
						<tr>
							<td>20.04.22~20.04.23</td>
							<td>스타벅스 기프티콘 증정 이벤트</td>
							<td>20.04.24</td>
							<td>진행중</td>
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
				$(this).parent().css({'color':'#390609', 'cursor':'pointer', 'font-weight':'bold'});
			}).mouseout(function(){
				$(this).parent().css({'color':'black','font-weight':'normal'});
			});
		});
	</script>
	
</body>
</html>