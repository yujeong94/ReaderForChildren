<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>audioBookPurchase</title>
<style>
	#title{padding-bottom: 30px;}
	.frame1{margin: 0 auto 60px; width: 840px; height: 100%;}
	.title2{font-weight: bold; font-size: 19px; margin: 10px 0 10px 0;}
	.smallFrame1{border: 1px solid lightgrey; margin: 0 auto; width: 840px; height: 100%; background: rgb(255, 253, 231);
				border-radius: 5px;}
	.yellowbox{font-size: 15px; margin: 30px auto;} .yellowbox b{font-weight: bold;}
	.frame2{margin: 0 auto; width: 840px; height: 100%;}
	.info{font-weight: bold; margin-right: 20px; display: inline-block;}
	.frame3{background: rgb(255, 253, 231); border: 1px solid lightgrey; border-radius: 5px; margin: 0 auto 60px;
			width: 840px; height: 100%; padding-bottom: 30px;}
	.info2{padding-bottom: 100px;}
	.tb{font-size: 15px;}
	.td1{font-weight: bold; padding: 20px 20px 0 0;}
	.td2{padding: 20px 0 8px 0;}
	.td3{padding-top: 20px;}
	.nameInput{border-radius: 4px; width: 80px; height: 20px; margin-bottom: 20px;}
	.td4{border: 1px solid lightgrey; padding: 5px 20px 5px 8px;} .td4 div{display: inline-block;}
	.changeBtn{background: rgb(241, 196, 15); color: white; border-radius: 5px; border: none; width: 92px; height: 35px;
				font-size: 14px; font-weight: bold; margin-left: 250px;}
	.phoneInput{margin-top: 20px; border-radius: 4px; width: 160px; height: 22px; margin-bottom: 30px;}
	.line{width: 640px; border-bottom: 2px solid lightgrey; margin-bottom: 30px;}
	.td5{font-weight: bold; padding-right: 20px;}
	.selbox{border-radius: 4px; width: 400px; height: 30px; border: 1px solid lightgrey;}
	#selboxDirect{border-radius: 4px; width: 395px; height: 60px; border: 1px solid lightgrey; margin-top: 10px;
				resize: none;}
	.frame4{font-weight: bold; margin: 0 auto; width: 840px; height: 100%;}
	.smallBox{margin-bottom: 10px; font-size: 17px;}
	.price{margin: 0 550px 0 10px; display: inline-block;}
	.finalPrice{color: rgb(231, 76, 60); font-size: 22px; margin: 0 525px 0 2px;}
	#finalPrice{color: rgb(231, 76, 60); font-size: 22px;}
	.frame5{margin: 20px auto 60px; width: 840px; height: 100%; font-size: 14px; padding-bottom: 20px;}
	.frame5 div{display: inline-block;}
	.agreeMent{margin-right: 50px; text-decoration: underline;} .agreeMent:hover {cursor: pointer;}
	.frame6{margin: 20px auto 50px; width: 840px; height: 100%; text-align: center;}
	.payBtn{background: rgb(231, 76, 60); color: white; border: none; width: 200px; height: 60px; border-radius: 5px;
		font-weight: bold; font-size: 20px;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	
		<div class="contents">
			<div id="title"><h1>주문/결제</h1></div>
			
			<div class="frame1">
				<div class="title2">주문 상품</div>
				<div class="smallFrame1">
					<div class="yellowbox">&nbsp;&nbsp;<b>${ hidden1 }</b> &nbsp;${ bkName }&nbsp;${ hidden2 }</div>
				</div>
			</div>
			
			<div class="frame2">
				<div class="title2">배송 정보</div>
				<div class="smallFrame1" style="margin-bottom: 10px;">
					<div class="yellowbox">
						<div class="info">&nbsp;&nbsp;주문자 정보</div>
						<span>${ lu.userName }     ㅣ    ${ lu.email }     ㅣ     ${ newPhone }</span>
					</div>
				</div>
			</div>
			
			<div class="frame3">
				<table class="tb">
					<tr>
						<td rowspan="5" class="td1">&nbsp;&nbsp;배송지 정보</td>
						<td style="font-size: 12px;" class="td2">[기본배송지]</td>
						<td rowspan="2" class="td3"></td>
					</tr>
					<tr>
						<td><input type="text" class="nameInput" value="${ lu.userName }"></td>
					</tr>
					<tr>
						<td class="td4" colspan="2">
							<div style="margin-bottom: 8px;">${ lu.postalCode }</div><br>
							<div>${ lu.bAddress }</div>
							<button class="changeBtn" onclick="changeShipAdd();">배송지 변경</button><br>
							<div>${ lu.lAddress }</div>
							
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" class="phoneInput" value="${ newPhone }">
						</td>
					</tr>
					<tr>
						<td colspan="2"><div class="line"></div></td>
					</tr>
					<tr>
						<td class="td5">&nbsp;&nbsp;배송메세지</td>
						<td colspan="2">
							<select class="selbox">
								<option selected disabled>배송 메세지를 선택해주세요.</option>
								<option>부재 시 경비실에 맡겨주세요.</option>
								<option>부재 시 택배함에 넣어주세요.</option>
								<option>부재 시 집 앞에 놔주세요.</option>
								<option>배송 전 연락 바랍니다.</option>
								<option>파손의 위험이 있는 상품입니다. 배송 시 주의해주세요.</option>
								<option value="direct">직접 입력</option>
							</select><br>
							<textarea id="selboxDirect" name="selboxDirect"/></textarea>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="frame4">
				<div class="title2">결제 정보</div>
				<div class="smallFrame1" style="margin-bottom: 10px;">
					<div class="yellowbox">
						<div class="smallBox">
							<div class="price orderPrice">&nbsp;&nbsp;주문 금액</div>
							<span>${ sum }원</span>
						</div>
						<div class="price finalPrice">&nbsp;&nbsp;결제 금액</div>
						<span id="finalPrice">${ sum }원</span>
					</div>
				</div>
			</div>
			
			<div class="frame5">
				<div style="float: right;">
					<div class="agreeMent">개인정보 제 3자 제공 동의 > </div>
					<div><input type="checkbox">동의합니다.</div>
				</div>	
			</div>
			
			<div class="frame6">
				<input type="button" class="payBtn" value="결제하기" onclick="pay();">
			</div>
		</div>
		
	<c:import url="../common/footer.jsp"/>
	</div>
	
	<script>
	$(function(){
		$("#selboxDirect").hide();
		
		$(".selbox").change(function() {
		if($(".selbox").val() == "direct") {
			$("#selboxDirect").show();
		}  else {
			$("#selboxDirect").hide();
		}
		}) 
	});
	
	function changeShipAdd(){
		var popLeft = Math.ceil(( window.screen.width - 650 )/2);
		var popTop = Math.ceil(( window.screen.height - 430 )/2);
		
		window.open("shipAddList.ab", "shippingAddressList", "width=650, height=430, "+ ", left=" + popLeft + ", top="+ popTop);
	}
	
	function pay(){
		location.href="${contextPath}/views/audioBook/successPayment.jsp";
	}
	
	
	$(function(){
		$('.agreeMent').click(function(){
			var popLeft = Math.ceil(( window.screen.width - 400 )/2);
			var popTop = Math.ceil(( window.screen.height - 530 )/2);
			
			window.open("agreeInform.ab", "agreeForInformProvision", "width=400, height=530, "+ ", left=" + popLeft + ", top="+ popTop);
		});
	});
	
	</script>

</body>
</html>