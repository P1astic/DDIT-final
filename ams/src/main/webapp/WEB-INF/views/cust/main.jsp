<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/cust/main2.css">
<script>
$(function(){
	
	//실시간 주차 현황
	$("#con-3-1-1").on("click",function(){
		 window.location.href = '/cust/parking/ParkingIinformation.html#targetDiv';
	});
	
	//주차예약
	$("#con-3-1-2").on("click",function(){
		 window.location.href = '/cust/parking/main';
	});
	
	
	//층별시설도
	$("#con-3-1-4").on("click",function(){
		 window.location.href = '/cust/floorInfo/info';
	});
	
	
	//출발/도착안내 클릭시 
	$("#con-3-1-3").on("click",function(){
		 window.location.href = '/cust/airplane/arrivalList';
	});
	
	//오시는길 클릭시 
	$("#con-3-1-5").on("click",function(){
		 window.location.href = '/cust/map/route';
	});
	
	//고객소리함 클릭시 
	$("#con-3-1-6").on("click",function(){
		 window.location.href = '/cust/cus/main';
	});
	
	
	//출발/도착안내 클릭시 
	$("#con-3-1-3").on("click",function(){
		 window.location.href = '/cust/airplane/arrivalList';
	});
	
	//오시는길 클릭시 
	$("#con-3-1-5").on("click",function(){
		 window.location.href = '/cust/map/route';
	});
	
	//고객소리함 클릭시 
	$("#con-3-1-6").on("click",function(){
		 window.location.href = '/cust/cus/main';
	});
	
	
   $('input[name="radios"]').change(function() {
          if ($('#radiooo').is(':checked')) {
              $('#departureLabel').css('color', '#063B7B');
              $('#arrivalLabel').css('color', 'white');
              $('#icon1').attr('fill', '#063B7B');
              $('#icon2').attr('fill', 'white');
          } else if ($('#radiooo2').is(':checked')) {
              $('#arrivalLabel').css('color', '#063B7B');
              $('#departureLabel').css('color', 'white');
              $('#icon2').attr('fill', '#063B7B');
              $('#icon1').attr('fill', 'white');
          }
      });
	
	
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
		
// 	    if ($("div.start[id='con-2-1-1']")) {
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
			
			console.log(result);
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
				$("._congestion_A").css("background-color", "#61D242");
			}else if(congestionData.CGDR_A_LVL == '3'){
				$("._congestion_A").css("background-color", "#f98f39");
			}else if(congestionData.CGDR_A_LVL == '4'){
				$("._congestion_A").css("background-color", "#DF0174");
			}
			
			if(congestionData.CGDR_B_LVL == '1'){
				$("._congestion_B").css("background-color", "#2E9AFE")
			}else if(congestionData.CGDR_B_LVL == '2'){
				$("._congestion_B").css("background-color", "#61D242");
			}else if(congestionData.CGDR_B_LVL == '3'){
				$("._congestion_B").css("background-color", "#f98f39");
			}else if(congestionData.CGDR_B_LVL == '4'){
				$("._congestion_B").css("background-color", "#DF0174");
			}
			
			if(congestionData.CGDR_C_LVL == '1'){
				$("._congestion_C").css("background-color", "#2E9AFE")
			}else if(congestionData.CGDR_C_LVL == '2'){
				$("._congestion_C").css("background-color", "#61D242");
			}else if(congestionData.CGDR_C_LVL == '3'){
				$("._congestion_C").css("background-color", "#f98f39");
			}else if(congestionData.CGDR_C_LVL == '4'){
				$("._congestion_C").css("background-color", "#DF0174");
			}
			
			if(congestionData.CGDR_D_LVL == '1'){
				$("._congestion_D").css("background-color", "#2E9AFE")
			}else if(congestionData.CGDR_D_LVL == '2'){
				$("._congestion_D").css("background-color", "#61D242");
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
			
			if(waitTime_A.includes("00시간")){
				$("._waitTime_A").text(waitTime_A.slice(5, 8));
			}else{
				$("._waitTime_A").text(waitTime_A);
			}
			if(waitTime_A.includes("00시간")){
				$("._waitTime_B").text(waitTime_B.slice(5, 8));
			}else{
				$("._waitTime_B").text(waitTime_B);
			}
			if(waitTime_C.includes("00시간")){
				$("._waitTime_C").text(waitTime_C.slice(5, 8));
			}else{
				$("._waitTime_C").text(waitTime_C);
			}
			if(waitTime_D.includes("00시간")){
				$("._waitTime_D").text(waitTime_D.slice(5, 8));
			}else{
				$("._waitTime_D").text(waitTime_D);
			}
			if(waitTime_ALL.includes("00시간")){
				$("._waitTimeDisplay").text(waitTime_ALL.slice(5, 8));
			}else{
				$("._waitTimeDisplay").text(waitTime_ALL);
			}
			
			
		}
	})
	
	function secToHourMin(seconds){
		
		var minutes = Math.floor((seconds / 60) % 60);
		var hours = Math.floor((seconds / (60 * 60)) % 24);
		
		hours = (hours < 10) ? "0" + hours : hours;
		minutes = (minutes < 10) ? "0" + minutes : minutes;
		
		return hours + "시간 " + minutes + "분";		
	}
	
	var now = new Date();
	var minutes = now.getMinutes();
	var adjustedMinutes = minutes < 30 ? "00" : "30";
	var startTime = now.getHours().toString().padStart(2, '0') + ":" + adjustedMinutes;
	
	$("#_startTime").val(startTime);
	$("#_endTime").val("23:50");
	
	
})
</script>
<div id="container" style="font-family:Pretendard;">

	
	<!-- 내용 -->
	<div id="content">
		<!-- 이름 -->
		<div class="con-1">
			<div class="con-1-1">친절한 공항, 다시찾고 싶은 공항</div>
			<div class="con-1-2">김포국제공항</div>
		</div>
		
		<!-- 항공편 조회-->
		<div class="con-2">
	         <div class="con-2-1" style="cursor: pointer;" >
				<label for="radiooo"  class="label1" style="color: #063B7B" id="departureLabel">  
					<svg xmlns="http://www.w3.org/2000/svg" height="30px"  id="icon1" viewBox="0 -960 960 960" width="30px" fill="#063B7B" id="icon1"><path d="M439-541 197-645q-24-11-29-36t14-44l14-15q9-9 20.5-12t23.5-1l347.36 64L707-809q20.7-21 50.85-21Q788-830 809-809.24t21 51Q830-728 809-707L689-587l63.97 346.42Q755-229 752-217.5q-3 11.5-12 20.5l-15 15q-19.24 19-44.55 14T644-197L541-439l-97 97 22 124q2 10-1 18.5t-9.73 15.28l-16.36 16.47Q425.44-154 405.72-157T377-177l-70.54-129.81L176-377q-17-9-20-28.72t10.75-33.19l16.47-16.36Q190-462 199.17-465q9.17-3 18.83-1l124 22 97-97Z"/></svg>
					 출발
				 </label>
				<input type="radio" name="radios" value="departure" checked id="radiooo"/>
				
				<label for="radiooo2"  class="label1" style="color:white;" id="arrivalLabel" >  
					<svg xmlns="http://www.w3.org/2000/svg" height="30px" id="icon2" viewBox="0 -960 960 960" width="30px" fill="#FFFFFF" id="icon1"><path d="M439-541 197-645q-24-11-29-36t14-44l14-15q9-9 20.5-12t23.5-1l347.36 64L707-809q20.7-21 50.85-21Q788-830 809-809.24t21 51Q830-728 809-707L689-587l63.97 346.42Q755-229 752-217.5q-3 11.5-12 20.5l-15 15q-19.24 19-44.55 14T644-197L541-439l-97 97 22 124q2 10-1 18.5t-9.73 15.28l-16.36 16.47Q425.44-154 405.72-157T377-177l-70.54-129.81L176-377q-17-9-20-28.72t10.75-33.19l16.47-16.36Q190-462 199.17-465q9.17-3 18.83-1l124 22 97-97Z"/></svg>
					 도착
				 </label>
				<input type="radio" name="radios" value="arrival" id="radiooo2" />
			
			</div>
		
			<div class="con-2-2">
				<div class="con-2-box">
					<div class="con-2-box-child">
						<div class="con-nm">공항</div>
						<div class="con-val">서울/김포</div>
					</div>
					<div class="con-2-box-child2">
						<div class="con-nm">시간</div>
						<div class="con-val-box">
						  <input type="time" class="tm" id="_startTime">
						  <span class="time-separator"> ~ </span>
						  <input type="time"  class="tm" id="_endTime">
						</div>
					</div>
					<div class="con-2-box-child2">
						<div class="con-nm">항공사</div>
						<div class="con-val-box2">
							<select id="_selectAirLine" class="con-val-box">
								<option value="">선택</option>
								<c:forEach var="airlineVO" items="${airlineList}">
									<option value="${airlineVO.airKrNm}">${airlineVO.airKrNm }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="con-2-box-child3">
						<div class="con-nm">편명</div>
						<div class="con-val-box2">
							<input class="_searchBox" type="text" placeholder="편명 입력"/>
						</div>
					</div>
				</div>
				<div class="_searchBtn">조회</div>
			</div>
		</div>
		
		<!-- 즐겨찾기 메뉴-->
		<div class="con-3">
		
			<div class="con-3-1" id="con-3-1-1">
				<div class="con-3-1-1">
					<svg xmlns="http://www.w3.org/2000/svg" height="32px" viewBox="0 -960 960 960" width="32px" fill="#ffffff"><path d="M480-520q66 0 113-47t47-113v-120H320v120q0 66 47 113t113 47ZM200-80q-17 0-28.5-11.5T160-120q0-17 11.5-28.5T200-160h40v-120q0-61 28.5-114.5T348-480q-51-32-79.5-85.5T240-680v-120h-40q-17 0-28.5-11.5T160-840q0-17 11.5-28.5T200-880h560q17 0 28.5 11.5T800-840q0 17-11.5 28.5T760-800h-40v120q0 61-28.5 114.5T612-480q51 32 79.5 85.5T720-280v120h40q17 0 28.5 11.5T800-120q0 17-11.5 28.5T760-80H200Z"/></svg>
				</div>
				<div class="con-3-2">실시간 주차 현황</div>
			</div>
			
			<div class="con-3-1" id="con-3-1-2">
				<div class="con-3-1-1">
					<svg xmlns="http://www.w3.org/2000/svg" height="32px" viewBox="0 -960 960 960" width="32px" fill="#ffffff"><path d="M373.33-370.67v184q0 27.67-19.5 47.17T306.67-120q-27.67 0-47.17-19.5T240-186.67v-586.66q0-27.67 19.5-47.17t47.17-19.5h218.66Q624-840 692-772q68 68 68 166.67 0 98.66-68 166.66t-166.67 68h-152Zm0-133.33H528q43 0 72.17-29.17 29.16-29.16 29.16-72.16t-29.16-72.17Q571-706.67 528-706.67H373.33V-504Z"/></svg>
				</div>
				<div class="con-3-2">주차예약</div>
			</div>
			
			<div class="con-3-1" id="con-3-1-3">
				<div class="con-3-1-1">
					<svg xmlns="http://www.w3.org/2000/svg" height="32px" viewBox="0 -960 960 960" width="32px" fill="#ffffff"><path d="M817.33-496.33 236-340q-22 5.67-42.17-2.67Q173.67-351 161.67-370l-95-158q-9-15-2.5-31.67 6.5-16.66 23.83-21.66l20.33-5.34q8.67-2 17.5-.5 8.84 1.5 15.5 7.17L242-495.33l156.67-42.34-172.34-230q-14-18.33-6.66-40.83 7.33-22.5 30-28.17l19-5Q279-844 289.5-842q10.5 2 18.83 9.33l289 242.34L776.67-639q30-7.67 55.83 7.83t34.17 45.5q8.33 29.34-6.17 55.17-14.5 25.83-43.17 34.17ZM153.33-120q-14.33 0-23.83-9.5-9.5-9.5-9.5-23.83 0-14.34 9.5-23.84t23.83-9.5h653.34q14.33 0 23.83 9.5 9.5 9.5 9.5 23.84 0 14.33-9.5 23.83-9.5 9.5-23.83 9.5H153.33Z"/></svg>
				</div>
				<div class="con-3-2">출발/도착 안내</div>
			</div>
			<div class="con-3-1" id="con-3-1-4">
				<div class="con-3-1-1">
						<svg xmlns="http://www.w3.org/2000/svg" height="32px" viewBox="0 -960 960 960" width="32px" fill="#ffffff"><path d="M480-284.33q105.67-82 159.5-164.34Q693.33-531 693.33-598q0-94.67-59.66-155Q574-813.33 480-813.33q-94 0-153.67 60.33-59.66 60.33-59.66 155 0 66.33 53.83 148.67 53.83 82.33 159.5 165Zm0 68.66q-10 0-20-3.33t-18.67-10q-122.66-96-182-189.5Q200-512 200-598q0-123.67 78.33-202.83Q356.67-880 480-880q123.33 0 201.67 79.17Q760-721.67 760-598q0 86-59.33 179.5-59.34 93.5-182 189.5-8.67 6.67-18.67 10-10 3.33-20 3.33ZM479.33-520q33.67 0 57.17-23.5T560-600q0-33-23.5-56.5T479.33-680q-33 0-56.16 23.5Q400-633 400-600t23.17 56.5q23.16 23.5 56.16 23.5Zm-246 440Q219-80 209.5-89.5 200-99 200-113.33q0-14.34 9.5-23.84t23.83-9.5h493.34q14.33 0 23.83 9.5 9.5 9.5 9.5 23.84 0 14.33-9.5 23.83Q741-80 726.67-80H233.33ZM480-600Z"/></svg>
				</div>
				<div class="con-3-2">층별 시설도</div>
			</div>
			<div class="con-3-1" id="con-3-1-5">
				<div class="con-3-1-1">
						<svg xmlns="http://www.w3.org/2000/svg" height="32px" viewBox="0 -960 960 960" width="32px" fill="#ffffff"><path d="M586-127.67 352.67-210l-187.34 74q-8.66 3.33-16.5 1.83-7.83-1.5-14.5-5.83-6.66-4.33-10.5-11.17Q120-158 120-167v-563.67q0-13 7.5-23t19.83-15l183.34-63.66q5.33-2 10.83-2.67 5.5-.67 11.17-.67 5.66 0 11.16.67t10.84 2.67L608-750.67l186.67-74q8.66-3.33 16.5-2.16 7.83 1.16 14.5 5.5 6.66 4.33 10.5 11.5 3.83 7.16 3.83 16.16v568.34q0 11.66-7.5 20.33-7.5 8.67-19.17 13L630-127.67q-5.33 2-10.83 2.67-5.5.67-11.17.67t-11.17-.67q-5.5-.67-10.83-2.67Zm-14-75v-492.66L388-758v492.67l184 62.66Zm66.67 0 134.66-44.66v-499.34l-134.66 51.34v492.66Zm-452-11.33 134.66-51.33V-758l-134.66 44.67V-214Zm452-481.33v492.66-492.66ZM321.33-758v492.67V-758Z"/></svg>
				</div>
				<div class="con-3-2">오시는 길</div>
			</div>
			<div class="con-3-1" id="con-3-1-6">
				<div class="con-3-1-1">
						<svg xmlns="http://www.w3.org/2000/svg" height="32px" viewBox="0 -960 960 960" width="32px" fill="#ffffff"><path d="M586-127.67 352.67-210l-187.34 74q-8.66 3.33-16.5 1.83-7.83-1.5-14.5-5.83-6.66-4.33-10.5-11.17Q120-158 120-167v-563.67q0-13 7.5-23t19.83-15l183.34-63.66q5.33-2 10.83-2.67 5.5-.67 11.17-.67 5.66 0 11.16.67t10.84 2.67L608-750.67l186.67-74q8.66-3.33 16.5-2.16 7.83 1.16 14.5 5.5 6.66 4.33 10.5 11.5 3.83 7.16 3.83 16.16v568.34q0 11.66-7.5 20.33-7.5 8.67-19.17 13L630-127.67q-5.33 2-10.83 2.67-5.5.67-11.17.67t-11.17-.67q-5.5-.67-10.83-2.67Zm-14-75v-492.66L388-758v492.67l184 62.66Zm66.67 0 134.66-44.66v-499.34l-134.66 51.34v492.66Zm-452-11.33 134.66-51.33V-758l-134.66 44.67V-214Zm452-481.33v492.66-492.66ZM321.33-758v492.67V-758Z"/></svg>
				</div>
				<div class="con-3-2">고객 소리함</div>
			</div>
		</div><!-- con-3- -->
		
	</div>
	<!-- 내용 끝-->
	<div id="footer">
	
		<!-- 24.10.1. 탑승수속 소요시간 div 홍정호 -->
		<div class="border" style="padding:10px 150px 10px 150px;">
			<div id="dds-box">
				<div id="dds-0-1-2-box">
					<div id="dds">BOARDING PROCESS TIME</div>
					<div id="dds-1">국내선 탑승 수속 소요시간 안내</div>
					<div id="dds-2">셀프 체크인부터 항공기 탑승까지 평균 체류시간</div>
				</div>
				<div id="dds-3-4-box" style="background-color:#E7F0F9">
					<!-- 평균 소요시간 계산하기 -->
					<strong id="dds-3">평균 소요 시간</strong>
					<div id="dds-4" class="_waitTimeDisplay">00 시간 00분</div>
					<strong id="dds-5">현재 공항 내 혼잡도는<span id="dds-5-1" class="_congestionDisplay ml-3 mr-3 ">혼잡도</span> 입니다.</strong>
					<div class="d-flex flex-row align-items-center" style="margin-top:10px; margin-bottom:10px;">
						<span style="font-size:18px;">
							<i class="bi bi-dot" style="font-size:25px; color:#2E9AFE; -webkit-text-stroke: 2px;"></i>원활
						</span>
						<span style="font-size:18px;">
							<i class="bi bi-dot" style="font-size:25px; color:#61D242; -webkit-text-stroke: 2px;"></i>보통
						</span>
						<span style="font-size:18px;">
							<i class="bi bi-dot" style="font-size:25px; color:#f98f39; -webkit-text-stroke: 2px;"></i>혼잡
						</span>
						<span style="font-size:18px;">
							<i class="bi bi-dot" style="font-size:25px; color:#DF0174; -webkit-text-stroke: 2px;"></i>매우혼잡
						</span>
					</div>
				</div>
				
				<!-- 총 혼잡도 표시 -->
			</div>
			<div class="d-flex flex-row align-items-center justify-content-center" style="padding:0px 50px 50px 50px;">
				<div>
					<div class="d-flex flex-column">
						<div class="d-flex flex-row align-items-end">
							<i class="bi bi-1-circle" style="font-size:25px; margin-right:25px;"></i>
							<img src="/resources/images/custmain/icon_checkIn01.png" style="width:35px; height:35px; margin-right:15px;">
							<span style="font-size:25px;">
								공항도착(주차)<b class="line_parking"></b>
							</span>
						</div>
						<div class="d-flex flex-row justify-content-between" style="margin-bottom:10px;">
							<div class="d-flex side_line"></div>
							<div class="d-flex flex-row ml-auto">
								<i class="bi bi-p-circle-fill" style="font-size:25px;"></i>
								<i class="bi bi-bus-front-fill" style="font-size:25px;"></i>
							</div>
						</div>
					</div>
					<div class="d-flex flex-column">
						<div class="d-flex flex-row align-items-end">
							<i class="bi bi-2-circle" style="font-size:25px; margin-right:25px;"></i>
							<img src="/resources/images/custmain/icon_checkIn02.png" style="width:35px; height:35px; margin-right:15px;">
							<span style="font-size:25px;">
								셀프 체크인<b class="line_checkin"></b>
							</span>
						</div>
						<div class="d-flex flex-row justify-content-between">
							<div class="side_text" style="margin-top:10px;">
								<p class="_waitTime_A _congestion_A" style="border-radius:5px; color:white; width:70px; text-align:center;">
									_waitTime_A
								</p>
							</div>
							<div class="d-flex side_line _congestion_A"></div>
							<div class="d-flex flex-row ml-auto">
								<i class="bi bi-cart-fill" style="font-size:25px;"></i>
								<i class="bi bi-currency-exchange" style="font-size:25px;"></i>
								<i class="bi bi-cup-hot-fill" style="font-size:25px;"></i>
							</div>
						</div>
					</div>
					<div class="d-flex flex-column">
						<div class="d-flex flex-row align-items-end">
							<i class="bi bi-3-circle" style="font-size:25px; margin-right:25px;"></i>
							<img src="/resources/images/custmain/icon_checkIn03.png" style="width:35px; height:35px; margin-right:15px;">
							<span style="font-size:25px;">
								신분확인<b class="line_id"></b>
							</span>
						</div>
						<div class="d-flex flex-row justify-content-between">
							<div class="side_text" style="margin-top:10px;">
								<p class="_waitTime_B _congestion_B" style="border-radius:5px; color:white; width:70px; text-align:center;">
									_waitTime_B
								</p>
							</div>
							<div class="d-flex side_line _congestion_B"></div>
							<div class="d-flex flex-row ml-auto">
							</div>						
						</div>						
					</div>
					<div class="d-flex flex-column">
						<div class="d-flex flex-row align-items-end">
							<i class="bi bi-4-circle" style="font-size:25px; margin-right:25px;"></i>
							<img src="/resources/images/custmain/icon_checkIn04.png" style="width:35px; height:35px; margin-right:15px;">
							<span style="font-size:25px;">
								보안검색<b class="line_id"></b>
							</span>
						</div>
						<div class="d-flex flex-row justify-content-between">
							<div class="side_text" style="margin-top:10px;">
								<p class="_waitTime_C _congestion_C" style="border-radius:5px; color:white; width:70px; text-align:center;">
									_waitTime_C
								</p>
							</div>
							<div class="d-flex side_line _congestion_C"></div>
							<div class="d-flex flex-row ml-auto">
							</div>	
						</div>
					</div>
					<div class="d-flex flex-column justify-content-between" >
						<div class="d-flex flex-row align-items-end">
							<i class="bi bi-5-circle" style="font-size:25px; margin-right:25px;"></i>
							<img src="/resources/images/custmain/icon_checkIn05.png" style="width:35px; height:35px; margin-right:15px;">
							<span style="font-size:25px;">
								탑승시간<b class="line_id"></b>
							</span>
						</div>
						<div class="d-flex flex-row justify-content-between">
							<div class="side_text" style="margin-top:10px; ">
								<p class="_waitTime_D _congestion_D" style="border-radius:5px; background-color:#e6f0f9; color:black; width:70px; text-align:center;">
									_waitTime_D
								</p>
							</div>
							<div class="d-flex side_line _congestion_D"></div>
							<div class="d-flex flex-row ml-auto">
								<i class="bi bi-cart-fill" style="font-size:25px;"></i>
								<i class="bi bi-currency-exchange" style="font-size:25px;"></i>
								<i class="bi bi-cup-hot-fill" style="font-size:25px;"></i>
							</div>							
						</div>						
					</div>
					<div class="d-flex flex-column">
						<div class="d-flex flex-row">
							<i class="bi bi-6-circle" style="font-size:25px; margin-right:25px;"></i>
							<img src="/resources/images/custmain/icon_checkIn06.png" style="width:35px; height:35px; margin-right:15px;">
							<span style="font-size:25px;">
								출발<b class="line_departure"></b>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 24.10.1. 탑승수속 소요시간 div 홍정호 -->
	</div>

</div>
<div>


</div>
<div id="footerdiv">
	
	
</div>
<script>
    $(document).ready(function() {
      
    });
</script>
