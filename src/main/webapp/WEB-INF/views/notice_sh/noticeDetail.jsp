<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>noticeDetail</title>
<style>
   .frame{width: 80%; margin: 0 auto 30px; border-top: 1px solid grey; border-bottom: 1px solid lightgrey;}
   .titleLine{background: rgb(254, 249, 248); height: 75px; font-size: 17px; border-bottom: 1px solid lightgrey; padding: 5px 0 5px;}
   #titleDiv{width: 79.5%; display: inline-block; padding-top: 25px;}
   #titleSpan{padding-left: 20px; font-weight: bold;}
   #infoDiv{width: 19.7%; height: 100%; display: inline-block;}
   #infoTable{margin-left: auto; margin-right: 18px; margin-top: 16px; text-align: center; color: grey; font-size: 13px;}
   #date{border-bottom: 1px solid lightgrey;}
   .contentDiv{height: 400px; font-size: 15px; padding: 30px 20px 20px 20px; background: rgb(254, 249, 248);}
   .btnBox{margin-bottom: 30px;}
   .UpdateBtn{background: rgb(231, 76, 60);}
   .delBtn{background: rgb(190, 190, 190); margin: 0 8px 0;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>
   
	<div class="contents">
		<div id="title"><h1>공지사항</h1></div>
         
		<div class="frame">
			<div class="titleLine">
				<div id = "titleDiv">
					<span id="titleSpan">
						<span style="color: rgb(235, 130, 118);">[${ n.category }]</span>
						${ n.noTitle }
					</span>
				</div>
				
				<div id = "infoDiv">
					<table id = "infoTable">
						<tr><td id = "date">${ n.noDate }</td></tr>
						<tr><td>운영자&nbsp;&nbsp;|&nbsp;&nbsp;${ n.noHit }</td></tr>
					</table>
				</div>
			</div>
            
			<div class = "contentDiv">
				<% pageContext.setAttribute("newLineChar", "\r\n"); %>
				${ fn:replace(n.noContent, newLineChar, "<br>") }
			</div>
		</div>
		
		<c:url var="update" value="noUpdateView.no">
			<c:param name="noCode" value="${ n.noCode }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		
		<c:url var="delete" value="noDelete.no">
			<c:param name="noCode" value="${ n.noCode }"/>
		</c:url>
         
		<div class="btnBox">
			<c:if test="${ adminUser ne null }">
				<button class="defaultBtn UpdateBtn" onclick="location.href='${ update }'">수정하기</button>
			</c:if>
			
			<button class="defaultBtn delBtn" onclick = "location.href='noList.no'">목록으로</button>
			
			<c:if test="${ adminUser ne null }">
				<button class="defaultBtn UpdateBtn" onclick="deleteNotice();">삭제하기</button>
			</c:if>	
		</div>
	</div>
      
	<c:import url="../common/footer.jsp"/>   
	</div>
	
	<script>
	function deleteNotice(){
		var bool = confirm('게시글을 삭제하시겠습니까?');
		if(bool){
			location.href='${ delete }';
		}
	}
	</script>
</body>
</html>