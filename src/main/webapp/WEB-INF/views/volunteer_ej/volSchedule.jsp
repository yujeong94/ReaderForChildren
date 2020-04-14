<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">

<link href='${ contextPath }/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='${ contextPath }/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<script src='${ contextPath }/fullcalendar/packages/core/main.js'></script>
<script src='${ contextPath }/fullcalendar/packages/daygrid/main.js'></script>
<script src='${ contextPath }/fullcalendar/packages/interaction/main.js'></script>


<style>
.contents {
   width: 1100px;
   height: 1100px;
   background: white;
   margin: auto;
   margin-bottom: 100px;
   padding: 20px;
}

#title {
   margin: 50px;
   text-align: center;
}
#calendar_div{
	height : 700px;
}

#calendar{
	width : 800px;
	height : 400px;
	margin-left : auto;
	margin-right: auto;
}

.fc-sat {color:#007dc3}
.fc-sun {color:#e31b23}

label{
	font-size : 15px;
}

#info{
	border-top : 3px solid gray;
	border-bottom : 3px solid gray;
	width : 74%;
	margin-right : auto;
	margin-left : auto;
	border-collapse: collapse;
	border-spacing: 0;
}

.info_title{
	width : 25%;
	height : 44px;
	border-top : 2px solid gray;
	margin-left : 10px;
	vertical-align : middle;
}

.right{
	width: 75%;
	border-top : 2px solid gray;
	vertical-align : middle;
}

.input_info{
	border-radius: 5px;
	border : 1px lightgray solid;
	height : 24px;
	width : 50%;
}

.title_word{
	margin-left : 10px;
	color : gray;
	font-size : 15px;
}

#submit_btn{
	width : 100%;
	height : 100%;
	font-weight : bold;
	border : solid 2px gray;
	background : white;
	cursor : pointer;
}

#btn_div{
	margin-top : 40px;
	margin-left :auto;
	margin-right :auto;
	width : 160px;
	height : 35px;
}

#detail{
	position : absolute;
	right : 14%;
	top : 30%;
}

</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
   
   <!-- 내용 -->
   <div class="contents">
      <div id="title"><h1>봉사 일정</h1></div>
   		<a href = "my_volunteer.jsp" target="_blank" onclick = "window.open(this.href,'','width = 800, height = 700'); return false;" ><img src = "${ contextPath }/resources/images/detail.png" width = 40px height = 40px id="detail"></a>
   		<div id = "calendar_div">
			<div  id="calendar"> </div>
   		</div>
   		
    	<div style = "float:right">
   			<button onclick = "addSchedule()">일정 등록</button>
   		</div>
		
 		<script>
			function addSchedule(){
				window.open("../WEB-INF/views/volunteer_ej/addScheduleForm.jsp","스케줄 등록","width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes")
			}
		</script>
		

		
		
		<div>
		<table id = "info">
		
			<tr>
		 		<td class = "info_title"><label class = "title_word">이름</label></td>
		 		<td class = "right"><label>${ loginUser.userName }</label></td>
		 	</tr>
	
		 	<tr>
		 		<td class = "info_title"><label class = "title_word">전화번호</label></td>
		 		<td class = "right right2"><input type = "text" class = "input_info" value = "${ loginUser.phone }"></td>
		 	</tr>
		
		</table>
   		</div>
   		
   		<div id ="btn_div">
	   		<input type = "button" id = "submit_btn" value = "봉사활동 신청">
   		</div>
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
</body>


<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'interaction','dayGrid' ],
        defaultView: 'dayGridMonth',
        selectable: true
      });
    
      
      calendar.addEvent( {'title':'어린이집 일일교사', 'start':'2020-04-10', 'end':'2020-04-10'});
      
      calendar.render();
    });
    
    function changeShipAdd(){
        var popLeft = Math.ceil(( window.screen.width - 650 )/2);
        var popTop = Math.ceil(( window.screen.height - 430 )/2);
        
        window.open("${contextPath}/views/ej/my_volunteer.jsp", "changeShipAdd", "width=650, height=430, "+ ", left=" + popLeft + ", top="+ popTop);
     }
    
</script>



</html>