<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>
 b{
 	font-weight : bold;
 }
	
.contents {
   width: 1100px;
   height: 1200px;
   background: white;
   margin: auto;
   margin-bottom: 100px;
   padding: 20px;
}

#title {
   margin: 50px;
   text-align: center;
}

	.info{
		border-top : 1px solid #F9A654;
		border-bottom : 2px solid lightgray;
		width : 80%;
		margin-right : auto;
		margin-left : auto;
		border-collapse: collapse;
		border-spacing: 0;
		
	}
	
	#info_title{
		height : 50px;
		background : #F9A654;
		font-size : 25px;
		
	}
	
	#info_word{
		color:white;
		margin-left : 5px;
		vertical-align: middle;
	}
	
	.info_title2{
		width : 25%;
		height : 44px;
		border-top : 2px solid lightgray;
		font-size:18px;
		vertical-align: middle;
		color : gray;
	}
	
	.title_word{
		margin-left:10px;
		font-size: 17px;
	}
	
	#address{
		width : 25%;
		height : 105px;
		border-top : 2px solid lightgray;
	}
	
	.right{
		width: 75%;
		border-top : 2px solid lightgray;
		padding-top : 8px;
		
	}
	
	#ad_num{
		width : 20%;
	}
	
	#check{
		vertical-align: middle;
		font-size : 13px;
		margin-left : 10px;
	}
	
	.ok{color : green;} .error{color : red;} .pattern{color : red;}
	
	.info_address{
		margin-top : 3px;
	}
	
	.input_info{
		border-radius: 5px;
		border : 1px lightgray solid;
		height : 24px;
		width : 50%;
	}
	
	.pwdinform{
		vertical-align: middle;
		font-size : 13px;
		margin-left : 10px;
	}
	
	#same{ color : green;} #diff{color : red;}
	
	#ad_btn{
		width : 10%;
		height : 26px;
		font-size : 12px;
		color : white;
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
		width : 5%;
	}
	
	.gender{
		width:30px;
		text-align: center
	}
	
	.fm{
		margin-left : 50px;
	}
	
	.input_gender{
		font-size : 14px;
	}
	
	#terms{
		margin-top : 5%;
	}
	
	.terms_box{
		width : 80%;
		margin-right : auto;
		margin-left : auto;
	}
	
	#terms_content{
		width : 99.4%;
		height : 250px;
	}
	
	#agree_box{
		width : 80%;
		margin-right : auto;
		margin-left : auto;
		margin-top: 10px;
		margin-bottom : 30px;
	}
	
	#agree{
		width : 15px;
		height : 15px;
		margin-left : 30px;
	}
	
	#join{
		width : 100%;
		height : 45px;
		background : black;
		color : white;
		font-weight : bold;
		font-size : 20px;
		margin-bottom : 50px;
		border : 1px solid black;
		cursor : pointer;
	}
	
	.rightgender{
		vertical-align :middle;
	}
	
</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <!-- 내용 -->
   <div class="contents">
   		<div id="title"><h1>회원가입</h1></div>
   		<form action="insert.me" method="post" id="joinForm">
   		<table class = "info">
		 	<tr id = "info_title">
		 		<td colspan = "2"><label id = "info_word"><b>기본정보</b></label></td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><label class = "title_word" >아이디</label></td>
		 		<td class = "right"><input type = "text" class = "input_info" id = "userId" name = "userId" placeholder = "영어/숫자 4글자 이상">
		 			<label id = "check">
		 				<span class = "guide ok" id = "pas" style="display:none">사용 가능</span>
		 				<span class = "guide error" id = "impas" style="display:none">사용 불가</span>
		 				<span class = "guide pattern" id = "impas2" style="display:none">영문 소문자,숫자만 사용</span>
		 				<input type="hidden" name="idCheck" id="idCheck" value="0">
		 			</label>
		 		</td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><label class = "title_word">비밀번호</label></td>
		 		<td class = "right">
		 			<input type = "password" class = "input_info" id = "userPwd" name = "userPwd" placeholder = "영문자/숫자/특수문자 포함 8~16자리">
		 			<input type="hidden" name="pwdCheck" id="pwdCheck" value="0">
		 		</td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><label class = "title_word">비밀번호 확인</label></td>
		 		<td class = "right">
		 			<input type = "password" class = "input_info" id = "userPwd2" name = "userPwd2">
		 			<span class = "pwdinform sm" id = "same" style="display:none">비밀번호 일치</span>
		 			<span class = "pwdinform df" id = "diff" style="display:none">비밀번호 불일치</span>
		 			<input type="hidden" name="pwdCheck2" id="pwdCheck2" value="0">
		 		</td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><label class = "title_word">이름</label></td>
		 		<td class = "right">
		 			<input type = "text" class = "input_info" id = "userName" name = "userName">
		 			<input type="hidden" name="nameCheck" id="nameCheck" value="0">
		 		</td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2" id = "address"><label class = "title_word">주소</lable></td>
		 		<td class = "right" id = "address2"><input type = "text" class = "input_info postcodify_postcode5" id = "ad_num" value="" name = "postalCode"><input type = "button" id = "ad_btn" value = "우편번호"><br>
		 		<input type = "text" class = "input_info info_address postcodify_address" id = "b_ad" value="" name = "bAddress"><br>
		 		<input type = "text" class = "input_info info_address postcodify_extra_info" id = "l_ad" value="" name = "lAddress"></td>
		 	</tr>
		 		
		 	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	        <script>
		        $(function(){
		           $("#ad_btn").postcodifyPopUp();
		        });
		        
		        
		        $('#userId').on('keyup',function(){
		        	var userId = $(this).val().trim();
		        	if(userId.length < 4){
		        		$('.guide').hide();
		        		$('#idCheck').val(0);
		        		
		        		return;
		        	}
		        	
		        	$.ajax({
		        		url : 'check.me',
		        		data : {id:userId},
		        		success : function(data){
		        			if(data == '0' && /^[a-z0-9]+$/.test($("#userId").val())){
		        				$('.guide.ok').show();
		        				$('.guide.error').hide();
		        				$('.guide.pattern').hide();
		        				$('#idCheck').val(1);
		        			}else if(!/^[a-z0-9]+$/.test($("#userId").val())){
		        				$('.guide.ok').hide();
		        				$('.guide.error').hide();
		        				$('.guide.pattern').show();
		        				$('#idCheck').val(0);
		        			}else {
		        				$('.guide.ok').hide();
		        				$('.guide.error').show();
		        				$('.guide.pattern').hide();
		        				$('#idCheck').val(0);
		        			}
		        		}
		        	});
		        });
		        
		        
		        $('#userPwd').blur(function(){
		        	var str = $(this).val();
		        	var passrule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		        	
		        	if(passrule.test(str)){
		        		$('#pwdCheck').val(1);
		        	}else{
		        		$('#pwdCheck').val(0);
		        	}
		        });
		        
		        $('#userPwd2').blur(function(){
		        	if($('#userPwd2').val() == ""){
		        		$('.pwdinform.sm').hide();
		        		$('.pwdinform.df').hide();
		        		$('#pwdCheck2').val(0);
		        	}else if($('#userPwd2').val() == $('#userPwd').val()){
		        		$('.pwdinform.sm').show();
		        		$('.pwdinform.df').hide();
		        		$('#pwdCheck2').val(1);
		        	}else{
		        		$('.pwdinform.sm').hide();
		        		$('.pwdinform.df').show();
		        		$('#pwdCheck2').val(0);
		        	}
		        });
		       
		        
		        $('#userName').blur(function(){
			         var str = $(this).val();
			         var regExp = /^[가-힣]+$/;
			         
			         if(regExp.test(str)){
			            $('#nameCheck').val(1);
			         } else {
			        	 $('#nameCheck').val(0);
			         }
			     });
		        
		        
	        </script>
		 	
		 	<tr>
		 		<td class = "info_title2"><label class = "title_word">휴대전화</label></td>
		 		<td class = "right">
		 			<input type = "text" class = "input_info" id = "phone" name = "phone" placeholder = " ' - ' 빼고 입력">
					<input type="hidden" name="phoneCheck" id="phoneCheck" value="0">		 			
		 		</td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><label class = "title_word">이메일</label></td>
		 		<td class = "right">
		 			<input id="realEmail" type="hidden" name="email">
		 			<input type = "text" class = "input_info infro_email" id = "email01"> @ <input type = "text" class = "input_info infro_email" id = "email02">
		 			<input type="hidden" name="emailCheck" id="emailCheck" value="0">
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
		 		<td class = "info_title2"><label class = "title_word">생년월일</label></td>
		 		<td class = "right">
		 			<input type = "text" class = "input_info birth" id= "year" placeholder = "년(4자)">년 <input type = "text" class = "input_info birth" id = "month">월 <input type = "text" class = "input_info birth" id = "day">일
		 			<input type="hidden" name="birth" id="realBirth">
		 		</td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><label class = "title_word">성별</label></td>
		 		<td class = "right rightgender">
			 		<input type = "radio" name = "gender" value = "남" class = "gender" id="male"><label class = "input_gender">남</label>
			 		<input type = "radio" name = "gender" value = "여" class = "gender fm"><label class = "input_gender">여</label>
		 		</td>
		 	</tr>
		 </table>
	 
	 <table class = "info" id = "terms">
	 	<tr id = "info_title">
	 		<td><label id = "info_word"><b>[필수] 이용약관 동의</b></label></td>
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

2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 			2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 
	 	</textarea>
	 </div>
	 
	 <div id = "agree_box">
	 	<label><b>이용약관에 동의하십니까?</b></label><input type = "radio" id = "agree" name="agree"><label><b>동의함</b></label>
	 </div>
	 
	 <div class = "terms_box">
	 	<input type="button" id = "join" value = "가입하기">
	 </div>
	</form>
	<script>
		
		$('#phone').blur(function(){
	        var str = $(this).val();
	        var regExp = /^[0-9]+$/;
	        
	        if(regExp.test(str)){
	         $('#phoneCheck').val(1);
	        } else {
	       	 $('#phoneCheck').val(0);
	        }
	    });
		
		
		$('#email01').blur(function(){
	        var str = $(this).val();
	        var regExp = /^[a-zA-Z0-9]*$/;
	        
	        if(regExp.test(str)){
	         $('#emailCheck').val(1);
	        } else {
	       	 $('#emailCheck').val(0);
	        }
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
		
		
		
	</script>
	 
	<script>
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
          
    </script> 		
   	
   	<script>
   	
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

   		
   		$('#join').click(function(){
   			if($('#idCheck').val() == 0){
   				alert('사용 가능한 아이디를 입력해주세요.');
   				$('#userId').focus();
   	   			return false;
   			}else if($('#pwdCheck').val() == 0){
   				alert('비밀번호를 다시 입력해주세요.\n영문자/숫자/특수문자 포함 8~16자리')
   				$('#userPwd').focus();
   	   			return false;
   			}else if($('#pwdCheck2').val() == 0){
   				alert('비밀번호가 일치하지 않습니다.')
   				$('#userPwd2').focus();
   	   			return false;
   			}else if($('#nameCheck').val() == 0){
   				alert('이름을 다시 입력해주세요.')
   				$('#userName').focus();
   	   			return false;
   			}else if($("#ad_num").val() == "" || $("b_ad").val() == "" || $("l_ad").val() == ""){
   				alert('주소를 입력해주세요.')
   	   			return false;
   			}else if($('#phoneCheck').val() == 0){
   				alert('전화번호를 다시 입력해주세요.\n(- 제외)');
   				$('#phone').focus();
   	   			return false;
   			}else if($('#emailCheck').val() == 0){
   				alert('이메일을 다시 입력해주세요.');
   				$('#email01').focus();
   	   			return false;
   			}else if($('#realBirth').val == ""){
   				alert('생년월일을 다시 입력해주세요');
   				$('#yead').focus();
   				return false;
   			}else if($(':radio[name="gender"]:checked').length < 1){
   				alert('성별을 선택해주세요.');
   				$('#male').focus();
   				return false;
   			}else if($(':radio[name="agree"]:checked').length < 1){
   				alert('약관에 동의해주세요.');
   				$('#agree').focus();
   				return false;
   			}else{
   	   			$('#joinForm').submit();
   	   		}
   			
   		});
   		
   		

   	</script>
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
</body>
</html>