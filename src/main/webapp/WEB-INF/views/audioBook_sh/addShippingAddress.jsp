<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<title>addShippingAddress</title>
<style>
	html, body{margin: 0; padding: 0;}
	.bigTitle{background: rgb(243, 156, 18); color: white; font-size: 25px; font-weight: bold; text-align: center;
			height: 53px;}
	.outer{width: 700px; height: 100%; margin: 0 auto;}
	.smallOuter{height: 320px; border-top: 1px solid grey; border-bottom: 1px solid grey; margin-bottom: 50px;}
	#tb{margin: 20px 0 20px 0;}
	td{padding: 6px 0 6px 0;}
	input{border-radius: 4px; height: 25px;}
	.saName, .recName, .phone, .zipcode{width: 130px;}
	.basicAdd, .detailAdd{width: 450px;}
	#pn_btn{color: white; background: rgb(241, 196, 15); border-radius: 3px; border: none; font-weight: bold;
			width: 70px; height: 30px;}	
	.btns{text-align: center;}
	.btn{width: 110px; height: 45px; border-radius: 3px; border: none; color: white; font-weight: bold;
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
		<form action="addShipAdd.ab" method="post">
			<div class="smallOuter">
				<table id="tb">
					<tr>
						<td><b>배송지 이름</b></td>
						<td rowspan="6" style="width: 40px;"></td>
						<td><input type="text" name="sName" class="saName"></td>
					</tr>
					<tr>
						<td><b>수령인</b></td>
						<td><input type="text" name="rName" class="recName"></td>
					</tr>
					<tr>
						<td><b>연락처</b></td>
						<td><input type="text" name="rPhone" class="phone" placeholder=" (-없이)"></td>
					</tr>
					<tr>
						<td rowspan="3"><b>주소</b></td>
						<td>
							<input type="text" name="rZipcode" id="zonecode" class="zipcode postcodify_postcode5" value="">
							<input type="button" id="pn_btn" value="우편번호">
						</td>
					</tr>
					<tr>
						<td><input type="text" name="rBasicadd" id="address" class="basicAdd postcodify_address" value=""></td>
					</tr>
					<tr>
						<td><input type="text" name="rDetailadd" id="address_etc" class="detailAdd postcodify_extra_info" value=""></td>
					</tr>
				</table>
				
				<br><br>
			</div>
			
			<div class="btns">
				<input type="submit" class="btn addSA" value="추가">
				<button type="reset" class="btn cancelBtn">닫기</button>
			</div>	
		</form>
	</div>
		
	
	
	<script>
	$(function(){
		$("#pn_btn").postcodifyPopUp();
	});
	
	
	$('.cancelBtn').click(function(){
		self.close();
	});
	</script>
	
</body>
</html>