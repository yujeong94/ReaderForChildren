<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 결과 발표 | ReaderForChildren</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>

#pwdCheckTable {
	margin: auto;
	margin-right: 230px;
	font-size: 1.2rem;
	height: 100px;
	padding: 10px;
}

#pwdCheckTable td {
	vertical-align: middle;
}

#pwdCheckTable th {
	font-weight: 600;
	vertical-align: middle;
}

#passBtn {
	width: 66px;
	margin: auto;
	margin-top: 30px;
}

#checkPwd {
	width: 150px;
	font-size: 1.1rem;
	vertical-align: middle;
	padding-left: 10px;
}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<div class="contents">
		<h1>정보 확인</h1>
		<form action="passCheckInfo.au" style="margin-bottom: 100px; margin-top: 100px;">
			<table id="pwdCheckTable">
				<tr>
					<th width="150px">비밀번호</td>
					<td><input type="password" name="userPwd" id="pwd1"></td>
					<td></td>
				</tr>
				<tr>
					<th>비밀번호 확인</td>
					<td><input type="password" id="pwd2"></td>
					<td id="checkPwd"></td>
				</tr>
			</table>
			
			<div id="passBtn">
				<button class="defaultBtn upBtn">확인</button>
			</div>
		</form>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
</body>
<script>
	var check = false;
	$('#pwd2').keyup(function(){
	 	if($('#pwd2').val() == $('#pwd1').val()){
	 		$("#checkPwd").text("비밀번호 일치").css("color","green");
	 		check = true;
	 	} else{
	 		$("#checkPwd").text("비밀번호 불일치").css("color","red");
	 		check = false;
	 	}
	 });
	
	$(".upBtn").click(function(){
		if(check == false) {
			$(".upBtn").attr("type","button");
			swal("비밀번호가 일치하지 않습니다.");
		} else {
			$(".upBtn").attr("type","submit");
			console.log("submit");
		}
	});
	
</script>
</html>