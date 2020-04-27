<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	#mainTitle{
		width : 100%;
		text-align : center;
		border-bottom : gray solid 2px;
	}
	
	#notice{
		height : 70px;
		background : lightgray;
		margin-bottom : 20px;
	}
	
	#activityTable{
		border : 2px solid rgb(84,12,211);
		border-radius : 5px;
		width : 90%;
		margin-left : auto;
		margin-right : auto;
		margin-bottom : 20px;
	}
	
	.firstTd{
		width : 80%;
		height : 40px;
		font-weight : bold;
		padding-left : 10px;
		
	}
	
	.cancelBtnTd{
		text-align : right;
		padding-right : 10px;
	}
	
	.cancelBtn{
		width : 90px;
		height : 30px;
		border: solid 1px rgb(84,12,211);
		border-radius: 12px;
		background : rgb(84,12,211);
		color : white;
		font-size : 12px;
		font-weight : bold;
		cursor : pointer;
	}
	
	.date{
		height : 20px;
		text-align : right;
		padding-right : 10px;
		font-weight : bold;
	}
	
	#overDate{
		border: solid 1px gray;
		background : gray;
		pointer-events: none;
	}
</style>
</head>
<body>

	<div id = "content">
		
		<div id = "mainTitle">
			<h1>나의 봉사활동</h1>
		</div>
		
		<div id = "notice">
			
		</div>
		
		<div id = "activityDiv">
			<c:forEach var="mva" items="${ mva }">
				<table id = "activityTable">
					<tr>
						<td class = "firstTd">${ mva.volContent }</td>
						<td class = "cancelBtnTd">
							<%-- <c:url var = "cancel" value = "cancelVol.vo">
								<c:param name = "vlNum2" value = "${ mva.vlNum2 }"/>
							</c:url> --%>
							<input type="hidden" class="vlNum" name="vlNum2" value="${ mva.vlNum2 }">
							<c:if test="${ mva.volStatus eq 'N' }">
								<input type="button" class = "cancelBtn" id = "overDate" value = "취소하기" >
							</c:if>
							<c:if test="${ mva.volStatus eq 'Y' }">
								<input type="button" class = "cancelBtn" value = "취소하기">
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan = "2" class = "date">시작날짜 | ${ mva.volStart }</td>
					</tr>
					<tr>
						<td colspan = "2" class = "date">끝날짜 | ${ mva.volEnd }</td>
					</tr>
				</table>
			</c:forEach>
		</div>
		

		
		
		
	</div>



	<script>
		$(".cancelBtn").click(function(){
			var vlNum2 = $(this).parent().children(".vlNum").val();
			var result = confirm("정말 취소하시겠습니까?");
			
			if(result){
				location.href='cancelVol.vo?vlNum2='+vlNum2;
			}else{
				return false;
			}
		});
	</script>
</body>
</html>