<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css"
	rel="stylesheet" media="screen" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/map/info.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${rooot_apiKey}"></script>



<div class="routeUtil">
	<div id="info.route.searchBox" class="RouteSearchBox WHITEOUT">
		<div id="info.route.searchBox.list">
			<div class="WaypointBoxView origin" sortid="0"
				style="left: 0px; top: 0px; position: relative;">
				<div class="dragArea">
					<span class="title origin"></span>
				</div>
				<div class="waypointWindow" style="position: relative;">
					<input class="valueBox" readonly="" placeholder="출발지를 입력하세요">
					<form class="WaypointInput HIDDEN">
						<input id="info.route.waypointSuggest.input0" title="검색어 입력"
							class="input" type="text" autocomplete="off"><input
							class="submit" type="submit" value="">
						<blockquote id="info.route.waypointSuggest.input0Suggest"
							class="inputSuggest">
							<div class="suggestBox box_sub" style="display: none;">
								<div class="baseBox bg">
									<div class="list">
										<ul class="suggest_list_target"></ul>
									</div>
								</div>
								<div class="favorite_find HIDDEN">
									<ul class="list_find"></ul>
								</div>
								<div class="search_recent">
									<em class="tit_recent">히스토리</em>
									<ul data-id="wrap" class="list_recent">
										<li class="ms_item"><a href="#" data-id="link" id=""
											class="link_search"> <span
												class="ico_search_history ico_history_place"></span>김포국제공항
												국제선
										</a>
											<button data-id="remove" class="btn_delete"
												aria-describedby="" data-type="place" data-idx="0">
												<span class="ico_search_history ico_delete">삭제</span>
											</button></li>
										<li class="ms_item"><a href="#" data-id="link" id=""
											class="link_search"> <span
												class="ico_search_history ico_history_place"></span>카카오
										</a>
											<button data-id="remove" class="btn_delete"
												aria-describedby="" data-type="place" data-idx="1">
												<span class="ico_search_history ico_delete">삭제</span>
											</button></li>
									</ul>
									<div class="favorite_recent">
										<button data-id="disabled" type="button" class="btn_recentoff">히스토리
											끄기</button>
										<button data-id="clear" type="button" class="btn_deleteall">전체삭제</button>
									</div>
								</div>
							</div>
						</blockquote>
					</form>
				</div>
			</div>
			<div class="WaypointBoxView dest" sortid="1"
				style="left: 0px; top: 0px; position: relative;">
				<div class="dragArea">
					<span class="title dest"></span>
				</div>
				<div class="waypointWindow" style="position: relative;">
					<input class="valueBox valueBox-ACTIVE" readonly=""
						placeholder="도착지를 입력하세요">
					<form class="WaypointInput HIDDEN">
						<input id="info.route.waypointSuggest.input1" title="검색어 입력"
							class="input" type="text" autocomplete="off"><input
							class="submit" type="submit" value="">
						<blockquote id="info.route.waypointSuggest.input1Suggest"
							class="inputSuggest">
							<div class="suggestBox box_sub" style="display: none;">
								<div class="baseBox bg" style="display: block;">
									<div class="list">
										<ul class="suggest_list_target">
											<li class="ms_item"><a href="#"><strong
													class="emph_keyword">김포국제공항 국제선</strong></a></li>
										</ul>
									</div>
								</div>
								<div class="favorite_find HIDDEN">
									<ul class="list_find"></ul>
								</div>
								<div class="search_recent">
									<em class="tit_recent">히스토리</em>
									<ul data-id="wrap" class="list_recent">
										<li class="ms_item"><a href="#" data-id="link" id=""
											class="link_search"> <span
												class="ico_search_history ico_history_place"></span>김포국제공항
												국제선
										</a>
											<button data-id="remove" class="btn_delete"
												aria-describedby="" data-type="place" data-idx="0">
												<span class="ico_search_history ico_delete">삭제</span>
											</button></li>
									</ul>
									<div class="favorite_recent">
										<button data-id="disabled" type="button" class="btn_recentoff">히스토리
											끄기</button>
										<button data-id="clear" type="button" class="btn_deleteall">전체삭제</button>
									</div>
								</div>
							</div>
						</blockquote>
					</form>
				</div>
			</div>
		</div>
		<a href="#none" id="info.route.searchBox.toggleVia"
			class="btn_roadsearch toggleVia">경유지 추가</a> <a href="#none"
			id="info.route.searchBox.change" class="btn_roadsearch routechange"
			title="출발/도착 순서 바꾸기">출발/도착 순서 바꾸기</a> <a href="#none"
			id="info.route.searchBox.clearVia" class="btn_roadsearch clearVia"
			title="모두 지우기">모두 지우기</a>
	</div>
	<div id="info.flagsearch.method" class="routeMethod">
		<div class="RouteMethodTabView">
			<a id="cartab" data-id="car" class="car" href="#"></a> <a
				id="transittab" data-id="transit" class="transit" href="#"></a> <a
				id="walktab" data-id="walk" class="walk" href="#"></a> <a
				id="biketab" data-id="bike" class="bike" href="#"></a>
		</div>
	</div>
</div>
<!-- <div class="map" id="googleMap"></div> -->
<div id="map" style="width: 500px; height: 400px;"></div>



<div class="TopLineH">



	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.558714638491985,
					126.8027869125177),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>

	<div class="item">
		<div id="map" style="width: 500px; height: 400px;"></div>
		<p class="subTit4">주소</p>
		<div class="NONONO">
			<p class="subTxt1">대전광역시 동구 대덕로111</p>
		</div>
	</div>
	<div class="item">
		<p class="subTit4">대표전화</p>
		<div class="NONONO">
			<p class="subTxt1">
				공항종합안내(자동음성안내) <a href="tel:1661-2626">1661-2626</a>
			</p>
		</div>
	</div>
	<div class="item">
		<p class="subTit4">오시는길</p>
		<div class="NONONO">
			<dl class="sdl-RL">
				<dt class="subTxt1 mT5">대전IC 방면</dt>
				<dd class="subTxt1">지하차도 앞에서 우측방향으로 진입 후 좌회전하여 공항으로 진입</dd>
				<dt class="subTxt1">서대전역 방면</dt>
				<dd class="subTxt1">공항도로 직진 후, 공항으로 진입</dd>
				<dt class="subTxt1">청주 방면</dt>
				<dd class="subTxt1">6번 국도를 지나 대한항공 앞 사거리에서 좌회전 후, 회물청사를 경유하여
					공항으로 진입</dd>
			</dl>
			<p class="subTxt1 weightM">
				출발지에서 공항까지 오시는 길에 대한 자세한 정보는 <span class="C_blue weightM">루트맵</span>을통해
				확인하시기 바랍니다.
			</p>
			<a class="sbtn-mid LinkArrow btn_Routemap" href="#none"><span
				class="btn_Routemap">루트맵 바로가기</span></a>
			<div style="margin: 0px 4px; float: left;">
				<a title="Kakao 지도로 보시려면 클릭하세요."
					style="float: left; width: 32px; height: 10px;"
					href="http://map.kakao.com/" target="_blank"><img
					style="float: left; width: 32px; height: 10px; border: none;"
					alt="Kakao 지도로 이동"
					src="http://t1.daumcdn.net/mapjsapi/images/m_bi_b.png"></a>
				<div
					style="font: 11px/11px Arial, Tahoma, Dotum, sans-serif; float: left;">&nbsp;</div>
			</div>
		</div>
	</div>
</div>

<!-- <script> -->
// function myMap() { // var mapOptions = { // center : new
google.maps.LatLng(36.72192014217427, // 127.49595873743439), // //
center : new google.maps.LatLng(37.5586545, 126.7944739), // zoom : 20
// }; // var map = new
google.maps.Map(document.getElementById("googleMap"), // mapOptions); //
}
<!-- </script> -->

