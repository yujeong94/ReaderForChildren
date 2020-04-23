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
   		<a href = "myVolunteer.vo" target="_blank" onclick = "window.open(this.href,'','width = 800, height = 700'); return false;" ><img src = "${ contextPath }/resources/images/detail.png" width = 40px height = 40px id="detail"></a>
   		<div id = "calendar_div">
			<div  id="calendar"> </div>
   		</div>
   		
    	<div style = "float:right">
   			<button onclick = "addSchedule()">일정 등록</button>
   		</div>
		
 		<script>
			function addSchedule(){
				/* window.open("${ contextPath }/volunteer_ej/addScheduleForm.jsp","스케줄 등록","width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes") */
				window.open("addSchForm.vo","스케줄등록","width=800, height=700");
			}
		</script>
		
		
	<form action = "submitInform.vo"  method="post" id = "submitInform" >
		<div>
		<input type = "hidden" id = "schedule" name = "schedule" >
		<input type = "hidden" id = "eventNum" name = "vlNum2" >
		<table id = "info">
			
			
				<tr id = "tr2" style = "display:none">
			 		<td class = "info_title"><label class = "title_word">활동</label></td>
			 		<td class = "right"><label id="schedule2"></label></td>

			 	</tr>
				<tr>
			 		<td class = "info_title"><label class = "title_word">이름</label></td>
			 		<td class = "right">
			 			<label>${ loginUser.userName }</label>
			 			<input type = "hidden" id = "userID" name = "userName" value="${ loginUser.userName }">
			 		</td>
			 	</tr>
		
			 	<tr>
			 		<td class = "info_title"><label class = "title_word">전화번호</label></td>
			 		<td class = "right right2"><input type = "text" class = "input_info" name = "vlPhone" value = "${ loginUser.phone }"></td>
			 	</tr>
		</table>
   		</div>
	
   		<div id ="btn_div">
	   		<input type = "button" id = "submit_btn" value = "봉사활동 신청">
   		</div>
   	</form>
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
</body>


<script>
	$('#submit_btn').click(function(){
		if($('#schedule').val() == ""){
			alert("지원하실 봉사할동을 클릭해주세요");
			return false;
		}else{
			var result = confirm($('#schedule').val()+"\n선택하신 봉사활동에 정말 신청하시겠습니까?");
			if(result){
				var vlNum2 = $('#eventNum').val();
				
				$.ajax({
					type : "POST",
					url : 'checkDate.vo',
					data : {vlNum2 : vlNum2},
					success : function(data){
						if(data == "true"){
							alert("날짜를 확인해주세요");
						}else{
							$.ajax({
								type : "POST",
								url : 'checkDe.vo',
								data : {vlNum2 : vlNum2},
								success : function(data){
									if(data == "true"){
										alert("이미 신청하신 봉사활동입니다.");
									}else{
										$('#submitInform').submit();
									}
								}
							});
						}
					}
				});
				
			}else{
				return false;
			}
		}
	});
</script>




<script>
	
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'interaction','dayGrid'],
        defaultView: 'dayGridMonth',
        selectable: true,
        events: [
        	<c:forEach var="vsS" items="${vs}" varStatus="vss">
        		<c:if test="${vss.last}">
	        		{
	        		  id 	 : '${ vsS.volAddNum }',
	  	              title  : '${ vsS.volContent }',
	  	              start  : '${ vsS.volStart }',
	  	              end    : '${ vsS.volEnd }',
	  	            }
	        		</c:if>
	        		<c:if test="${!vss.last}">
	        			{
	        				id 	   : '${ vsS.volAddNum }',
	  	              		title  : '${ vsS.volContent }',
	  	              		start  : '${ vsS.volStart }',
	  	              		end    : '${ vsS.volEnd }',
  	           		},
    			</c:if>
	        </c:forEach>   
	   ],
	   eventClick :  
	   			
			   function(info,event, element){
		   		
		   		
		   	   
			   $("#schedule").val(info.event.title);
			   $("#eventNum").val(info.event.id);
			   
			   $("#schedule2").text($('#schedule').val());
			   $('#tr2').removeAttr('style');	
			   
			   
		   },
		   
		 eventRender: function (event, element) {
			 event.backgroundColor = 'green';
		 }
      });
    
      
      
      calendar.render();
    });
    
    function changeShipAdd(){
        var popLeft = Math.ceil(( window.screen.width - 650 )/2);
        var popTop = Math.ceil(( window.screen.height - 430 )/2);
        
        window.open("${contextPath}/views/ej/my_volunteer.jsp", "changeShipAdd", "width=650, height=430, "+ ", left=" + popLeft + ", top="+ popTop);
     }
    
</script>


<script type="text/javascript">
	var message = '${msg}'; 
	if(message != ""){
		alert(msg); 
	}
</script>


</html>