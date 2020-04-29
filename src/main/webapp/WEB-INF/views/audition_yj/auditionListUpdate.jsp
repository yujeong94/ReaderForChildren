<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 오디오북 리스트 수정 | ReaderForChildren</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>
	h1 {
		margin-bottom: 10px;
	}
	h2 { 
		font-size: 1.5rem;
		font-weight: 500;
		text-align: center;
		margin-bottom: 100px;
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
	
	#imgDiv {
		border: 1px dashed black;
		width: 170px;
		height: 200px;
		overflow: hidden;
		margin: auto;
	}
	
	#imgDiv td {
		padding-top: 100px;
	}
	
	#imgCon {
		background: black;
		width:100%;
	}
	#imgUpBtn {
		width: 100px;
		margin: auto;
		margin-top: 20px;
	}
	.defaultBtn {
		padding: 5px;
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
		font-weight: 700;
		margin-right: 10px;
	}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<c:import url="auMenubar.jsp"/>
	<div class="contents clear-fix">
		<h1>Reader 오디션 </h1>
		<h2>- 오디오북 리스트 수정 -</h2>
		
		<form id="auListUpdateForm" action="auListUpdate.au" method="post" enctype="Multipart/form-data">
		
			<div id="imgDiv">
				<img id="bookImg" src="${ contextPath }/resources/uploadFiles/${ audition.biName }">
				<input type="hidden" name="biName" value="${ audition.biName }">
			</div>
			
			<div id="imgUpBtn">
				<button type="button" id="imgCon" class="defaultBtn">사진 업로드</button>
			</div>
			
			<table class="aListTable">
				<tr class="conBg">
					<td style="padding-top:10px;">
						<label id="bookName">책 이름</label>
						<input type="text" name="bkName" value="${ audition.bkName }">
						<input type="hidden" name="aNum" value="${ audition.aNum }">
					</td>
				</tr>
				<tr class="conBg">
					<td class="conTitle">테스트 구절</td>
				</tr>
				<tr class="conBg">
					<td>
				<!-- <button type="button" id="testBtn">업로드</button> -->
						<input type="file" accept=".txt" name="reloadTest" style="padding-left: 50px">
						<input type="hidden" name="teName" value="${ audition.teName }">
						현재 파일 :
						<a href="${ contextPath }/resources/uploadFiles/${ audition.teName }">
							${ audition.teName }
						</a>
					</td>	
				</tr>
				
				<tr class="conBg"><td class="conTitle">모집조건</td></tr>
				<tr class="aCon conBg">
					<td>
						<label>성별</label>
						<select style="width: 80px;" name="qGender">
							<option value="무관" 
								<c:if test="${ audition.qGender == '무관' }">selected</c:if>>무관</option>
							<option value="남자" 
								<c:if test="${ audition.qGender == '남자' }">selected</c:if>>남자</option>
							<option value="여자"
								<c:if test="${ audition.qGender == '여자' }">selected</c:if>>여자</option>
						</select>
					</td>
				</tr>
				<tr class="aCon conBg">
					<td>
						<label>나이</label>
						<select multiple="multiple" id="multiSel" style="width: 80px;" name="qAge">
							<option value="무관">무관</option>
							<option value="20대">20대</option>
							<option value="30대">30대</option>
							<option value="40대">40대</option>
							<option value="50대">50대</option>
						</select>
					</td>
				</tr>
				<tr class="aCon conBg">
					<td>
						<label>경력</label>
						<input type="radio" value="유" name="qCareer" <c:if test="${ audition.qCareer == '유' }">checked</c:if>><span>유</span>
						<input type="radio" value="무" name="qCareer" <c:if test="${ audition.qCareer == '무' }">checked</c:if>><span>무</span>
					</td>
				</tr>
				<tr class="aCon conBg">
					<td>
						<label>요청사항</label><textarea rows="10" name="request">${ audition.request }</textarea>
					</td>
				</tr>
				<tr class="aCon conBg">
					<td><label>마감날짜 </label><input type="date" name="endDate" id="endDate" value="${ audition.endDate }"></td>
					<jsp:useBean id="now" class="java.util.Date"/>
					<fmt:formatDate value="${ now }" pattern="yyyyMMdd" var="today"/>
				</tr>
				<tr class="conBg">
					<td class="btnTd"><button class="defaultBtn upBtn">수정</button>
					<button class="defaultBtn delBtn" onclick="location.href='aulist.au'">취소</button></td>
				</tr>
			</table>
				
			<div id="fileArea">
				<input type="file" accept="image/*" id="bookBtn" name="reloadBook" onchange="Load(this,1)">
				<!-- <input type="file" accept="text/plain" id="testImg" name="testBtn" onchange="Load(this,2)"> -->
			</div>
		
		</form>
		
				
		<script>
			$(function(){
				$('#fileArea').hide();
				$('#imgCon').click(function(){
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
							break;
						}
					}
					reader.readAsDataURL(value.files[0]);
				}
			}
			
			$(function(){
				var string = "${ audition.qAge }";
				var arr = string.split(",");
				
				console.log($("#multiSel option").length);
				for(var i = 0; i < arr.length; i++){
					for(var j = 0; j < $("#multiSel option").length; j++){
						if(arr[i] == $('#multiSel option:eq('+j+')').val()){
							$('#multiSel option:eq('+j+')').prop("selected",true);
						}
					}
				}
				
			});
			
			$(".upBtn").click(function(){
				var endDate = $("#endDate").val().replace(/-/g,"");
				var today = ${ today };
				
				if(endDate < today) {
					swal("지난 날짜입니다. 날짜를 확인해주세요");
					$(this).attr("type","button");
				} else {
					$(this).attr("type","submit");
				}
			});
		</script>
</div>
	<c:import url="../common/footer.jsp"/>
</div>
<script>
</script>
</body>
</html>