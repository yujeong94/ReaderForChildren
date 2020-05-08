<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 지원서 | ReaderForChildren</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/audition/apply.css">
<style>
	
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<c:import url="auMenubar.jsp"/>
	<div class="contents">
		<h1>내 지원서</h1>
		
		<form id="applyForm" class="divblank" action="applyUpdateView.au" method="post" enctype="Multipart/form-data">
			
			<h2>Profile</h2>
			
			<div id="profileArea" class="divblank">
				<div id="proImgArea">
					<img id="proImg" src="${ contextPath }/resources/uploadFiles/${ r.imgChange }">
				</div>
				
				<table id="profileCon">
					<tr>
						<th width="80px">도서 명</th>
						<td width="120px">${ a.bkName }</td>
						<th width="60px">이름</th>
						<td>${ loginUser.userName }<input type="hidden" name="userName" class="inputSize"></td>
						<th width="60px">성별</th>
						<td>${ loginUser.gender }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${ loginUser.birth }<input type="hidden" name="age" class="inputSize"></td>
						<th>연락처</th>
						<td>${ loginUser.phone }<input type="hidden" name="phone" class="inputSize"></td>
						<th>이메일</th>
						<td>${ loginUser.email }<input type="hidden" name="email" class="emailSize"></td>
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
			
			<div class="btnBox">
				<button class="defaultBtn upBtn">수정</button>
				<button type="button" class="defaultBtn delBtn">삭제</button>
			</div>
		</form>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
<script>
	$('.delBtn').click(function(){
		
		swal({
			  title: "정말 삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				location.href="apDelete.au";
			  } else {
			    swal("삭제가 취소되었습니다.");
			  }
			});
	});
</script>
</body>
</html>