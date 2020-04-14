<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
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
	font-size : 15px;
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
		height : 110px;
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
	
	.btn_box{
		width : 80%;
		margin-right : auto;
		margin-left : 10%;
		margin-top : 40px;
		margin-bottom : 400px;
		display : inline-block;
	}
	
	#ok_btn{
		width : 100%;
		height : 45px;
		background : black;
		color : white;
		font-weight : bold;
		font-size : 20px;
		margin-bottom : 50px;
		border : 1px solid black;
		cursor : pointer;
	}
</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <!-- 내용 -->
   <div class="contents">
      <div id="title"><h1>비밀번호 찾기</h1></div>

	 <div id = "find_box">
		<label id = "find_guide">임시 비밀번호가 메일로 전송되었습니다.</label>	 	
	 </div>
	 
	 <table class = "info">

	 	<tr>
	 		<td class = "info_title"><label class = "title_word">ID</label></td>
	 		<td class = "right"><label>${ userId }</label></td>
	 	</tr>

	 	<tr>
	 		<td class = "info_title"><label class = "title_word">이메일</label></td>
	 		<td class = "right">
	 			<label>${ email }</label>
	 		</td>
	 	</tr>
	 	
	 </table>

	 
	 <div class = "btn_box">
	 	<input type = "button" id = "ok_btn" value = "메인화면">
	 </div>
	 
	 <script>
   	 	$('#ok_btn').click(function(){
   	 		location.href = 'index.jsp';
   	 	});
   	 </script>
   
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
</body>
</html>