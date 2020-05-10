<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReaderForChildren</title>
<style>
	.ment{display: inline-block; float: right;}
	#chk{width: 17px; height: 17px;}
</style>
</head>
<body>
	<div class="content">
		<img src="${ contextPath }/resources/images/popupImg.png" width="680" height="450">
		<form method="post" action="popup.ab" name="frm">
			<div class="ment">
				<input type="checkbox" name="chk" id="chk" value="no" onclick="document.frm.submit()">
				<span>24시간 동안 보이지 않기</span>
				<a href="javascript:self.close()">[닫기]</a>
			</div>
		</form>
	</div>
	
<%
	String chk = request.getParameter("chk");
	if(chk != null){
%>	
		<script type="text/javascript">
		document.getElementById("chk").checked = true;
		</script>
<%	
		Cookie ck = new Cookie("pop", "no");
		ck.setMaxAge(60*60*24);
		response.addCookie(ck);
	}
%>	
	
</body>
</html>