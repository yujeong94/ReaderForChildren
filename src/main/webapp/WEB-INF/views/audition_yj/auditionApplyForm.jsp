<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원서 | ReaderForChildren</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/audition/apply.css">
<style></style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<div class="contents">
		<h1>Reader 지원하기</h1>
		
		<span><label class="star" style="margin-left: 50px;">* </label>필수입력항목</span>
		
		<form id="applyForm" class="divblank" action="insert.ap" method="post" enctype="Multipart/form-data">
			
			<h2><label class="star">* </label>Profile</h2>
			
			<div id="profileArea" class="divblank">
				<div id="proImgArea">
				 	<span id="imgCon">click!!</span>
					<img id="proImg">
				</div>
				<div id="fileArea">
					<input type="file" id="ImgBtn" name="profileImg" onchange="Load(this)">
				</div>
				
				<script>
					$(function(){
						$('#fileArea').hide();
						$('#proImgArea').click(function(){
							$('#ImgBtn').click();
						});
					});
					
					function Load(input){
						if(input.files && input.files[0]){
							var reader = new FileReader();
							reader.onload = function(e) {
								$('#proImg').attr("src", e.target.result);
								$('#imgCon').hide();
							}
							
							reader.readAsDataURL(input.files[0]);
						}
					}
				</script>
				
				<table id="profileCon">
					<tr>
						<th width="120px">오디오북 명</th>
						<td>어쩌고저쩌고</td>
						<th width="80px">이름</th>
						<td><input type="text" name="userName" value="박유정" class="inputSize"></td>
						<th width="80px">성별</th>
						<td>여자</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="age" value="19940313"  class="inputSize"></td>
						<th>연락처</th>
						<td><input type="text" name="phone" value="01020324186"  class="inputSize"></td>
						<th>이메일</th>
						<td><input type="email" name="email" value="94yuuu@naver.com"  class="emailSize"></td>
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
						<td width=180px class="careerBorder"><input type="text" class="careerInput"></td>
						<td width=300px class="careerBorder"><input type="text" class="careerInput"></td>
						<td width=180px class="careerBorder"><input type="text" class="careerInput"></td>
						<td><img src='${ contextPath }/resources/images/minus0.png' class='minusBtn' style="padding-left: 5px;"></td>
					</tr>
					<%-- <tr>
						<td><input type="text" class="careerInput"></td>
						<td><input type="text" class="careerIn"></td>
						<td><input type="text" class="careerInput"></td>
						<td class="forth"><img src="${ contextPath }/resources/images/minus.png" id="minusBtn"></td>
					</tr> --%>
					<tr>
				</table>
				<div align="center">
					<img src="${ contextPath }/resources/images/plus.png" id="plusBtn">
				</div>
			</div>
			
			<h2><label class="star">* </label>Introduce</h2>
			
			<div id="introArea" align="center">
				<textarea rows="40px" cols="100px"></textarea>
			</div>
			
			<div id="recordArea">
				<label class="star">* </label><span id="recordSpan"> 녹음 파일 첨부 </span><input type="file" accept="audio/*">
			</div>
			
			<div class="btnBox">
				<button type="submit" class="defaultBtn upBtn">Apply</button>				
			</div>
		</form>
		
		<script>
			$('#plusBtn').click(function(){
				var $table = $("#careerCon");
				var $tr = $("<tr>");
				var $td1 = $("<td class='careerBorder'>");
				var $td2 = $("<td class='careerBorder'>");
				var $td3 = $("<td class='careerBorder'>");
				var $td4 = $("<td style='padding-left:5px;'>");
				var $img = $("<img src='${ contextPath }/resources/images/minus0.png' class='minusBtn'>")
				var $input1 = $("<input type='text' class='careerInput'>");
				var $input2 = $("<input type='text' class='careerInput'>");
				var $input3 = $("<input type='text' class='careerInput'>");
				
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