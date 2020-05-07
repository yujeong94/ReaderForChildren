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

	body{
		background : #ffe478;
	}
	
	#info{
		
		width : 525px;
		margin-left : 20px;
	}
	
	#calendar_title{
		width : 400px;
	}

	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; }
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: blue; }
	.ui-datepicker{ font-size: 12px; width: 160px; }
	.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
	.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
	
	#saveBtn{
		border : 0px;
		border-radius : 4px;
		cursor : pointer;
		width : 100px;
		height : 30px;
		background : #F06250;
		color : white;
		font-weight : bold;
		margin-top : 20px;
		margin-left : 420px;
	}
	
	.right{
		margin-left : 20px;
		border-radius : 2px;
		border : 1px solid gray;
	}
</style>
</head>


<body>
	
	<form action = "addVolSchedule.vo" method = "post">
	<div id = "form1">
		
			<table id = "info">
				<tr>
					<td id = "td1"><b>일정 명칭</b></td>
					<td id = "td2"><input type ='text' class = "right" id='calendar_title' name = "volContent"></td>
				</tr>
				<tr>
					<td><b>시작 날짜</b></td>
					<td><input type ='text' class = "right" id='start_date' name = "volStart" style='width:80px'></td>
				</tr>
				<tr>
					<td><b>마감 날짜</b></td>
					<td><input type ='text' class = "right" id='end_date' name = "volEnd" style='width:80px'></td>
				</tr>
				<tr>
					<td><b>모집 인원</b></td>
					<td><input type ='number' class = "right" id='max' name = "volMax" style='width:80px'></td>
				</tr>
			</table>
			
			<button onclick='saveSchedule();' id = "saveBtn">저장하기</button>
	</div>
	</form>
	
	<script>
	
		$(function(){
			if('${result}' != ''){
				alert('등록이 완료되었습니다.');
				opener.document.location.reload();
				self.close();
			}
		});
		
	</script>
	
	
	
	<script>
	
	
		$(function(){
			$("#start_date").datepicker({
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    showMonthAfterYear:true,
			    yearSuffix: "년",
			    showOn:'button',
			    buttonImage : '${ contextPath }/resources/images/calendar.png',
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
			    showOn:'button',
			    buttonImage : '${ contextPath }/resources/images/calendar.png',
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