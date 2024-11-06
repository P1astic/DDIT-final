<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

<head>	
	    <title>주차 요금 안내</title>
    <style>
       /* parking-info.css */
.test {
    line-height: 1.6;
    color: #333;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.tab-menu {
    display: flex;
    border-bottom: 2px solid #1e3a8a;
    margin-bottom: 20px;
}

.tab-button {
    background: none;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.tab-button.active {
    background-color: #1e3a8a;
    color: white;
}

h1, h2 {
    color: #1e3a8a;
    border-bottom: 2px solid #1e3a8a;
    padding-bottom: 10px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
}

th {
    background-color: #f0f4f8;
}

.note {
    background-color: #f0f4f8;
    padding: 10px;
    border-left: 4px solid #1e3a8a;
    margin-bottom: 45px;
}

.parking-area {
    margin-bottom: 60px;
}



.title{
font-size: 35px;
}

 .container1 {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
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
        background-color: white;
    	  text-align: center;
        border-radius: 5px;
        cursor: pointer;
         transition: background-color 0.3s;
    }
    
     .right{
    flex: 1;
        padding: 20px;
        background-color: #007bff;
        color: white;
        text-align: center;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .left:hover {
        background-color: #007bff;
        color: white;
    }



    </style>
</head>
<div class="test">
<div id="contTabFix">
    <ul class="tabList tab02">
        <li><a onclick="location.href='/cust/parking/ParkingIinformation'">주차장</a></li>
        <li><a onclick="location.href='/cust/parking/ParkingMoney'" title="선택됨" class="on">주차요금</a></li> <!-- href를 '#'로 수정 -->
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


    <h1 class="title">주차 요금 안내</h1>

    <div class="note">
        <p>◆ 자동차 종류의 구분은 "자동차관리법" 제3조 및 "자동차관리법 시행규칙" 별표1을 따르되, 자동차 종류별 소형/대형 요금 적용은 아래 표를 따름</p>
    </div>

    <h2 class="title">차량구분</h2>
    <table style="margin-bottom: 35px;">
        <tr>
            <th>구분</th>
            <th>소형</th>
            <th>대형</th>
        </tr>
        <tr>
            <td>승용차</td>
            <td>전차량</td>
            <td>-</td>
        </tr>
        <tr>
            <td>승합차</td>
            <td>15인승 이하</td>
            <td>16인승 이상</td>
        </tr>
        <tr>
            <td>화물차</td>
            <td>최대적재량 1톤, 총 중량 3.5톤 이하</td>
            <td>최대적재량 1톤, 총 중량이 3.5톤 초과</td>
        </tr>
        <tr>
            <td>특수차</td>
            <td>총 중량 3.5톤 이하</td>
            <td>총 중량 3.5톤 초과</td>
        </tr>
    </table>

    <div class="parking-area">
        <h2 class="title">국내선(제1주차장, 제2주차장)</h2>
        <table>
            <tr>
                <th>요금체계</th>
                <th>소형</th>
                <th>대형</th>
                <th>비고</th>
            </tr>
            <tr>
                <td>1일(24시간) 주차시</td>
                <td>
                    <p><strong>월,화,수,목요일</strong></p>
                    <p>기본 30분 : 1,000원</p>
                    <p>매 15분 : 500원 추가</p>
                    <p>24시간 : 20,000원</p>
                    <p><strong>금,토,일요일 및 법정공휴일</strong></p>
                    <p>기본 30분 : 1,000원</p>
                    <p>매 15분 : 500원 추가</p>
                    <p>24시간 : 30,000원</p>
                </td>
                <td>
                    <p>기본 30분 : 1,200원</p>
                    <p>매 10분 : 400원 추가</p>
                    <p>24시간 : 40,000원</p>
                </td>
                <td>
                    <p><strong>월,화,수,목요일</strong></p>
                    <p>10시간(20,000원)</p>
                    <p><strong>금,토,일요일 및 법정공휴일</strong></p>
                    <p>15시간(30,000원)</p>
                </td>
            </tr>
        </table>
    </div>

    <div class="parking-area">
        <h2 class="title">국제선 지하주차장</h2>
        <table>
            <tr>
                <th>요금체계</th>
                <th>소형</th>
                <th>대형</th>
                <th>비고</th>
            </tr>
            <tr>
                <td>1일(24시간) 주차시</td>
                <td>
                    <p>기본 30분 : 1,000원</p>
                    <p>(30분 초과)매 15분당 :500원추가</p>
                    <p><strong>24시간</strong></p>
                    <p>월,화,수,목요일 : 20,000원</p>
                    <p>금,토,일요일 및 법정공휴일 : 30,000원</p>
                </td>
                <td>
                    <p>기본 30분 : 1,200원</p>
                    <p>매 10분 : 400원 추가</p>
                    <p>24시간 : 40,000원</p>
                </td>
                <td></td>
            </tr>
        </table>
    </div>

    <div class="parking-area">
        <h2 class="title">화물청사</h2>
        <table>
            <tr>
                <th>요금체계</th>
                <th>시간단위</th>
                <th>요금</th>
                <th>비고</th>
            </tr>
            <tr>
                <td rowspan="2">소형</td>
                <td>최초 30분</td>
                <td>기본요금 : 1,000원</td>
                <td rowspan="2">
                    <p><strong>월,화,수,목요일</strong></p>
                    <p>6시간(12,000원)</p>
                    <p><strong>금,토,일요일 및 법정공휴일</strong></p>
                    <p>9시간(18,000원)</p>
                </td>
            </tr>
            <tr>
                <td>30분 이후</td>
                <td>매 15분당 500원 추가</td>
            </tr>
            <tr>
                <td rowspan="2">대형</td>
                <td>최초 30분</td>
                <td>기본요금 : 1,200원</td>
                <td rowspan="2">
                    <p><strong>입차시간 기준 1일(24시간)</strong></p>
                    <p>요금 40,000원</p>
                </td>
            </tr>
            <tr>
                <td>30분 이후</td>
                <td>매 10분당 400원 추가</td>
            </tr>
        </table>
    </div>
    </div>
