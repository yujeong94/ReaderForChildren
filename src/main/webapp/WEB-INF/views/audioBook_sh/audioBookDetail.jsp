<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>audioBookDetail</title>
<style type="text/css">
	.cTitle{color: grey; font-size: 18px; font-weight: bold; margin-left: 60px; float: left; margin-top: 7px;}
	.title{display: inline-block; color: black; font-size: 25px; font-weight: bold; padding-left: 20px; margin-bottom: 50px;}
	.tb{margin: 0 auto; font-size: 16px;}
	.tb td {vertical-align: top;}
	.td0 img{width: 280px; height: 350px;}
	.td1{padding: 15px 0 50px 40px;} .td1 span{color: grey; margin: 5px;} .td1 b{font-weight: bold; margin-right: 5px;}
	.td2{text-align: center; padding: 0 0 0 25px;} .td2 img{width: 120px; height: 35px; margin: 0 10px;}
	.priceTd{padding-bottom: 10px;} .priceTd b{font-size: 17px; font-weight: bold; margin: 0 35px 0 35px; color: grey;}
	.td3{text-align: center; height: 30px; padding: 0 0 20px 27px;}
	.chkbox{width: 19px; height: 19px; margin: 0 62px 0 62px;}
	.td4{margin-right: 20px; float: right;}
	.total{display: inline-block; font-weight: bold; font-size: 20px; margin: 0 30px 5px 0;}
	.price{color: rgb(231, 76, 60); font-weight: bold; font-size: 25px; border: none; width: 100px; outline: none; text-align: right;}
	.td5{float: right; font-size: 12px; margin: 0 20px 35px 0;}
	.td6{text-align: center;}
	.Btn{color: white; border: none; width: 120px; height: 45px; border-radius: 5px;
		font-weight: bold; font-size: 17.5px; margin: 0 5px 20px 5px;}
	.purchaseBtn{background: rgb(231, 76, 60);} .purchaseBtn:hover {cursor: pointer;}
	.cartBtn{background: rgb(190, 190, 190)} .cartBtn:hover {cursor: pointer;}
	
	.info{margin: 0 auto 50px; width: 840px; height: 100%;}
	.IT{font-weight: bold; font-size: 19px; margin: 10px 0 20px 0;}
	.line{width: 730px; border-bottom: 2px solid rgb(136, 136, 136); margin-bottom: 20px;}
	.simpleInfo span{color: grey; margin-right: 7px;} .simpleInfo b{font-weight: bold; margin-right: 20px;}
	.simpleInfo{font-size: 16px; margin-bottom: 30px;}
	.intro span{font-size: 16px; font-weight: bold;}
	.intro2{margin: 8px 0 100px 0; height: 30px; font-size: 14px;}
	.IT2{display: inline-block;}
	.tab{display: inline-block; padding: 28px 0 0 465px;}
	.Ftab{height: 30px; border: none; background: rgb(243, 156, 18); color: white; font-weight: bold; outline: none;} .Ftab:hover {cursor: pointer;}
	.Mtab{height: 30px; border: none; background: darkgrey; color: white; font-weight: bold; outline: none;} .Mtab:hover {cursor: pointer;}
	.intro3{margin: 8px 0 70px 0; height: 30px; font-size: 14px;}
	.record{height: 100px; margin-top: 20px;}
	.updateBtn{background: rgb(231, 76, 60); color: white; border: none; width: 130px; height: 50px; border-radius: 5px;
				font-weight: bold; font-size: 20px; text-align: center; margin-top: 20px; margin-right: 8px;} .updateBtn:hover {cursor: pointer;}
	.deleteBtn{background: rgb(231, 76, 60); color: white; border: none; width: 130px; height: 50px; border-radius: 5px;
				font-weight: bold; font-size: 20px; text-align: center; margin-top: 20px;} .deleteBtn:hover {cursor: pointer;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	
		<div class="contents">
			<form name="frm" method="post" onsubmit="return check();">
			<div style="height: 50px;"></div>
			<div class="cTitle">오디오북 > </div>
			<div class="title">${ b.bkName }</div>
			
			<br clear="all">
				<table class="tb">
					<tr>
						<td class="td0"><img src="${ contextPath }/resources/bookUploadImages/${ i.changeName }"></td>
						<td width="90px"></td>
						<td>
							<table>
								<tr>
									<td class="td1">
										<span>글</span> <b>${ b.bkWriter }</b> <span>그림</span> <b>${ b.bkDraw }</b> <span>출판</span> <b>${ b.bkPublisher }</b>
		                              	<br>
										<span>페이지</span> <b>${ b.bkPage }</b> <span>출판일</span> <b>${ b.bkPubdate }</b>
										<input type="hidden" name="bkCode" id="bkCode" value="${ b.bkCode }">
										<input type="hidden" name="bkName" value="${ b.bkName }">
		                        	</td>
								</tr>
								<tr>
									<td class="td2">
										<img src="${ contextPath }/resources/images/book.PNG">
										<img src="${ contextPath }/resources/images/audioF.PNG">
										<img src="${ contextPath }/resources/images/audioM.PNG">
		                         	</td>
								</tr>
								<tr>
									<td class="priceTd">
										<b style="padding-left: 38px;">${ b.bkPrice }원</b>
										<b style="padding-left: 9px;">${ abF.audPrice }원</b>
										<b style="padding-left: 10px;">${ abM.audPrice }원</b></td>
								</tr>
								<tr>
									<td class="td3">
										<input type="checkbox" name="chkbox" class="chkbox" id="checkB" value="${ b.bkPrice }" onclick="itemSum();">
										<input type="checkbox" name="chkbox" class="chkbox" id="checkAF" value="${ abF.audPrice }" onclick="itemSum();">
										<input type="checkbox" name="chkbox" class="chkbox" id="checkAM" value="${ abM.audPrice }" onclick="itemSum();">
										<input type="hidden" name="hidden1" id="hidden1">
										<input type="hidden" name="hidden2" id="hidden2">
										<input type="hidden" name="hidden3" id="hidden3">
									</td>
								</tr>
								<tr>
									<td class="td4">
										<div class="total">Total</div>
										<input type="text" name="sum" class="price" value="0" readonly>&nbsp;원
									</td>
								</tr>
								<tr>
									<td class="td5"><span>※도서만 단독으로 구매는 불가능합니다.</span></td>
								</tr>
								<tr>
									<td class="td6">
										<input type="button" class="Btn purchaseBtn" value="바로구매" onclick="goPurchase();">
										<input type="button" class="Btn cartBtn" value="장바구니" onclick="goCart();">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			<br clear="all"><div style="height: 70px;"></div>
			
			<div class="info">
				<div class="bookInfo">
					<div class="IT">도서 정보</div>
					<div class="line"></div>
					
					<div class="simpleInfo">
						<span>저자</span> <b>${ b.bkWriter }</b> <span>그림</span> <b>${ b.bkDraw }</b>
						<span>출판</span> <b>${ b.bkPublisher }</b> <span>도서 발행일</span> <b>${ b.bkPubdate }</b>
					</div>
					<div class="intro">
						<span>책 소개</span>
						<div class="intro2">
						${ b.bkIntro }
						</div>
					</div>
					
				</div>
				
				<div class="audioBookInfo">
					<div class="IT IT2">오디오북 정보</div>
						<div class="tab">
							<input type="button" class="Ftab" id="Ftab" value="여자 음성" onclick="clickFtab();">
							<input type="button" class="Mtab" id="Mtab" value="남자 음성" onclick="clickMtab();">
						</div>
					<div class="line"></div>
					
					<div id="FemaleReader" style="display: inline-block;">
						<div class="simpleInfo">
							<input type="hidden" name="audCodeF" value="${ abF.audCode }">
							<span>리더</span> <b>${ abF.rdName }(${ afF.userId })</b> <span>오디오북 발행일</span> <b>${ abF.audDate }</b>
						</div>
						<div class="intro">
							<span>리더 소개</span>
							<div class="intro3">
							${ abF.rdIntro }
							</div>
							<span>미리듣기</span>
							<div class="record">
								<audio src="${ contextPath }/resources/audioFileUpload/${ afF.changeName }" controls="controls"></audio>
							</div>
						</div>
					</div>
					
					<div id="MaleReader" style="display: none;">
						<div class="simpleInfo">
							<input type="hidden" name="audCodeM" value="${ abM.audCode }">
							<span>리더</span> <b>${ abM.rdName }(${ afM.userId })</b> <span>오디오북 발행일</span> <b>${ abM.audDate }</b>
						</div>
						<div class="intro">
							<span>리더 소개</span>
							<div class="intro3">
							${ abM.rdIntro }
							</div>
							<span>미리듣기</span>
							<div class="record">
								<audio src="${ contextPath }/resources/audioFileUpload/${ afM.changeName }" controls="controls"></audio>
							</div>
						</div>
					</div>
				</div>
				<c:set var="adminUser" value="${ adminUser }"/>
				<c:if test="${ adminUser ne null }">
					<div class="btnBox">
						<input type="button" class="updateBtn" value="정보수정" onclick="updateProduct();">
						<input type="button" class="deleteBtn" value="상품삭제" onclick="deleteProduct();">
					</div>
				</c:if>
				
				<input type="hidden" name="page" value="${ page }">
			</div>
			</form>
		</div>
		
	<c:import url="../common/footer.jsp"/>
	</div>
	
	<script>
	
	function check(){
		var checkedB = $("input:checkbox[id='checkB']").is(":checked");
		var checkedAM = $("input:checkbox[id='checkAM']").is(":checked");
		var checkedAF = $("input:checkbox[id='checkAF']").is(":checked");
		
		if('${loginUser}' != ''){		// EL은 null 못씀
			
			if(checkedB==true && checkedAM==false && checkedAF==false){
				alert("도서만 단독으로 구매는 불가능합니다.");
				return false;
			} else if(checkedB==false && checkedAM==false && checkedAF==false){
				alert("구매하실 상품을 선택해주세요.");
				return false;
			} else if(checkedB==true && checkedAM==true && checkedAF==true){
				$('#hidden1').val('[도서+오디오북]');
				$('#hidden2').val('(여자음성+남자음성)');
				$('#hidden3').val('${abF.audCode},${abM.audCode}');
				return true;
			} else if(checkedB==true && checkedAM==true && checkedAF==false){
				$('#hidden1').val('[도서+오디오북]');
				$('#hidden2').val('(남자음성)');
				$('#hidden3').val('${abM.audCode}');
				return true;
			} else if(checkedB==true && checkedAM==false && checkedAF==true){
				$('#hidden1').val('[도서+오디오북]');
				$('#hidden2').val('(여자음성)');
				$('#hidden3').val('${abF.audCode}');
				return true;
			} else if(checkedB==false && checkedAM==true && checkedAF==true){
				$('#hidden1').val('[오디오북]');
				$('#hidden2').val('(여자음성+남자음성)');
				$('#hidden3').val('${abF.audCode},${abM.audCode}');
				return true;
			} else if(checkedB==false && checkedAM==true && checkedAF==false){
				$('#hidden1').val('[오디오북]');
				$('#hidden2').val('(남자음성)');
				$('#hidden3').val('${abM.audCode}');
				return true;
			} else if(checkedB==false && checkedAM==false && checkedAF==true){
				$('#hidden1').val('[오디오북]');
				$('#hidden2').val('(여자음성)');
				$('#hidden3').val('${abF.audCode}');
				return true;
			} else{
				return true;
			}
			
		} else{
			alert("로그인 후 이용해주세요.");
			return false;
		}
	}
	
	
	function itemSum(){
		var total = 0;
		for(i=0; i<frm.chkbox.length; i++){
			if(frm.chkbox[i].checked==true){
				total = total + parseInt(frm.chkbox[i].value);
			}
		}
		frm.sum.value=total;
	}
	
	
	
	function clickFtab(){
		$('#FemaleReader').attr('style', 'display:inline-block');
		$('#MaleReader').attr('style', 'display:none');
		$('#Ftab').css('background','rgb(243, 156, 18)');
		$('#Mtab').css('background','darkgrey');
	}
	
	function clickMtab(){
		$('#FemaleReader').attr('style', 'display:none');
		$('#MaleReader').attr('style', 'display:inline-block');
		$('#Ftab').css('background','darkgrey');
		$('#Mtab').css('background','rgb(243, 156, 18)');
	}
	
	
	function checkForCart(){
		var bool = confirm('선택하신 상품을 장바구니에 담으시겠습니까?');
		if(bool){
			return true;
		} else{
			return false;
		}
	}
	
	
	function goPurchase(){
		
		var ch = check();
		
		if(ch){
			var f = document.frm;
			f.action = "purchase.ab";
			f.submit();
		}
	}
	
	
	function goCart(){
		var ch = check();
		if(ch){
			var chCart = checkForCart();
			if(chCart){
				var queryString = $("form[name=frm]").serialize(); // form데이터를 쿼리스트링 형식으로 넘겨주기
				
				$.ajax({
					type: 'post',
					url: 'cartInsert.ab',
					data: queryString,
					success: function(data){
						if(data == "success"){
							var bool = confirm('장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?');
							if(bool){
								location.href="ablist.ab"; /* 여기에 장바구니 url 넣기 */
							}
						}
					}
				});
			}
		}
	}
	
	
	function deleteProduct(){
		var bool = confirm("해당 상품을 삭제하시겠습니까?");
		if(bool){
			var bkCode = $('#bkCode').val();
			location.href="deleteProduct.ab?bkCode="+bkCode;
		}
	}
	
	function updateProduct(){
		var f = document.frm;
		f.action = "updateProductView.ab";
		f.submit();
	}
	
	</script>	
	
</body>
</html>