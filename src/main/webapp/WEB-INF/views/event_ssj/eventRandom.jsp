<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Lato|Roboto:400,900' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<title>Insert title here</title>
<style>
body{
	text-align: center;
	background: white;
}

.title{
	font-size: 30px;
	font-weight: bold;
	margin: 20px;
}

.content{
	font-size: 15px;
}

.winnerTable{
	text-align: center;
	margin: auto;
	/* position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%); */
	margin-top: 110px;
}

.inTableTH{
	border-bottom: 1px solid gray;
	padding: 4px;
	padding-left: 10px;
	padding-right: 10px;
	font-size: 18px;
}

.inTableTD{
	font-size: 15px;
}

.tfootTD{
	padding-top: 15px;
}

/* button css */
/* body {
	width: 100%;
	height: 100%;
	position: relative;
	overflow: hidden;
	background-blend-mode: luminosity;
} */
.container {
	position: absolute;
	top: 15%;
	left: 50%;
	transform: translate(-50%, -50%);
}
.btn {
	margin-top: calc(50% + 25px);
	position: relative;
	display: inline-block;
	width: 277px;
	height: 50px;
	font-size: 1em;
	font-weight: bold;
	line-height: 60px;
	text-align: center;
	text-transform: uppercase;
	background-color: transparent;
	cursor: pointer;
	text-decoration: none;
	font-family: 'Roboto', sans-serif;
	font-weight: 900;
	font-size: 17px;
	letter-spacing: 0.045em;
}
.btn svg {
	position: absolute;
	top: 0;
	left: 0;
}
.btn svg rect {
	stroke-width: 4;
	stroke-dasharray: 353, 0;
	stroke-dashoffset: 0;
	-webkit-transition: all 600ms ease;
	transition: all 600ms ease;
}
.btn span {
	background: rgb(255, 130, 130);
	background: -moz-linear-gradient(left, rgba(255, 130, 130, 1) 0%, rgba(225, 120, 237, 1) 100%);
	background: -webkit-linear-gradient(left, rgba(255, 130, 130, 1) 0%, rgba(225, 120, 237, 1) 100%);
	background: linear-gradient(to right, rgba(255, 130, 130, 1) 0%, rgba(225, 120, 237, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#ff8282', endColorstr='#e178ed', GradientType=1);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}
.btn:hover svg rect {
	stroke-width: 4;
	stroke-dasharray: 196, 543;
	stroke-dashoffset: 437;
}


</style>
</head>
<body>
	<div class="title">${ event.eTitle }</div>
	<div class="content">당첨자 수 : ${ event.eEventNum } &nbsp;&nbsp;&nbsp; 댓글 수 : ${ reply }</div>
	<div class="container">
		<a class="btn"> 
			<svg width="277" height="62">
	    		<defs>
	        		<linearGradient id="grad1">
	            		<stop offset="0%" stop-color="#FF8282" />
	            		<stop offset="100%" stop-color="#E178ED" />
	        		/linearGradient>
	    		</defs>
	   			<rect x="5" y="5" rx="25" fill="none" stroke="url(#grad1)" width="266" height="50"></rect>
	  		</svg> 
	  		<span>당첨자를 추첨해주세요!</span>
		</a>
	</div>
	<table class="winnerTable">
		<thead>
			<tr>
				<th class="inTableTH inTableid">회원 아이디</th>
				<th class="inTableTH inTablename">회원 이름</th>
				<th class="inTableTH inTablephone">휴대폰끝4자리</th>
			</tr>
		</thead>
		<tbody>
			<tr><td colspan=3 class="inTableTD">추첨 전</td></tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan=3 class="tfootTD"><input type="button" class="defaultBtn delBtn btn1" id="close" value="닫기"></td>
			</tr>
		</tfoot>
	</table>

	<script>
		$('a').on('click', function() {
			var eNum = ${ event.eNum };
			var eEventNum = ${ event.eEventNum };
			console.log("eNum : " + eNum);
			$.ajax({
				url: "eventRandomInsert.ev",
				data: {eNum:eNum, eEventNum:eEventNum},
				type: "post",
				success: function(data) {
					if(data > 0){
						getEventWinner();
						$('a').off('click');
					}
					
				}
			});
		});
		
		function getEventWinner(){
			var eNum = ${ event.eNum };
			
			console.log("getEventWinner eNum : " + eNum);
			console.log("type " +typeof(eNum));
			
			$.ajax({
				url: "eventWinnerRandom.ev",
				data: {eNum:eNum},
				dataType: "json",
				success: function(data) {
					$tableBody = $('.winnerTable tbody');
					$tableBody.html('');
					
					var $tr;
					
					if(data.length > 0){
						for(var i in data){
							$tr = $(
							'<tr><td class="inTableTD">'+ data[i].userId + 
							'</td><td class="inTableTD">'+ decodeURIComponent(data[i].userName)+
							'</td><td class="inTableTD">'+ decodeURIComponent(data[i].phone) + 
							'</td></tr>'
							);
							$tableBody.append($tr);
						}
					}
				},
				error: function(data){
					console.log("getEventWinner 실패");
				}
			});
		}
		
		$('#close').on('click', function(){
			opener.document.location.reload();
			window.close();
		});
	</script>
	
</body>
</html>