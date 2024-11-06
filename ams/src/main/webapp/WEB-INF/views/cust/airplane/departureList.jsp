<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/airplane/departureList.css">

<script type="text/javascript">

// 전역 변수
let serviceKey = "${ServiceKey}"; // 인증 키
let page = 1; 					// 한 페이지당 항목 개수
let todayDateforLink = "${todayDateforLink}";		// 접속 당일 날짜 yyyymmdd 형식
let selDate;					// 선택한 날짜
let flightArray;
let matchCount;
let nowTime = "${nowTime}";		// 현재 시간

console.log(todayDateforLink);



$(function(){

	//24.9.30. 홍정호 arrivalList로 올때마다 model에 매핑된 값을 자동으로 가져옴
	let datefromMain = "${dateParam}";
	let airLinefromMain = "${airLineParam}";
	let airFlnfromMain = "${airFlnParam}";
	let startTimefromMain = "${startTimeParam}";
	let endTimefromMain = "${endTimeParam}";
	let formattedStartTime = startTimefromMain.slice(0, 2) + ':' + startTimefromMain.slice(2);
	let formattedEndTime = endTimefromMain.slice(0, 2) + ':' + endTimefromMain.slice(2);

	$("#airLine").val(airLinefromMain);
	if(airFlnfromMain !== "all"){
		$("#airFln").val(airFlnfromMain);
	}
	if(formattedStartTime != null && formattedStartTime != ''){
		$("#startTime").val(formattedStartTime);
	}
	if(formattedEndTime != null && formattedEndTime != ''){
		$("#endTime").val(formattedEndTime);
	}
	
	console.log("datefromMain : " + datefromMain);
	
	if(datefromMain == ''){
		$.ajax({
			url:"http://api.odcloud.kr/api/FlightStatusListDTL/v1/getFlightStatusListDetail?page="+page+"&perPage="+matchCount+"&cond%5BFLIGHT_DATE%3A%3AEQ%5D="+todayDateforLink+"&cond%5BIO%3A%3AEQ%5D=I&cond%5BAIRPORT%3A%3AEQ%5D=GMP&serviceKey="+serviceKey,
			type:"get",
			success:function(result){
				matchCount = result.matchCount;
				getSchedule();
			}
		});
	}else{
		console.log("파라미터 값 받음")
		$.ajax({
			url:"http://api.odcloud.kr/api/FlightStatusListDTL/v1/getFlightStatusListDetail?page="+page+"&perPage="+matchCount+"&cond%5BFLIGHT_DATE%3A%3AEQ%5D="+datefromMain+"&cond%5BIO%3A%3AEQ%5D=O&cond%5BAIRPORT%3A%3AEQ%5D=GMP&serviceKey="+serviceKey,
			type:"get",
			success:function(result){
				matchCount = result.matchCount;
				updateDate();//이제 updateDate에서 이프문치기
			}
		});	
	}
	

	
	// 조회버튼 클릭 시 해당하는 스케쥴 출력
	$("#searchBtn").on("click", function() {
		let date = $("#date").val();
		let arrived = $("#arrived").val();
		let airLine = $("#airLine").val();
		let airFln = $("#airFln").val();
		let remark = $("#remark").val();
		let boarding = $("#boarding").val();
		let startTime = $("#startTime").val();
		let endTime = $("#endTime").val();
		
		startTime = parseInt(startTime.replace(":", ""));
		endTime = parseInt(endTime.replace(":", ""));
		
		console.log("검색 Date : " + date);
		console.log("검색 arrived : " + arrived);
		console.log("검색 airLine : " + airLine);
		console.log("검색 airFln : " + airFln);
		console.log("검색 remark : " + remark);
		console.log("검색 boarding : " + boarding);
		console.log("검색 startTime : " + startTime);
		console.log("검색 endTime : " + endTime);
		
	    if(date == 0) { 					// 날짜 미선택 시 알람 발생
	    	alert("조회 일자를 지정해주십시오");
	    	return;
	    } else {
	    	date = date.split("-");
	    	selDate = date[0]+date[1]+date[2];
		    console.log("선택한 날짜 : " + selDate );   	
	    }
	    
	    if(startTime >= endTime) {
	    	alert("시간 설정을 확인해주십시오");
	    	return;
	    }
	    
	 // 날짜만 선택했을 때
	    if (date && (!arrived || arrived === "all") && (!airLine || airLine === "all") && (!airFln || airFln === "") && (!remark || remark === "all") && (!startTime || startTime === "0") && (!endTime || endTime === "2350")) {
	        updateDate();
	    } else {
	    	$.ajax({
				url:"http://api.odcloud.kr/api/FlightStatusListDTL/v1/getFlightStatusListDetail?page="+page+"&perPage="+matchCount+"&cond%5BFLIGHT_DATE%3A%3AEQ%5D="+selDate+"&cond%5BIO%3A%3AEQ%5D=I&cond%5BAIRPORT%3A%3AEQ%5D=GMP&serviceKey="+serviceKey,
				type:"get",
				success:function(result){
					flightArray = result.data;
					console.log(flightArray.length)					
					
					// STD 기준으로 오름차순 정렬
				    flightArray.sort((a, b) => {
				        return (a.STD || 0) - (b.STD || 0); // STD가 null인 경우 0으로 간주
				    });

					console.log("검색 버튼 호출 데이터 : ", result.data);
					
					$("#tbody").empty();
					let str = "";
					
					flightArray.forEach((item, i) => {
						
						let itemSTD = parseInt(item.STD); // item.STD를 정수로 변환

						
						let match = true; // 매칭 여부를 저장할 변수
		                
		                // 필터링 조건
		                if (boarding && boarding !== "all" && item.BOARDING_KOR !== boarding) {
		                    match = false;
		                    console.log("boarding 부정");
		                }
		                if (airLine && airLine !== "all" && item.AIRLINE_KOREAN !== airLine) {
		                    match = false;
		                    console.log("airLine 부정");
		                }
		                if (airFln && item.AIR_FLN !== airFln) {
		                    match = false;
		                    console.log("airFln 부정");
		                }
		                if (remark && remark !== "all" && item.RMK_KOR !== remark) {
		                	match = false;
		                    console.log("remark 부정");
		                }
						
		                if (itemSTD >= startTime && endTime >= itemSTD) {
			                if (match) {
			                	if(item.STD != null) {
									item.STD = item.STD.slice(0,2) + ":" + item.STD.slice(2); // 시간 표시 형식 변경                		
			                	}else {
			                		item.STD = "-";
			                	}

			                	if(item.ETD != null) {
									item.ETD = item.ETD.slice(0,2) + ":" + item.ETD.slice(2); // 시간 표시 형식 변경                		
			                	}else {
			                		item.ETD = "-";
			                	}
			                	
								str += "<tr>";
								str += "<td style='width:10%' id='std'>" + item.STD + "</td>";					
				                str += "<td style='width:10%' id='etd'>" + item.ETD + "</td>";
				                str += "<td style='width:10%'>" + item.BOARDING_KOR + "</td>";
	
				             // 항공사 이미지와 이름 출력
				                let airlineImgFound = false;
				
				                // JSP에서 서버 측 항공사 리스트를 클라이언트에서 사용할 수 있게
				                <c:forEach var="airLine" items="${airLineVO}">
				                    if ("${airLine.airKrNm}" === item.AIRLINE_KOREAN) {
				                        str += "<td style='width:30%; text-align:left;'>";
				                        if(item.AIRLINE_KOREAN === "제주항공" || item.AIRLINE_KOREAN === "에어부산" || item.AIRLINE_KOREAN === "전일본공수" || item.AIRLINE_KOREAN === "타이거에어 타이완") {
					                        str += "<a href='${airLine.airUrl}' target='_blank'><img src='${airLine.airImg}' alt='${airLine.airKrNm}' style='width:100px; margin-left:-25px; margin-right:25px;'>" + item.AIRLINE_KOREAN + "</a>";
				                        	
				                        } else {
					                        str += "<a href='${airLine.airUrl}' target='_blank'><img src='${airLine.airImg}' alt='${airLine.airKrNm}'>" + item.AIRLINE_KOREAN + "</a>";	                        	
				                        }
				                        str += "</td>";
				                        airlineImgFound = true; // 이미지를 찾은 경우 true로 설정
				                    }
				                </c:forEach>
				
				                // 이미지가 없으면 항공사 이름만 출력
				                if (!airlineImgFound) {
				                    str += "<td style='width:30%; margin-left:160px; text-align:left;'>" + item.AIRLINE_KOREAN + "</td>";
				                }
				                
			                    
			                    str += "<td style='width:10%'>" + item.AIR_FLN + "</td>";
			                    str += "<td style='width:10%; color:#01A9DB;'>" + (item.BAGGAGE_CLAIM != null ? item.BAGGAGE_CLAIM : "-") + "</td>";
			                 // 지연 값 도착하지 않았을 때 지연으로 만들기
					             if (item.RMK_KOR !== "도착" && item.RMK_KOR !== "결항" && (item.ETD - item.STD) >= 15) {
					                  	item.RMK_KOR = "지연";               
					             } 
				                 str += "<td style='width:20%'>";
				                 str += "<button id='rmkBtn' style='background:";
				                 if(item.RMK_KOR === "도착") {
				                     str += "#2E9AFE;'";
				                 } else if(item.RMK_KOR === "결항" || item.RMK_KOR === "사전결항" || item.RMK_KOR === "지연") {
				                     str += "#FE2E64;'";
				                 } else if(item.RMK_KOR == null) {
				                     str += "none;'";
				                 } else {
				                     str += "#04B431;'"
				                 } 
				                 str += "type='button'>";
				                 str += (item.RMK_KOR != null ? item.RMK_KOR : "-");
				                 str += "</button>";    
				                 str += "</td>";
			                    str += "</tr>";
			                }
		                }
						
					})					
					$("#tbody").append(str);
					
				}
			});
	    }	    
	})
	
	// 오늘 이후의 날짜 선택 시 알람 발생
	$("#date").on("change", function() {
		let date = $(this).val();
		date = date.split("-");
		selDate = date[0]+date[1]+date[2];
		console.log("오늘 날짜 : " + todayDateforLink);
		console.log("선택 날짜 : " + selDate);
		if(selDate > todayDateforLink) {
			alert("오늘 이후의 날짜는 조회 불가능합니다"); // 오늘 이후 날짜 선택 시 알람 발생
			$("#date").val("");
		}
		$("#startTime").val("00:00");
		$("#endTime").val("23:50");
	})
	
	// 새로고침 클릭 이벤트
	$("#refreshBtn").on("click", function() {
		location.reload();
	})
	
function updateDate() { // 날짜 선택 시 스케쥴 조회
	
   	console.log("updateDate 도착");
   	console.log("datefromMain : " + datefromMain);
   	console.log("airLinefromMain : " + airLinefromMain);
	
	let startTime = $("#startTime").val();
	let endTime = $("#endTime").val();  	
   	
	startTime = parseInt(startTime.replace(":", ""));
	endTime = parseInt(endTime.replace(":", ""));
	
	$.ajax({
		url:"http://api.odcloud.kr/api/FlightStatusListDTL/v1/getFlightStatusListDetail?page="+page+"&perPage="+matchCount+"&cond%5BFLIGHT_DATE%3A%3AEQ%5D="+selDate+"&cond%5BIO%3A%3AEQ%5D=I&cond%5BAIRPORT%3A%3AEQ%5D=GMP&serviceKey="+serviceKey,
		type:"get",
		success:function(result){
			matchCount = result.matchCount;
			//오브젝트는 쉼표로 봄
			console.log("result.data updateDate : ", result.data);
			flightArray = result.data;	
			console.log(flightArray.length)
			
			// STD 기준으로 오름차순 정렬
		    flightArray.sort((a, b) => {
		        return (a.STD || 0) - (b.STD || 0); // STD가 null인 경우 0으로 간주
		    });
			
			$("#tbody").empty();
			let str = "";
			flightArray.forEach((item, i) => {
				let itemSTD = parseInt(item.STD); // item.STD를 정수로 변환
				

    			//if datefromMain is not null - 홍정호
    			if(datefromMain != '' && datefromMain != null){
    				console.log("datefromMain is not null : " + datefromMain);

    				let itemSTD = parseInt(item.STD); // item.STD를 정수로 변환
    				console.log("itemSTD = " + itemSTD);
    				let match = true; // 매칭 여부를 저장할 변수 - 홍정호
    				
    				//항공사 필터조건 - 홍정호
    				if(airLinefromMain && airLinefromMain !== "all" && item.AIRLINE_KOREAN !== airLinefromMain){
    					match = false;
    					console.log(item.AIRLINE_KOREAN + " 비교 : " + airLinefromMain);
    					console.log("airLinefromMain 부정");
    				}
    				//편명 필터조건 - 홍정호
    				if(airFlnfromMain && airFlnfromMain!== "all" && item.AIR_FLN !== airFlnfromMain){
    					match = false;
    					console.log(item.AIR_FLN + " 비교 : " + airFlnfromMain);
    					console.log("airFlnfromMain 부정");
    				}        				
    				
    				console.log("처리하는로직 진입전");
    				//처리하는 로직
    				if(itemSTD >= startTimefromMain && endTimefromMain >= itemSTD){
    					console.log("처리하는로직 진입후");
    					
    					if(match){
        					if(item.STD != null){
        						item.STD = item.STD.slice(0,2) + ":" + item.STD.slice(2); // 시간 표시 형식 변경
        					}else{
        						item.STD = "-";
        					}
                        	if(item.ETD != null) {
        						item.ETD = item.ETD.slice(0,2) + ":" + item.ETD.slice(2); // 시간 표시 형식 변경                		
                        	}else {
                        		item.ETD = "-";
                        	}
        					str += "<tr>";
        					str += "<td style='width:10%' id='std'>" + item.STD + "</td>";					
        	                str += "<td style='width:10%' id='etd'>" + item.ETD + "</td>";
        	                str += "<td style='width:20%'>" + item.ARRIVED_KOR + "</td>";
        	                
        	                //항공사 이미지와 이름 출력
        	                let airlineImgFound = false;
        	                <c:forEach var="airLine" items="${airLineVO}">
			                    if ("${airLine.airKrNm}" === item.AIRLINE_KOREAN) {
			                        str += "<td style='width:30%; text-align:left;'>";
			                        if(item.AIRLINE_KOREAN === "제주항공" || item.AIRLINE_KOREAN === "에어부산" || item.AIRLINE_KOREAN === "전일본공수" || item.AIRLINE_KOREAN === "타이거에어 타이완") {
				                        str += "<a href='${airLine.airUrl}' target='_blank'><img src='${airLine.airImg}' alt='${airLine.airKrNm}' style='width:100px; margin-left:-25px; margin-right:25px;'>" + item.AIRLINE_KOREAN + "</a>";
			                        	
			                        } else {
				                        str += "<a href='${airLine.airUrl}' target='_blank'><img src='${airLine.airImg}' alt='${airLine.airKrNm}'>" + item.AIRLINE_KOREAN + "</a>";	                        	
			                        }
			                        str += "</td>";
			                        airlineImgFound = true; // 이미지를 찾은 경우 true로 설정
			                    }
        	                </c:forEach>
        	                
        	                if(!airlineImgFound){
        	                	str += "<td style='width:30%; margin-left:160px; text-align:left;'>" + item.AIRLINE_KOREAN + "</td>";
        	                }
        	                
		                    str += "<td style='width:10%'>" + item.AIR_FLN + "</td>";
		                    str += "<td style='width:10%; color:#01A9DB;'>" + (item.GATE != null ? item.GATE : "-") + "</td>" 
                        	
			                 // 지연 값 도착하지 않았을 때 지연으로 만들기
			                if (item.RMK_KOR !== "출발" && item.RMK_KOR !== "결항" && (item.ETD - item.STD) >= 15){
			                    	item.RMK_KOR = "지연";               
			                }
		                    str += "<td style='width:20%'>";
		                    str += "<button id='rmkBtn' style='background:";
		                    if(item.RMK_KOR === "출발") {
		                        str += "#2E9AFE;'";
		                    } else if(item.RMK_KOR === "결항" || item.RMK_KOR === "사전결항" || item.RMK_KOR === "지연") {
		                        str += "#FE2E64;'";
		                    } else if(item.RMK_KOR == null) {
		                        str += "none;'";
		                    } else {
		                        str += "#04B431;'"
		                    }
		                    str += "type='button'>";
		                    str += (item.RMK_KOR != null ? item.RMK_KOR : "-");
		                    str += "</button>";    
		                    str += "</td>";
		                    str += "</tr>";        						
    					}
    				}
    			}else{
					if (itemSTD >= startTime && endTime >= itemSTD) {
						if(item.STD != null) {
							item.STD = item.STD.slice(0,2) + ":" + item.STD.slice(2); // 시간 표시 형식 변경                		
	                	}else {
	                		item.STD = "-";
	                	}

	                	if(item.ETD != null) {
							item.ETD = item.ETD.slice(0,2) + ":" + item.ETD.slice(2); // 시간 표시 형식 변경                		
	                	}else {
	                		item.ETD = "-";
	                	}
	                	
						str += "<tr>";
		                str += "<td style='width:10%' id='std'>" + item.STD + "</td>";					
		                str += "<td style='width:10%' id='etd'>" + item.ETD + "</td>";
		                str += "<td style='width:10%'>" + item.BOARDING_KOR + "</td>";
		
		             // 항공사 이미지와 이름 출력
		                let airlineImgFound = false;
		
		                // JSP에서 서버 측 항공사 리스트를 클라이언트에서 사용할 수 있게
		                <c:forEach var="airLine" items="${airLineVO}">
		                    if ("${airLine.airKrNm}" === item.AIRLINE_KOREAN) {
		                        str += "<td style='width:30%; text-align:left;'>";
		                        if(item.AIRLINE_KOREAN === "제주항공" || item.AIRLINE_KOREAN === "에어부산" || item.AIRLINE_KOREAN === "전일본공수" || item.AIRLINE_KOREAN === "타이거에어 타이완") {
			                        str += "<a href='${airLine.airUrl}' target='_blank'><img src='${airLine.airImg}' alt='${airLine.airKrNm}' style='width:100px; margin-left:-25px; margin-right:25px;'>" + item.AIRLINE_KOREAN + "</a>";
		                        	
		                        } else {
			                        str += "<a href='${airLine.airUrl}' target='_blank'><img src='${airLine.airImg}' alt='${airLine.airKrNm}'>" + item.AIRLINE_KOREAN + "</a>";	                        	
		                        }
		                        str += "</td>";
		                        airlineImgFound = true; // 이미지를 찾은 경우 true로 설정
		                    }
		                </c:forEach>
		
		                // 이미지가 없으면 항공사 이름만 출력
		                if (!airlineImgFound) {
		                    str += "<td style='width:30%; margin-left:160px; text-align:left;'>" + item.AIRLINE_KOREAN + "</td>";
		                }
		                
		                 
		                 str += "<td style='width:10%'>" + item.AIR_FLN + "</td>";
		                 str += "<td style='width:10%; color:#01A9DB;'>" + (item.BAGGAGE_CLAIM != null ? item.BAGGAGE_CLAIM : "-") + "</td>";
		              // 지연 값 도착하지 않았을 때 지연으로 만들기
			             if (item.RMK_KOR !== "도착" && item.RMK_KOR !== "결항" && (item.ETD - item.STD) >= 15) {
			                  	item.RMK_KOR = "지연";               
			             } 
		                 str += "<td style='width:20%'>";
		                 str += "<button id='rmkBtn' style='background:";
		                 if(item.RMK_KOR === "도착") {
		                     str += "#2E9AFE;'";
		                 } else if(item.RMK_KOR === "결항" || item.RMK_KOR === "사전결항" || item.RMK_KOR === "지연") {
		                     str += "#FE2E64;'";
		                 } else if(item.RMK_KOR == null) {
		                     str += "none;'";
		                 } else {
		                     str += "#04B431;'"
		                 } 
		                 str += "type='button'>";
		                 str += (item.RMK_KOR != null ? item.RMK_KOR : "-");
		                 str += "</button>";    
		                 str += "</td>";
		                 str += "</tr>";
					}					
				}
				//end of if
				
			})
			$("#tbody").append(str);
		}
	});
}

//파라미터 없이 최초 진입시 실행되는
function getSchedule() {
	
	console.log("현재 시간 : " + nowTime);
	nowTime = parseInt(nowTime.replace(":", ""));
	console.log("수정한 현재 시간 : " + nowTime);
	
	$.ajax({
		url:"http://api.odcloud.kr/api/FlightStatusListDTL/v1/getFlightStatusListDetail?page="+page+"&perPage="+matchCount+"&cond%5BFLIGHT_DATE%3A%3AEQ%5D="+todayDateforLink+"&cond%5BIO%3A%3AEQ%5D=I&cond%5BAIRPORT%3A%3AEQ%5D=GMP&serviceKey="+serviceKey,
		type:"get",
		success:function(result){
			selDate = todayDateforLink;
			//해당 날짜의 최대 스케줄 개수
			matchCount = result.matchCount;
			//오브젝트는 쉼표로 봄
			console.log("result.data getSchedule : ", result.data);
			flightArray = result.data;	
			console.log(flightArray.length);
			
			// STD 기준으로 오름차순 정렬
			flightArray.sort((a, b) => {
				return (a.STD || 0) - (b.STD || 0); // STD가 null인 경우 0으로 간주
			});
			
			
			$("#tbody").empty();
			let str = "";
			flightArray.forEach((item, i) => {
				if(item.STD >= nowTime) {		// STD가 현재 시간 이후일 경우 출력
					if(item.STD != null) {
						item.STD = item.STD.slice(0,2) + ":" + item.STD.slice(2); // 시간 표시 형식 변경                		
                	}else {
                		item.STD = "-";
                	}

                	if(item.ETD != null) {
						item.ETD = item.ETD.slice(0,2) + ":" + item.ETD.slice(2); // 시간 표시 형식 변경                		
                	}else {
                		item.ETD = "-";
                	}
                	
					str += "<tr>";
					str += "<td style='width:10%' id='std'>" + item.STD + "</td>";					
	                str += "<td style='width:10%' id='etd'>" + item.ETD + "</td>";
	                str += "<td style='width:10%'>" + item.BOARDING_KOR + "</td>";
	                 
	             // 항공사 이미지와 이름 출력
	                let airlineImgFound = false;
	
	                // JSP에서 서버 측 항공사 리스트를 클라이언트에서 사용할 수 있게
	                <c:forEach var="airLine" items="${airLineVO}">
	                    if ("${airLine.airKrNm}" === item.AIRLINE_KOREAN) {
	                        str += "<td style='width:30%; text-align:left;'>";
	                        if(item.AIRLINE_KOREAN === "제주항공" || item.AIRLINE_KOREAN === "에어부산" || item.AIRLINE_KOREAN === "전일본공수" || item.AIRLINE_KOREAN === "타이거에어 타이완") {
		                        str += "<a href='${airLine.airUrl}' target='_blank'><img src='${airLine.airImg}' alt='${airLine.airKrNm}' style='width:100px; margin-left:-25px; margin-right:25px;'>" + item.AIRLINE_KOREAN + "</a>";
	                        	
	                        } else {
		                        str += "<a href='${airLine.airUrl}' target='_blank'><img src='${airLine.airImg}' alt='${airLine.airKrNm}'>" + item.AIRLINE_KOREAN + "</a>";	                        	
	                        }
	                        str += "</td>";
	                        airlineImgFound = true; // 이미지를 찾은 경우 true로 설정
	                    }
	                </c:forEach>
	
	                // 이미지가 없으면 항공사 이름만 출력
	                if (!airlineImgFound) {
	                    str += "<td style='width:30%; margin-left:160px; text-align:left;'>" + item.AIRLINE_KOREAN + "</td>";
	                }
	                
	                 
	                 str += "<td style='width:10%'>" + item.AIR_FLN + "</td>";
	                 str += "<td style='width:10%; color:#01A9DB;'>" + (item.BAGGAGE_CLAIM != null ? item.BAGGAGE_CLAIM : "-") + "</td>";
	              // 지연 값 도착하지 않았을 때 지연으로 만들기
		             if (item.RMK_KOR !== "도착" && item.RMK_KOR !== "결항" && (item.ETD - item.STD) >= 15) {
		                  	item.RMK_KOR = "지연";               
		             } 
	                 str += "<td style='width:20%'>";
	                 str += "<button id='rmkBtn' style='background:";
	                 if(item.RMK_KOR === "도착") {
	                     str += "#2E9AFE;'";
	                 } else if(item.RMK_KOR === "결항" || item.RMK_KOR === "사전결항" || item.RMK_KOR === "지연") {
	                     str += "#FE2E64;'";
	                 } else if(item.RMK_KOR == null) {
	                     str += "none;'";
	                 } else {
	                     str += "#04B431;'"
	                 } 
	                 str += "type='button'>";
	                 str += (item.RMK_KOR != null ? item.RMK_KOR : "-");
	                 str += "</button>";    
	                 str += "</td>";
	                 str += "</tr>";
				}
			})
			$("#tbody").append(str);
		}
	});
}	
	
	
});
</script>
<div class="container">

	<div class="headerDiv">
		
			<div id="arv">
				<a id="arvALink" href="/cust/airplane/arrivalList"> 
					출발
				</a>
			</div>
			<div id="dep">
				<a id="depALink" href="/cust/airplane/departureList">
					도착
				</a>
			</div>
	</div>
	<!-- headerDiv 끝 -->
		
		<div class="searchSection">
		<!-- searchDiv 시작 -->
		<div class="searchDiv">	
			<div class="searchChild">
				<div class="searchSmall">
					<label for="airport">공항</label>
					<input type="text" id="airport" name="airport" value="김포공항" readonly>
				</div>
				
				<div class="searchSmall">
					<label for="boarding">출발지</label>
					<select id="boarding" name="boarding" class="form-control">
                         <option value="all" selected>전체</option>
                         <c:forEach var="nation" items="${nationName}" varStatus="status">
                         	<option value="${nation.comDetCdNm}">${nation.comDetCdNm}</option>
                         </c:forEach>
                     </select>
				</div>
			</div>
	
			<div class="searchChild">
				<div class="searchSmall">
					<label for="date">운항일</label>
					<input type="date" id="date" name="date" value="${todayDate}" />
				</div>
		
				<div class="searchSmall">
					<label for="time">시간</label>
						<input type="time" id="startTime" name="startTime" value="${nowTime}" />
						<p>~</p>
						<input type="time" id="endTime" name="endTime" value="${lastTime}" />
				</div>
			</div>
			
			<div class="searchChild">
				<div class="searchSmall">
					<label for="remark">현황</label>
					<select id="remark" name="remark" class="form-control">
						<option value="all" selected>전체</option>
                 		<option value="도착">도착</option>
                 		<option value="결항">결항</option>
                 		<option value="지연">지연</option>    
					</select>
				</div>
		
		
				<div class="searchSmall">
					<label for="airLine">항공사</label>
					<select id="airLine" name="airLine" class="form-control">
						<option value="all" selected>전체</option>
						<c:forEach var="airLine" items="${airLineName}" varStatus="status">
							<option value="${airLine.comDetCdNm}">${airLine.comDetCdNm}</option>
						</c:forEach>
					</select>
				</div>
			</div>
	
			<div class="searchChild">
				<div class="searchSmall">
					<label for="airFln">편명</label>
					<input type="text" id="airFln" name="airFln" placeholder="편명 입력"
						value="${param.airFln}" class="form-control" />
				</div>
				
				<div class="searchSmall">
					<label></label>
				</div>
			</div>
		</div>
		<!-- searchDiv 끝 -->
		
		<div class="searchBtnDiv">
			<button type="button" id="searchBtn" class="btn btn-default">조회</button>
		</div>
		
	</div>
		
	
	<!-- refreshDiv 시작 -->
	<div class="refreshDiv">
			<label id="lastRefresh">마지막 새로고침 : ${refreshTime}</label>		
			<button type="button" id="refreshBtn">
				<img src="/resources/images/reload.png" style="width:20px; height:20px;">
			</button>
	</div>	
	<!-- refreshDiv 끝 -->	
	
	<!-- tableDiv 시작 -->
	<div class="tableDiv">
		<table>
			<thead>
				<tr>
					<th style="width:10%">도착시각</th>
					<th style="width:10%">변경시각</th>
					<th style="width:20%">출발지</th>
					<th style="width:30%; text-align:left;'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;항공사</th>
					<th style="width:10%">항공편명</th>
					<th style="width:10%">수하물수취대</th>
					<th style="width:20%">현황</th>
				</tr>
			</thead>
			<tbody id="tbody">
			</tbody>
		</table>
	</div>
	<!-- tableDiv 끝 -->
</div>


