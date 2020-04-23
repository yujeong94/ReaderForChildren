<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>audioBookUpdate</title>
<style>
	#title{padding: 25px 0 30px 0;}
	.tb{margin: 0 auto; font-size: 16px;}
	.tb td {vertical-align: top;}
	#imgArea{width: 280px; height: 350px; border: 1px solid grey;}
	#imgArea:hover{cursor: pointer;}
	.td1{padding: 15px 0 50px 40px;} .td1 span, .td4 span, .td5 span{margin: 5px;}
	.td1 input{margin-bottom: 10px;}
	.td1 input, .td4 input, .td5 input, .simpleInfo input{margin-right: 5px; border-radius: 4px; height: 18px;}
	.td4, .td5{margin-right: 20px; float: right; margin-bottom: 3px;}
	.td6{text-align: center;}
	.Btn{color: white; border: none; width: 120px; height: 45px; border-radius: 5px;
		font-weight: bold; font-size: 17.5px; margin: 20px 5px 20px 5px;}
	.purchaseBtn{background: rgb(231, 76, 60);}
	.cartBtn{background: rgb(190, 190, 190)}
	
	.info{margin: 0 0 80px 130px; width: 840px; height: 100%;}
	.IT{font-weight: bold; font-size: 19px; margin: 10px 0 20px 0;}
	.line{width: 730px; border-bottom: 2px solid rgb(136, 136, 136); margin-bottom: 20px;}
	.simpleInfo span{margin-right: 7px;}
	.simpleInfo{font-size: 16px; margin-bottom: 30px;}
	.intro span{font-size: 16px; font-weight: bold;}
	.intro2{margin: 8px 0 100px 0; width: 700px; height: 100px; font-size: 14px; resize: none; border-radius: 4px;}
	.IT2{display: inline-block;}
	.intro3{margin: 8px 0 30px 0; width: 700px; height: 100px; font-size: 14px; resize: none; border-radius: 4px;}
	.record{height: 100px;}
	.btnBox{margin-bottom: 30px;}
	.update{background: rgb(243, 156, 18); color: white; border: none; width: 130px; height: 50px; border-radius: 5px;
		font-weight: bold; font-size: 20px; text-align: center; margin-right: 8px;} .update:hover {cursor: pointer;}
	.delBtn{color: white; border: none; width: 130px; height: 50px; border-radius: 5px;
		font-weight: bold; font-size: 20px; text-align: center;} .delBtn:hover {cursor: pointer;}
	.recordSpan {font-weight:bold; background:lightgray; border-radius: 4px; margin-right: 5px; height: 10px;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>
		
		<div class="contents">
			<div id="title"><h1>상품 등록</h1></div>
			
			<br clear="all">
			<form action="updateProduct.ab" method="post" enctype="Multipart/form-data">
			<input type="hidden" name="page" value="${ page }">
				<table class="tb">
					<tr>
						<td class="td0">
							<div id="imgArea">
								<img id="image" src="${ contextPath }/resources/bookUploadImages/${ i.changeName }" width="280" height="350">
								<input type="hidden" name="imgOriginName" value="${ i.originName }">
								<input type="hidden" name="imgChangeName" value="${ i.changeName }">
								<input type="hidden" name="biNo" value="${ i.biNo }">
							</div>
							<div id="fileArea">
								<input type="file" id="thumbnailImg" multiple="multiple" name="thumbnailImg" onchange="LoadImg(this)">
							</div>
						</td>
						<td width="150px"></td>
						<td>
							<table>
								<tr>
									<td class="td1">
										<input type="hidden" name="bkCode" value="${ b.bkCode }">
										<span>도서 제목</span> <input type="text" name="bkName" value="${ b.bkName }" style="width: 130px;"><br>
										<span style="margin-right: 27px;">페이지</span> <input type="text" name="bkPage" value="${ b.bkPage }" style="width: 50px;"><br>
										<span style="margin-right: 43px;">출판</span> <input type="text" name="bkPublisher" id="bkPublisher" value="${ b.bkPublisher }" style="width: 80px;"><br>
										<span style="margin-right: 59px;">글</span> <input type="text" name="bkWriter" id="bkWriter" value="${ b.bkWriter }" style="width: 100px;"><br>
										<span style="margin-right: 43px;">그림</span> <input type="text" name="bkDraw" id="bkDraw" value="${ b.bkDraw }" style="width: 100px;"><br>
										<span style="margin-right: 27px;">출판일</span> <input type="date" name="bkPubdate" id="bkPubdate" value="${ b.bkPubdate }" style="width: 120px;">
		                        	</td>
								</tr>
								<tr>
									<td class="td4">
										<span style="margin-right: 33px;">도서 가격</span> <input type="text" name="bkPrice" value="${ b.bkPrice }" style="width: 100px;">원
									</td>
								</tr>
								<tr>
									<td class="td5">
										<span style="margin-right: 33px;">오디오북 가격</span> <input type="text" name="audPrice" value="${ abF.audPrice }" style="width: 100px;">원
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				
				<br clear="all"><div style="height: 70px;"></div>
				
				<div class="info">
					<div class="bookInfo">
						<div class="IT">도서 정보</div>
						<div class="line"></div>
						
						<div class="simpleInfo">
							<span>저자</span> <input type="text" id="bkWriter2" value="${ b.bkWriter }" style="width: 100px;">
							<span>그림</span> <input type="text" id="bkDraw2" value="${ b.bkDraw }" style="width: 100px;">
							<span>출판</span> <input type="text" id="bkPublisher2" value="${ b.bkPublisher }" style="width: 100px;">
							<span>도서 발행일</span> <input type="date" id="bkPubdate2" value="${ b.bkPubdate }" style="width: 120px;">
						</div>
						<div class="intro">
							<span>책 소개</span><br>
							<textarea class="intro2" name="bkIntro">${ b.bkIntro }</textarea>
						</div>
						
					</div>
					
					<div class="audioBookInfo">
						<div class="IT IT2">오디오북 정보 - 여자</div>
						<div class="line"></div>
						
						<div class="simpleInfo">
							<input type="hidden" name="audCodeF" value="${ abF.audCode }">
							<span>리더 이름</span> <input type="text" name="rdNameF" value="${ abF.rdName }" style="width: 80px;">
							<span>리더 아이디</span> <input type="text" name="rdIdF" value="${ afF.userId }" style="width: 80px;">
							<span>오디오북 발행일</span> <input type="date" name="audDateF" value="${ abF.audDate }" style="width: 120px;">
						</div>
						<div class="intro">
							<span>리더 소개</span><br>
							<textarea class="intro3" name="rdIntroF">${ abF.rdIntro }</textarea><br>
							
							<span>미리듣기</span>
							
							<br><br>
							
							<input type="hidden" name="afCodeF" value="${ afF.afCode }">
							<div class="recordArea">
          						<label class="star">* </label><span class="recordSpan">&nbsp;[파일] </span>
               					<span id="fileShowF">
               						${ afF.originName }
               						<input type="hidden" name="audioFileFOr" value="${ afF.originName }">
               						<input type="hidden" name="audioFileF" value="${ afF.changeName }">
               					</span>
           						<button type="button" id="recFileF" class="defaultBtn upBtn" style="background: gray; width: 60px; height: 30px; padding: 2px;">변경</button>
         					</div>
         					
         					<div class="fileArea">
        					 	<input type="file" accept="audio/*" id="recBtnF" name="fileF" onchange="Load(this,1)">
      						</div>
						</div>
					</div>
					
					<div style="height: 50px;"></div>
					
					<div class="audioBookInfo">
						<div class="IT IT2">오디오북 정보 - 남자</div>
						<div class="line"></div>
						
						<div class="simpleInfo">
							<input type="hidden" name="audCodeM" value="${ abM.audCode }">
							<span>리더 이름</span> <input type="text" name="rdNameM" value="${ abM.rdName }" style="width: 80px;">
							<span>리더 아이디</span> <input type="text" name="rdIdM" value="${ afM.userId }" style="width: 80px;">
							<span>오디오북 발행일</span> <input type="date" name="audDateM" value="${ abM.audDate }" style="width: 120px;">
						</div>
						<div class="intro">
							<span>리더 소개</span><br>
							<textarea class="intro3" name="rdIntroM">${ abM.rdIntro }</textarea><br>
							
							<span>미리듣기</span>
							
							<br><br>
							
							<input type="hidden" name="afCodeM" value="${ afM.afCode }">
							<div class="recordArea">
          						<label class="star">* </label><span class="recordSpan">&nbsp;[파일] </span>
               					<span id="fileShowM">
               						${ afM.originName }
               						<input type="hidden" name="audioFileMOr" value="${ afM.originName }">
               						<input type="hidden" name="audioFileM" value="${ afM.changeName }">
               					</span>
           						<button type="button" id="recFileM" class="defaultBtn upBtn" style="background: gray; width: 60px; height: 30px; padding: 2px;">변경</button>
         					</div>
         					
         					<div class="fileArea">
        						<input type="file" accept="audio/*" id="recBtnM" name="fileM" onchange="Load(this,2)">
      						</div>
							
						</div>
					</div>
				</div>
				
				<div class="btnBox">
					<input type="submit" class="update" value="수정">
					<button type="reset" class="delBtn">취소</button>
				</div>
				
			</form>
			
		</div>
		
	<c:import url="../common/footer.jsp"/>
	</div>
	
	<script>
	
    $(function(){
       $('.fileArea').hide();
       $('#recFileF').click(function(){
          $("#recBtnF").click();
       });
       $('#recFileM').click(function(){
          $("#recBtnM").click();
       });
    });
    
    function Load(input, num){
       if(input.files && input.files[0]){
          var reader = new FileReader();
          reader.onload = function(e) {
             switch(num){
             case 1: 
            	 var fileValue = $("#recBtnF").val().split("\\");
                 var fileName = fileValue[fileValue.length-1];
                 //console.log("fileValue : " + fileValue);
                 //console.log("fileName : " + fileName);
                 //구조 알고싶으면 위에 주석 풀어서 찍어보기
                 $('#fileShowF').text(fileName); break;
             case 2: 
                var fileValue = $("#recBtnM").val().split("\\");
                var fileName = fileValue[fileValue.length-1];
                $('#fileShowM').text(fileName); break;
             }
          }
          
          reader.readAsDataURL(input.files[0]);
       }
    }
	
	
	$(function(){
		$("#fileArea").hide();
						
		$("#imgArea").click(function(){
			$("#thumbnailImg").click();
		});
		
	});
					
	function LoadImg(value){
		if(value.files && value.files[0]){
		var reader = new FileReader();
							
		reader.onload = function(e){								
			$("#image").attr("src", e.target.result);
		}
							
		reader.readAsDataURL(value.files[0]);
		}
	}
	
	
	$('.delBtn').click(function(){
		var bool = confirm('상품 수정을 취소하시겠습니까?');
		if(bool){
			location.href="ablist.ab";
		}	
	});
	
	
	// 자동 입력
	$('#bkPublisher').keyup(function(){
		var bkPub = $(this).val();
		$('#bkPublisher2').val(bkPub);
	});
	
	$('#bkWriter').keyup(function(){
		var bkW = $(this).val();
		$('#bkWriter2').val(bkW);
	});
	
	$('#bkDraw').keyup(function(){
		var bkD = $(this).val();
		$('#bkDraw2').val(bkD);
	});
	
	$('#bkPubdate').change(function(){
		var bkPdt = $(this).val();
		$('#bkPubdate2').val(bkPdt);
	});
	</script>	
	
</body>
</html>