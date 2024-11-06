<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/xml2json.js" />"></script>

<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/common.css" />
<!-- reset -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/board.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/layout.css" />
<!-- 개별 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac_n.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/airport.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/cusMain.css" />

<!-- 주차장 및 주차요금 섹션 -->
<style>





    /* 배경을 흰색으로 설정 */
   
    .container1 {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .form-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
    }
    .form-group {
        flex: 1;
        margin-right: 10px;
    }
    .form-group:last-child {
        margin-right: 0;
    }
    label {
        display: block;
        margin-bottom: 5px;
    }
    select, input {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }
    button {
        background-color: #b91c1c;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 10px; /* 버튼과 폼 간 간격 조정 */
    }
    .button-group {
        display: flex;
        border: 1px solid #ddd;
        border-radius: 4px;
        overflow: hidden;
    }
    .select-button {
        flex: 1;
        padding: 10px;
        background-color: #f8f8f8;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
        color: #333;
    }
    .select-button:not(:last-child) {
        border-right: 1px solid #ddd;
    }
    .select-button.active {
        background-color: #007bff; /* 파란색 배경 */
        color: white; /* 흰색 글자 */
    }

    /* 결과 컨테이너 스타일 추가 */
    #resultContainer {
        background-color: #f8f8f8;
        padding: 15px;
        border-radius: 5px;
        border: 1px solid #ddd;
        margin-top: 20px; /* 결과 컨테이너와 폼 간 간격 조정 */
    }

    /* 새로운 스타일: select 요소 옆에 화살표 추가 */
    .styled-select {
        appearance: none;
        -moz-appearance: none;
        -webkit-appearance: none;
        background: url('data:image/svg+xml;charset=US-ASCII,<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path d="M6 9L0 3h12L6 9z" fill="%23666"/></svg>') no-repeat right 10px center;
        background-color: white;
        background-size: 12px;
    }

    /* 주차장 및 주차요금 버튼 스타일 */
    .container1 {
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
    }
    .left {
        flex: 1;
        padding: 20px;
        background-color: #007bff;
        color: white;
        text-align: center;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
     .right{
    flex: 1;
        padding: 20px;
        background-color: white;
    	  text-align: center;
        border-radius: 5px;
        cursor: pointer;
         transition: background-color 0.3s;
    }
    .right:hover {
        background-color: #007bff;
        color: white;
    }
      .congestion-level {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }
        .color-box {
            width: 20px;  /* 색상 표시 박스의 너비 */
            height: 20px; /* 색상 표시 박스의 높이 */
            margin-right: 10px; /* 색상과 설명 사이의 여백 */
        }
        
        .test {
    line-height: 1.6;
    color: #333;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}
    
</style>
<script type="text/javascript">
window.onload = function() {
    var total = 0;
	var color = "";
    $.ajax({
        url: "/cust/parking/api",
        type: "GET",
        dataType: "json",
        success: function(data) {
            console.log(data); // 데이터 확인
			
            
            // 그래프 생성 반복
            for (var i = 0; i < data.length; i++) {
            	
            	var value = (data[i].parkingOccupiedSpace / data[i].parkingTotalSpace) *100;
            	
            	
            	if (value < 50) {
            	    color = '#d3d3d3';  // 회색 (50% 미만)
            	} else if (value >= 50 && value < 70) {
            	    color = '#fffaa1';  // 노랑 (50%~70%)
            	} else if (value >= 70 && value < 99) {
            	    color = '#ff7f50';  // 주황 (70%~90%)
            	} else {
            	    color = '#ff4d4d';  // 빨강 (90% 이상)
            	}
              
            	
                // 주차장 이름 설정
                var label = ''; // 각 주차장 이름을 저장할 변수
                switch (i) {
                    case 0:
                        label = '국내선 제1주차장';
                        break;
                    case 1:
                        label = '국내선 제2주차장';
                        break;
                    case 2:
                        label = '국제선 주차빌딩 ';
                        break;
                    case 3:
                        label = '국제선 지하        ';
                        break;
                    case 4:
                        label = '화물청사            ';
                        break;
                }
                
                // 총 주차 공간
                total = data[i].parkingTotalSpace; 
                console.log(total);
                
                // 그래프를 그릴 canvas 요소 가져오기
                var canvasId = 'myChart' + i; // canvas ID
                var canvas = document.getElementById(canvasId);
                
                if (canvas) { // canvas 요소가 존재하는 경우
                    const ctx = canvas.getContext('2d'); // ctx 정의
                    // Chart.js 그래프 생성
                    new Chart(ctx, {
                        type: 'bar',  // 가로 막대 그래프
                        data: {
                            labels: [label],  // 각 그래프의 레이블 (주차장 이름)
                            datasets: [{
                                axis: 'y',
                                fill: false,
                                label: '현재 주차 수',  // 그래프 제목
                                data: [data[i].parkingOccupiedSpace],  // 주차 공간 데이터
                                backgroundColor: color,  // 배경색
                                borderColor: color,  // 테두리 색상
                                borderWidth: 1
                            }]
                        },
                        options: {
                        	responsive:true,
                            maintainAspectRatio: false,  // 비율 유지하지 않음
                            indexAxis: 'y',  // Y축을 가로로 설정
                            scales: {
                                x: {
                                    beginAtZero: true,  // 시작을 0으로 설정
                                    max: total,
                                    ticks: {
                                        callback: function(value) {
                                            return Math.floor(value); // 소수점을 없애기 위해 내림 처리
                                        }
                                    }
                                },
                                y: {
                                    beginAtZero: true,
                                    ticks: {
                                        font: {
                                            size: 20 // 주차장 이름 글자 크기 설정
                                        }
                                    }
                                }
                            }
                        }
                    });
                } else {
                    console.error("Canvas element with ID " + canvasId + " not found.");
                }
            }
        },
        error: function(xhr, status, error) {
            console.error("API 호출 실패:", error);
            $("#result").html("<p>데이터를 불러오는 중 오류가 발생했습니다.</p>");
        }
    });
}
</script>


<div class="test" style="margin-bottom:15px;">

<div id="contTabFix">
    <ul class="tabList tab02">
        <li><a onclick="location.href='/cust/parking/ParkingIinformation'" title="선택됨" class="on">주차장</a></li>
        <li><a onclick="location.href='/cust/parking/ParkingMoney'">주차요금</a></li> <!-- href를 '#'로 수정 -->
    </ul>
</div>

<!-- <div class="container1" style="margin: 20px;"> -->
<!--     <div class="left" onclick="location.href='/cust/parking/ParkingIinformation';" style="cursor: pointer;"> -->
<!--         <p style=" font-size: 1.3rem; text-align: center;">주차장</p> -->
<!--     </div> -->
<!--     <div class="right" id="rightContent" onclick="location.href='/cust/parking/ParkingMoney';" style="cursor: pointer;"> -->
<!--         <p style="font-size: 1.3rem; text-align: center;">주차요금</p> 글자색 제거 -->
<!--     </div> -->
<!-- </div> -->

<!-- 주차장 안내 제목 및 설명 -->
<div>
    <h1 style="font-size: 30px; margin: 30px;">주차장 안내</h1>
    <p style="font-size: 20px; color: #333;  margin-left:24px; width:70%; font-weight: bold;">
        김포공항 내의 유료주차장은 총 4개소로서 6,000여대의 동시 주차 수용 능력을 갖추고 있습니다.<br>
        이용객 여러분께서는 이용하시기 편리한 주차장을 이용하시길 바랍니다.
    </p>
</div>

<br>
<div style="text-align: center;">
    <img alt="공항 주차장 " src="/resources/images/parking_gimpo_New.png">
</div>
<br>

<h1 style="font-size: 30px; margin: 30px; text-align: center;">이용안내</h1>

<table border="1" style="width: 100%; text-align: center; border-collapse: collapse; border: 1px solid black;">
    <thead style="background-color: #f9f9f9;">
	<a style="font-size: 18px; color: red;">위치별 및 차종에 따라 요금이 상이하니 주차요금페이지에서 확인하세요</a>
        <tr>
            <th style="padding: 10px; border: 1px solid black;">요금체계</th>
            <th style="padding: 10px; border: 1px solid black;">소형</th>
            <th style="padding: 10px; border: 1px solid black;">대형</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="padding: 20px; border: 1px solid black;">1일(24시간) 주차 시</td>
            <td style="padding: 20px; text-align: left; border: 1px solid black;">
                월,화,수,목요일<br>
                • 기본 30분: 1,000원<br>
                • 매 15분: 500원 추가<br>
                • 24시간: 20,000원<br><br>
                금,토,일요일 및 법정공휴일<br>
                • 기본 30분: 1,000원<br>
                • 매 15분: 500원 추가<br>
                • 24시간: 30,000원
            </td>
            <td style="padding: 20px; text-align: left; border: 1px solid black;">
                • 기본 30분: 1,200원<br>
                • 매 10분: 400원 추가<br>
                • 24시간: 40,000원
            </td>
        </tr>
        <tr>
            <td style="padding: 20px; border: 1px solid black;">1일 추가 주차 시</td>
            <td style="padding: 20px; border: 1px solid black;">상기 요금 반복 적용</td>
            <td style="padding: 20px; border: 1px solid black;">상기 요금 반복 적용</td>
        </tr>
    </tbody>
</table>
<br>
<h1 style="font-size: 30px; margin: 30px; text-align: center;" id="targetDiv">주차 현황</h1>
<div style="font-size: 20px; display: flex; justify-content: space-around; align-items: center; margin-top: 20px;">
    <div class="congestion-level" style="display: flex; align-items: center;">
        <div class="color-box" style="background-color: #d3d3d3;"></div>
        <div>주차 가능 (50% 미만)</div>
    </div>
    <div class="congestion-level" style="display: flex; align-items: center;">
        <div class="color-box" style="background-color: #fffaa1;"></div>
        <div>여유 있음 (50%~70%)</div>
    </div>
    <div class="congestion-level" style="display: flex; align-items: center;">
        <div class="color-box" style="background-color: #ff7f50;"></div>
        <div>다소 혼잡 (70%~90%)</div>
    </div>
    <div class="congestion-level" style="display: flex; align-items: center;">
        <div class="color-box" style="background-color: #ff4d4d;"></div>
        <div>매우 혼잡 (90% 이상)</div>
    </div>
</div>

<div style="width: 100%; height: 100%">
    <canvas id="myChart0"></canvas>
</div>
	<div style="width: 100%; height: 100%">
	    <canvas id="myChart1"></canvas>
	</div>
	<div style="width: 100%; height: 100%">
	    <canvas id="myChart2"></canvas>
	</div>
	<div style="width: 100%; height: 100%">
	    <canvas id="myChart3"></canvas>
	</div>
	<div style="width: 100%; height: 100%; margin-bottom:20px;">
	    <canvas id="myChart4"></canvas>
	</div>
</div>

