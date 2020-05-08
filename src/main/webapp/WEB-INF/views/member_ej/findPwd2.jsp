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

#title {
   margin: 50px;
   text-align: center;
}

label{
	font-size : 15px;
}

	#find_box{
		border : 2px solid gray;
		width : 62%;
		height : 120px;
		margin-right : auto;
		margin-left : auto;
		margin-top : 80px;
		margin-bottom : 20px;
		display : table;
	}

	#find_guide{
		display : table-cell;
		text-align : center;
		vertical-align : middle;
		font-weight : bold;
		font-size : 20px;
	}
	
	#firstline{
		line-height : 70px;
	}
	
	#em{
		color : rgb(106,172,228);
	}
	
	#changement{
		color : gray;
		font-size : 15px;
	}
	
	.btn_box{
		width : 80%;
		margin-right : auto;
		margin-left : 10%;
		margin-top : 40px;
		display : inline-block;
	}
	
	#ok_btn{
		width : 150px;
		height : 45px;
		background : #F06250;
		color : white;
		font-weight : bold;
		font-size : 20px;
		margin-bottom : 50px;
		margin-left : 330px;
		border : 1px solid #F06250;
		border-radius : 4px;
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
		<label id = "find_guide">
		<span id = "firstline"><span id = "em">${ email }</span>으로 임시 비밀번호가 전송되었습니다.<br></span>
		<span id = "changement">로그인 후 비밀번호를 변경해주세요.</span>
		</label>	 	
	 </div>
	 
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