<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>shippingAddressList</title>
<style>
	html, body{margin: 0; padding: 0;}
	.bigTitle{background: rgb(243, 156, 18); color: white; font-size: 25px; font-weight: bold; text-align: center;
			height: 53px;}
	.chooseBtn{color: white; background: rgb(241, 196, 15); border-radius: 3px; border: none; font-weight: bold;
			width: 55px; height: 30px;}
	.tbOuter{margin: 0 auto; width: 700px; padding: 0 20px; height: 355px; overflow: auto;/* overflow: scroll; */}
	#tb{width: 100%; text-align: center; border-top: 1px solid grey; border-collapse: collapse;}
	td{border-bottom: 1px solid grey; border-collapse: collapse; padding: 10px 0 10px 0;}
	.defaultSA{background: rgb(231, 76, 60); color: white; border-radius: 3px; border: none; font-weight: bold;
			font-size: 11px; width: 68px; height: 22px;}
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
	
	<div class="tbOuter">
		<table id="tb">
			<thead>
				<tr style="height: 40px;">
					<th>배송지</th>
					<th>주소</th>
					<th>연락처</th>
					<th>선택</th>
				</tr>
			</thead>
			
			<tbody id="tb">
				<tr>
					<td>
						집<br><b>박소현</b>
						<br><button disabled class="defaultSA">기본배송지</button>
					</td>
					<td rowspan="2">서울시 강서구 월정로 23길 4, 행복오피스텔 203호</td>
					<td rowspan="2">010-2344-8456</td>
					<td rowspan="2"><button class="chooseBtn">선택</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<br><br>
	
	<div class="btns">
		<button type="submit" class="addSA" onclick="addShippingAdd();">배송지 추가</button>
		<button type="reset" class="cancelBtn">닫기</button>
	</div>	
	
	
	<script>
	function addShippingAdd(){
		location.href="${contextPath}/views/audioBook/addShippingAddress.jsp";
	}
	</script>
</body>
</html>