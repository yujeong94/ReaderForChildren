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
.contents {
   width: 1100px;
   height: 600px;
   background: white;
   margin: auto;
   margin-bottom: 100px;
   padding: 20px;
}

#title {
   margin: 50px;
   text-align: center;
}
	
label{
	font-size : 15px;
}
	.info{
		border : 1px solid black;
		width : 60%;
		margin-right : auto;
		margin-left : auto;
		margin-top : 100px;
		border-collapse: collapse;
		border-spacing: 0;
	}

	.info_title{
		width : 25%;
		height : 44px;
		border-top : 2px solid gray;
		margin-left : 10px;
		vertical-align : middle;
	}
	
	.title_word{
		margin-left : 10px;
		color : gray;
		font-size : 15px;
	}
	
	#method{
		width : 15px;
		height : 15px;
	}
	
	.right{
		width: 75%;
		border-top : 2px solid gray;
		vertical-align : middle;
	}
	
	.input_info{
		border-radius: 5px;
		border : 1px lightgray solid;
		height : 24px;
		width : 50%;
	}
	
	.infro_email{
		width : 30%;
	}
	
	#selectEmail{
		height : 26px;
	}
	
	.btn_box{
		width : 80%;
		margin-right : auto;
		margin-left : auto;
		margin-top : 40px;
	}
	
	#ok_btn{
		width : 250px;
		height : 45px;
		background : #F06250;
		color : white;
		font-weight : bold;
		font-size : 20px;
		margin-bottom : 50px;
		margin-left : 310px;
		border : 1px solid #F06250;
		border-radius : 4px;
		cursor : pointer;
	}
</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <!-- 내용 -->
   <div class="contents">
      <div id="title"><h1>비밀번호 찾기</h1></div>
   
   	<form action = "findPwd.me" method="post" id="findForm">
	 <table class = "info">
	 	<tr>
	 		<td class = "info_title"><label class = "title_word">인증방법</label></td>
	 		<td class = "right"><input type = "radio"  checked = "checked" id="method"><label>이메일</label></td>
	 	</tr>

		<tr>
			<td class = "info_title"><label class = "title_word">아이디</label></td>
			<td class = "right">
				<input type = "text" class = "input_info" id = "userId" name ="userId">
				<input type="hidden" name ="idCheck" id="idCheck">
			</td>
		</tr>

	 	<tr>
	 		<td class = "info_title"><label class = "title_word">이름</label></td>
	 		<td class = "right">
	 			<input type = "text" class = "input_info" id = "userName" name = "userName">
	 			<input type="hidden" name="nameCheck" id="nameCheck">
	 		</td>
	 		
	 	</tr>

	 	<tr>
	 		<td class = "info_title"><label class = "title_word">이메일</label></td>
	 		<td class = "right">
	 			<input type="hidden" name="email" id="realEmail">
	 			<input type = "text" class = "input_info infro_email" id = "email01"> @ <input type = "text" class = "input_info infro_email" id = "email02">
	 			<input type="hidden" name="emailCheck" id="emailCheck">
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
	 </table>
	
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
       	console.log($('#realEmail'));
       	   });
    </script>
	
	 <script>
	 		
		 $('#userId').blur(function(){
	         var str = $(this).val();
	         var regExp = /^[a-z0-9]+$/;
	         
	         if(regExp.test(str)){
	            $('#idCheck').val(1);
	         } else {
	        	$('#idCheck').val(0);
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
		 
		 $('#email01').blur(function(){
		        var str = $(this).val();
		        var regExp = /^[a-zA-Z0-9]*$/;
		        
		        if(regExp.test(str)){
		         $('#emailCheck').val(1);
		        } else {
		       	 $('#emailCheck').val(0);
		        }
		    });
		 
		 
	 </script>
	
	 
	 <div class = "btn_box">
	 	<input type = "button" id = "ok_btn" value = "임시 비밀번호 전송">
	 </div>
	  
 	</form>
   
  <script>
	   $('#ok_btn').click(function(){
			if($('#idCheck').val() == 0){
				alert('아이디를 확인해주세요.');
				$('#userId').focus();
	   			return false;
			}else if($('#nameCheck').val() == 0){
				alert('이름을 확인해주세요.');
				$('#userName').focus();
	   			return false;
			}else if($('#emailCheck').val() == 0){
				alert('이메일을 확인해주세요.')
				$('#email01').focus();
	   			return false;
			}else{
				$('#findForm').submit();
			}
		});
   </script>
	  
	    
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
</body>
</html>