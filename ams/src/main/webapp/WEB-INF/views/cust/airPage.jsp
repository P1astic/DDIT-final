<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/cust/airPage2.css">
<!-- <link rel="stylesheet" href="/resources/css/cust/airPage.css"> -->

<script>
$(function(){
		//메뉴에 활성 클래스 추가
		$('ul li').click(function(e) {
			e.preventDefault();
			$('li').removeClass('active');
			$(this).addClass('active');
		});
		
		//드롭 다운 메뉴 
		// 공항안내
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
	<nav class="menu">
		<ul>
			<li class="active"><a href="#">Home</a></li>
			
			<!-- 공항안내 -->
			<li class="drop-down"><a href="#">공항 안내</a>
				<div class="mega-menu fadeIn animated">
					
					
					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>오시는 길</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>시설 안내</span>
								<li>층별 시설도</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>시설 안내</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>
				
				</div>
			</li>
			
			<!-- 주차 안내 -->
			<li class="d1"><a href="#">주차 안내</a>
				<div class="m1 fadeIn animated">

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>주자 예약</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>시설 안내</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>
				
				</div>
			</li>
			
			
			<!-- 취항 정보 조회 -->
			<li class="d2"><a href="#">취항 정보 조회</a>
				<div class="m2 fadeIn animated">

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>주자 예약</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>시설 안내</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>
				
				</div>
			</li>


			<!-- 탑승 절차 안내 -->
			<li class="d3"><a href="#">탑승 절차 안내</a>
				<div class="m3 fadeIn animated">

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>주자 예약</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>시설 안내</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>
				
				</div>
			</li>

						
			<!-- 고객참여  -->
			<li class="d4"><a href="#">고객 참여</a>
				<div class="m4 fadeIn animated">

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>주자 예약</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>

					<div class="mm-3column">
						<span class="categories-list">
							<ul>
								<span>시설 안내</span>
								<li>층별 시설도</li>
								<li>Plasma TVs</li>
								<li>3D TVs</li>
								<li>DVD & Blu-ray Players</li>
								<li>Home Theater Systems</li>
								<li>Cell Phones</li>
								<li>Apple iPhone</li>
								<li><a class="mm-view-more" href="#">View more →</a></li>
							</ul>
						</span>
					</div>
				
				</div>
			</li>
	</nav>
</div>



