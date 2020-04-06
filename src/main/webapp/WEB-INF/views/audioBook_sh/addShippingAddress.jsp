<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>addShippingAddress</title>
<style>
	html, body{margin: 0; padding: 0;}
	.bigTitle{background: rgb(243, 156, 18); color: white; font-size: 25px; font-weight: bold; text-align: center;
			height: 53px;}
	.outer{width: 700px; height: 100%; border-top: 1px solid grey; border-bottom: 1px solid grey; margin: 0 auto;}
	#tb{margin: 20px 0 20px 0;}
	td{padding: 6px 0 6px 0;}
	input{border-radius: 4px; height: 25px;}
	.saName, .recName, .phone, .zipcode{width: 130px;}
	.basicAdd, .detailAdd{width: 450px;}
	#pn_btn{color: white; background: rgb(241, 196, 15); border-radius: 3px; border: none; font-weight: bold;
			width: 70px; height: 30px;}	
	.btns{text-align: center;}
	.btns button{width: 110px; height: 45px; border-radius: 3px; border: none; color: white; font-weight: bold;
				font-size: 16px;}
	.addSA{background: rgb(243, 156, 18); margin-right: 8px;}
	.cancelBtn{background: lightgrey;}		
</style>			
</head>
<body>
	<div class="bigTitle">
		<div style="display: inline-block; margin-top: 8px;">배송지 목록</div>
	</div>
	
	<br><br>
	
	<div class="outer">
		<table id="tb">
			<tr>
				<td><b>배송지 이름</b></td>
				<td rowspan="6" style="width: 40px;"></td>
				<td><input type="text" value="남친집" class="saName"></td>
			</tr>
			<tr>
				<td><b>수령인</b></td>
				<td><input type="text" value="윤남친" class="recName"></td>
			</tr>
			<tr>
				<td><b>연락처</b></td>
				<td><input type="text" value="010-2345-7739" class="phone"></td>
			</tr>
			<tr>
				<td rowspan="3"><b>주소</b></td>
				<td>
					<input type="text" class="zipcode postcodify_postcode5">
					<input type="button" id="pn_btn" value="우편번호">
				</td>
			</tr>
			<tr>
				<td><input type="text" class="basicAdd postcodify_address"></td>
			</tr>
			<tr>
				<td><input type="text" class="detailAdd postcodify_extra_info"></td>
			</tr>
		</table>
	</div>
	
	<br><br>
	
	<div class="btns">
		<button type="submit" class="addSA">추가</button>
		<button type="reset" class="cancelBtn">닫기</button>
	</div>	
	
	
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
	$(function(){
		$("#pn_btn").postcodifyPopUp();
	});
	
	</script>
</body>
</html>