 

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
   
   .contents{
      width: 1000px;
      height: 800px;
      background: white;
      margin: auto;
      margin-bottom: 100px;
      padding: 20px;
      font-size:16px;
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
    #title {
   margin: 50px;
   text-align: center;
}
   
   .info{
      border : 1px solid black;
      width : 60%;
      margin-right : auto;
      margin-left : auto;
      border-collapse: collapse;
      border-spacing: 0;
      margin-top:30px;
      vertical-align: middle;  
   }
   
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
.quick_menu {
	 position:absolute; 
	 margin-top: 100px; 
		
	}
	.quick_menu table {
		display: inline-table;
		text-align: center;
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		margin-bottom: 20px;
	}
	.quick_menu td {
		cursor: pointer; 
		vertical-align: middle;  
		background-color: rgb(253, 249, 249);
	}
	.quick_menu td:hover{color:rgb(225, 120, 110);}
.boardTr{width:80px; height:40px; background-color: white;}
	.td {
		border-bottom: 1px solid gray;
	}
	#tabletd td{ vertical-align: middle;}
#btn{margin-left:370px; margin-top:30px;}
.upBtn{width:80px;height:35px;  color: white;  box-shadow: none; 
    border: none; border-radius: 5px; font-size:13pt; font-weight: bold; }
    .delBtn{width:90px;height:35px;  color: white;  box-shadow: none; 
    border: none; border-radius: 5px; font-size:13pt; font-weight: bold; }
    #updateBtn{margin-right:10px;}
    #deleteBtn{margin-left:10px;}
  
    #changePwd{font-weight: 550; }
	#changePwd:hover{color:rgb(225, 120, 110); cursor:pointer;}
</style>

</head>
<body>
   <!-- 로고, 장바구니, 메뉴바 -->
  <div class="outer">
   <c:import url="../common/menubar.jsp"/>
   
   <div class = "contents">
   
   <div id="title"><h1>마이페이지</h1></div>
				
				<div class="quick_menu">
				<table>
					
					<tr class="boardTr">
						<td class="td" onclick="location.href = 'buylist.jsp'" id="infoTd">주문 내역 조회
						</td>
					</tr>
					<tr class="boardTr">
						<td class="td" onclick="location.href = 'sponserlist.jsp'" id="infoTd">후원내역 조회
						</td>
					</tr>
					<tr class="boardTr">
						<td class="td" onclick="location.href = '../basket/basketlist.jsp'" id="infoTd">장바구니 조회
						</td>
					</tr>
					<tr class="boardTr">
						<td class="td" onclick="location.href = 'booklist.jsp'" id="infoTd">예약부스 내역 조회
						</td>
					</tr>
					</table>
			</div>
		  
			<form action="mupdate.me" method="post">
    <table class = "info" id="tabletd" >
       <tr id = "info_title">
          <td colspan = "2"><label id = "info_word"><b>마이페이지</b></label></td>
       </tr>
       <tr>
          <td class = "info_title2">아이디</td>
          <td class = "right">${ loginUser.userId }<input type = "hidden" class = "input_info" name="userId" value="${ loginUser.userId }"></td>
       </tr>
       <tr>
          <td class = "info_title2">비밀번호</td>
          <td class = "right"><input type = "password" id = "userPwd" class = "input_info" name = "userPwd" required><span id="changePwd" onclick="location.href='mpwdUpdateView.me'" >비밀번호 변경하기</span></a>
          <input type="hidden" name="pwdCheck" id="pwdCheck" value="0" required></td>
       </tr>
       <tr>
		 		<td class = "info_title2"><label class = "title_word">비밀번호 확인</label></td>
		 		<td class = "right">
		 			<input type = "password" class = "input_info" id = "userPwd2" name = "userPwd2" required>
		 			<span class = "pwdinform sm" id = "same" style="display:none">비밀번호 일치</span>
		 			<span class = "pwdinform df" id = "diff" style="display:none">비밀번호 불일치</span>
		 			<input type="hidden" name="pwdCheck2" id="pwdCheck2" value="0">
		 		</td>
		 	</tr>
       <tr>
          <td class = "info_title2">이름</td>
          <td class = "right"><input type = "text" class = "input_info" name="userName" value="${ loginUser.userName }"></td>
       </tr>
      	<tr>
		 		<td class = "info_title2" id = "address"><label class = "title_word">주소</lable></td>
		 		<td class = "right" id = "address2"><input type = "text" class = "input_info postcodify_postcode5" id = "ad_num" name = "postalCode" value="${ loginUser.postalCode }">
		 		<input type = "button" id = "ad_btn" value = "우편번호"><br>
		 		<input type = "text" class = "input_info info_address postcodify_address" value="${ loginUser.bAddress }" name = "bAddress"><br>
		 		<input type = "text" class = "input_info info_address postcodify_extra_info" value="${ loginUser.lAddress }" name = "lAddress"></td>
		</tr>
       <tr>
          <td class = "info_title2">휴대전화</td>
          <td class = "right"><input type = "text" class = "input_info" name="phone" value="${ loginUser.phone }"></td>
       </tr>
       <tr>
          <td class = "info_title2">이메일</td>
          <td class = "right">
             <input type = "text" class = "input_info infro_email" id = "email01" name="email1" value="${email1 }" name="email1" > @ <input type = "text"  value="${selectEmail }" name="selectEmail"  class = "input_info infro_email" id = "email02">
            <input type="hidden" name="emailCkeck" id="emailCheck" value="${loginUser.email }">
             <select name="selectEmail" id="selectEmail" value="${selectEmail }">
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
       <%-- <tr>
          <td class = "info_title2">수익현황</td>
          <td class = "right">${ loginUser.revenue }</td>
       </tr>
        <tr>
          <td class = "info_title2">후원금액</td>
          <td class = "right" name="donation">${ sp.donation }</td>
       </tr>  --%>
    </table>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	        <script>
		        $(function(){
		           $("#ad_btn").postcodifyPopUp();
		        });
		        </script>
 	<script>
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
 
    <div id="btn">
    <table>
   
   <tr> 
   <td><input type="submit" value="수정" class="upBtn" id="updateBtn"></td> 
					
				<td><button type="button" id="cancels" class="upBtn" onclick="location.href='javascript:history.go(-1)'">취소</button></td>
				
				<c:url var="mdelete" value="mdelete.me">
							<c:param name="id" value="${ loginUser.userId }"/>
				</c:url>
				<td><button type="button" id="deleteBtn" class="delBtn" onclick="location.href='${ mdelete }'">회원 탈퇴</button></td>
   </tr>
     </table>
    </div>
       </form>
   </div>
  	<c:import url="../common/footer.jsp"/> 
   </div>
</body>
</html>