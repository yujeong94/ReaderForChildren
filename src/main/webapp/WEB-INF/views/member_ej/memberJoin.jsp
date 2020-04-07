<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<link rel="stylesheet" href="../../resources/css/common.css">
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
		border : 1px solid black;
		width : 80%;
		margin-right : auto;
		margin-left : auto;
		border-collapse: collapse;
		border-spacing: 0;
	}
	
	#info_title{
		height : 50px;
		background : #D8D8D8;
		font-size : 25px;
	}
	
	#info_word{
		margin-left : 5px;
		vertical-align: middle;
	}
	
	.info_title2{
		width : 25%;
		height : 44px;
		border-top : 2px solid gray;
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
		border-top : 2px solid gray;
	}
	
	.right{
		width: 75%;
		border-top : 2px solid gray;
		padding-top : 8px;
		
	}
	
	#ad_num{
		width : 20%;
	}
	
	#check{
		vertical-align: middle;
		font-size : 13px;
		color : green;
		margin-left : 10px;
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
		width : 10%;
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
		width : 5%;
	}
	
	.gender{
		width:30px;
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
	

</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <!-- 내용 -->
   <div class="contents">
   		<div id="title"><h1>회원가입</h1></div>
   		<table class = "info">
		 	<tr id = "info_title">
		 		<td colspan = "2"><label id = "info_word"><b>기본정보</b></label></td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><lable class = "title_word">아이디</lable></td>
		 		<td class = "right"><input type = "text" class = "input_info"><label id = "check">사용 가능</label></td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><lable class = "title_word">비밀번호</lable></td>
		 		<td class = "right"><input type = "text" class = "input_info"></td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><lable class = "title_word">비밀번호 확인</lable></td>
		 		<td class = "right"><input type = "text" class = "input_info"></td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><lable class = "title_word">이름</lable></td>
		 		<td class = "right"><input type = "text" class = "input_info"></td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2" id = "address"><lable class = "title_word">주소</lable></td>
		 		<td class = "right" id = "address2"><input type = "text" class = "input_info postcodify_postcode5" id = "ad_num" value=""><input type = "button" id = "ad_btn" value = "우편번호"><br>
		 		<input type = "text" class = "input_info info_address postcodify_address" value=""><br>
		 		<input type = "text" class = "input_info info_address postcodify_extra_info" value=""></td>
		 	</tr>
		 		
		 	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	        <script>
		        $(function(){
		           $("#ad_btn").postcodifyPopUp();
		        });
	        </script>
		 	
		 	<tr>
		 		<td class = "info_title2"><lable class = "title_word">휴대전화</lable></td>
		 		<td class = "right"><input type = "text" class = "input_info"></td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><lable class = "title_word">이메일</lable></td>
		 		<td class = "right">
		 			<input type = "text" class = "input_info infro_email" id = "email01"> @ <input type = "text" class = "input_info infro_email" id = "email02">
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
		 		<td class = "info_title2"><lable class = "title_word">생년월일</lable></td>
		 		<td class = "right"><input type = "text" class = "input_info" id= "year" placeholder = "년(4자)">년 <input type = "number" class = "input_info birth">월 <input type = "number" class = "input_info birth">일</td>
		 	</tr>
		 	<tr>
		 		<td class = "info_title2"><lable class = "title_word">성별</lable></td>
		 		<td class = "right">
			 		<input type = "radio" name = "gender" value = "남" class = "gender"><label class = "input_gender">남</label>
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
	 	<label><b>이용약관에 동의하십니까?</b></label><input type = "radio" id = "agree"><label><b>동의함</b></label>
	 </div>
	 
	 <div class = "terms_box">
	 	<input type = "button" id = "join" value = "가입하기">
	 </div>
   		
   	
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
</body>
</html>