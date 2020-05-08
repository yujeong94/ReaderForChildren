<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹음 부스 예약하기 | ReaderForChildren</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">

<link href='${ contextPath }/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='${ contextPath }/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<script src='${ contextPath }/fullcalendar/packages/core/main.js'></script>
<script src='${ contextPath }/fullcalendar/packages/daygrid/main.js'></script>
<script src='${ contextPath }/fullcalendar/packages/interaction/main.js'></script>
<style>
	.btnBox {
		margin-top: 50px;
	}
	#map {
		margin: auto;
	}
	#myAddr {
		width: 455px;
		height: 30px;
	}
	#searchAddr {
		text-align: center;
		font-size: 1.2rem;
		margin: auto;
		margin-top: 100px;
		margin-bottom: 30px;
		width: 500px;
		heigth: 20px;
		background: green;
	}
	#searchBtn {
		vertical-align: middle;
		height: 36px;
		width: 40px;
		background: white;
		border: 1px solid #A4A4A4;
	}
	
	#calendar{
     	width : 500px;
	   	height : 400px;
	   	margin: auto;
	   	margin-top: 50px;
	   	margin-bottom: 50px;
	}
	
	#timeTable {
		text-align: center;
		margin: auto;
		width: 500px;
		font-size: 1.5rem;
		border: 1px solid black;
	}
	
	#timeTable td {
		border: 1px solid lightgray;
	}
	
	
 	#infoArea {
		display: none;
	} 
	
	#infoArea input {
		border: none;
	}
	
	#infoTable {
		margin: auto;
		border: 1px solid black;
		border-radius: 5px;
		margin-top: 50px;
		width: 500px;
		height: 100px;
	}
	
	#infoTable th, #infoTable td {
		border: 1px solid lightgray;
		padding: 10px;
	}
	
	#infoTable input {
		font-size: 11pt;
	}
	
	/*  */
#menu {
  visibility: hidden;
}

label {
  width: 100px;
  height: 10px;
  border-radius: 5px;
  background: black;
  cursor: pointer;
  transition: .6s;
  position: fixed;
  top: 50%;
  left: 50%;
  margin-left: -50px;
  margin-top: -7.5px;
}

label:before {
  content: "";
  width: 100px;
  height: 10px;
  background: black;
  position: absolute;
  transform: translateY(-30px);
  -webkit-transform: translateY(-30px);
  border-radius: 5px;
  -webkit-transition: .6s;
  transition: .6s;
}

label:after {
  content: "";
  width: 100px;
  height: 10px;
  background: black;
  position: absolute;
  transform: translateY(30px);
  -webkit-transform: translateY(30px);
  border-radius: 5px;
  transition: .6s;
  -webkit-transition: .6s;
}

#menu:checked + label {
  width: 0;
}

#menu:checked + label:before {
  transform: rotate(45deg) translate(0px);
  -webkit-transform: rotate(45deg) translate(0px);
}

#menu:checked + label:after {
  transform: rotate(-45deg) translate(0px);
  -webkit-transform: rotate(-45deg) translate(0px);
}

.contents { 
	padding-bottom: 100px;
}

.fc-left {
	color: orange;
	font-size: 11pt;
}

.fc-button {
	background-color: orange;
}

.fc-today-button {
	background-color: orange;
}

</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<div class="contents">
	<h1>녹음 부스 예약</h1>
	
		<!--  
		<input id="menu" type="checkbox">
		<label for="menu"></label>
		-->
	
		<div id="searchAddr">
			<input type="text" id="myAddr" list="addrList" placeholder="   찾으실 녹음실명 또는 주소를 검색해보세요"><button id="searchBtn"><img src="${ contextPath }/resources/images/search2.png" width=22px></button><br>
			<datalist id="addrList">
				<option value="레벨나인 스튜디오">서울특별시 강남구 논현로 414 세일빌딩 9층</option>
				<option value="모닝스타녹음실">서울특별시 강남구 논현로72길 29 리치노아빌 지하1층</option>
				<option value="웨이브랩">서울특별시 마포구 양화로 73-1 이스턴빌딩 지하 1층</option>
				<option value="IMCL">서울특별시 서대문구 이화여대1길 15</option>
				<option value="원더레코즈">서울특별시 강남구 역삼로9길 24</option>
				<option value="온에어뮤직">서울 송파구 백제고분로42길 35</option>
				<option value="지니스튜디오">경기도 구리시 이문안로 138</option>
				<option value="사운드유엑스">경기도 안양시 동안구 시민대로327번길 11-41 5층 517호</option>
				<option value="밴드하우스">인천광역시 미추홀구 주안중로 32-5 지하1층</option>
				<option value="뉴렉녹음실">충청북도 청주시 상당구 상당로115번길 51</option>
				<option value="비커즈뮤직">경상북도 대구광역시 중구 명덕로 127</option>
				<option value="보이스팩토리">전라남도 광주광역시 남구 중앙로 90 2층</option>
			</datalist>		
		</div>
		
		<div id="map" style="width:500px;height:400px;">
		</div>
		
		<div id="calendar"></div>
		
		<div id="timeBox">
			<table id="timeTable">
				<tr>
					<td>09:00 - 11:00</td>
					<td>11:00 - 13:00</td>
					<td>13:00 - 15:00</td>
				</tr>
				<tr>
					<td>15:00 - 17:00</td>
					<td>17:00 - 19:00</td>
					<td>19:00 - 21:00</td>
				</tr>
			</table>
		</div>
		
		<form id="infoArea" action="insertRecord.re">
			<table id="infoTable">
				<tr>
					<th width="120px">녹음실</th>
					<td colspan="3">
						<input type="text" id="recCompany" name="recCompany" readOnly required><br>
						주소 : <input type="text" id="address" name="address" size="50px" style="font-size: 8pt;" readOnly required>
					</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>
						<input type="text" id="dateInfo" name="dateInfo" readOnly required>
						<jsp:useBean id="now" class="java.util.Date"/>
						<fmt:formatDate value="${ now }" pattern="yyyyMMdd" var="today"/>
					</td>
					<th width="90px">시간</th>
					<td><input type="text" id="rTime" name="rTime" readOnly required></td>
				</tr>
				<!-- <tr>
				</tr> -->
			</table>
			
			<div class=btnBox>
				<button class="defaultBtn upBtn rBtn">예약</button>
				<!-- <button type="button" onclick="location.href='testMap.re'">테스트</button> -->
			</div>
			
		</form>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=398d38ff223ba6e4b87ae695ed9759f4&libraries=services,clusterer,drawing"></script>
		<script>
		
		// 달력, 시간표 숨기기
		$(function(){
			$("#calendar").hide();
			$("#timeBox").hide();
		});
		
		// 지도 부분
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.498981, 127.032914), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
		    {
		        content: '레벨나인 스튜디오 | 서울특별시 강남구 논현로 414 세일빌딩 9층', 
		        latlng: new kakao.maps.LatLng(37.4972385027886, 127.039064239457)
		    },
		    {
		        content: '모닝스타녹음실 | 서울특별시 강남구 논현로72길 29 리치노아빌 지하1층',
		        latlng: new kakao.maps.LatLng(37.4963568837854, 127.041654989761)
		    },
		    {
		        content: '웨이브랩 | 서울특별시 마포구 양화로 73-1 이스턴빌딩 지하 1층',
		        latlng: new kakao.maps.LatLng(37.5515565949487, 126.916106694815)
		    },
		    {
		        content: 'IMCL | 서울특별시 서대문구 이화여대1길 15', 
		        latlng: new kakao.maps.LatLng(37.5572104627807, 126.944919267804)
		    },
		    {
		        content: '원더레코즈 | 서울특별시 강남구 역삼로9길 24', 
		        latlng: new kakao.maps.LatLng(37.4956071073488, 127.033920262182)
		    },
		    {
		        content: '온에어뮤직 | 서울 송파구 백제고분로42길 35',
		        latlng: new kakao.maps.LatLng(37.5040249437866, 127.111685370422)
		    },
		    {
		        content: '지니스튜디오 | 경기도 구리시 이문안로 138',
		        latlng: new kakao.maps.LatLng(37.590948897369, 127.146640595875)
		    },
		    {
		        content: '사운드유엑스 | 경기도 안양시 동안구 시민대로327번길 11-41 5층 517호',
		        latlng: new kakao.maps.LatLng(37.3982031689559, 126.96314114623)
		    },
		    {
		        content: '밴드하우스 | 인천광역시 미추홀구 주안중로 32-5 지하1층',
		        latlng: new kakao.maps.LatLng(37.4615262731348, 126.683003154536)
		    },
		    {
		        content: '뉴렉녹음실 | 충청북도 청주시 상당구 상당로115번길 51',
		        latlng: new kakao.maps.LatLng(36.638347188937, 127.487124868381)
		    },
		    {
		        content: '비커즈뮤직 | 대구광역시 중구 명덕로 127',
		        latlng: new kakao.maps.LatLng(35.8566551633687, 128.584074220755)
		    },
		    {
		        content: '보이스팩토리 | 광주광역시 남구 중앙로 90 2층',
		        latlng: new kakao.maps.LatLng(35.1438728149344, 126.907874967636)
		    }
		];

		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });

		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    
		    var geocoder = new kakao.maps.services.Geocoder();
		    kakao.maps.event.addListener(marker, 'click', clickMarker(marker, infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		// 클릭이벤트 클로저
		function clickMarker(marker, infowindow) {
			return function() {
				$("#timeBox").hide();
				$("#calendar").show();
				var offset = $("#calendar").offset();
				$('html').animate({scrollTop: offset.top},300);
				
				var info = infowindow.getContent();
				var infoArr = info.split("|");
				$("#recCompany").val(infoArr[0]);
				$("#address").val(infoArr[1].trim());
				$("#infoArea").css("display","block");
				
			}
		}
		
        // 주소 입력시 마커로 이동
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		$("#searchBtn").click(function(){
			var inputAddr = $("#myAddr").val();
			var optionAddr = "";
			
			for(var i = 0; i < $("#addrList option").length; i++) {
				if(inputAddr == $("#addrList option:eq("+ i +")").val()){
					optionAddr = $("#addrList option:eq("+ i +")").text();
					break;
				} 
			}
			if(optionAddr == ""){
				swal("입력한 주소로 등록된 녹음실이 없습니다. \n 주소 목록을 확인해 주세요!");
			}
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(optionAddr, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			  	}
			});
		});
			
		
		/* 캘린더  */
	    document.addEventListener('DOMContentLoaded', function() {
	    	var calendarEl = document.getElementById('calendar');
	    
	    	var calendar = new FullCalendar.Calendar(calendarEl, {
	        	plugins: [ 'interaction', 'dayGrid' ],
	        	selectable: true,
	    		dateClick: function(info) {
	    			
	    			$("#timeBox").show();
	    			var offset = $("#timeBox").offset();
	    			$("html").animate({scrollTop: offset.top},300);
	    			
	    			var today = ${ today };
	    			var clickD = info.dateStr;
	    			var newD = clickD.replace(/-/g, "");
	    			
	    			if(newD < today) {
	    				swal("지난 날짜입니다. 날짜를 다시 선택해주세요!");
	    				var calOff = $("#calendar").offset();
	    				$("html").animate({scrollTop: calOff.top},300);
	    			} else {
		    			$("#dateInfo").val(info.dateStr);
		    			recInfo();
	    			}
	    			$("#infoArea").css("display","block");
	    			
	    		}
	        });
	      
	        calendar.render();
	    });
		
		$("#timeTable td").mouseover(function(){
			$(this).css("background","#ffe478");
		}).mouseout(function(){
			$(this).css("background","white");
		}).click(function(){
			$("#rTime").val($(this).text());
			$("#infoArea").css("display","block");
		}); 
		
		function recInfo() {
			var inputRecCompany = $("#recCompany").val();
			var inputAddress = $("#address").val();
			var inputRdate = $("#dateInfo").val();
			if(inputRecCompany != "" && inputAddress != "" && inputRdate != ""){
				console.log("입력된 녹음실 " + inputRecCompany);
				console.log("2 " + inputAddress);
				console.log("3 " + inputRdate);
				$.ajax({
					url: "recInfo.re",
					type: "post",
					dataType: "json",
					data: {inputRecCompany:inputRecCompany, inputAddress:inputAddress, inputRdate:inputRdate},
					success: function(data) {
						if(data.length == 0) {
							console.log("널이다");
							$("#timeTable td").css({"cursor":"pointer","background":"white"});
							$("#timeTable td").mouseover(function(){
								$(this).css("background","#ffe478");
							}).mouseout(function(){
								$(this).css("background","white");
							}).click(function(){
								$("#rTime").val($(this).text());
								$("#infoArea").css("display","block");
							});
						} else {
							for(var i = 0; i < 6; i++) {
								for(var j = 0; j < data.length; j++) {
									if($("#timeTable td").eq(i).text() == data[j].rTime) {
										console.log("td값 " + $("#timeTable td").eq(i).text());
										console.log("예약된 시간" + data[j].rTime);
										$("#timeTable td").eq(i).off();
										$("#timeTable td").eq(i).css({"background":"lightgray","cursor":"default"});
										break;
									} else {
										console.log("else로 들어옴");
										console.log($("#timeTable td").eq(i).css("background-color"));
										if($("#timeTable td").eq(i).css("background-color") != "lightgray") {
											$("#timeTable td").eq(i).css({"cursor":"pointer","background":"white"});
											$("#timeTable td").eq(i).mouseover(function(){
												$("#timeTable td").eq(i).css("background","#ffe478");
											}).mouseout(function(){
												$("#timeTable td").eq(i).css("background","white");
											}).click(function(){
												$("#rTime").val($(this).text());
												$("#infoArea").css("display","block");
											});
										}
									}
								}
							}
						}
					}
				});
			}
		}
		
		$(".rBtn").click(function(){
			$(this).attr("type","button");
			
			if($("#dateInfo").val() == "") {
				swal("날짜를 선택해주세요.");
				var offset = $("#calendar").offset();
				$('html').animate({scrollTop: offset.top},300);
			} else if($("#rTime").val() == "") {
				swal("시간을 선택해주세요.");
				var offset = $("#timeBox").offset();
				$('html').animate({scrollTop: offset.top},300);
			} else {
				$(this).attr("type","submit");
			}
		});
		
		// 예약완료 알림창
		var msg = "${ msg }";
		if(msg != ""){
			swal({
				  title: "예약완료!",
				  text: msg,
				  icon: "success",
				  button: "확인"
				});
		}
		
		</script>
		
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
</body>
</html>