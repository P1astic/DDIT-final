<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="/resources/css/airplane/main.css">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script>
$(function(){
	
	//servicekey를 application.properties로 옮기는 작업 필요
	let aprtPsgrCongestionServiceKey = "${aprtPsgrCongestionServiceKey}";
	let aprtWaitTimeServiceKey = "${aprtWaitTimeServiceKey}";	
	
	$("._searchBtn").on("click", function(){
		//날짜 YYYY-MM-DD 생성
		const today = new Date();
		
		const year = today.getFullYear(); // 2023
		const month = (today.getMonth() + 1).toString().padStart(2, '0'); // 06
		const day = today.getDate().toString().padStart(2, '0'); // 18
		
		const date = year + month + day; // 20230618
		
		
	    var selectedStartTime = $("#_startTime").val().replace(":", "");
	    var selectedEndTime = $("#_endTime").val().replace(":", "");
	    var selectedAirLine = $("#_selectAirLine option:selected").val();
	    var searchBoxValue = $("._searchBox").val();
	    
		/*
		date = 운항일 << 오늘날짜로 2024-09-30
		arrived = 목적지, 무조건 all
		airLine = 항공사, val이 null 이면 all
		airFln = 편명, val이 null 이면 all
		remark = 현황,무조건 all
		startTime, endTime 1500, 2350
	*/
	    
	    // 항공사가 null이면 all로 설정
	    if (!selectedAirLine || selectedAirLine.trim() === "") {
	        selectedAirLine = "all";
	    }
	    
	    // 편명이 null이면 all로 설정
	    if (!searchBoxValue || searchBoxValue.trim() === "") {
	        searchBoxValue = "all";
	    }
	    
	    if(!selectedStartTime || selectedStartTime.trim() === ""){
	    	selectedStartTime = "0000";
	    }
	    
	    if(!selectedEndTime || selectedEndTime.trim() === ""){
	    	selectedEndTime = "2350";
	    }
	    
	    // 쿼리 스트링 생성
	    var queryString = "?dateParam=" + date
	                    + "&arrived=all"
	                    + "&airLineParam=" + selectedAirLine
	                    + "&airFlnParam=" + searchBoxValue
	                    + "&remark=all"
	                    + "&startTimeParam=" + selectedStartTime
	                    + "&endTimeParam=" + selectedEndTime;
	    
	    console.log(queryString);
		
		if($("input[name='radios']:checked").val() == "departure"){
			window.location.href="/cust/airplane/arrivalList" + queryString;
			
		}else{
			window.location.href ="/cust/airplane/departureList" + queryString;
		}
	})
	
	//24.10.1. 공항 구간별 혼잡도 정보 API 호출 홍정호
	$.ajax({
		url:"http://api.odcloud.kr/api/getAPRTPsgrCongestion/v1/aprtPsgrCongestion​?page=1&perPage=10&cond%5BIATA_APCD%3A%3AEQ%5D=GMP&serviceKey="+aprtPsgrCongestionServiceKey,
		type:"get",
		success:function(result){
			let congestionData = result.data[0];
			
			$("#CGDR_A_LVL").text(congestionData.CGDR_A_LVL);
			$("#CGDR_B_LVL").text(congestionData.CGDR_B_LVL);
			$("#CGDR_C_LVL").text(congestionData.CGDR_C_LVL);
			$("#CGDR_D_LVL").text(congestionData.CGDR_D_LVL);
			$("#CGDR_ALL_LVL").text(congestionData.CGDR_ALL_LVL);
			
			if(congestionData.CGDR_ALL_LVL == '1'){
				$("._congestionDisplay").text("원활");
			}else if(congestionData.CGDR_ALL_LVL == '2'){
				$("._congestionDisplay").text("보통");
			}else if(congestionData.CGDR_ALL_LVL == '3'){
				$("._congestionDisplay").text("혼잡");
			}else if(congestionData.CGDR_ALL_LVL == '4'){
				$("._congestionDisplay").text("매우혼잡");
			}
			
			if(congestionData.CGDR_A_LVL == '1'){
				$("._congestion_A").css("background-color", "#2E9AFE");
			}else if(congestionData.CGDR_A_LVL == '2'){
				$("._congestion_A").css("background-color", "#04B431");
			}else if(congestionData.CGDR_A_LVL == '3'){
				$("._congestion_A").css("background-color", "#f98f39");
			}else if(congestionData.CGDR_A_LVL == '4'){
				$("._congestion_A").css("background-color", "#DF0174");
			}
			
			if(congestionData.CGDR_B_LVL == '1'){
				$("._congestion_B").css("background-color", "#2E9AFE")
			}else if(congestionData.CGDR_B_LVL == '2'){
				$("._congestion_B").css("background-color", "#04B431");
			}else if(congestionData.CGDR_B_LVL == '3'){
				$("._congestion_B").css("background-color", "#f98f39");
			}else if(congestionData.CGDR_B_LVL == '4'){
				$("._congestion_B").css("background-color", "#DF0174");
			}
			
			if(congestionData.CGDR_C_LVL == '1'){
				$("._congestion_C").css("background-color", "#2E9AFE")
			}else if(congestionData.CGDR_C_LVL == '2'){
				$("._congestion_C").css("background-color", "#04B431");
			}else if(congestionData.CGDR_C_LVL == '3'){
				$("._congestion_C").css("background-color", "#f98f39");
			}else if(congestionData.CGDR_C_LVL == '4'){
				$("._congestion_C").css("background-color", "#DF0174");
			}
			
			if(congestionData.CGDR_D_LVL == '1'){
				$("._congestion_D").css("background-color", "#2E9AFE")
			}else if(congestionData.CGDR_D_LVL == '2'){
				$("._congestion_D").css("background-color", "#04B431");
			}else if(congestionData.CGDR_D_LVL == '3'){
				$("._congestion_D").css("background-color", "#f98f39");
			}else if(congestionData.CGDR_D_LVL == '4'){
				$("._congestion_D").css("background-color", "#DF0174");
			}
		}
	})
	
	//24.10.1. 공항 구간별 소요시간 정보  API 호출 홍정호
	$.ajax({
		url:"http://api.odcloud.kr/api/getAPRTWaitTime/v1/aprtWaitTime?page=1&perPage=10&cond%5BIATA_APCD%3A%3AEQ%5D=GMP&serviceKey="+aprtWaitTimeServiceKey,
		type:"get",
		success:function(result){
			let waitTimeData = result.data[0];
			
			$("#STY_TCT_AVG_A").text(waitTimeData.STY_TCT_AVG_A);
			$("#STY_TCT_AVG_B").text(waitTimeData.STY_TCT_AVG_B);
			$("#STY_TCT_AVG_C").text(waitTimeData.STY_TCT_AVG_C);
			$("#STY_TCT_AVG_D").text(waitTimeData.STY_TCT_AVG_D);
			$("#STY_TCT_AVG_ALL").text(waitTimeData.STY_TCT_AVG_ALL);
			
			
			let waitTime_A = secToHourMin(parseInt(waitTimeData.STY_TCT_AVG_A));
			let waitTime_B = secToHourMin(parseInt(waitTimeData.STY_TCT_AVG_B));
			let waitTime_C = secToHourMin(parseInt(waitTimeData.STY_TCT_AVG_C));
			let waitTime_D = secToHourMin(parseInt(waitTimeData.STY_TCT_AVG_D));
			let waitTime_ALL = secToHourMin(parseInt(waitTimeData.STY_TCT_AVG_ALL));

			$("._waitTime_A").text(waitTime_A);
			$("._waitTime_B").text(waitTime_B);
			$("._waitTime_C").text(waitTime_C);
			$("._waitTime_D").text(waitTime_D);
			$("._waitTimeDisplay").text(waitTime_ALL);
		}
	})
	
	function secToHourMin(seconds){
		
		var minutes = Math.floor((seconds / 60) % 60);
		var hours = Math.floor((seconds / (60 * 60)) % 24);
		
		hours = (hours < 10) ? "0" + hours : hours;
		minutes = (minutes < 10) ? "0" + minutes : minutes;
		
		return hours + "시간 " + minutes + "분";		
	}
	
})
</script>
<h2>공항홈페이지</h2>
<h4>성공!!!!!!!!</h4>

<!-- 패딩 5 줬음 -->
<div class="AirportSearchBox p-5 border">
	<div class="startStopBtn d-flex flex-row justify-content-between">
		<div class="_leftBtn">
			<input type="radio" name="radios" value="departure" checked/>출발
			<input type="radio" name="radios" value="arrival"/>도착
		</div>
		<div class="_rightBtn">
			<button type="button">출발/도착안내</button>
		</div>
	</div>
	<div class="searchBoxOption d-flex flex-row justify-content-center">
		<div class="border _itemGroup _airPort" style="flex-grow:1;">
			<label>공항</label>
			<span>서울/김포</span>
		</div>
		<div class="border _itemGroup _time" style="flex-grow:1;">
			<label>시간</label>
			<div>
				<input type="time" id="_startTime"/>
			</div>
			<span>~</span>
			<div>
				<input type="time" id="_endTime"/>
			</div>
		</div>

		<div class="border _itemGroup _airLine" style="flex-grow:1;">
			<label>항공사</label>
			<select id="_selectAirLine">
				<option value="">선택</option>
				<c:forEach var="airlineVO" items="${airlineList}">
					<option value="${airlineVO.airNm}">${airlineVO.airNm }</option>
				</c:forEach>
			</select>
		</div>
		<div class="border _itemGroup _airNumber" style="flex-grow:1;">
			<label>편명</label>
			<input type="text" class="_searchBox" placeholder="편명 입력">
		</div>
		<div class="border _itemGroup _airNumber" style="flex-grow:1;">
			<input type="button" class="_searchBtn" value="조회">
		</div>
		
	</div>
</div>


<!-- 24.10.1. 탑승수속 소요시간 div 홍정호 -->
<div class="border p-5">
	<p>BOARDING PROCESS TIME</p>
	<p>국내선 탑승 수속 소요시간 안내</p>
	<p>셀프 체크인부터 항공기 탑승까지 평균 체류시간</p>
	
	<!-- 평균 소요시간 계산하기 -->
	<strong>평균 소요 시간</strong>
	<p class="_waitTimeDisplay">00 시간 00분</p>
	
	<!-- 총 혼잡도 표시 -->
	<strong>지금 공항의 혼잡도는</strong><span class="_congestionDisplay ml-3 mr-3">혼잡도</span><strong> 입니다.</strong>
	
	<div class="d-flex flex-row _process"><!-- 구간별 이미지 삽입 필요 -->
		<div class="border" style="width:200px; height:390px; background:gray;"></div><!-- 비워두기(수속장 전) -->
		<div class="border" style="width:200px; height:390px; background:gray;"></div>
		<div class="border" style="width:200px; height:390px; background:gray;"></div>
		<div class="border" style="width:200px; height:390px; background:gray;"></div>
		<div class="border" style="width:200px; height:390px; background:gray;"></div>
	</div>
	<div class="d-flex flex-row _waitTime"><!-- 구간별 이미지 삽입 필요 -->
		<div class="border" style="width:200px; height:50px;"></div><!-- 비워두기 -->
		<div class="border _congestion_A" style="width:200px; height:50px; background:lightgray;">
			<span class="_waitTime_A"></span>
		</div><!-- 1구간 소요시간 -->
		<div class="border _congestion_B" style="width:200px; height:50px; background:lightgray;">
			<span class="_waitTime_B"></span>
		</div><!-- 2구간 소요시간 -->
		<div class="border _congestion_C" style="width:200px; height:50px; background:lightgray;">
			<span class="_waitTime_C"></span>
		</div><!-- 3구간 소요시간 -->
		<div class="border _congestion_D" style="width:200px; height:50px; background:lightgray;">
			<span class="_waitTime_D"></span>
		</div><!-- 4구간 소요시간 -->
	</div>	
</div>
<!-- 24.10.1. 탑승수속 소요시간 div 홍정호 -->