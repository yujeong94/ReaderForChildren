<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">>
<title>audioBookDetail</title>
<style>
	.cTitle{color: grey; font-size: 18px; font-weight: bold; margin-left: 60px; float: left; margin-top: 7px;}
	.title{display: inline-block; color: black; font-size: 25px; font-weight: bold; padding-left: 20px; margin-bottom: 50px;}
	.tb{margin: 0 auto; font-size: 16px;}
	.tb td {vertical-align: top;}
	.td0 img{width: 280px; height: 350px;}
	.td1{padding: 15px 0 50px 40px;} .td1 span{color: grey; margin: 5px;} .td1 b{font-weight: bold; margin-right: 5px;}
	.td2{text-align: center; padding: 0 0 10px 25px;} .td2 img{width: 120px; height: 35px; margin: 0 10px;}
	.td3{text-align: center; height: 30px; padding: 0 0 20px 27px;}
	.chkbox{width: 19px; height: 19px; margin: 0 62px 0 62px;}
	.td4{margin-right: 20px; float: right;}
	.total{display: inline-block; font-weight: bold; font-size: 20px; margin: 7px 30px 0 0;}
	.price{color: rgb(231, 76, 60); font-weight: bold; font-size: 25px;}
	.td5{float: right; font-size: 12px; margin: 0 20px 35px 0;}
	.td6{text-align: center;}
	.Btn{color: white; border: none; width: 120px; height: 45px; border-radius: 5px;
		font-weight: bold; font-size: 17.5px; margin: 0 5px 20px 5px;}
	.purchaseBtn{background: rgb(231, 76, 60);}
	.cartBtn{background: rgb(190, 190, 190)}
	
	.info{margin: 0 auto 80px; width: 840px; height: 100%;}
	.IT{font-weight: bold; font-size: 19px; margin: 10px 0 20px 0;}
	.line{width: 730px; border-bottom: 2px solid rgb(136, 136, 136); margin-bottom: 20px;}
	.simpleInfo span{color: grey; margin-right: 7px;} .simpleInfo b{font-weight: bold; margin-right: 20px;}
	.simpleInfo{font-size: 16px; margin-bottom: 30px;}
	.intro span{font-size: 16px; font-weight: bold;}
	.intro2{margin: 8px 0 100px 0; height: 30px; font-size: 14px;}
	.IT2{display: inline-block;}
	.tab{display: inline-block; padding: 28px 0 0 465px;}
	.Ftab{height: 30px; border: none;} .Mtab{height: 30px; border: none;}
	.intro3{margin: 8px 0 70px 0; height: 30px; font-size: 14px;}
	.record{height: 100px;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>
		
		<div class="contents">
			<div style="height: 50px;"></div>
			<div class="cTitle">오디오북 > </div>
			<div class="title">헨젤과 그레텔</div>
			
			<br clear="all">
			
			<table class="tb">
				<tr>
					<td class="td0"><img src="${pageContext.servletContext.contextPath}/images/HG.PNG"></td>
					<td width="90px"></td>
					<td>
						<table>
							<tr>
								<td class="td1">
									<span>글</span> <b>그림형제</b> <span>그림</span> <b>낸시 에콤 버커트</b> <span>출판</span> <b>비룡소</b>
	                              	<br>
									<span>페이지</span> <b>28</b> <span>출판일</span> <b>2014.06.30</b>
	                        	</td>
							</tr>
							<tr>
								<td class="td2">
									<img src="${pageContext.servletContext.contextPath}/images/book.PNG">
									<img src="${pageContext.servletContext.contextPath}/images/audioM.PNG">
									<img src="${pageContext.servletContext.contextPath}/images/audioF.PNG">
	                         	</td>
							</tr>
							<tr>
								<td class="td3">
									<input type="checkbox" class="chkbox">
									<input type="checkbox" class="chkbox">
									<input type="checkbox" class="chkbox">
								</td>
							</tr>
							<tr>
								<td class="td4"><div class="total">Total</div> <span class="price">5,500원</span></td>
							</tr>
							<tr>
								<td class="td5"><span>※도서만 단독으로 구매는 불가능합니다.</span></td>
							</tr>
							<tr>
								<td class="td6">
									<input type="button" class="Btn purchaseBtn" value="바로구매" onclick="purchase()">
									<button class="Btn cartBtn">장바구니</button>
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
						<span>저자</span> <b>그림형제</b> <span>그림</span> <b>낸시 에콤 버커트</b>
						<span>출판</span> <b>비룡소</b> <span>도서 발행일</span> <b>2014.06.30</b>
					</div>
					<div class="intro">
						<span>책 소개</span>
						<div class="intro2">
							소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 !<br> 그들의 몸이 얼마나 튼튼하며
						</div>
					</div>
					
				</div>
				
				<div class="audioBookInfo">
					<div class="IT IT2">오디오북 정보</div>
						<div class="tab">
							<button class="Ftab">여자 음성</button>
							<button class="Mtab">남자 음성</button>
						</div>
					<div class="line"></div>
					
					<div class="simpleInfo">
						<span>리더</span> <b>김태리</b> <span>오디오북 발행일</span> <b>2020.03.02</b>
					</div>
					<div class="intro">
						<span>리더 소개</span>
						<div class="intro3">
							소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 !<br> 그들의 몸이 얼마나 튼튼하며
						</div>
						<span>미리듣기</span>
						<div class="record">
							오디오 파일 재생
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
	<c:import url="../common/footer.jsp"/>
	</div>
	
	<script>
	function purchase(){
		location.href="${ contextPath }/views/audioBook/audioBookPurchase.jsp";
	}
	</script>	
	
</body>
</html>