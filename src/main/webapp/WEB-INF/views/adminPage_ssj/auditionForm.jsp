<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>enroll reader</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/audition/apply.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<style>
.passBtn{
	background: #8D97BA;
}

.failBtn{
	background: #C79691;
}

.banBtn{
	background: #A0A4A5;
}

.defaultBtn{
	width: 100px;
}

.box2{
	text-align: right;
}

.delBtn{
	margin-right: 100px;
	font-size: 13px;
	padding: 5px 7px;
	width: 70px;
	vertical-align: middle;
}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<div class="contents">
		<h1>지원서</h1>
		<div id="applyForm" class="divblank">
			<h2>Profile</h2>
			
			<div id="profileArea" class="divblank">
				<div id="proImgArea">
					<img id="proImg" src="${ contextPath }/resources/uploadFiles/${ r.imgChange }">
				</div>
				
				<table id="profileCon">
					<tr>
						<th width="120px">오디오북 명</th>
						<td width="120px">${ a.bkName }</td>
						<th width="80px">이름</th>
						<td>${ m.userName }<input type="hidden" name="userName" class="inputSize"></td>
						<th width="80px">성별</th>
						<td>${ m.gender }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${ m.birth }<input type="hidden" name="age" class="inputSize"></td>
						<th>연락처</th>
						<td>${ m.phone }<input type="hidden" name="phone" class="inputSize"></td>
						<th>이메일</th>
						<td>${ m.email }<input type="hidden" name="email" class="emailSize"></td>
					</tr>
					
				</table>
			</div>
			
			<h2 style="margin-left: 10px; margin-top: 100px;">Career</h2>
			
			<div id="careerArea">
				<table id="careerCon">
					<tr>
						<th width=180px class="careerBorder">기간</th>
						<th width=300px class="careerBorder">경력 사항</th>
						<th width=180px class="careerBorder">근무기관</th>
					</tr>
					<c:forEach var="c" items="${ c }">
					<tr>
						<td width=180px class="careerBorder">${ c.cDate }<input type="hidden" class="careerInput"></td>
						<td width=300px class="careerBorder">${ c.cContent }<input type="hidden" class="careerInput"></td>
						<td width=180px class="careerBorder">${ c.cCompany }<input type="hidden" class="careerInput"></td>
					</tr>
					</c:forEach>
				</table>
			</div>
			
			<h2>Introduce</h2>
			
			<div id="introArea" align="center">
				<textarea rows="40px" cols="100px" readonly style="padding: 10px;">${ r.introduce }</textarea>
			</div>
			
			<div id="recordArea">
				<span id="recordSpan"> 녹음 파일 </span><input type="hidden" accept="audio/*">
				<a href="${ contextPath }/resources/uploadFiles/${ r.recName }">${ oldRec }</a>
			</div>
			
			 
			<c:if test="${ r.status == 0 }">
			<div class="btnBox">
				<button type="button" class="defaultBtn passBtn">합격</button>
				<button type="button" class="defaultBtn failBtn">불합격</button>
				<button type="button" class="defaultBtn banBtn">영구정지</button>
			</div>
			</c:if>
			<div class="btnBox box2">
				<button type="button" class="defaultBtn delBtn">back</button>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
<script>
	var userId = "${ m.userId }";

	$('.delBtn').click(function(){
		window.history.back();
	});
	
	$('.banBtn').click(function(){
		location.href="banReader.ad?userId="+userId;
	});
	
	$('.failBtn').click(function(){
		location.href="failReader.ad?userId="+userId;
	});
	
	$('.passBtn').click(function(){
		location.href="passReader.ad?userId="+userId;
	});
</script>
</body>
</html>