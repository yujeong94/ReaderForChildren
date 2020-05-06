<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sponsorList</title>
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
	margin-bottom: 30px;
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
	width: 100px;
}

.IDtd{
	width: 150px;
}

.DATEtd{
	width: 200px;
}

.STATUStd{
	width: 250px;
}

.stuTd{
	font-size: 15px;
	vertical-align: middle;
}

/* 검색창 */
.search{
	height: 35px;
	width: 260px;
	border: 1px solid #77A687;
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
	background: #77A687;
	outline: none;
	float: right;
	color: white;
}

.borderTd{
	border-bottom: 1px solid #89978A;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 내용 -->
	<div class="contents">
		<%@ include file="../common/adminMenubar.jsp" %>
		<div class="ap_content">
			<div id="title">후원자 리스트</div>
			<div class="search">
				<input type="text" class="searchInput" placeholder="후원단체 입력" <c:if test="${ spName != null }">value=${ spName }</c:if>>
				<button class="searchBtn"><img src="${ contextPath }/resources/images/search2.png" width="22px"></button>
			</div>
			<div class="tableDiv">
				<table class="listTable">
					<thead>
					<tr id="listTitle">
						<th class="NOtd fixedHeader">No</th>
						<th class="IDtd fixedHeader">ID</th>
						<th class="DATEtd fixedHeader">Sponsor</th>
						<th class="STATUStd fixedHeader">Total Sponsorship</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${ !empty list }">
						<c:forEach var="s" items="${ list }" varStatus="c">
							<tr>
								<td class="NOtd borderTd">${ c.count }</td>
								<td class="IDtd borderTd">${ s.userId }</td>
								<td class="DATEtd borderTd">${ s.spName }</td>
								<td class="STATUStd stuTd borderTd">${ s.donation }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ empty list }">
						<tr>
							<td colspan="4">검색 결과가 없습니다.</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
	
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$('.searchBtn').click(function(){
			$(this).css('background','green');
			var spName = $('.searchInput').val().trim();
			
			location.href="sponsorSearch.ad?spName="+spName;
		});
		
	</script>
	
</body>
</html>