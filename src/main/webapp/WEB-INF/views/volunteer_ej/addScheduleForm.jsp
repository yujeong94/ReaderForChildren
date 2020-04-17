<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<style>
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; }
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: blue; }
</style>
</head>
<body>
	
	<form action = "addVolSchedule.vo" method = "post">
	<div style = 'width : 100%; height : 30px'>
		<div style = 'width:30%; float:left; padding-left:30px'>일정 명칭</div>
		<div style='width:60%; float:right'><input type ='text' id='calendar_title' name = "volContent"></div>
	</div>
	
	<div style = 'width : 100%; height : 30px'>
		<div style = 'width:30%; float:left; padding-left:30px'>시작 날짜</div>
		<div style='width:60%; float:right'><input type ='text' id='start_date' name = "volStart" style='width:80px'></div>
	</div>
	
	<div style = 'width : 100%; height : 30px'>
		<div style = 'width:30%; float:left; padding-left:30px'>마감 날짜</div>
		<div style='width:60%; float:right'><input type ='text' id='end_date' name = "volEnd" style='width:80px'></div>
	</div>
	
	<div>
		<div style = 'width:30%; float:left; padding-left:30px'>모집 인원</div>
		<div style='width:60%; float:right'><input type ='number' id='max' name = "volMax" style='width:80px'></div>
	</div>
	
	<div style = 'width : 100%; text-align:center; height : 30px; margin-bottom:15px; margin-top:10px'>
		<button onclick='saveSchedule();'>저장하기</button>
	</div>
	
	</form>
	
	<script>
		function saveSchedule(){
			window.close();
		}
	</script>
	
	
	
	<script>
		$(function(){
			$("#start_date").datepicker({
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    showMonthAfterYear:true,
			    yearSuffix: "년",
				dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
				dayNamesMin : ['일','월','화','수','목','금','토'],
				dateFormat : "yy-mm-dd",
				prevText : '이전 달',
				nextText : '다음 달',
				minDate : 0,
				onClose : function(selectDate) {
					$('#end_date').datepicker('option','minDate',selectDate);
				}
			});
		});
		
		$(function(){
			$("#end_date").datepicker({
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    showMonthAfterYear:true,
			    yearSuffix: "년",
				dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
				dayNamesMin : ['일','월','화','수','목','금','토'],
				dateFormat : "yy-mm-dd",
				minDate : 0,
				prevText : '이전 달',
				nextText : '다음 달',
				
			});
		});
	</script>
	
	
</body>
</html>