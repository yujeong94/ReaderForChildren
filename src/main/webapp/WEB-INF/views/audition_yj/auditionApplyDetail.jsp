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
	#careerCon {
		text-align: center;
	}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<div class="contents">
		<h1>내 지원서</h1>
		
		<form id="applyForm" class="divblank" action="update.ap" method="post" enctype="Multipart/form-data">
			
			<h2>Profile</h2>
			
			<div id="profileArea" class="divblank">
				<div id="proImgArea">
					<img id="proImg">
				</div>
				
				<table id="profileCon">
					<tr>
						<th width="120px">오디오북 명</th>
						<td width="120px">어쩌고저쩌고</td>
						<th width="80px">이름</th>
						<td>박유정<input type="hidden" name="userName" value="박유정" class="inputSize"></td>
						<th width="80px">성별</th>
						<td>여자</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>19940313<input type="hidden" name="age" value="19940313"  class="inputSize"></td>
						<th>연락처</th>
						<td>01020324186<input type="hidden" name="phone" value="01020324186"  class="inputSize"></td>
						<th>이메일</th>
						<td>94yuuu@naver.com<input type="hidden" name="email" value="94yuuu@naver.com"  class="emailSize"></td>
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
						<td></td>
					</tr>
					<tr>
						<td width=180px class="careerBorder">2019-03-13 ~ 2020-04-01<input type="hidden" class="careerInput"></td>
						<td width=300px class="careerBorder">성우<input type="hidden" class="careerInput"></td>
						<td width=180px class="careerBorder">kh정보교육원<input type="hidden" class="careerInput"></td>
						<td></td>
					</tr>
					<tr>
				</table>
			</div>
			
			<h2>Introduce</h2>
			
			<div id="introArea" align="center">
				<textarea rows="40px" cols="100px" readonly></textarea>
			</div>
			
			<div id="recordArea">
				<span id="recordSpan"> 녹음 파일 </span><input type="hidden" accept="audio/*">
			</div>
			
			<div class="btnBox">
				<button type="submit" class="defaultBtn upBtn">수정</button>
				<button type="button" class="defaultBtn delBtn">삭제</button>
								
			</div>
		</form>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
</body>
</html>