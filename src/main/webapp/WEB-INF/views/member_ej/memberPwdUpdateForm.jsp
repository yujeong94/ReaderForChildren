<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>

<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
.contents {
   width: 1000px;
   height: 600px;
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
	
	

#title {
   margin: 50px;
   text-align: center;
}

.info{
      /* border : 1px solid black; */
      width : 55%;
      height : 45%;
      margin-right : auto;
      margin-left : 320px;
      border-collapse: collapse;
      border-spacing: 0;
      margin-top:120px;
      vertical-align: middle; 
      
   }
 
#title2{ font-size: 18px; }

 .info_title2{
      width : 25%;
      height : 8%;
      /* border-top : 2px solid gray; */
      vertical-align: middle; 
      font-size:18px;
	       text-align : center;
	 
   }
    .right{
      width:30%;
      /* border-top : 2px solid gray; */
      vertical-align: middle; 
   }
   .input_info{
   	  margin-left: 25px;
      border-radius: 5px;
      border : 1px lightgray solid;
      height : 27px;
      width : 95%;
   }
 /*   .upBtn{width:100px;height:30px; color:white; margin-right : -360px;
      margin-left : 440px; margin-top:30px; cursor:pointer} */
      .upBtn{width:80px;height:35px;  color: white;  box-shadow: none; 
    border: none; border-radius: 5px; margin-top:40px; }
    #updateBtn{margin-right:10px;margin-left:420px;}
    #cancle{margin-left:10px;}
   #tabletd{height:150px;}
</style>
</head>
<body>
 <div class="outer">
   <c:import url="../common/menubar.jsp"/>
   
   <!-- 내용 -->
   <div class="contents">
      <div id="title"><h1>비밀번호 변경</h1></div>
   <form action="mPwdUpdate.me" method="post" id="updateForm">
  
   
   <table class = "info" id="tabletd" >
       <tr>
          <td class = "info_title2" >현재비밀번호</td>
          <td class = "right"><input type = "password" id="userPwd" name="userPwd" class = "input_info" >
          </td>
       </tr>
       <tr>
          <td class = "info_title2">비밀번호</td>
          <td class = "right"><input type = "password" name="newPwd1" id="newPwd1" class = "input_info">
           <input type="hidden" name="pwdCheck" id="pwdCheck" value="0" required></td>
       </tr>
       <tr>
          <td class = "info_title2">비밀번호 확인</td>
          <td class = "right"><input type = "password" name="newPwd2" id="newPwd2" class = "input_info"></td>
          <td class = "right">
		 			<span class = "pwdinform sm" id = "same" style="display:none">비밀번호 일치</span>
		 			<span class = "pwdinform df" id = "diff" style="display:none">비밀번호 불일치</span>
		 			<input type="hidden" name="pwdCheck2" id="pwdCheck2" value="0">
		 		</td>
       </tr>
       
   
        
       
   </table>
   <script >
   
 	 $('#newPwd1').blur(function(){
     	var str = $(this).val();
     	var passrule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
     	
     	if(passrule.test(str)){
     		$('#pwdCheck').val(1);
     	}else{
     		$('#pwdCheck').val(0);
     	}
     });
     
     $('#newPwd2').blur(function(){
     	if($('#newPwd2').val() == ""){
     		$('.pwdinform.sm').hide();
     		$('.pwdinform.df').hide();
     		$('#pwdCheck2').val(0);
     	}else if($('#newPwd2').val() == $('#newPwd1').val()){
     		$('.pwdinform.sm').show();
     		$('.pwdinform.df').hide();
     		$('#pwdCheck2').val(1);
     	}else{
     		$('.pwdinform.sm').hide();
     		$('.pwdinform.df').show();
     		$('#pwdCheck2').val(0);
     	}
     });
    </script>
   
   
    
   <table>
	   <tr> 
   				<td><input id="updateBtn" type="submit"  value="적용" class="upBtn"></td> 
				<td><button type="button" id="cancle" class="upBtn" onclick="location.href='javascript:history.go(-1)'">취소</button></td>
 	  </tr>
    </table>
   
  
   <script>
   $('#updateBtn').click(function(){
		   if($('#pwdCheck').val() == 0){
				alert('비밀번호를 다시 입력해주세요.\n영문자/숫자/특수문자 포함 8~16자리')
				$('#newPwd1').focus();
	  			return false;
			}else if($('#pwdCheck2').val() == 0){
				alert('비밀번호가 일치하지 않습니다.')
				$('#newPwd2').focus();
	   			return false;
			}else{
				$('#updateForm').submit();
				}
			});
   </script>
   
   </form>
   
   </div>
   
   	<c:import url="../common/footer.jsp"/> 
   </div>
   
   
</body>
</html>