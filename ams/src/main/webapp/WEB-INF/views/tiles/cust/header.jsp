<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/cust/airPage2.css">

<script>
$(function(){
	
	//출발/도착안내 클릭시 
	$("#airportFacility").on("click",function(){
		 window.location.href = ' /cust/airportFacility/list';
	});
	
	
		//메뉴에 활성 클래스 추가
		$('ul li').click(function(e) {
			   e.preventDefault();
		    // 클릭한 항목이 .add 클래스인 경우 active 클래스 추가하지 않음
		    if (!$(this).hasClass('add')) {
		        $('li').removeClass('active'); // 모든 li에서 active 클래스 제거
		        $(this).addClass('active'); // 클릭한 li에 active 클래스 추가
		    }
// 			e.preventDefault();
// 			$('li').removeClass('active');
// 			$(this).addClass('active');
		});
		
		
// 		//드롭 다운 메뉴 
// 		// 공항안내
		$(".drop-down").hover(function() {
			$('.mega-menu').addClass('display-on');
		});
		$(".drop-down").mouseleave(function() {
			$('.mega-menu').removeClass('display-on');
		});

		//주차 안내
		$(".d1").hover(function() {
			$('.m1').addClass('display-on');
		});
		$(".d1").mouseleave(function() {
			$('.m1').removeClass('display-on');
		});
		
		//취항 정보 조회	
		$(".d2").hover(function() {
			$('.m2').addClass('display-on');
		});
		$(".d2").mouseleave(function() {
			$('.m2').removeClass('display-on');
		});
		
		//탑승 절차 안내
		$(".d3").hover(function() {
			$('.m3').addClass('display-on');
		});
		$(".d3").mouseleave(function() {
			$('.m3').removeClass('display-on');
		});
		
		//고객 참여
		$(".d4").hover(function() {
			$('.m4').addClass('display-on');
		});
		$(".d4").mouseleave(function() {
			$('.m4').removeClass('display-on');
		});
});
</script>

<div class="container2">

			<!-- 사이트맵 및 한/영 선택-->
		<div class="nav-bar-1">
			<div onclick="window.location='/cust/siteMap/list';" style="cursor:pointer;">사이트맵</div>
		</div>

	<nav class="menu">
		<ul class="uu">
			<li class="add" onclick="window.location='/cust/main';" style="cursor: pointer;">
			<img src="/resources/images/boarding/plane.png" alt="Logo" class="logo"	>
			AMS 김포국제공항</li>


			
			<!-- 공항안내 -->
			<li class="drop-down"><a href="#" class="tt">공항 안내</a>
				<div class="mega-menu fadeIn animated">
					
					
					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span  onclick="window.location.href='/cust/map/route';" style="cursor:pointer;">오시는 길</span>
								
							</ul>
						</span>
					</div>

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
							<span  onclick="window.location='/cust/floorInfo/info';" style="cursor:pointer;" >층별 시설안내</span>
							
							</ul>
						</span>
					</div>
					
					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span  onclick="window.location.href='/cust/airportFacility/list';" style="cursor:pointer;" >공항시설 예약안내</span>
							</ul>
						</span>
					</div>
					
					
				</div>
			</li>
			
			<!-- 주차 안내 -->
			<li class="d1"><a href="#" class="tt">주차 안내</a>
				<div class="m1 fadeIn animated">

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span onclick="window.location.href='/cust/parking/ParkingIinformation';">주차장 정보 조회</span>
							
							</ul>
						</span>
					</div>

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span onclick="window.location.href='/cust/parking/ParkingMoney';" >주차 예약 및 조회</span>
							</ul>
						</span>
					</div>
				
				</div>
			</li>
			
			
			<!-- 취항 정보 조회 -->
			<li class="d2"><a href="#" class="tt">운항 정보</a>
				<div class="m2 fadeIn animated">

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
							<span  onclick="window.location.href='/cust/airplane/arrivalList';" style="cursor:pointer;" >항공 스케줄 조회</span>
							</ul>
						</span>
					</div>
				
				</div>
			</li>


			<!-- 탑승 절차 안내 -->
			<li class="d3"><a href="#" class="tt">탑승 절차 안내</a>
				<div class="m3 fadeIn animated">

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span  onclick="window.location.href='/cust/map/howCheck';" style="cursor:pointer;">탑승 절차 안내</span>
								
							</ul>
						</span>
					</div>
				
				</div>
			</li>

						
			<!-- 고객참여  -->
			<li class="d4"><a href="#" class="tt">고객 참여</a>
				<div class="m4 fadeIn animated">

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
							<span  onclick="window.location.href='/cust/cus/main';" style="cursor:pointer;">고객 소리함</span>
							</ul>
						</span>
					</div>

				</div>
			</li>
	</nav>
</div>
<div id="myDiv">
</div>
<div class="nav-bar" >
	<div class="snb_area">
	 <div class="btn_home" title="HOME"   onclick="window.location='/cust/main';" style="cursor:pointer;">
	 	<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#5f6368"><path d="M240-200h133.85v-201.54q0-15.36 10.39-25.76 10.4-10.39 25.76-10.39h140q15.36 0 25.76 10.39 10.39 10.4 10.39 25.76V-200H720v-353.85q0-3.07-1.35-5.57-1.34-2.5-3.65-4.43L487.31-735q-3.08-2.69-7.31-2.69-4.23 0-7.31 2.69L245-563.85q-2.31 1.93-3.65 4.43-1.35 2.5-1.35 5.57V-200Zm-60 0v-353.85q0-17.17 7.68-32.53 7.69-15.37 21.24-25.31l227.7-171.54q18.95-14.46 43.32-14.46t43.44 14.46l227.7 171.54q13.55 9.94 21.24 25.31 7.68 15.36 7.68 32.53V-200q0 24.54-17.73 42.27Q744.54-140 720-140H562.31q-15.37 0-25.76-10.4-10.4-10.39-10.4-25.76v-201.53h-92.3v201.53q0 15.37-10.4 25.76-10.39 10.4-25.76 10.4H240q-24.54 0-42.27-17.73Q180-175.46 180-200Zm300-269.23Z"/></svg>
	 </div> 
	 
	 <select class="btn_sel">
		 <option value="" >공항안내</option>
		 <option value="" >오시는길</option>
		 <option value="">층별 안내도</option>
		 <option value="">공항 시설 예약</option>
	 </select>
	 
	 
	</div>

</div>


<script>
window.onload = function() {
	  // 현재 URL을 확인
	  const currentUrl = window.location.href;

	  // 특정 URL일 때만 div 숨기기
	  if (currentUrl.includes("/cust/main")) {
	    const myDiv = document.getElementById("myDiv");

	    const navBars = document.getElementsByClassName("nav-bar");

	    // ID가 myDiv인 요소 숨기기
	    if (myDiv) {
	      myDiv.style.display = "none";
	    }

	    // 클래스가 nav-bar인 모든 요소 숨기기
	    for (let i = 0; i < navBars.length; i++) {
	      navBars[i].style.display = "none";
	    }
	  }
	};

</script>







