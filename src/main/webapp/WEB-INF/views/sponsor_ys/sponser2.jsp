<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
   
  .contents {
	width: 1000px;
   height: 900px; 
    background: white;
    margin: auto;
    margin-bottom: 100px;
    padding: 20px;
}
   #subHeader{
			width : 1170px;
			height : 100px;
			display : inline-block;
	}
	#boardName{
		width : 94%;
		height : 70px;
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 30pt;
		font-weight: bold;
		display : inline-table;
		border-bottom: 2pt solid gray;
		text-align: center;
	}
	
	#content_table td{
			border-bottom : 1pt solid gray;
				width : 1140px;
		}
	#title {
   margin: 50px;
   text-align: center;
}
#title2{ font-size: 18px; }
	.content_title{
			font-weight : bold;
		}
	#price{margin-left:60px; color: gray;  margin-bottom:-30px; font-size: 18px; }
	.button{ width: 130px; height: 50px;  background-color: rgb(253, 236, 236); color: white;  font-weight: bold; cursor:pointer; font-size: 23px;
		margin-left: 250px; line-height: 40px;  text-align: center; border: 0; border-radius: 5px;}
		.button2{width: 130px; height: 50px; background-color: rgb(253, 236, 236); color: white; font-weight: bold; cursor:pointer; font-size: 23px;
		margin-left: 50px; line-height: 40px;  text-align: center; border: 0; border-radius: 5px;} 
		.button3{width: 130px; height: 50px; background-color: rgb(253, 236, 236); color: white; font-weight: bold; cursor:pointer; font-size: 23px;
		margin-left: 50px; line-height: 40px;  text-align: center; border: 0; border-radius: 5px;} 
		.button4{width: 130px; height: 50px; background-color: rgb(253, 236, 236); color: white; font-weight: bold; cursor:pointer; font-size: 23px;
		margin-left: 50px; line-height: 40px;  text-align: center; border:black;  border-radius: 5px;}  
	  #won{margin-left:50px;width : 80%; margin-top:-100px;
		height : 70px;}   
		button:hover
		
	   .info{
      border : 1px solid black;
      width : 60%;
      margin-left :200px;
      border-collapse: collapse;
      border-spacing: 0;
      margin-top:30px;
   }
   #tabletd{
   	margin-left:200px;
   	font-size:16px;
   }
   #tabletd td{
    vertical-align: middle; }
   
   #info_title{
      height : 50px;
      background : #D8D8D8;
      font-size : 20px;
      vertical-align: middle;  
   }
   
   #info_word{
      margin-left : 5px;
   }
   
   .info_title2{
      width : 25%;
      height : 44px;
      border-top : 2px solid gray;
   }
   
   #address{
      width : 25%;
      height : 100px;
      border-top : 2px solid gray;
   }
   
   .right{
      width: 75%;
      border-top : 2px solid gray;
   }
   
   #ad_num{
      width : 20%;
   }
   
   #check{
      height : 18px;
      font-size : 10px;
      color : gray;
      margin-left : 5px;
      background : lightgray;
      border-radius : 3px;
      border : 1px lightgray solid;
      cursor : pointer;
   }
   
   .info_address{
      margin-top : 3px;
   }
   
   .input_info{
      border-radius: 5px;
      border : 1px lightgray solid;
      height : 24px;
      width : 50%;
   }
   
   #ad_btn{
      width : 15%;
      height : 26px;
      font-size : 12px;
      color : gray;
      margin-left : 5px;
      background : lightgray;
      border-radius : 3px;
      border : 1px lightgray solid;
      cursor : pointer;
   }
   
   .infro_email{
      width : 30%;
   }
   
   #selectEmail{
      height : 26px;
   }
   
   #year{
      width : 15%;
   }
   
   .birth{
      width : 10%;
   }
   
   .gender{
      margin-left : 5%;
   }
		#terms{
      margin-top : 5%;
   }
   
   .terms_box{
      width : 55%;
      margin-right : auto;
      margin-left : auto;
   }
   
   #terms_content{
      width : 99.4%;
      height : 150px;
   }
   
   #agree_box{
      width : 80%;
      margin-right : auto;
      margin-left : auto;
      margin-top: 10px;
      margin-bottom : 30px;
      font-size:15px;
   }
   
   #agree{
      margin-left : 10px;
   }
  /*  .upBtn{width: 100px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer;
		margin-left:400px; margin-bottom:25px; font-size: 15px; text-align: center; border: 0; border-radius: 5px;}
	.cancle{width: 100px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer;
		margin-left:50px; margin-bottom:25px;    font-size: 15px; text-align: center; border: 0; border-radius: 4px;} */
#pay{margin-left:400px; margin-bottom:25px; font-size: 15px; width:100px; height: 40px; text-align:center; cursor:pointer; font-weight:bold;color: white;  box-shadow: none; 
    border: none; border-radius: 5px;}
#cancel{margin-left:50px; margin-bottom:25px; font-size: 15px; width:100px; height: 40px; text-align:center; cursor:pointer; font-weight:bold; color: white;  box-shadow: none; 
    border: none; border-radius: 5px;}
</style>

</head>
<body>
   <!-- 로고, 장바구니, 메뉴바 -->
   <div class="outer">
    <c:import url="../common/menubar.jsp"/>
    
   <div class = "contents">
 <div id="title"><h1>${b.spName }아동 후원</h1></div>
		<table id = "content_table" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td class = "content_title" id = "title2">후원금액
				 	<p id="price" >
						선택하신 후원금액을 확인해주세요.
					</p>
				</td>
			</tr>
			
		</table>
		<br><br>
	 
		<table id = "won" > <!--  style="margin-left: auto; margin-right: auto;" -->
		
			<button type="button" class="button">10000</button>
			<button type="button"  class="button2">30000</button>
			<button type="button" class="button3">50000</button>
			<button type="button"  class="button4">70000</button> 
			<!-- <tr>
				<td class="button" >10000</td>
				<td class="button2">20000</td>
				<td class="button3">30000</td>
				<td class="button4">40000</td>
			</tr> -->
		</table>

		<table id = "content_table" style="margin-left: auto; margin-right: auto; margin-top:50px">
			<tr>
				<td class = "content_title" id = "title2">'${ loginUser.userName }'후원자 정보
				</td>
			</tr>
		</table>
  	<form action="mupdate.sp" method="post"> 
  
  <table class = "info" id="tabletd" >
      
       <tr>
          <td class = "info_title2">이름</td>
          <td class = "right"><input type = "text" class = "input_info" name="userName" value="${ loginUser.userName }" ></td>
       </tr>
       
       <%-- <c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
					<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
						<c:set var="post" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="address2" value="${ addr }"/>
					</c:if>
				</c:forTokens> --%>
       <tr>
          <td class = "info_title2" id = "address">주소</td>
          <td class = "right"><input type = "text" name="post" class = "input_info" id = "ad_num" value="${ post }"><input type = "button" id = "ad_btn" value = "우편번호"><br>
          <input type = "text" name="baddress"  class = "input_info info_address" value="${ baddress }"><br>
          <input type = "text" name="laddress" class = "input_info info_address" value="${ laddress }" ></td>
       </tr>
       <tr>
          <td class = "info_title2">휴대전화</td>
          <td class = "right"><input type = "text" class = "input_info" name="phone" value=${ loginUser.phone }></td>
       </tr>
       <tr>
          <td class = "info_title2">이메일</td>
          <td class = "right">
             <input type = "text" class = "input_info infro_email" id = "email01" value="${ loginUser.email }"> @ <input type = "text" class = "input_info infro_email" id = "email02" value="${ loginUser.email }">
             <select name="selectEmail" id="selectEmail">
                  <option value="1">직접입력</option>
                  <option value="daum.net">daum.net</option>
                  <option value="empal.com" >empal.com</option>
                  <option value="gmail.com" >gmail.com</option>
                  <option value="hanmail.com">hanmail.net</option>
                  <option value="msn.com">msn.com</option>
                  <option value="naver.com">naver.com</option>
                  <option value="nate.com">nate.com</option>
               </select>
          </td>
       </tr>
       <tr>
          <td class = "info_title2">생년월일</td>
          <td class = "right"><input type = "text" class = "input_info" id= "year" placeholder = "년(4자)" value="${ loginUser.birth }">년 <input type = "number" class = "input_info birth">월 <input type = "number" class = "input_info birth">일</td>
       </tr>
    </table>
    <div class = "terms_box">
       <textarea id="terms_content">
1. 개인정보 수집목적 및 이용목적
가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
         
콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스
         
나. 회원 관리
         
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달
1. 개인정보 수집목적 및 이용목적

가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산

콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스

나. 회원 관리

회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달

2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의          2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 
       </textarea>
    </div>
    
    <div id = "agree_box">
       <label><b>이용약관에 동의하십니까?</b></label><input type = "radio" id = "agree"><label><b>동의함</b></label>
    </div>
    
    <div id="btn">
   		 <table>
  	 		<tr> 
				<td><button onclick ="location.href='sppayment.sp';" class="upBtn" id="pay">결제하기</button></td>
				<td><button onclick = "location.href = 'sponser1.jsp'" class="upBtn" id="cancel" >취소하기</button></td>
  			 </tr>
    	 </table>
  </div>
   </form> 
   </div>
    	<c:import url="../common/footer.jsp"/> 
  
    <script>
		var sell = null;
		var IMP = window.IMP; 
		IMP.init('imp36870177');
		
		IMP.request_pay({
		    pg : 'kakao', 
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${b.spName }',
		    amount : '${ sp.donation }',
		    buyer_email : '${ loginUser.email }',
		    buyer_name : '${ loginUser.userName }',
		    buyer_tel : '${ loginUser.phone }',
		    buyer_addr : '${ post }',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '${ loginUser.userName }'님;
		        msg += '결제 금액 ' + rsp.paid_amount + '원이 결제 되었습니다.';
		       
		    } else {
		        var msg = '결제에 실패하였습니다.\n';
		        msg += '에러내용 : ' + rsp.error_msg;
		       
		    }
		  
		    alert(msg);
		});
	</script>	
   </div>
</body>
</html>