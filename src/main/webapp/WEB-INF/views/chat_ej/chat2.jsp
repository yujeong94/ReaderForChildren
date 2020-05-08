<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<!-- <script type="text/javascript" src="../../lib/sockjs.min.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
	body{
		background : #ffe478;
	}
	
	#headDiv{
		width : 210px;
		margin-right : auto;
		margin-left : auto;
		margin-top : 30px;
		font-size : 25px;
		font-weight : bold;
	}
	
	#chatUN{
		color : rgb(105,52,52);
	}
	
	#chatArea{
		width : 80%;
		height : 300px;
		margin-top : 40px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#chatMessageArea{
		width : 100%;
		height : 100%;
		border: 1px solid rgb(182,205,221);
		border-radius:3px;
		background : rgb(182,205,221);
	}
	
	#inputMessage_form1{
		width : 80%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px; 
		margin-bottom: 15px;
	}
	
	#inputMessage_form2{
		width : 100%;
		margin-left: auto;
		margin-right: auto;
	}
	
	#message{
		border: 1px solid rgb(182,205,221);
		height: 65px;
		width: 78%;
	}
	
	#sendBtnForm{
		float: right; 
		width: 18%; 
		height: 65px; 
		text-align: center; 
		background-color: rgb(182,205,221); 
		border-radius: 5px;
		border : 0px;
		font-weight: bold;
		cursor : pointer;
	}
	
	#userDiv{
		margin-bottom : 5px;
	}
	
	#user{
		border: 1px solid #01D1FE;
	}
	
	.arrange {
		text-align: right;
	}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


</head>
<body>
 
 	<div id = "content">
 		
 		<div id = "headDiv">
 			<label><span id = "chatUN">${ loginUser.userName }</span>님의 대화창</label>
 		</div>
 		
 		<!-- 채팅 내용 -->
			
				<div id= "chatArea">
					<textarea id="chatMessageArea" disabled="disabled"></textarea>
				</div>
	
		
		<!-- 채팅 입력창 -->
		<div id = "inputMessage_form1">
			<form>
			<div id = "inputMessage_form2">
				<div id = "userDiv">
						<input id="user" type="hidden" value="${ loginUser.userName }" readonly/>
						<%-- <input id="realuser" type="hidden" value="${ loginUser.userId }" readonly/> --%>
				</div>
				<input type="text" class="form-control" id = "message" placeholder = "Enter..." onkeydown="return enter()">
				<input onclick="sendMessage()" value="전송" type="button" id ="sendBtnForm">
			</div>
			</form>
		</div>
		
 	</div>

<script>

	var ws = new WebSocket("ws://localhost:9980/ReaderForChildren/usersocket");
	
	var messageTextArea = document.getElementById("chatMessageArea");

	ws.onopen = function(){
		console.log('Info : connection opened.');
	};
	
	ws.onmessage = function(event){
		console.log(event.data + '\n');
		messageTextArea.value += "[운영자] : " + event.data+"\n";
	};
	
	ws.oncloese = function(event){
		console.log('Info: connection closed.');
		setTimeout(function(){
			connect(); }, 1000);
	};
	
	ws.onerror = function(err){
		console.log('Error : ',err);
	};

	
	
	
	function sendMessage() {
		var user = document.getElementById("user");
		var message = document.getElementById("message");
		/* var realuser = document.getElementById("realuser"); */
		
		console.log(user);
		
			messageTextArea.value += "[" +  user.value + "]" + " : " + message.value + "\n";


		// WebSocket 서버에 메시지를 송신한다.
		ws.send("[" + user.value + "]:" + message.value);

		message.value = "";
	}
	
	
</script>	
	
<script type="text/javascript">

	
	
	
	function enter() {
		if(event.keyCode === 13) {
			sendMessage();
			// form에 의해 자동 submit을 막는다.
			return false;
		}
		return true;
	}


</script>



</body>
</html>