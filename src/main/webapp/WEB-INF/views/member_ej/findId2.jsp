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
		width : 79.5%;
		height : 100px;
		margin-right : auto;
		margin-left : auto;
		margin-bottom : 20px;
		display : table;
	}

	#find_guide{
		display : table-cell;
		text-align : center;
		vertical-align : middle;
		color : rgb(106,172,228);
		font-weight : bold;
		font-size : 20px;
	}
	
	.info{
		border : 2px solid gray;
		width : 80%;
		margin-right : auto;
		margin-left : auto;
		border-collapse: collapse;
		border-spacing: 0;
	}

	.info_title{
		width : 20%;
		height : 44px;
		margin-left : 10px;
		vertical-align : middle;
	}
	
	.title_word{
		margin-left : 20px;
		color : gray;
		font-size : 15px;
	}
	
	.right{
		width: 80%;
		vertical-align : middle;
	}
	
	#find_id{
		border-top : 2px gray solid;
		height : 50px;
		vertical-align : middle;
		text-align : center;
	}
	
	#id{
		font-weight : bold;
	}
	
	.btn_box{
		width : 80%;
		margin-right : auto;
		margin-left : 10%;
		margin-top : 40px;
		margin-bottom : 400px;
		display : inline-block;
	}
	
	#ok_btn{
		width : 49.5%;
		height : 45px;
		background : black;
		color : white;
		font-weight : bold;
		font-size : 20px;
		margin-bottom : 50px;
		border : 1px solid black;
		cursor : pointer;
	}
	
	#pwd_btn{
		width : 49.5%;
		height : 45px;
		background : white;
		color : black;
		font-weight : bold;
		font-size : 20px;
		border : 1px solid gray;
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
		<label id = "find_guide">아이디 찾기가 완료되었습니다.</label>	 	
	 </div>
	 
	 <table class = "info">

	 	<tr>
	 		<td class = "info_title"><label class = "title_word">이름</label></td>
	 		<td class = "right"><label>${ userName }</label></td>
	 	</tr>

	 	<tr>
	 		<td class = "info_title"><label class = "title_word">이메일</label></td>
	 		<td class = "right">
	 			<label>${ email }</label>
	 		</td>
	 	</tr>
	 	
	 	<tr>
	 		<td colspan ="2" id = "find_id">
			 	<label id="id">${ findId }</label>
	 		</td>
	 	</tr>
	 </table>

	 
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