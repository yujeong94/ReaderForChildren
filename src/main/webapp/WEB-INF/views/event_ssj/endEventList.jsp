<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../js/jquery-3.4.1.min.js"></script>
<title>endEventList</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>
.contents {
	width: 1100px;
	background: white;
	margin: auto;
	margin-bottom: 100px;
	padding: 20px;
	padding-bottom: 50px;
}

#title {
	margin: 50px;
	text-align: center;
}

.boxDiv {
	text-align: center;
}

.selectBox {
	display: inline-block;
	width: 410px;
	padding-top: 20px;
	padding-bottom: 20px;
	margin: 10px;
	margin-bottom: 20px;
	font-size: 20px;
	text-align: center;
	border: 1px solid black;
}

.eventBox {
	display: inline-block;
	width: 270px;
	height: 300px;
	margin: 9px;
	text-align: center;
}
.eventContent{
	width: 90%;
	text-align: left;
	margin: auto;
	margin-top: 7px;
}
.eventCount{
	width: 90%;
	text-align: left;
	margin: auto;
	margin-top: 10px;
}

.inputText{
	border: none;
}

/* #sbox1{
	background: rgb(241, 196, 15);
} */

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 내용 -->
	<div class="contents">
		<div id="title"><h1>EVENT</h1></div>
		<div class="boxDiv">
			<div class="selectBox" id="sbox1">진행중인 이벤트</div>
			<div class="selectBox" id="sbox2">이벤트 당첨자 발표</div>
		</div>
		<form action="#">
		<div class="boxDiv">
			<div class="eventBox" id="ebox1">
				<div class="eventImg">
					<img alt="#" src="${ contextPath }/resources/images/poster.jpg" width="90%">
				</div>
				<div class="eventContent">
					[당첨발표] 후원시 랜덤으로 스타벅스 기프티콘 증정
				</div>
				<div class="eventCount">
					조회수 : <input type="text" class="inputText" value="19220" readonly>
				</div>
			</div>
			<div class="eventBox" id="ebox2">
				<div class="eventImg">
						<img alt="#" src="${ contextPath }/resources/images/poster.jpg" width="90%">
					</div>
					<div class="eventContent">
						[당첨발표] 후원시 랜덤으로 스타벅스 기프티콘 증정
					</div>
					<div class="eventCount">
						조회수 : <input type="text" class="inputText" value="19220" readonly>
					</div>
				</div>
			<div class="eventBox" id="ebox3">
				<div class="eventImg">
					<img alt="#" src="${ contextPath }/resources/images/poster.jpg" width="90%">
				</div>
				<div class="eventContent">
					[당첨발표] 후원시 랜덤으로 스타벅스 기프티콘 증정
				</div>
				<div class="eventCount">
					조회수 : <input type="text" class="inputText" value="19220" readonly>
				</div>
			</div>
		</div>
		<div class="boxDiv">
			<div class="eventBox" id="ebox1">
				<div class="eventImg">
					<img alt="#" src="${ contextPath }/resources/images/poster.jpg" width="90%">
				</div>
				<div class="eventContent">
					[당첨발표] 후원시 랜덤으로 스타벅스 기프티콘 증정
				</div>
				<div class="eventCount">
					조회수 : <input type="text" class="inputText" value="19220" readonly>
				</div>
			</div>
			<div class="eventBox" id="ebox2">
				<div class="eventImg">
						<img alt="#" src="${ contextPath }/resources/images/poster.jpg" width="90%">
					</div>
					<div class="eventContent">
						[당첨발표] 후원시 랜덤으로 스타벅스 기프티콘 증정
					</div>
					<div class="eventCount">
						조회수 : <input type="text" class="inputText" value="19220" readonly>
					</div>
				</div>
			<div class="eventBox" id="ebox3">
				<div class="eventImg">
					<img alt="#" src="${ contextPath }/resources/images/poster.jpg" width="90%">
				</div>
				<div class="eventContent">
					[당첨발표] 후원시 랜덤으로 스타벅스 기프티콘 증정
				</div>
				<div class="eventCount">
					조회수 : <input type="text" class="inputText" value="19220" readonly>
				</div>
			</div>
		</div>
		</form>
	</div>

	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(function(){
			$('.selectBox').mouseover(function(){
				$(this).css('background', 'rgb(241, 196, 15)');
			}).mouseout(function(){
				$(this).css('background', 'none');
			});
			
		});
	</script>
	
</body>
</html>