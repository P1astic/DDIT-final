<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css"
	rel="stylesheet" media="screen" />

<!-- css모음 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/airport.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/board.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/common.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac_n.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/slick.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/parking/boomin.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/parking/commons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/parking/common.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/parking/reset.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/parking/frame1.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/parking/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/parking/jquery.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/parking/select2.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/map/info.css">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${rooot_apiKey}"></script>
<div id="contents">
	<div class="map-wrap Noto">
		<div style="padding-left:400px;">
			<div id="map" style="width: 500px; height:500px;">
			</div>
		</div>
		<div class="TopLineH">
			<div class="item">
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
<!-- 					<p class="subTxt1 weightM"> -->
<!-- 						출발지에서 공항까지 오시는 길에 대한 자세한 정보는 <span class="C_blue weightM">루트맵</span>을통해 -->
<!-- 						확인하시기 바랍니다. -->
<!-- 					</p> -->
<!-- 					<a class="sbtn-mid LinkArrow btn_Routemap" href="#none"><span -->
<!-- 						class="btn_Routemap">루트맵 바로가기</span></a> -->
<!-- 					<div style="margin: 0px 4px; float: left;"> -->
<!-- 						<a title="Kakao 지도로 보시려면 클릭하세요." -->
<!-- 							style="float: left; width: 32px; height: 10px;" -->
<!-- 							href="http://map.kakao.com/" target="_blank"><img -->
<!-- 							style="float: left; width: 32px; height: 10px; border: none;" -->
<!-- 							alt="Kakao 지도로 이동" -->
<!-- 							src="http://t1.daumcdn.net/mapjsapi/images/m_bi_b.png"></a> -->
<!-- 						<div -->
<!-- 							style="font: 11px/11px Arial, Tahoma, Dotum, sans-serif; float: left;">&nbsp;</div> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
</div>
<script>
///resources/images/boarding/plane.png
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(37.558056, 126.795556),
		level : 7
	};

	var map = new kakao.maps.Map(container, options);
	
	var imageSrc = '/resources/images/boarding/plane-marker.png',
		imageSize = new kakao.maps.Size(64, 69),
		imageOption = {offset : new kakao.maps.Point(27, 69)};
	
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		markerPosition = new kakao.maps.LatLng(37.558056, 126.795556);
	
	var marker = new kakao.maps.Marker({
		position: markerPosition,
		image:markerImage,
		clickable: true
	})
	
	var iwContent = '<div style="padding:5px;"><a href="https://place.map.kakao.com/26970621" target="_blank">김포공항</a></div>',
		iwRemoveable = true;
	
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});	
	
	kakao.maps.event.addListener(marker, 'click', function() {
	      // 마커 위에 인포윈도우를 표시합니다
	      infowindow.open(map, marker);  
	});
	
	marker.setMap(map);
	
	
</script>