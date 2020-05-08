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
	h1 {
		margin-bottom: 100px;
	}
	label {
		font-weight: bold;
	}
	#find_box{
		border-top: 1px solid lightgray;
		padding-top: 30px;
		width : 80%;
		height: 80px;
		margin: auto;
		text-align: center;
		font-weight: bold;
		font-size: 20px;
		color: #DC1212;
	}

	.info{
		width : 80%;
		margin: auto;
		margin-bottom: 50px;
		text-align: center;	
		font-size: 1.3rem;
		border-bottom: 1px solid lightgray;
		padding-bottom: 30px;
	}

	
	.btn_box{
		width : 100px;
		margin: auto;
		margin-top : 40px;
		margin-bottom : 100px;
	}
	
	#ok_btn{
		height : 45px;
		background : #F06250;
		color : white;
		font-weight : bold;
		font-size : 20px;
		border: none;
		border-radius: 5px;
		cursor : pointer;
	}

</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <!-- 내용 -->
   <div class="contents">
      <h1>Reader 오디션 결과</h1>
   
	 <div id = "find_box">
		2020년 ReaderForChildren 3차 Reader오디션 결과
	 </div>
	 
 	<div class="info">
 		<c:if test="${ status == 0 }">
 		오디션 결과 발표 기간이 아닙니다.
 		</c:if>
 		<c:if test="${ status == 1 }">
	 	<label>${ loginUser.userName }님(${ loginUser.userId })</label>은 Reader 오디션에 <label style="red;">합격</label>하셨습니다.<br>
		합격을 진심으로 축하드립니다.<br><br>
		이후 일정은 개인별로 안내드리겠습니다.<br> 
		감사합니다.
		</c:if>
		<c:if test="${ status == 2 }">
		<label>${ loginUser.userName }님(${ loginUser.userId })</label>은 Reader 오디션에 <label style="red;">불합격</label>하셨습니다.<br><br>
		다음엔 좋은 결과로 함께할 수 있기를 바라겠습니다.<br>
		감사합니다.
		</c:if>
		<c:if test="${ status == 4 }">
	 	<label>${ loginUser.userName }님(${ loginUser.userId })</label>의 Reader 오디션 지원 내역이 존재하지 않습니다.
		</c:if>
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