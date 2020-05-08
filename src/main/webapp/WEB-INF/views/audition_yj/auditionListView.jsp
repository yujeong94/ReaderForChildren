<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 지원 리스트 | ReaderForChildren</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>
	h2 { 
		font-size: 1.5rem;
		font-weight: 600;
		margin-left: 30px;
		margin-top: 80px;
	}
	h3 {
		font-size: 1rem;
		margin-left: 50px;
		color: red;
	}
	.aListTable {
		float: left;
		margin-top: 80px;
		margin-bottom: 70px;
		margin-left: 15px;
		width: 185px;
		height: 600px;
		text-align: center;
	}
	/* td {
		vertical-align: middle;
	} */
	.conBg {
		background: #FBEACD;
	}
	.conTitle {
		font-weight: 800;
		font-size: 1.3rem;
		margin-bottom: 10px;
	}
	.btnTd {
		vertical-align: bottom;
		padding-bottom: 10px;
	}
 	.applyBtn {
		background: #EF8F0E;
	} 
	.imgTr {
		border: none;
		width: 184px;
		height: 220px;
	}
	.aCon {
		font-size: 1.1rem;
	}
	
	.downBtn {
		background: #F8B448;
		color: white;
		border: none;
		border-radius: 3px;
	}
	
	#nullInfo {
		margin: auto;
		margin-top: 50px;
		margin-bottom: 100px;
		width: 300px;
		text-align: center;
		font-size: 1.5rem;
	}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<c:import url="auMenubar.jsp"/>
	
	<div class="contents clear-fix">
		<h1>Reader 오디션 지원</h1>
		<h2>이 달의 판매 예정 오디오북</h2>
		<h3>※ 오디션 지원에 관한 자세한 사항은 공지사항을 참고하세요 <a href="noList.no" style="color:navy; text-decoration: none;"> >> 바로가기</a></h3>
		
		<c:if test="${ adminUser != null && aulist == null}">
			<div id="nullInfo">
				오디션 공고를 등록해주세요.
			</div>
		</c:if>

		<c:forEach var="a" items="${ aulist }">
			<table class="aListTable">
				<tr>
					<td class="imgTr"><img src="${ contextPath }/resources/uploadFiles/${ a.biName }" width="184px" height="220px" ></td>
				</tr>
				<tr class="conBg"><td style="font-size: 1.2rem;">"${ a.bkName }"</td></tr>  
				<tr class="conTitle conBg"><td>테스트 구절</td></tr>
				<tr class="conBg"><td><a href="${ contextPath }/resources/uploadFiles/${ a.teName }" download="${ a.teName }"><button class="downBtn">다운로드</button></a></td></tr>
				<tr class="conTitle conBg"><td>모집조건</td></tr>
				<tr class="aCon conBg"><td>성별 - ${ a.qGender }</td></tr>
				<tr class="aCon conBg"><td>나이 - ${ a.qAge }</td></tr>
				<tr class="aCon conBg"><td>경력 - ${ a.qCareer }</td></tr>
				<tr class="conTitle conBg"><td>요청사항</td></tr>
				<tr class="aCon conBg"><td height="10%">${ a.request }</td></tr>
				<tr class="conTitle conBg"><td>마감날짜 </td></tr>
				<tr class="aCon conBg endDate"><td>${ a.endDate }</td></tr>
					
					<c:url var="upView" value="auListUpView.au">
						<c:param name="aNum" value="${ a.aNum }"/>
					</c:url>
					<%-- <c:url var="delete" value="auListDelete.au">
						<c:param name="aNum" value="${ a.aNum }"/>
					</c:url> --%>
					
				<tr class="conBg">
				    <c:if test="${ loginUser != null && loginUser.division == 1 }">
						<td class="btnTd btnTd1"><button class="defaultBtn applyBtn">Apply</button>
						<input type="hidden" value="${ a.aNum }" class="anum">
						<input type="hidden" value="${ a.bkName }" class="bkname">
						</td>
					</c:if>
					<c:if test="${ adminUser != null }">
						<td class="btnTd">
							<button class="defaultBtn upBtn" onclick="location.href='${ upView }'">Edit</button>
							<button class="defaultBtn delBtn">Delete</button>
							<input type="hidden" value="${ a.aNum }" class="anum">
						</td>
					</c:if>
				</tr>
			</table>
		</c:forEach>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
<script>
	$(".delBtn").click(function(){
		var anum = $(this).parent().children(".anum").val();
		
		swal({
			  title: "정말 삭제하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				location.href="auListDelete.au?aNum=" + anum;
			  } else {
			    swal("삭제가 취소되었습니다.");
			  }
			});
	});
	
	// 오디션 한번만 지원가능
	$(".applyBtn").click(function(){
		var userId = "${ loginUser.userId }";
		var anum = $(this).parent().children(".anum").val();
		var bkname = $(this).parent().children(".bkname").val();
		
		var today = new Date();
		var day = today.getDate();
		var month = today.getMonth() + 1;
		var year = today.getFullYear();
		
		if(day < 10) {
			day = '0' + day;
		}
		if(month < 10) {
			month = '0' + month;
		}
		
		today = Number(year+month+day);
		var endDate = Number($(this).parents().children(".endDate").children().text().replace(/-/g,""));
		
		if(today > endDate) {
			swal("이미 마감된 공고입니다.");
		} else {
			$.ajax({
				url: "readerCheck.au",
				type: "post",
				data: {userId:userId},
				success: function(data) {
					if(data == "ok") {
						swal("이미 지원하셨습니다. 오디션은 한번만 지원가능합니다.");
					} else {
						location.href="applyInsert.au?aNum=" + anum + "&bkName=" + bkname;
					}
				}
			});
		} 
	});
</script>
</body>
</html>