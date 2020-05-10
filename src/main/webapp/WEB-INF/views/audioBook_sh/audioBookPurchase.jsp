<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	#defSALabel{display: inline-block;}		
	.info2{padding-bottom: 100px;}
	.tb{font-size: 15px;}
	.td1{font-weight: bold; padding: 20px 20px 0 0;}
	.td2{padding: 20px 0 8px 0;}
	.td3{padding-top: 20px;}
	.nameInput{border-radius: 4px; width: 80px; height: 20px; margin-bottom: 20px; outline: none;}
	.td4{border: 1px solid lightgrey; padding: 5px 20px 5px 8px;} .td4 div{display: inline-block;}
	.td4 input{border: none; background: none; outline: none;}
	.changeBtn{background: rgb(241, 196, 15); color: white; border-radius: 5px; border: none; width: 92px; height: 35px;
				font-size: 14px; font-weight: bold; margin-left: 100px;}
	.phoneInput{margin-top: 20px; border-radius: 4px; width: 160px; height: 22px; margin-bottom: 30px; outline: none;}
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
		font-weight: bold; font-size: 20px;} .payBtn:hover {cursor: pointer;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>
		<form name="form" id="form" action="orderInsert.ab" method="post">
			<div class="contents">
				<div id="title"><h1>주문/결제</h1></div>
					
				<div class="frame1">
					<div class="title2">주문 상품</div>
					<div class="smallFrame1">
						<div class="yellowbox">&nbsp;&nbsp;<b>${ hidden1 }</b> &nbsp;${ bkName }&nbsp;${ hidden2 }</div>
						<input type="hidden" name="bkCode" value="${ bkCode }">
						<input type="hidden" name="hidden3" value="${ hidden3 }">
						
						<c:set var="hidden1" value="${ hidden1 }"/>
						<c:if test="${hidden1 eq '[도서+오디오북]' || hidden1 eq '도서 오디오북'}">
							<input type="hidden" name="containBk" value="Y">
						</c:if>
						<c:if test="${hidden1 eq '[오디오북]' || hidden1 eq '오디오북'}">
							<input type="hidden" name="containBk" value="N">
						</c:if>
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
							<td style="font-size: 12px;" class="td2">
								<input type="hidden" id="levelInput" name="rLevel" value="0">
								<div id="defSALabel">[기본배송지]</div>
							</td>
							<td rowspan="2" class="td3"></td>
						</tr>
						<tr>
							<td>
								<input type="hidden" id="sNoInput" name="sNo" value="${ sNo }">
								<input type="text" class="nameInput" id="nameInput" value="${ lu.userName }" readonly>
							</td>
						</tr>
						<tr>
							<td class="td4" colspan="2">
								<div style="margin-bottom: 8px;">
									<input type="text" id="pcInput" value="${ lu.postalCode }" readonly>
								</div><br>
								<div>
									<input type="text" id="bAInput" size="50" value="${ lu.bAddress }" readonly>
								</div>
								<button type="button" class="changeBtn" onclick="changeShipAdd();">배송지 변경</button><br>
								<div>
									<input type="text" id="lAInput" size="50" value="${ lu.lAddress }" readonly>
								</div>
									
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="text" class="phoneInput" id="phoneInput" value="${ newPhone }" readonly>
							</td>
						</tr>
						<tr>
							<td colspan="2"><div class="line"></div></td>
						</tr>
						<tr>
							<td class="td5">&nbsp;&nbsp;배송메세지</td>
							<td colspan="2">
								<select class="selbox" name="delRequest">
									<option value="">배송 메세지를 선택해주세요.</option>
									<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
									<option value="부재 시 택배함에 넣어주세요.">부재 시 택배함에 넣어주세요.</option>
									<option value="부재 시 집 앞에 놔주세요.">부재 시 집 앞에 놔주세요.</option>
									<option value="배송 전 연락 바랍니다.">배송 전 연락 바랍니다.</option>
									<option value="파손의 위험이 있는 상품입니다. 배송 시 주의해주세요.">파손의 위험이 있는 상품입니다. 배송 시 주의해주세요.</option>
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
								<span><fmt:formatNumber value="${ sum }"/>원</span>
							</div>
							<div class="price finalPrice">&nbsp;&nbsp;결제 금액</div>
							<span id="finalPrice"><fmt:formatNumber value="${ sum }"/>원</span>
							<input type="hidden" name="sum" value="${ sum }">
						</div>
					</div>
				</div>
					
				<div class="frame5">
					<div style="float: right;">
						<div class="agreeMent">개인정보 제 3자 제공 동의 > </div>
						<div><input type="checkbox" id="chkagree">동의합니다.</div>
					</div>	
				</div>
					
				<div class="frame6">
					<input type="button" class="payBtn" id="payment" value="결제하기">
				</div>
			</div>
		</form>
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
		var popTop = Math.ceil(( window.screen.height - 650 )/2);
		
		window.open("shipAddList.ab", "shippingAddressList", "width=750, height=580, "+ ", left=" + popLeft + ", top="+ popTop);
	}
	
	
	$(function(){
		$('.agreeMent').click(function(){
			var popLeft = Math.ceil(( window.screen.width - 400 )/2);
			var popTop = Math.ceil(( window.screen.height - 700 )/2);
			
			window.open("agreeInform.ab", "agreeForInformProvision", "width=500, height=600, "+ ", left=" + popLeft + ", top="+ popTop);
		});
	});
	
	
	function check(){
		var selected = $('.selbox > option:selected').val();
		var checked = $("input:checkbox[id='chkagree']").is(":checked");
		
		if(!selected) {
			alert('배송 메세지를 선택해주세요.');
			$('.selbox').focus();
		    return false;
		} else if(!checked){
			alert('개인정보 제 3자 제공에 동의해주세요.');
			$('#chkagree').focus();
		    return false;
		} else{
			return true;
		}
	}
	
	</script>
	
	<script>
	
	$('#payment').click(function(){
		var ch = check();
		
		if(ch){
			var IMP = window.IMP;
			IMP.init('imp30707400');
		
			IMP.request_pay({
				pg : 'inicis',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : 'ReaderForChildren 오디오북 결제',
			    amount : '${ sum }',
			    buyer_email : '${ loginUser.email }',
			    buyer_name : '${ loginUser.userName }',
			    buyer_tel : '${ loginUser.phone }',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        alert(msg);
			        
			        $('#form').submit();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        
			        alert(msg);
			    }
			    
			});
		}
	});
	
	
	</script>
	
	
</body>
</html>