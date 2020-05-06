<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventDetail</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>
.contents {
	width: 1100px;
	background: white;
	margin: auto;
	margin-bottom: 100px;
	padding: 20px;
}

#title {
	margin: 50px;
	text-align: center;
}

.tableStyle{
	margin: auto;
}

.inputStyle{border-radius: 4px; box-shadow: none; padding: 0.5rem 0.6rem; font-size: 0.8rem;
   		line-height: 1.5; vertical-align: middle; border: 1px solid #ced4da; transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;}
   		
.btnStyle{
	text-align: center;
	padding: 20px;
}

#evnet_title{
	width: 635px;
}

.label{
	font-weight: 600; width: 150px; height: 50px; font-size: 15px;
}
.textClass{resize: none; border: 1px solid #ced4da; border-radius: 4px;}

#labelTd1{
	vertical-align: middle;
}

.photoTD{
	padding-top: 20px;
	vertical-align: middle;
}

#event_entry{
	border-radius: 4px; vertical-align: middle; border: 1px solid #ced4da;
	padding: 0.5rem 0.6rem; font-size: 0.8rem; width: 128px;
}

#event_num{
	border-radius: 4px; vertical-align: middle; border: 1px solid #ced4da;
	padding: 0.5rem 0.6rem; font-size: 0.8rem; width: 113px;
}

.btn_file {display:inline-block;width:100px;height:26px;font-size:0.8em;line-height:27px;text-align:center;vertical-align:middle;
			background-color: lightgray; font-weight: 600; font-size: 0.9rem; border-radius: 0.25rem;padding: 2px;}
			
input[type="file"] {position:absolute;width:1px;height:1px;padding:0;
					margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0;}
					
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 내용 -->
	<div class="contents">
		<div id="title"><h1>이벤트 등록</h1></div>
		<form action="eventDataInsert.ev" method="post" enctype="Multipart/form-data" onsubmit="return submitForm();">
			<table class="tableStyle">
				<tr>
					<td class="label" id="labelTd">제목</td>
					<td>
						<input type="text" class="inputStyle" name="eTitle" id="event_title" placeholder="이벤트 제목을 입력하세요." required>
					</td>
				</tr>
				<tr>
					<td class="label" id="labelTd">기간</td>
					<td>
						<input type="date" class="inputStyle" name="eStart" id="startDate" required>
						~
						<input type="date" class="inputStyle" name="eEnd" id="endDate" required>
					</td>
				</tr>
				<tr>
					<td class="label" id="labelTd">발표 날짜</td>
					<td>
						<input type="date" class="inputStyle" name="eAnno" id="announDate" required>
					</td>
				</tr>
				<tr>
					<td class="label" id="labelTd">대상자</td>
					<td>
						<select size="1" id="event_entry" name="eTarget">
							<option value="모든 회원" selected>모든 회원</option>
							<option value="후원자">후원자</option>
							<option value="오디션 지원자">오디션 지원자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="label" id="labelTd">당첨자 수</td>
					<td>
						<input type="number" min="1" id="event_num" name="eEventNum" required>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="label" id="labelTd1">이벤트 소개</td>
				</tr>
				<tr>
					<td colspan="2"><textarea class="textClass" name="eContent" id="event_intro" rows="7" cols="110" placeholder="이벤트 소개를 적어주세요." required></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="label" id="labelTd1">이벤트 참여 방법</td>
				</tr>
				<tr>
					<td colspan="2"><textarea class="textClass" name="eWay" id="event_way" rows="7" cols="110" placeholder="이벤트 참여 방법을 적어주세요." required></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="label" id="labelTd1">이벤트 당첨 기준</td>
				</tr>
				<tr>
					<td colspan="2"><textarea class="textClass" name="eStand" id="event_stand" rows="7" cols="110" placeholder="이벤트 당첨 기준을 적어주세요." required></textarea></td>
				</tr>
				<tr>
					<td class="label photoTD" id="labelTd2">사진 첨부</td>
					<td class="photoTD" id="testTD">
						<input type="text" name="potoFile" id="potoFile" class="inputStyle" readonly>
						<label for="uploadBtn1" class="btn_file">첨부파일</label>
						<input type="file" name="uploadBtn1" id="uploadBtn1" class="uploadBtn1" accept="image/jpeg, image/png, image/jpg" required>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="btnStyle"><input type="submit" class="defaultBtn upBtn" value="등록"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		var uploadFile = $('.photoTD .uploadBtn1');
	    uploadFile.on('change', function(){
	    	if(window.FileReader){
	    		var filename = $(this)[0].files[0].name;
	    	} else {
	    		var filename = $(this).val().split('/').pop().split('\\').pop();
	    	}
	    	$(this).siblings('#potoFile').val(filename);
	    	
	    });
	    
	    function submitForm(){
	    	var startDay = $('#startDate').val();
	    	var endDay = $('#endDate').val();
	    	var annouDay = $('#announDate').val();
	    	
	    	if(annouDay < endDay){
	    		alert("발표 날짜를 다시 등록해주세요.");
	    		return false;
	    	} else{
	    		return true;
	    	}
	    }
	</script>
	
</body>
</html>