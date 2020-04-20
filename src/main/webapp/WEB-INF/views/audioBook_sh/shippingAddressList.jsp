<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		<form>
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
					<c:forEach var="l" items="${ list }" varStatus="vs">
						<c:if test="${ l.rLevel == 0 }">
							<tr class="addrTr">
								<td>
									<input type="hidden" id="sNo${ vs.index }" value="${ l.sNo }">
									${ l.sName }<br><b>${ l.rName }</b>
									<input type="hidden" id="rLevel${ vs.index }" value="${ l.rLevel }">
									<input type="hidden" id="rName${ vs.index }" value="${ l.rName }">
									<br><button disabled class="defaultSA">기본배송지</button>
								</td>
								<td>
									<input type="hidden" value="${ l.rZipcode }">
									<input type="hidden" value="${ l.rBasicadd }">
									<input type="hidden" value="${ l.rDetailadd }">
									(${ l.rZipcode })<br>${ l.rBasicadd }<br>${ l.rDetailadd }
								</td>
								<td>
									${ l.rPhone }
									<input type="hidden" value="${ l.rPhone }">
								</td>
								<td>
									<button type="button" class="chooseBtn">선택</button>
								</td>
							</tr>
						</c:if>
						<c:if test="${ l.rLevel == 1 }">
							<tr class="addrTr">
								<td>
									<input type="hidden" id="sNo${ vs.index }" value="${ l.sNo }">
									${ l.sName }<br><b>${ l.rName }</b>
									<input type="hidden" id="rLevel${ vs.index }" value="${ l.rLevel }">
									<input type="hidden" id="rName${ vs.index }" value="${ l.rName }">
								</td>
								<td>
									<input type="hidden" value="${ l.rZipcode }">
									<input type="hidden" value="${ l.rBasicadd }">
									<input type="hidden" value="${ l.rDetailadd }">
									(${ l.rZipcode })<br>${ l.rBasicadd }<br>${ l.rDetailadd }
								</td>
								<td>
									${ l.rPhone }
									<input type="hidden" value="${ l.rPhone }">
								</td>
								<td>
									<button type="button" class="chooseBtn">선택</button>
								</td>
							</tr>
						</c:if>
					</c:forEach>	
				</tbody>
			</table>
		</form>
	</div>
	
	<br><br>
	
	<div class="btns">
		<button type="submit" class="addSA" onclick="addShippingAdd();">배송지 추가</button>
		<button type="reset" class="cancelBtn">닫기</button>
	</div>	
	
	
	<script>
	function addShippingAdd(){
		location.href="addShipAddView.ab";
	}
	
	$('.cancelBtn').click(function(){
		self.close();
	});
	
	$('.chooseBtn').click(function(){
		var sNo = $(this).parent().parent().children('td').eq(0).children('input').eq(0).val();
		var rLevel = $(this).parent().parent().children('td').eq(0).children('input').eq(1).val();
		var rName = $(this).parent().parent().children('td').eq(0).children('input').eq(2).val();
		var rZipcode = $(this).parent().parent().children('td').eq(1).children('input').eq(0).val();
		var rBasicadd = $(this).parent().parent().children('td').eq(1).children('input').eq(1).val();
		var rDetailadd = $(this).parent().parent().children('td').eq(1).children('input').eq(2).val();
		var rPhone = $(this).parent().parent().children('td').eq(2).children('input').eq(0).val();
		
		opener.document.getElementById("sNoInput").value = sNo;
		opener.document.getElementById("levelInput").value = rLevel;
		opener.document.getElementById("nameInput").value = rName;
		opener.document.getElementById("pcInput").value = rZipcode;
		opener.document.getElementById("bAInput").value = rBasicadd;
		opener.document.getElementById("lAInput").value = rDetailadd;
		opener.document.getElementById("phoneInput").value = rPhone;
		
		self.close();
	});
	
	</script>
</body>
</html>