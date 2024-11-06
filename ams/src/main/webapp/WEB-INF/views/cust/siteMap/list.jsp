<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<div id="container">
<div id="title">AMS 전체 메뉴 사이트맵</div>
	<div id="content">
	
		<div class="a">
			<div class="menu">
				<div class="title">공항 안내</div>
				<div class="li" onclick="window.location.href='/cust/map/rooot';">오시는길</div>
				<div class="li" onclick="window.location='https://example.com';">층별 시설도</div>
				<div class="li" onclick="window.location.href='/cust/airportFacility/list';" >공항시설 예약 및 조회</div>
			</div>
			
			<div class="menu">
				<div class="title">탑승 절차안내 </div>
				<div class="li" onclick="window.location.href='/cust/map/howCheck';">탑승 절차 안내</div>
				<div class="li" onclick="window.location.href='/cust/map/howCheck';">탑승장 이용상태 조회</div>
			</div>
	    </div>
	    
		<div class="a">
			<div class="menu">
				<div class="title">주차 안내</div>
				<div class="li"  onclick="window.location.href='/cust/map/howCheck';">주차장 정보 조회</div>
				<div class="li"  onclick="window.location.href='/cust/map/howCheck';">실시간 주차 현황</div>
				<div class="li"  onclick="window.location.href='/cust/map/howCheck';">주차 예약 및 조회</div>
			</div>
			<div class="menu">
				<div class="title" >취항정보조회</div>
				<div class="li"  onclick="window.location.href='/cust/airplane/arrivalList';">항공 스케줄</div>
			</div>
		</div>
		
		<div class="a">
			<div class="menu">
				<div class="title">고객참여 </div>
				<div class="li"  onclick="window.location.href='/cust/cus/main2';">고객 소리함</div>
			</div>
			<div class="menu">
				<div class="title"></div>
				<div class="li"></div>
			</div>
		</div>
		
	</div>
</div>
<style>
#container{
	display:flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 34px 100px;
	    height: 785px;
}
#title{
font-weight: 800;
    font-size: 42px;
    padding-bottom: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #2B3A46;
    width: 100%;
    border-top: 1px solid #2B3A46;
    padding-top: 90px;
}
#content{
/* 	border: 1px solid black; */
	width: 100%;
	display: flex;
	padding: 10px;
	justify-content: space-around;
    gap: 60px;
}
.title{
	font-size: 28px;
	font-weight: 500; 
	text-decoration: underline;
}
.a{
	display: flex;
	flex-direction: column;
    gap: 76px;
}
.li{
font-size: 18px; 
cursor: pointer;
}
.li:hover {
    text-decoration: underline;
}
.menu{
display: flex;
flex-direction: column;
gap: 10px;
}

</style>