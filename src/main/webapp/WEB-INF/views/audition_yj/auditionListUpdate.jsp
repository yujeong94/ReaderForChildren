<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 지원 리스트 수정 | ReaderForChildren</title>
<link rel="stylesheet" href="../../resources/css/common.css">
<style>
	h2 { 
		font-size: 1.5rem;
		font-weight: 600;
		margin-left: 30px;
		margin-top: 80px;
	}
	h3 {
		font-size: 1rem;
		margin-left: 50px;
		color: red;
	}
	
	.aListTable {
		margin: auto;
		margin-top: 50px;
		margin-bottom: 70px;
		width: 170px;
		height: 600px;
		text-align: center;
	}
	
	.conBg {
		background: lightgray;
	}
	.conTitle {
		font-weight: 800;
		font-size: 1.3rem;
		margin-bottom: 10px;
	}
	.btnTd {
		vertical-align: bottom;
		padding-bottom: 10px;
	}
	
	#imgTr {
		height: 200px;
		overflow: hidden;
	}
	
	#imgTr td {
		padding-top: 100px;
	}
	
	#imgCon {
		background: black;
	}
	.aCon {
		font-size: 1.1rem;
	}
	.aCon label {
		font-weight: 700;
		float: left;
		padding-left: 50px;
	}
	#bookName {
		font-size: 1.3rem;
		margin-bottom: 10px;
	}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<div class="contents clear-fix">
		<h1>Reader 오디션 지원 수정</h1>
		<h2>이 달의 판매 예정 오디오북</h2>
		
		<form action="update.ap" id="aListUpdateForm">
			<table class="aListTable">
				<tr id="imgTr">
					<td>
						<button type="button" id="imgCon" class="defaultBtn">사진 업로드</button>
						<img id="bookImg">
					</td>
				</tr>
				<tr style="display: none;"><td class="aId">게시글 번호</td></tr>
				<tr class="conBg">
					<td style="padding: 20px;">
						<p id="bookName">책 이름 </p>  
						<p class="conTitle">테스트 구절</p>
						<p>
						<!-- <button type="button" id="testBtn">업로드</button> -->
							<input type="file" accept=".txt" style="padding-left: 50px">
						</p><br>
						<p></p>
						<p class="conTitle">모집조건</p>
						<p class="aCon">
							<label>성별</label><select style="width: 80px;">
													<option>무관</option>
													<option>남자</option>
													<option>여자</option>
												 </select> <br><br>
							<label>나이</label><select multiple="multiple" style="width: 80px;">
													<option value="무관">무관</option>
													<option value="20대">20대</option>
													<option value="30대">30대</option>
													<option value="40대">40대</option>
													<option value="50대">50대</option>
												 </select><br><br>
							<label>경력</label><input type="radio" value="유" name="career" checked><span>유</span>
											  <input type="radio" value="무" name="career"><span>무</span><br><br>
							<label>요청사항</label><textarea rows="10"></textarea><br>
						</p>
					</td>
				</tr>
				<tr class="conBg">
					<td class="btnTd"><button class="defaultBtn upBtn">등록</button></td>
				</tr>
			</table>
		</form>
		
		<div id="fileArea">
					<input type="file" accept="image/*" id="bookBtn" name="bookBtn" onchange="Load(this,1)">
					<!-- <input type="file" accept="text/plain" id="testImg" name="testBtn" onchange="Load(this,2)"> -->
		</div>
				
				<script>
					$(function(){
						$('#fileArea').hide();
						$('#imgTr').click(function(){
							$('#bookBtn').click();
						});
						/* $('#testBtn').click(function(){
							$('#testImg').click();
						}); */
					});
					
					function Load(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							reader.onload = function(e) {
								switch(num){
								case 1: 
									$('#bookImg').attr("src", e.target.result);
									$('#imgCon').hide();
									break;
								}
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
<script>
	$(".applyBtn").click(function(){
		location.href="${ contextPath }/views/audition_yj/auditionApplyForm.jsp";
	});
</script>
</body>
</html>