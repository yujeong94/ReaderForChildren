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

.readerTableDiv1{
	height: 300px;
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
		<%@ include file="../common/adminMenubar.jsp" %>
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
				</table>
				<c:if test="${ member.division == 2 }">
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
						<c:if test="${ !empty support }">
							<c:forEach var="s" items="${ support }" varStatus="c">
								<tr>
									<td class="NOtd">${ c.count }</td>
									<td class="IDtd">${ s.spName }</td>
									<td class="DATEtd">${ s.supdate }</td>
									<td class="STATUStd stuTd">${ s.donation }</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${ empty support }">
							<tr>
								<td colspan=4>후원 기록이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						</tbody>
					</table>
				</div>
				</c:if>
				<c:if test="${ member.division == 1 }">
				<div class="readerTableDiv1">
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
						<c:if test="${ !empty support }">
							<c:forEach var="s" items="${ support }" varStatus="c">
								<tr>
									<td class="NOtd">${ c.count }</td>
									<td class="IDtd">${ s.spName }</td>
									<td class="DATEtd">${ s.supdate }</td>
									<td class="STATUStd stuTd">${ s.donation }</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${ empty support }">
							<tr>
								<td colspan=4>후원 기록이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						</tbody>
					</table>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>