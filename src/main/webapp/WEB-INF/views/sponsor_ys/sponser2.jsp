<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	#button{ width: 130px; height: 50px;  background-color: rgb(253, 236, 236); color: white;  font-weight: bold; cursor:pointer; font-size: 23px;
		margin-left: 250px; line-height: 40px;  text-align: center; border: 0; border-radius: 5px;}
		#button2{width: 130px; height: 50px; background-color: rgb(253, 236, 236); color: white; font-weight: bold; cursor:pointer; font-size: 23px;
		margin-left: 50px; line-height: 40px;  text-align: center; border: 0; border-radius: 5px;} 
		#button3{width: 130px; height: 50px; background-color: rgb(253, 236, 236); color: white; font-weight: bold; cursor:pointer; font-size: 23px;
		margin-left: 50px; line-height: 40px;  text-align: center; border: 0; border-radius: 5px;} 
		#button4{width: 130px; height: 50px; background-color: rgb(253, 236, 236); color: white; font-weight: bold; cursor:pointer; font-size: 23px;
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
   
 <div id="title"><h1>${sp.spCode}아동 후원</h1></div>
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
	 
		<form name="form" id="form" action="suinsert.sp" method="post">
		<table id = "won" > <!--  style="margin-left: auto; margin-right: auto;" -->
		<tr>
			<td>
				<button type="button" id="button" class="button" onclick="choosed(this);">10000</button>
				<button type="button" id="button2" class="button" onclick="choosed(this);">30000</button>
				<!-- <button type="button" id="button3" class="button" onclick="choosed();">50000</button>
				<button type="button" id="button4"  class="button" onclick="choosed();">70000</button> -->
				
				<input type="hidden" id="donation" name="donation" value="">
			</td>
		</tr>	
		<!-- 	<input type="hidden" id = "donation_value" name = "donation123"> -->
			<!-- <tr>
				<td class="button" >10000</td>
				<td class="button2">20000</td>
				<td class="button3">30000</td>
				<td class="button4">40000</td>
			</tr> -->
		</table>
		<%-- <c:url var="sllist" value="sllist.sp">
						<c:param name="snum" value="${  sp.snum  }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url> --%>
	 
		<table id = "content_table" style="margin-left: auto; margin-right: auto; margin-top:50px">
		
			<tr>
				<td class = "content_title" id = "title2" > ${loginUser.userName }님 정보
				</td>
			</tr>
		</table>
 	<!-- <form action="myinfo.me" method="post">  -->

  <table class = "info" id="tabletd" >
      
       <tr>
          <td class = "info_title2">이름</td>
          <td class = "right"><input type = "text" class = "input_info" id="userName" name="userName" value="${ loginUser.userName }" ></td>
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
          <td class = "info_title2" id = "address"><span class = "title_word">주소</span></td>
		 		<td class = "right" id = "address2"><input type = "text" class = "input_info postcodify_postcode5" id = "ad_num" name = "postalCode" value="${ loginUser.postalCode }"><input type = "button" id = "ad_btn" value = "우편번호"><br>
		 		<input type = "text" class = "input_info info_address postcodify_address" value="${ loginUser.bAddress }" name = "bAddress"><br>
		 		<input type = "text" class = "input_info info_address postcodify_extra_info" value="${ loginUser.lAddress }" name = "lAddress"></td>
       </tr>
       <tr>
          <td class = "info_title2">휴대전화</td>
          <td class = "right"><input type = "text" class = "input_info" name="phone" value="${ loginUser.phone }">
          <!-- <input type = "text" class = "input_info" id="donation" name="donation"> -->
          <input type = "text" class = "input_info" name="userId" value="${loginUser.userId }">
           <input type = "text" class = "input_info" name="spCode" value="${support.spCode }"></td>
       </tr>
       <tr>
          <td class = "info_title2">이메일</td>
          <td class = "right">
             <input type = "text" class = "input_info infro_email" id = "email01" name="email1" value="${email1 }" name="email1" > @ <input type = "text"  value="${selectEmail }" name="selectEmail"  class = "input_info infro_email" id = "email02">
            <input type="hidden" name="emailCkeck" id="emailCheck" value="${loginUser.email }">
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
           <td class = "right" >
         <input type = "text" class = "input_info birth" id= "year" placeholder = "년(4자)" value="${year }" name="year" >년 <input type = "text" value="${month }" name="month" class = "input_info birth" id = "month">월 <input type = "text" value="${day }" name="day"  class = "input_info birth" id = "day">일
       		<input type="hidden" name="birth" id="realBirth" value="${loginUser.birth }"></td>
       </tr>
      <%--  <tr>
         <input type = "text" class = "input_info"   value="${ sp.donation }">${ sp.donation }</td>
       </tr> --%>
    </table>
    
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	        <script>
		        $(function(){
		           $("#ad_btn").postcodifyPopUp();
		        });
		        </script>
		        
		        
	
		        
		        
 <script>
 $('#email01').blur(function(){
     var str = $(this).val();
     var regExp = /^[a-zA-Z0-9]*$/;
     
     if(regExp.test(str)){
      $('#emailCheck').val(1);
     } else {
    	 $('#emailCheck').val(0);
     }
 });
 
 var selectEmail = $("#selectEmail");
 $('#selectEmail').change(function(){
	   $("#selectEmail option:selected").each(function () {
		   if($('#selectEmail').val()== '1'){
			   $("#email02").val('');
			   $("#email02").attr("disabled",false);
			}else{
				$("#email02").val(selectEmail.val());
				$("#email02").attr("disabled",true); 
          }
		   });
	$('#realEmail').val($("#email01").val() + "@" + $('#email02').val());
	   });
 
 $('.birth').blur(function(){
     var str = $(this).val();
     var regExp = /^[0-9]+$/;
     
     if(regExp.test(str)){
      $('#birthCheck').val(1);
     } else {
    	 $('#birthCheck').val(0);
     }
 });
 
 $('#month').blur(function(){
		var month = $('#month').val();
   		
		if(month.length == 1){
			month = '0' + month;
		}
		$('#month').val(month);
	});
	
	$('#day').blur(function(){
		var day = $('#day').val();
   		
		if(day.length == 1){
			day = '0' + day;
		}
		$('#day').val(day);
		$('#realBirth').val($('#year').val() + $('#month').val() + $('#day').val());
	});
 </script>
 

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
       <label><b>이용약관에 동의하십니까?</b></label><input type = "radio" id = "agree" value="0"><label><b>동의함</b></label>
    </div>
    
     <div id="btn">
   		 <table>
  	 		<tr> 
				<td><input type="button" class="upBtn" id="payment" value="후원하기"></td>
				<!-- <td><button onclick = "location.href = 'sponser1.jsp'" class="upBtn" id="cancel" >취소하기</button></td> -->
  			 </tr>
    	 </table>
  
  </div>
    
     <script>
     function choosed(obj){
			var price = obj.innerHTML;
			document.getElementById("donation").value = price;
	
		}

		$('#payment').click(function(){
			    var email = $('#email01').val()+$('#email02').val();
		 		var donation = $('#donation').val();
			   
				var IMP = window.IMP; 
				IMP.init('imp36870177');
				
				IMP.request_pay({
			   	    pg : 'inicis',
			   	    pay_method : 'card',
			   	    merchant_uid : 'merchant_' + new Date().getTime(),
			   	    name : '아동후원',
			   	    amount : donation,
			   	    buyer_email :email, 
			   	    buyer_name : '${loginUser.userId }',
			   	    buyer_tel : '${ loginUser.phone }',
			   	    buyer_addr : '${loginUser.bAddress}',
			   	    buyer_postcode : '${post}',
			   	    m_redirect_url : 'https://www.yourdomain.com/payments/complete' 

				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '후원';
				        msg += '결제 금액 ' + rsp.paid_amount + '원이 결제 되었습니다.';
				   
				        $('#form').submit();
				    } else {
				        var msg = '결제에 실패하였습니다.\n';
				        msg += '에러내용 : ' + rsp.error_msg;
				       
				        alert(msg);
				      
				    }
				
				});
		 	});
	</script>
     

 
      
   
	</form>
  
 
  
   </div>
    <c:import url="../common/footer.jsp"/> 

  
   </div>


</body>
</html>