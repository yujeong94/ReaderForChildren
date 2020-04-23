<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyerList</title>
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
	width: 150px;
}

.IDtd{
	width: 150px;
}

.ORDERtd{
	width: 250px;
}

.STATUStd{
	width: 200px;
}

.statusBtn {
	padding: 5px 10px; 
    box-shadow: none; 
    border: none; 
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    background: #85E82F;
    color: #0A1D6F;
}

.blinking{
	-webkit-animation:blink 0.4s ease-in-out infinite alternate;
    -moz-animation:blink 0.4s ease-in-out infinite alternate;
    animation:blink 0.4s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0.6;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0.6;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0.6;}
    100% {opacity:1;}
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
		<%@ include file="../common/adminMenubar.jsp" %>
		<div class="ap_content">
			<div id="title">구매자 리스트</div>
			<div class="search">
				<input type="text" class="searchInput" placeholder="아이디 입력">
				<button class="searchBtn"><img src="${ contextPath }/resources/images/search2.png" width="22px"></button>
			</div>
			<div class="tableDiv">
				<table class="listTable">
					<thead>
					<tr id="listTitle">
						<th class="NOtd fixedHeader">DATE</th>
						<th class="IDtd fixedHeader">ID</th>
						<th class="ORDERtd fixedHeader">ORDER</th>
						<th class="STATUStd fixedHeader">STATUS</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach begin="1" end="30" step="1" var="i">
						<tr>
							<td class="NOtd">2020-04-03</td>
							<td class="IDtd">user<c:out value="${ i }"/></td>
							<td class="ORDERtd">OR00<c:out value="${ i }"/></td>
							<td class="STATUStd">
								<button class="statusBtn blinking">배송접수</button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		/* $(function(){
			$('.listTable td').mouseover(function(){
				$(this).parent().css({'color':'#0FB07A', 'cursor':'pointer', 'font-weight':'bold'});
			}).mouseout(function(){
				$(this).parent().css({'color':'black','font-weight':'normal'});
			});
		}); */
		
			
			
			$('.statusBtn').click(function(){
				var status = $(this).parent().children(".statusBtn").text();
				console.log(status);
				
				if(status == '배송접수'){
					var check = confirm("접수하시겠습니까?");
					
					if(check){
						$(this).text("접수완료").css({'background':'#707171', 'color':'white'});
						$(this).parent().children(".statusBtn").removeClass('blinking');
					}
				}
				
			});
		
	</script>
	
</body>
</html>