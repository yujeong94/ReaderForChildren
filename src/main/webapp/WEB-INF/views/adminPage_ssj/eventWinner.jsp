<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

.Numtd{
	width: 80px;
}

.Datetd{
	width: 180px;
}

.Titletd{
	width: 300px;
}

.AnnDatetd{
	width: 100px;
}

.Replytd{
	width: 90px;
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
					<option value="전체" <c:if test="${ selectbox == '전체' }">selected</c:if>>전체 이벤트</option>
					<option value="진행" <c:if test="${ selectbox == '진행' }">selected</c:if>>진행 중인 이벤트</option>
					<option value="종료" <c:if test="${ selectbox == '종료' }">selected</c:if>>종료된 이벤트</option>
				</select>
			</div>
			<div class="tableDiv">
				<table class="listTable">
					<thead>
					<tr id="listTitle">
						<th class="Numtd fixedHeader">번호</th>
						<th class="Datetd fixedHeader">기간</th>
						<th class="Titletd fixedHeader">제목</th>
						<th class="AnnDatetd fixedHeader">발표날짜</th>
						<th class="Replytd fixedHeader">상태</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${ !empty list }">
						<c:forEach var="w" items="${ list }">
							<tr>
								<td>${ w.eNum }</td>
								<td>
									<fmt:formatDate value="${ w.eStart }" pattern="yy.MM.dd"/>
									~
									<fmt:formatDate value="${ w.eEnd }" pattern="yy.MM.dd"/>
								</td>
								<td>${ w.eTitle }</td>
								<td>
									<fmt:formatDate value="${ w.eAnno }" pattern="yy.MM.dd"/>
								</td>
								<td class="status">
									<jsp:useBean id="now" class="java.util.Date"/>
									<fmt:formatDate value="${ now }" pattern="yyyyMMdd" var="nowDate"/>
									<fmt:formatDate value="${ w.eEnd }" pattern="yyyyMMdd" var="closeDate"/>
									<c:choose>
										<c:when test="${ w.eDivision == 2 }">완료</c:when>
										<c:when test="${ w.eDivision == 1 && nowDate > closeDate }">추첨대기</c:when>
										<c:otherwise>진행중</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ empty list }">
						<tr>
							<td colspan="4">등록된 이벤트가 없습니다.</td>
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
				$(this).parent().css({'color':'#390609', 'cursor':'pointer', 'font-weight':'bold'});
			}).mouseout(function(){
				$(this).parent().css({'color':'black','font-weight':'normal'});
			}).click(function(){
				var eNum = $(this).parent().children().eq(0).text();
				var status = $(this).parent().children('.status').text();
				var trimStatus = status.trim();
				
				if(trimStatus == "진행중"){
					location.href="eventDetail.ev?eNum=" + eNum;
				} else if(trimStatus == "완료"){
					location.href="eventEndDetail.ev?eNum=" + eNum;
				} else{
					window.open("eventRandom.ev?eNum=" + eNum, "eventRandom", "width=600, height=500");
				}
			});
			
			
			$('#category').change(function(){
				var selectbox = $(this).val();
				
				location.href="eventListSelect.ad?selectbox=" + selectbox;
			});
			
		});
	</script>
	
</body>
</html>