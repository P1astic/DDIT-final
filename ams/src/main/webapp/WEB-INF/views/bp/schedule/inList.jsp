<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-xml2json/0.1/jquery.xml2json.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/schedule/inList.css">

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script>
let id = "${memVO.memId}";
	
let airLineNm = "";

let thisDate = "${thisDate}";
let firstYear = thisDate.slice(0,4);
let firstMonth = thisDate.slice(4,6);
let firstDay = thisDate.slice(6,8);

let thisYear = thisDate.slice(0,4);
let thisMonth = thisDate.slice(4,6);
let thisDay = "01";

function exportExcel(){ 
  // step 1. workbook 생성
  var wb = XLSX.utils.book_new();

  // step 2. 시트 만들기 
  var newWorksheet = excelHandler.getWorksheet();

  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
  XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

  // step 4. 엑셀 파일 만들기 
  var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

  // step 5. 엑셀 파일 내보내기 
  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
}

var excelHandler = {
    getExcelFileName : function(){
        return 'Domestic_flights_' + airLineNm + '_' + thisYear + '_' + thisMonth + '.xlsx';	//파일명
    },
    getSheetName : function(){
        return '국내선';	//시트명
    },
    getExcelData : function(){
        return document.getElementById('scheduleTable'); 	//테이블 아이디
    },
    getWorksheet : function(){
        return XLSX.utils.table_to_sheet(this.getExcelData());
    }
}

function s2ab(s) { 
  var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
  var view = new Uint8Array(buf);  //create uint8array as viewer
  for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
  return buf;    
}

function updateInList() {
	
	let data = {
		"year" : thisYear,
		"month" : thisMonth,
		"day" : thisDay
	}
	
	$.ajax({
		url : "/bp/schedule/updateInList",
		data : data,
		type : "get",
		dataType : "json",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(result) {		
			
			flightArray = result;
			
			// domesticStartTime 기준으로 오름차순 정렬
			flightArray.sort((a, b) => {
				return (a.domesticStartTime || 0) - (b.domesticStartTime || 0);		// domesticStartTime가 nulll인 경우 0으로 간주
			});

			$("#tbody").empty();
			
			let str = "";

			flightArray.forEach((item, i) => {
				
				// 접속한 항공사의 정보만 출력
				if(item.airlineKorean === airLineNm ) {
					console.log(item);
	            	str += "<tr>";
	            	str += "<td>" + item.domesticNum + "</td>";
	            	str += "<td>" + item.domesticStartTime + "</td>";
	            	str += "<td>" + item.domesticArrivalTime + "</td>";
	            	str += "<td>" + item.arrivalcity + "</td>";
	            	str += "<td data-title='월'>" + ((item.domesticMon != 'N') ? "<span class='circle' title='월요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='화'>" + ((item.domesticTue != 'N') ? "<span class='circle' title='화요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='수'>" + ((item.domesticWed != 'N') ? "<span class='circle' title='수요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='목'>" + ((item.domesticThu != 'N') ? "<span class='circle' title='목요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='금'>" + ((item.domesticFri != 'N') ? "<span class='circle' title='금요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='토'>" + ((item.domesticSat != 'N') ? "<span class='circle weekend' title='토요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='일'>" + ((item.domesticSun != 'N') ? "<span class='circle weekend' title='일요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td style='font-size:15px;'>" + item.domesticStdate + " ~ " + item.domesticEddate + "</td>";
	            	str += "</tr>";
				}
			})
			
			$("#tbody").append(str);
			
		},
		error : function(xhr, status, error) {
			console.log("에러 발생 : " + xhr.status + " " + error);
		}
	})
}

function getSchedule() {
 	// 최초 스케쥴 조회
	$.ajax({
		url : "/bp/schedule/getInList",
		type:"get",
		dataType : "json",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(result) {		
			
			flightArray = result;
			
			// domesticStartTime 기준으로 오름차순 정렬
			flightArray.sort((a, b) => {
				return (a.domesticStartTime || 0) - (b.domesticStartTime || 0);		// domesticStartTime가 nulll인 경우 0으로 간주
			});

			$("#tbody").empty();
			
			let str = "";

			flightArray.forEach((item, i) => {
				
				// 접속한 항공사의 정보만 출력
				if(item.airlineKorean === airLineNm ) {
					console.log(item);
	            	str += "<tr>";
	            	str += "<td>" + item.domesticNum + "</td>";
	            	str += "<td>" + item.domesticStartTime + "</td>";
	            	str += "<td>" + item.domesticArrivalTime + "</td>";
	            	str += "<td>" + item.arrivalcity + "</td>";
	            	str += "<td data-title='월'>" + ((item.domesticMon != 'N') ? "<span class='circle' title='월요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='화'>" + ((item.domesticTue != 'N') ? "<span class='circle' title='화요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='수'>" + ((item.domesticWed != 'N') ? "<span class='circle' title='수요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='목'>" + ((item.domesticThu != 'N') ? "<span class='circle' title='목요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='금'>" + ((item.domesticFri != 'N') ? "<span class='circle' title='금요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='토'>" + ((item.domesticSat != 'N') ? "<span class='circle weekend' title='토요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='일'>" + ((item.domesticSun != 'N') ? "<span class='circle weekend' title='일요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td style='font-size:15px;'>" + item.domesticStdate + " ~ " + item.domesticEddate + "</td>";
	            	str += "</tr>";
				}
			})
			
			$("#tbody").append(str);
			
		},
		error : function(xhr, status, error) {
			console.log("에러 발생 : " + xhr.status + " " + error);
		}
	});
}

$(function() {
	
	let date = thisYear + " / " + thisMonth;
	$("#date").html(date);
	
	$.ajax({
		url : "/bp/schedule/getAirLineNm",
		contentType : "application/json; charset=utf-8",
		data : id,
		type : "post",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},                     
		success : function(result) {
			console.log("getAirLineNm result : ", result.airKrNm);
			airLineNm = result.airKrNm;
// 			getSchedule();
		}
	});
	
	$("#downloadBtn").on("click", function() {
		exportExcel();
	})
	
	$("#before").on("click", function() {
	    console.log("현재 thisMonth : " + thisMonth);
	    
	    // thisMonth가 01인 경우 12로 변경
	    if (thisMonth === "01") {
	        thisMonth = "12";
	        thisYear = thisYear - 1;
	    } else {
	        // thisMonth에서 1을 빼고, 두 자리 수로 만들기
	        thisMonth = ("0" + (parseInt(thisMonth, 10) - 1)).slice(-2);
	        /*
								parseInt로 정수로 변환한다(10진수로) => 09 -> 9
														거기서 1을 뺀다
						결과에 "0"을 더한다
																두자리 이상일 수 있으니 끝에서부터 두 자리를 추출한다. 011 -> 11
			*/
	    }
	    
	    console.log("변경된 thisMonth : " + thisMonth);
	    
		date = thisYear + " / " + thisMonth;
		
	    // 변경된 월을 페이지에 업데이트
	    $("#date").html(date);
	    
	    // 해당 스케쥴 재로딩
	    updateInList();
	});

	$("#after").on("click", function() {
		
	    console.log("현재 thisMonth : " + thisMonth);
	    
	    // thisMonth가 01인 경우 12로 변경
	    if(thisMonth === firstMonth && thisYear === firstYear) {
	    	alert("다음 달은 조회 불가능합니다.");
	    	return;
	    } else if(thisMonth === "12") {
	        thisMonth = "01";
	        thisYear = thisYear + 1;
	    } else {
	        // thisMonth에서 1을 빼고, 두 자리 수로 만들기
	        thisMonth = ("0" + (parseInt(thisMonth, 10) + 1)).slice(-2);
	        /*
								parseInt로 정수로 변환한다(10진수로) => 09 -> 9
														거기서 1을 뺀다
						결과에 "0"을 더한다
																두자리 이상일 수 있으니 끝에서부터 두 자리를 추출한다. 011 -> 11
			*/
	    }
	    
	    console.log("변경된 thisMonth : " + thisMonth);
		
	    date = thisYear + " / " + thisMonth;
		
	    // 변경된 월을 페이지에 업데이트
	    $("#date").html(date);
	    
		// 해당 스케쥴 재로딩
	    updateInList();
	});
})
</script>
<div class="titleHeader">
	<h4>
		<span style="color:#A4A4A4; font-size:20px; font-weight: 600; word-wrap: break-word;">운행 스케쥴 조회  - </span>
		<span style="font-size:20px; font-weight: 600; word-wrap: break-word;">국내선</span>
	</h4>
	<div class="ml-auto d-flex align-items-center">
		
	</div>
</div>
<div class="container">

	<div class="date">
		<button type="button" class="monthBtns" id="before">
			<img src="/resources/images/icon/before.png">
		</button>
		<label id="date"></label>
		<button type="button" class="monthBtns" id="after">
			<img src="/resources/images/icon/after.png">
		</button>
		<div class="download">
			<button type="button" name="downloadBtn" id="downloadBtn">
				<img src="/resources/images/icon/download.png">
			</button>
		</div>
	</div>

	
	<!-- tableDiv 시작 -->
	<div class="tableDiv">
		<table id="scheduleTable">
			<thead>
				<tr>
					<th rowspan="2" style="width:10%">항공편</th>
					<th rowspan="2" style="width:10%">출발시간</th>
					<th rowspan="2" style="width:10%">도착시간</th>
					<th rowspan="2" style="width:10%">목적지</th>
					<th colspan="7" style="width:40%">운항요일</th>
					<th rowspan="2" style="width:20%">운항기간</th>
				</tr>
				<tr>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
					<th>일</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<tr>
					<td>OZ8901</td>
					<td>06:10</td>
					<td>07:20</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8911</td>
					<td>06:40</td>
					<td>07:50</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.06.11 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8733</td>
					<td>07:10</td>
					<td>08:10</td>
					<td>여수</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8913</td>
					<td>07:25</td>
					<td>08:35</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"></td>
					<td data-title="목"></td>
					<td data-title="금"></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.09.01 ~ 2024.09.30</td>
				</tr>
				<tr>
					<td>OZ8921</td>
					<td>08:20</td>
					<td>09:35</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8925</td>
					<td>08:30</td>
					<td>09:40</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8703</td>
					<td>09:25</td>
					<td>10:25</td>
					<td>광주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.09.08 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8927</td>
					<td>09:50</td>
					<td>11:00</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8931</td>
					<td>10:15</td>
					<td>11:25</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8935</td>
					<td>10:40</td>
					<td>11:50</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.06.11 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8941</td>
					<td>11:15</td>
					<td>12:25</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.06.26 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8947</td>
					<td>12:20</td>
					<td>13:35</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8949</td>
					<td>12:45</td>
					<td>13:55</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.09.08 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8951</td>
					<td>13:00</td>
					<td>14:10</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8953</td>
					<td>14:00</td>
					<td>15:10</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8961</td>
					<td>14:55</td>
					<td>16:05</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8963</td>
					<td>15:05</td>
					<td>16:15</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.08.01 ~ 2024.09.30</td>
				</tr>
				<tr>
					<td>OZ8707</td>
					<td>15:50</td>
					<td>16:45</td>
					<td>광주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.08.10 ~ 2024.09.30</td>
				</tr>
				<tr>
					<td>OZ8735</td>
					<td>16:10</td>
					<td>17:10</td>
					<td>여수</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8967</td>
					<td>16:35</td>
					<td>17:50</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.08.01 ~ 2024.09.30</td>
				</tr>
				<tr>
					<td>OZ8973</td>
					<td>17:50</td>
					<td>19:00</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8985</td>
					<td>18:50</td>
					<td>20:00</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.08.10 ~ 2024.09.30</td>
				</tr>
				<tr>
					<td>OZ8981</td>
					<td>19:30</td>
					<td>20:40</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.09.01 ~ 2024.09.30</td>
				</tr>
				<tr>
					<td>OZ8993</td>
					<td>20:50</td>
					<td>22:00</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>OZ8995</td>
					<td>21:20</td>
					<td>22:30</td>
					<td>제주</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style="font-size: 15px;">2024.03.31 ~ 2024.10.26</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- tableDiv 끝 -->
</div>