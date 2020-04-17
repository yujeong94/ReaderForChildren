<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../js/jquery-3.4.1.min.js"></script>
<title>eventList</title>
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

.boxDiv1{
	text-align: center;
}

.boxDiv2 {
	width: 874px;
	position: relative;
	left : 115px;
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
	height: 340px;
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
		<div class="boxDiv1">
			<div class="selectBox" id="sbox1">진행중인 이벤트</div>
			<div class="selectBox" id="sbox2">이벤트 당첨자 발표</div>
		</div>
		<form action="#">
			<div class="boxDiv2">
			<c:forEach var="e" items="${ event }">
				<div class="eventBox" id="ebox1">
					<input type="hidden" class="hiddenEventNo" value="${ e.eNum }">
					<div class="eventImg">
						<img alt="#" src="${ contextPath }/resources/uploadFiles/${ e.changeName }" width="240px" height="240px">
					</div>
					<div class="eventContent">
						[EVENT] ${ e.eTitle }
					</div>
					<div class="eventCount">
						조회수 : ${ e.eCount }
					</div>
				</div>
			</c:forEach>
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
			
			$('#sbox2').click(function(){
				location.href="eventEndList.ev";
			});
			
			$('#sbox1').click(function(){
				location.href="eventList.ev";
			});
			
			$('.eventBox').mouseover(function(){
				$(this).css('background','#F7F7D0');
			}).mouseout(function(){
				$(this).css('background','none');
			}).click(function(){
				var eventNum = $(this).children('input').val();
				location.href="eventDetail.ev?eNum="+eventNum;
			});
		});
		
	</script>
	
</body>
</html>