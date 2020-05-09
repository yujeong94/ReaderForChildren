<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원서 수정 | ReaderForChildren</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/audition/apply.css">
<style></style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<c:import url="auMenubar.jsp"/>
	<div class="contents">
		<h1>지원서 수정</h1>
		
		<span><label class="star" style="margin-left: 50px;">* </label>필수입력항목</span>
		
		<form id="updateForm" class="divblank" action="updateApply.au" method="post" enctype="Multipart/form-data">
			
			<h2><label class="star">* </label>Profile</h2>
			
			<div id="profileArea" class="divblank">
				<div id="proImgArea">
					<img id="proImg" src="${ contextPath }/resources/uploadFiles/${ r.imgChange }">
					<input type=hidden name="imgChange" value="${ r.imgChange }">
				</div>
				
				<table id="profileCon">
					<tr>
						<th width="80px">도서 명</th>
						<td width="120px">${ a.bkName }
							<%-- <input type="hidden" value="${ r.aNum }" name="aNum"> --%>
						</td>
						<th width="60px">이름</th>
						<td>${ loginUser.userName }</td>
						<th width="60px">성별</th>
						<td>${ loginUser.gender }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${ loginUser.birth }</td>
						<th>연락처</th>
						<td>${ loginUser.phone }</td>
						<th>이메일</th>
						<td>${ loginUser.email }</td>
					</tr>
				</table>
			</div>
			
			<h2 style="margin-left: 10px; margin-top: 100px;">Career</h2>
			<span id="cSpan"> ※모든 값을 채워주세요. 모든 값이 채워져야 등록됩니다.</span>
			<div id="careerArea">
				<table id="careerCon">
					<tr>
						<th width=180px class="careerBorder">기간</th>
						<th width=300px class="careerBorder">경력 사항</th>
						<th width=180px class="careerBorder">근무기관</th>
						<td></td>
					</tr>
					<c:forEach var="c" items="${ c }">
					<tr>
						<td width=180px class="careerBorder">
							<input type="text" class="careerInput" name="cDate" value="${ c.cDate }">
						</td>
						<td width=300px class="careerBorder">
							<input type="text" class="careerInput" name="cContent" value="${ c.cContent }">
						</td>
						<td width=180px class="careerBorder">
							<input type="text" class="careerInput" name="cCompany" value="${ c.cCompany }">
						</td>
						<td><img src='${ contextPath }/resources/images/minus0.png' class='minusBtn' style="padding-left: 5px;"></td>
					</tr>
					</c:forEach>
				</table>
				<div align="center">
					<img src="${ contextPath }/resources/images/plus.png" id="plusBtn">
				</div>
			</div>
			
			<h2><label class="star">* </label>Introduce</h2>
			
			<div id="introArea" align="center">
				<textarea rows="40px" cols="100px" name="introduce" required>${ r.introduce }</textarea>
			</div>
			
			<div id="recordArea">
				<label class="star">* </label><span id="recordSpan"> 녹음 파일 첨부 </span>
					<span id="fileShow">${ oldRec } <input type="hidden" name="recName" value="${ r.recName }"></span>
				<button type="button" id="recFile" class="defaultBtn upBtn" style="background: gray; width: 60px; height: 30px; padding: 2px;">변경</button>
			</div>
			
			<div class="btnBox">
				<button class="defaultBtn upBtn">수정</button>
				<button type="button" class="defaultBtn delBtn" onclick="location.href='apDetail.au'">취소</button>				
			</div>
			
			<div id="fileArea">
				<input type="file" accept="image/*" id="ImgBtn" name="profileImg" onchange="Load(this,1)">
				<input type="file" accept="audio/*" id="recBtn" name="recordFile" onchange="Load(this,2)">
			</div>
			
		</form>
		
		
		<script>
			$(function(){
				$('#fileArea').hide();
				$('#proImgArea').click(function(){
					$('#ImgBtn').click();
				});
				$('#recFile').click(function(){
					$("#recBtn").click();
				});
			});
			
			function Load(input, num){
				if(input.files && input.files[0]){
					var reader = new FileReader();
					reader.onload = function(e) {
						switch(num){
						case 1: 
							$('#proImg').attr("src", e.target.result); break;
						case 2: 
							var fileValue = $("#recBtn").val().split("\\");
							var fileName = fileValue[fileValue.length-1];
							
							$('#fileShow').text(fileName); break;
						}
					}
					
					reader.readAsDataURL(input.files[0]);
				}
			}
			
			$('#plusBtn').click(function(){
				var $table = $("#careerCon");
				var $tr = $("<tr>");
				var $td1 = $("<td class='careerBorder'>");
				var $td2 = $("<td class='careerBorder'>");
				var $td3 = $("<td class='careerBorder'>");
				var $td4 = $("<td style='padding-left:5px;'>");
				var $img = $("<img src='${ contextPath }/resources/images/minus0.png' class='minusBtn'>")
				var $input1 = $("<input type='text' class='careerInput' name='cDate'>");
				var $input2 = $("<input type='text' class='careerInput' name='cContent'>");
				var $input3 = $("<input type='text' class='careerInput' name='cCompany'>");
				
				$td4.append($img);
				$td1.append($input1);
				$td2.append($input2);
				$td3.append($input3);
				$tr.append($td1);
				$tr.append($td2);
				$tr.append($td3);
				$tr.append($td4);
				
				$table.append($tr);
				
				$('.minusBtn').click(function(){
					var $tr = $(this).parent().parent();
					$tr.remove();
				});
			});
			
			// 기존꺼 삭제할때
			$('.minusBtn').click(function(){
				var $tr = $(this).parent().parent();
				$tr.remove();
			});
			
		</script>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
</body>
</html>