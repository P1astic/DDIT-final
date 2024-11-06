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
console.log("id : " + id);

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
    	return 'International_flights_' + airLineNm + '_' + thisYear + '_' + thisMonth + '.xlsx';	//파일명
    },
    getSheetName : function(){
        return '국제선';	//시트명
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

function updateOutList() {
	
	let data = {
		"year" : thisYear,
		"month" : thisMonth,
		"day" : thisDay
	}
	
	$.ajax({
		url : "/bp/schedule/updateOutList",
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
	            	str += "<td>" + item.internationalNum + "</td>";
	            	str += "<td>" + item.internationalTime + "</td>";
	            	str += "<td>" + item.city + "</td>";
	            	str += "<td data-title='월'>" + ((item.internationalSun != 'N') ? "<span class='circle' title='월요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='화'>" + ((item.internationalMon != 'N') ? "<span class='circle' title='화요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='수'>" + ((item.internationalTue != 'N') ? "<span class='circle' title='수요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='목'>" + ((item.internationalWed != 'N') ? "<span class='circle' title='목요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='금'>" + ((item.internationalThu != 'N') ? "<span class='circle' title='금요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='토'>" + ((item.internationalFri != 'N') ? "<span class='circle weekend' title='토요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td data-title='일'>" + ((item.internationalSat != 'N') ? "<span class='circle weekend' title='일요일 운항'>운항</span>" : "") + "</td>";
	            	str += "<td style='font-size:15px;'>" + item.internationalStdate + " ~ " + item.internationalEddate + "</td>";
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
			url : "/bp/schedule/getOutList",
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
		            	str += "<td>" + item.internationalNum + "</td>";
		            	str += "<td>" + item.internationalTime + "</td>";
		            	str += "<td>" + item.city + "</td>";
		            	str += "<td data-title='월'>" + ((item.internationalSun != 'N') ? "<span class='circle' title='월요일 운항'>운항</span>" : "") + "</td>";
		            	str += "<td data-title='화'>" + ((item.internationalMon != 'N') ? "<span class='circle' title='화요일 운항'>운항</span>" : "") + "</td>";
		            	str += "<td data-title='수'>" + ((item.internationalTue != 'N') ? "<span class='circle' title='수요일 운항'>운항</span>" : "") + "</td>";
		            	str += "<td data-title='목'>" + ((item.internationalWed != 'N') ? "<span class='circle' title='목요일 운항'>운항</span>" : "") + "</td>";
		            	str += "<td data-title='금'>" + ((item.internationalThu != 'N') ? "<span class='circle' title='금요일 운항'>운항</span>" : "") + "</td>";
		            	str += "<td data-title='토'>" + ((item.internationalFri != 'N') ? "<span class='circle weekend' title='토요일 운항'>운항</span>" : "") + "</td>";
		            	str += "<td data-title='일'>" + ((item.internationalSat != 'N') ? "<span class='circle weekend' title='일요일 운항'>운항</span>" : "") + "</td>";
		            	str += "<td style='font-size:15px;'>" + item.internationalStdate + " ~ " + item.internationalEddate + "</td>";
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
	    updateOutList();
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
	    updateOutList();
	});
})
</script>
<div class="titleHeader">
	<h4>
		<span style="color:#A4A4A4; font-size:20px; font-weight: 600; word-wrap: break-word;">운행 스케쥴 조회  - </span>
		<span style="font-size:20px; font-weight: 600; word-wrap: break-word;">국제선</span>
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
					<th rowspan="2" style="width:10%">목적지</th>
					<th colspan="7" style="width:50%">운항요일</th>
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
					<td>KE2117</td>
					<td>09:00</td>
					<td>오사카/간사이</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.08.01 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2101</td>
					<td>09:00</td>
					<td>도쿄/하네다</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2201</td>
					<td>09:05</td>
					<td>베이징/서우두</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.04.22 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2106</td>
					<td>11:45</td>
					<td>도쿄/하네다</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.03.31 ~ 2024.10.20</td>
				</tr>
				<tr>
					<td>KE2118</td>
					<td>13:50</td>
					<td>오사카/간사이</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.08.01 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2102</td>
					<td>14:50</td>
					<td>도쿄/하네다</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2202</td>
					<td>15:00</td>
					<td>베이징/서우두</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.04.22 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2209</td>
					<td>16:00</td>
					<td>상하이/홍차오</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.04.22 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2103</td>
					<td>16:10</td>
					<td>도쿄/하네다</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.03.31 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2119</td>
					<td>16:30</td>
					<td>오사카/간사이</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.08.01 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2105</td>
					<td>18:40</td>
					<td>도쿄/하네다</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.03.31 ~ 2024.10.19</td>
				</tr>
				<tr>
					<td>KE2120</td>
					<td>21:25</td>
					<td>오사카/간사이</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.08.01 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2210</td>
					<td>21:30</td>
					<td>상하이/홍차오</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.04.22 ~ 2024.10.26</td>
				</tr>
				<tr>
					<td>KE2104</td>
					<td>22:05</td>
					<td>도쿄/하네다</td>
					<td data-title="월"><span class="circle" title="월요일 운항">운항</span></td>
					<td data-title="화"><span class="circle" title="화요일 운항">운항</span></td>
					<td data-title="수"><span class="circle" title="수요일 운항">운항</span></td>
					<td data-title="목"><span class="circle" title="목요일 운항">운항</span></td>
					<td data-title="금"><span class="circle" title="금요일 운항">운항</span></td>
					<td data-title="토"><span class="circle weekend" title="토요일 운항">운항</span></td>
					<td data-title="일"><span class="circle weekend" title="일요일 운항">운항</span></td>
					<td style='font-size:15px;'>2024.03.31 ~ 2024.10.26</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- tableDiv 끝 -->
</div>