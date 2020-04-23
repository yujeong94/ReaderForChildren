<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브메뉴</title>
<style>
/* 서브메뉴 */
.quick_menu {
	 position:absolute; 
	 margin-top: 100px; 
	 margin-left: 145px;
	}
	.quick_menu table {
		display: inline-table;
		text-align: center;
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		margin-bottom: 20px;
		width: 100px;
		height: 100px;
	}
	.quick_menu td {
		cursor: pointer; 
		vertical-align: middle;
		font-weight: 800;
	}
	.quick_menu td:hover {
		color: yellow;
	}
</style>
</head>
<body>
	<!-- 서브메뉴 -->
	<div class="quick_menu">
		<table>
			<c:if test="${ adminUser != null }">
			<tr class="boardTr" style="background: lightyellow;">
				<td  onclick="location.href='auListInsertView.au'" id="no1">오디션등록
				</td>
			</tr>
			</c:if>
			<tr class="boardTr" style="background: green; color: white;">
				<td id="no2">지원서보기
				</td>
			</tr>
		</table>
	</div>
	<script>
	$("#no2").click(function(){
		var userId = "${ loginUser.userId }";
		if(userId != ""){
			$.ajax({
				url: "readerCheck.au",
				type: 'post',
				data: {userId:userId},
				success: function(data) {
					if(data == 'no'){
						alert("지원한 지원서가 없습니다!");
					} else {
						location.href="apDetail.au";
					}
				},
				error: function(data) {
					alert("열람할 수 없습니다!");
				}
			});
		} 
	});
	
	</script>
</body>
</html>