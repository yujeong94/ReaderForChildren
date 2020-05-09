<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브메뉴</title>
<style>
	.quick_menu {
	 position:absolute; 
	 margin-top: 100px; 
	 margin-left: 105px;
	}
	.quick_menu table {
		display: inline-table;
		margin-bottom: 20px;
		width: 138px;
		height: 150px;
	}
	.quick_menu td {
		cursor: pointer; 
		vertical-align: middle;
		font-weight: 800;
		font-size: 1.2rem;
		padding-left: 10px;
	}
	.quick_menu td:hover {
		color: white;
	}
	#no1_1 {
		background: #5583A6;
	} 
</style>
</head>
<body>
	<!-- 회원 서브메뉴 -->
	<c:if test="${ loginUser != null }">
	<div class="quick_menu">
		<table>
			<tr>
				<td id="no1" style="background: #5583A6;" onclick="location.href='aulist.au'">오디션  리스트</td>
				<!-- <td id="no1_1"></td> -->
			</tr>
			<tr>
				<td id="no2" style="background: #EFA885;">지원서보기</td>
				<!-- <td id="no2_1"></td> -->
			</tr>
			<!-- <tr>	
				<td onclick="location.href='testSlider.au'">testSlider</td>
			</tr> -->
		</table>
	</div>
	</c:if>
	
	<!-- 관리자 서브메뉴 -->
	<c:if test="${ adminUser != null }">
	<div class="quick_menu">
		<table>
			<tr>
				<td id="no10" style="background: #5583A6;" onclick="location.href='aulist.au'">오디션  리스트</td>
			</tr>
			<tr>
				<td id="no20" style="background: #EFA885;" onclick="location.href='auListInsertView.au'">오디션등록</td>
			</tr>
			<!-- <tr>	
				<td onclick="location.href='testSlider.au'">testSlider</td>
			</tr> -->
		</table>
	</div>
	</c:if>
	
	<script>
	$("#no2").click(function(){
		/* $("#no2_1").css("background","#EFA885"); */
		var userId = "${ loginUser.userId }";
		var division = "${ loginUser.division }";
		if(userId != "" && division == 1) {
			$.ajax({
				url: "readerCheck.au",
				type: 'post',
				data: {userId:userId},
				success: function(data) {
					if(data == 'no'){
						swal("지원한 지원서가 없습니다!");
						/* $("#no2_1").css("background","none"); */
					} else {
						location.href="apDetail.au";
						/* $("#no2_1").css("background","#EFA885"); */
					}
				},
				error: function(data) {
					swal("열람할 수 없습니다!");
				}
			});
		} else {
			swal("지원서 조회를 할 수 없습니다.");
		} 
	});

	</script>
</body>
</html>