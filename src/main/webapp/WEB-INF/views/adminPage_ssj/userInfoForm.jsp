<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userInfoForm</title>
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
	margin: 14px;
	text-align: center;
	font-size: 25px;
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

.tableBIG{
	width: 90%;
	border-top: 1px solid lightgray;
	border-collapse: collapse;
	font-size: 15px;
	margin: auto;
}

td{
	border-bottom: 1px solid lightgray;
}

.firstTD{
	width: 95px;
	font-weight: bold;
	padding: 7px;
}
.secondTD{
	width: 256.4px;
}

.readerTableDiv{
	height: 140px;
	width: 760px;
	margin: auto;
	margin-top: 20px;
	overflow: auto;
}

.listTable{
	margin: auto;
	font-size: 13px;
	text-align: center;
}

#listTitle{
	font-weight: bold;
}

table > thead > tr > th {
	background: gray;
	color: white;
	padding: 5px;
	font-size: 15px;
}

table > tbody > tr > td {
	padding: 4px;
}

.fixedHeader{
	position: sticky;
	top: 0;
}

.NOtd{
	width: 100px;
}

.IDtd{
	width: 250px;
}

.DATEtd{
	width: 200px;
}

.STATUStd{
	width: 150px;
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
				<a href="${ contextPath }/eventWinner.ev" class="smallCategory">당첨자 리스트</a>
			</div>
		</div>
		<div class="ap_content">
			<div id="title">회원 정보</div>
			<div class="tableDiv">
				<table class="tableBIG">
					<tr>
						<td class="firstTD">아이디</td>
						<td class="secondTD">${ member.userId }</td>
						<td class="firstTD">회원 분류</td>
						<td class="secondTD">
							<c:if test="${ member.division == 1 }">
								일반회원
							</c:if>
							<c:if test="${ member.division == 2 }">
								리더
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="firstTD">이름</td>
						<td class="secondTD">${ member.userName }</td>
						<td class="firstTD">성별</td>
						<td class="secondTD">${ member.gender }</td>
					</tr>
					<tr>
						<td class="firstTD">전화번호</td>
						<td class="secondTD">${ member.phone }</td>
						<td class="firstTD">생년월일</td>
						<td class="secondTD">${ member.birth }</td>
					</tr>
					<tr>
						<td class="firstTD">이메일</td>
						<td class="thirdTD" colspan="3">${ member.email }</td>
					</tr>
					<tr>
						<td class="firstTD">주소</td>
						<td class="thirdTD" colspan="3">(${ member.postalCode }) ${ member.bAddress } ${member.lAddress }</td>
					</tr>
					<tr>
						<td class="firstTD">포인트</td>
						<td class="secondTD">500 point</td>
						<td class="firstTD">후원 금액</td>
						<td class="secondTD">${ member.donation } 원</td>
					</tr>
				</table>
				<div class="readerTableDiv">
					<table class="listTable">
						<thead>
						<tr id="listTitle">
							<th class="NOtd fixedHeader">No</th>
							<th class="IDtd fixedHeader">오디오 북 코드</th>
							<th class="DATEtd fixedHeader">날짜</th>
							<th class="STATUStd fixedHeader">수익</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach begin="1" end="10" step="1" var="i">
							<tr>
								<td class="NOtd"><c:out value="${ i }"/></td>
								<td class="IDtd">Reader for Children BOOK</td>
								<td class="DATEtd">2020-04-03</td>
								<td class="STATUStd stuTd">50,000</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="readerTableDiv">
					<table class="listTable">
						<thead>
						<tr id="listTitle">
							<th class="NOtd fixedHeader">No</th>
							<th class="IDtd fixedHeader">후원 단체</th>
							<th class="DATEtd fixedHeader">날짜</th>
							<th class="STATUStd fixedHeader">기부 금액</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach begin="1" end="10" step="1" var="i">
							<tr>
								<td class="NOtd"><c:out value="${ i }"/></td>
								<td class="IDtd">유니세프</td>
								<td class="DATEtd">2020-04-03</td>
								<td class="STATUStd stuTd">50,000</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>