<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
.contents {
   width: 1100px;
   height: 600px;
   background: white;
   margin: auto;
   margin-bottom: 100px;
   padding: 20px;
}

#title {
   margin: 50px;
   text-align: center;
}

label{
	font-size : 17px;
}


	#find_box{
		border : 2px solid gray;
		width : 60%;
		height : 100px;
		margin-top : 120px;
		margin-right : auto;
		margin-left : auto;
		margin-bottom : 20px;
		display : table;
	}

	#find_guide{
		display : table-cell;
		text-align : center;
		vertical-align : middle;
		/* color : rgb(106,172,228); */
		font-weight : bold;
		font-size : 20px;
	}
	
	#un{
		color : rgb(106,172,228);
	}
	
	#fi{
		color : red;
	}


	
	.btn_box{
		width : 60%;
		margin-right : auto;
		margin-left : 360px;
		margin-top : 40px;
		margin-bottom : 400px;
		display : inline-block;
	}
	
	#ok_btn{
		width : 27%;
		height : 45px;
		background : #F06250;
		color : white;
		font-weight : bold;
		font-size : 20px;
		margin-bottom : 50px;
		border : 1px solid #F06250;
		border-radius : 4px;
		cursor : pointer;
	}
	
	#pwd_btn{
		width : 27%;
		height : 45px;
		background : white;
		color : black;
		font-weight : bold;
		font-size : 20px;
		border : 1px solid #F06250;
		border-radius : 4px;
		cursor : pointer;
		margin-left : 3px;
	}
</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <!-- 내용 -->
   <div class="contents">
      <div id="title"><h1>아이디 찾기</h1></div>
   
	 <div id = "find_box">
		<label id = "find_guide">아이디 찾기가 완료되었습니다.<br>
		<span id = "un">${ userName }</span>님의 아이디는 <span id = "fi">${ findId }</span>입니다.</label>	 	
	 </div>
	 
	

	 
	 <div class = "btn_box">
	 	<input type = "button" id = "ok_btn" value = "메인화면">
	 	<input type = "button" id = "pwd_btn" value = "비밀번호 찾기">
	 </div>   
   	
   	 <script>
   	 	$('#ok_btn').click(function(){
   	 		location.href = 'index.jsp';
   	 	});
   	 	
   	 	$('#pwd_btn').click(function(){
   	 		location.href = 'pwdView.me';
   	 	})
   	 </script>
   	
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
</body>
</html>