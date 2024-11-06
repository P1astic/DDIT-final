




<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no" />
<meta property="og:url" content="https://www.airport.co.kr/gimpo/index.do" />
<meta property="og:title" content="고객의 소리" />
<meta property="og:description" content="고객의 소리 &lt; 고객의 소리 &lt; 고객참여" />
<meta property="og:type" content="website" />
<meta property="og:site_name" content="김포국제공항(국문)"/>
<meta property="og:image" content="/type/common/img/og/gimpo_ogimg.png" />
<!--트위터  -->
<meta property="twiiter:card" content="summary" />
<meta property="twiiter:url" content="https://www.airport.co.kr/gimpo/index.do" />
<meta property="twiiter:title" content="고객의 소리" />
<meta property="twiiter:description" content="고객의 소리 &lt; 고객의 소리 &lt; 고객참여" />
<meta property="twiiter:site_name" content="김포국제공항(국문)"/>
<meta property="twiiter:image" content="/type/common/img/og/gimpo_ogimg.png" />
<title>고객의 소리 &lt; 고객의 소리 &lt; 고객참여 | 김포국제공항(국문)</title>

<link rel="canonical" href="https://www.airport.co.kr/gimpo/index.do" />

<link rel="shortcut icon" href="/type/common/img/common/ico_favicon.ico" />
<link rel="icon" type="image/png" href="/type/common/img/common/ico_favicon.png" sizes="192x192" />

<link rel="stylesheet" type="text/css" href="/type/common/css/common.css?v=2.1" /><!-- reset -->
<link rel="stylesheet" type="text/css" href="/type/common/css/board.css?v=1.1" />
<link rel="stylesheet" type="text/css" href="/type/airportKor/css/layout.css?v=2.1" /><!-- 개별 -->
<link rel="stylesheet" type="text/css" href="/type/common/css/kac.css?v=2.1" />
<link rel="stylesheet" type="text/css" href="/type/common2024/css/kac_n.css?v=1.0" />
<link rel="stylesheet" type="text/css" href="/type/common/css/airport.css?v=1.25" />


<!--[if lt IE 9]>
<script src="../js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript" src="/type/common/js/jquery-2.2.1.min.js?v=1.1"></script>
<script type="text/javascript" src="/type/common/js/jquery.easing.1.3.js?v=1.1"></script>
<script type="text/javascript" src="/type/common/js/jquery.font-accessibility.dev_bvs.js?v=1.1"></script><!-- 폰트줌(제한) -->

<link rel="stylesheet" href="/type/common/css/jquery-ui.css?v=1.1" />
<link rel="stylesheet" href="/type/common/css/jquery-ui.theme.css?v=1.1" />

<link rel="stylesheet" type="text/css" href="/type/common/js/slick/slick.css?v=1.1"/><!-- 슬라이더 -->
<script type="text/javascript" src="/type/common/js/slick/slick.min.js?v=1.1"></script><!-- 슬라이더 -->
<script type="text/javascript" src="/type/common/js/slick/slick.acc.js?v=1.1"></script><!-- 슬라이더 -->

<link rel="stylesheet" type="text/css" href="/type/common/js/mCustomScrollbar/jquery.mCustomScrollbar.css?v=1.1" /><!-- 커스텀스크롤 -->
<script type="text/javascript" src="/type/common/js/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?v=1.1"></script><!-- 커스텀스크롤 -->

<script src="/type/common/js/jquery.form.js?v=1.1"></script>
<script src="/type/common/js/jquery-ui.min.js?v=1.1"></script>
<script src="/type/common/js/comm_fr.js?v=1.3"></script>
<script src="/type/common/js/util.js?v=1.1"></script>
<script src="/type/common/js/jquery.tmpl.js?v=1.1"></script>

<script type="text/javascript" src="/type/common/js/clipboard.min.js?v=1.1"></script>
<script src="/type/admin/js/printThis.js?v=1.1"></script>

<script>
$().ready(function() {
	var clipboard = new ClipboardJS('.urlCopy>button', {
	    text: function() {
		  	return fn_getUrl();
	    }
	});
	clipboard.on('success', function(e) {
		alert("URL이 복사되었습니다.");
	});
	clipboard.on('error', function(e) {
		alert("URL복사에 실패했습니다.");
	}); 

	$("#copyUrl").val(fn_getUrl());
	
	//mailto 처리
	var mailtoSubject = $("meta[property='og:title']").attr("content");
	var mailtoBody = mailtoSubject + "\n\n" + fn_getUrl();
	$("#mailShare").attr("href", 'mailto:?subject='+encodeURIComponent(mailtoSubject)+'&body='+encodeURIComponent(mailtoBody) );
});

  function fn_getUrl(){
	var rtnUrl = ""; 
	var url = decodeURIComponent(location.href);
  	url = decodeURIComponent(url).replace("#","");
  	url = decodeURIComponent(url).replace(";","");
	rtnUrl = url.replace("#;","");
	return rtnUrl;
  }
  
  
  function shareSns(sns){
		var snsTitle = '';
		var snsItems = new Array();
		var winOpt = new Array();	
		var snsUrl = fn_getUrl();
		
		snsItems['facebook'] = "http://www.facebook.com/share.php?u=" + encodeURIComponent(snsUrl);
		snsItems['twitter'] = "https://twitter.com/intent/tweet?text=" + encodeURIComponent(snsTitle + "\n" + snsUrl);
		snsItems['kakao'] = "https://story.kakao.com/share?url="+encodeURIComponent(snsUrl);
		snsItems['blog'] = "http://blog.naver.com/openapi/share?url="+encodeURIComponent(snsUrl)+"&title="+encodeURIComponent(snsTitle);
		snsItems['instagram'] = "https://www.instagram.com/airport.korea/";
		
		winOpt['facebook'] = "width=700, height=500, resizable=yes";
		winOpt['twitter'] = "width=700, height=500, resizable=yes";
		winOpt['kakao'] = "width=500, height=500, resizable=yes";
		winOpt['blog'] = "width=500, height=500, resizeable=yes";
		winOpt['instagram'] = "width=500, height=500, resizeable=yes";
		
		var win = window.open(snsItems[sns], sns, winOpt[sns]);
		if (win) {
	        win.focus();
	    }
	}
</script>

<script>
var gnbDep1 = 0;
var gnbDep2 = 0;
var gnbDep3 = 0;
$(function(){
	
});

function fn_save_opinion(){
	if($('#satisForm input:radio[name=SCO]:checked').length < 1){
		alert('만족도 점수를 선택하세요.');
		return;
	}
	
	if($('#satisForm [name=OPINION]').val().trim() == ''){
		alert('의견을 입력해주세요.');
		return;
	}
	
	if(!confirm('만족도 의견을 등록하시겠습니까?')){
		return;
	}
	
	fn_comm_ajax({
        url : "/gimpo/ajaxf/frSatisSvc/saveSatis.do",
        data : $("#satisForm").serialize(),
        dataType : "json",
        success : function(data) {
        	alert(data.MSG);
        	if(data.RESULT == 1){
        		location.reload();
        	}
        }
    });
	
}
</script>

<script>
function setHref(obj, org){
	if($(obj).find("> div").length > 0){
		if($(obj).find("> div> ul > li").length > 0){
			if($(obj).find(">a").data("sub")=="Y"){
				$(org).find(">a").attr("href",$(obj).find("> div> ul > li:eq(0) > a").attr("href"));
				$(org).find(">a").attr("target",$(obj).find("> div> ul > li:eq(0) > a").attr("target"));
				
				setHref($(obj).find("> div> ul > li:eq(0)"),org);
			}else{
				$(org).find(">a").attr("href",$(org).find(">a").attr("href"));
			}
		}
	}else{
		if($(obj).find("> ul > li").length > 0){
			if($(obj).find(">a").data("sub")=="Y"){
				$(org).find(">a").attr("href",$(obj).find("> ul > li:eq(0) > a").attr("href"));
				$(org).find(">a").attr("target",$(obj).find("> ul > li:eq(0) > a").attr("target"));
				
				setHref($(obj).find("> ul > li:eq(0)"),org);
			}else{
				$(org).find(">a").attr("href",$(org).find(">a").attr("href"));
			}
		}
	}
}

$(function(){
	$(document).on("click", "ul#gnb li, ul#snb li", function(){
		setHref($(this),$(this));
	});
	$(document).on("click", ".btn_topSearch", function(){
		ifrPop('SearchPop','gimpo/cms/FrCon/SearchPop.do');
	});
	
	if($('#gnb li.on').parents('ul').hasClass('menuS')){
		gnbDep1 = $('#gnb > li').index($('#gnb li.on').parents('ul.menuM').parent())+1;
		gnbDep2 = $('#gnb li.on').parents('ul.menuM').find('>li').index($('#gnb li.on').parents('ul.menuS').parent())+1;
		gnbDep3 = $('#gnb li.on').parents('ul.menuS').find('>li').index($('#gnb li.on'))+1;
	}else if($('#gnb li.on').parents('ul').hasClass('menuM')){
		gnbDep1 = $('#gnb > li').index($('#gnb li.on').parents('ul.menuM').parent())+1;
		gnbDep2 = $('#gnb li.on').parents('ul.menuM').find('>li').index($('#gnb li.on'))+1;
	}else{
		gnbDep1 = $('#gnb > li').index($('#gnb li.on'))+1;
	}
	$('.sVisual strong').text($('#gnb li.on > a').text());
	
	//나의예약팝업
	$(document).on('click', '.btn_topReservation', function(){
		var ifrSrc = "/gimpo/cms/frMyReserveCon/myReserveSearchPop.do";
	    //$('<iframe id="iframePop" class="pop_iframe" height="100%" scrolling="no" frameborder="0" title="[팝업] 연결 SITE관리" src="'+ifrSrc+'" onload="showiframe();"></iframe>').insertAfter($('#contents'));
	    $('<iframe id="iframePop" class="pop_iframe on" src="'+ifrSrc+'" title="나의예약 팝업 아이프레임" frameborder="0" style="left: 0;border: 0px currentColor; border-image: none; top: '+$(document).scrollTop()+'px; width: 100%; height: 100%; position: absolute; z-index: 999999;"/>').appendTo($("body #container"));
	    $('#iframePop').load(function(){
	    	LayerPop.draw('#iframePop');
	    });
	});
	
	//GNB - 면세점 하위메뉴 표시 가리기
	$("#gnb li:nth-child(8)").has(function() {
		$("#gnb li:nth-child(8)").removeClass("child");
		$("#heade").css("height", "0");
	});
	
	
	if($(".dutyfree_search, .dutyfreeProduct_view").length > 0) {
		$("#footer .dfs-msg").show();
	} else {
		$("#footer .dfs-msg").hide();
	}
	
// 	$(document).on('click', '.btn_topLogin', function(){
// 		location.href = "/gimpo/cms/login/topUtilLink.do?pRetUrl=" + encodeURIComponent(window.location.pathname + window.location.search);
// 	});
});

</script>
</head>

<body class="typeSub">
	

<div id="skip_menu">
	<a href="#contents">본문 바로가기</a>
	<a href="#header">주메뉴 바로가기</a>
	<a href="#footer">푸터 바로가기</a>
</div>

<div id="dim"></div>

<script>
var autoYn = "N";
var rollTime = "3";
$(function(){
	//20-10-30 재생,정지 기능 추가
	$('.HeadBnrWrap .HeadBnrControll').on('click', function () {
		if ($(this).hasClass('paused')) {
			$('.HeadBnrWrap .Bnr').slick('slickPlay');
			$(this).removeClass('paused').text('정지');
		} else {
			$('.HeadBnrWrap .Bnr').slick('slickPause');
			$(this).addClass('paused').text('재생');
		}
	});
	
	$(".btn_topPopup").on("click", function(e){
        if($("body").hasClass("typeHeadBnr")){
        	$('.Bnr').hide();
        	if($('#fullpage').hasClass('fullpage-wrapper')){
        		$('#fullpage').fullpage.setResponsive(true);	
        	}            
        	$("body").removeClass("typeHeadBnr").removeClass("typeHeadBnrHide");
            $(this).text("팝업열기");
            setCookie("headBnr_Yn","done",1);
            
            $('.HeadBnrWrap .Bnr').slick('slickPause');
        } else{
        	
        	if($('#fullpage').hasClass('fullpage-wrapper')){
        		$('#fullpage').fullpage.setResponsive(true);	
        	}
            $("body").addClass("typeHeadBnr");
            $(this).text("팝업닫기");
            setCookie("headBnr_Yn","done",0);
            
    		if($(".HeadBnrWrap .HeadBnrControll").hasClass('paused')) {
    			$('.HeadBnrWrap .Bnr').slick('slickPause');
    		}else{
    			if(autoYn){
    				$('.HeadBnrWrap .Bnr').slick('slickPlay');    				
    			}
    		}
    		$('.Bnr').show();
        }
    });
	
	$(".HeadBnrClosed").on("click", function(e){
		$('.Bnr').hide();
		$('.HeadBnrWrap .Bnr').slick('slickPause');
        $("body").removeClass("typeHeadBnr").removeClass("typeHeadBnrHide");
        $(".btn_topPopup").text("팝업열기");
        setCookie("headBnr_Yn","done",1);
    });
	
	var isOpenCookie = false;
	
	if(getCookie("headBnr_Yn") != "done"){
		isOpenCookie = true;
   	}else{
		isOpenCookie = false;
   	}
	
	if($(".HeadBnrWrap .Bnr .item").index() != "-1"){
		if(window.innerWidth > 1279){
			$("button.btn_topPopup").show();
		}
		if(isOpenCookie){
			$('body').addClass('typeHeadBnr');
		}
		
		
			autoYn = 'Y';
			rollTime = '5';
		
		if(null == rollTime || '' == rollTime){
			rollTime = '3';
		}
		
		rollTime = rollTime * 1000;
		
		if(autoYn == 'Y'){
			autoYn = true;
		}else{
			autoYn = false;
			$(".HeadBnrControll").hide();
		}
		
	    $('.HeadBnrWrap .Bnr').slick({
	    	autoplay : autoYn,
	    	autoplaySpeed: rollTime,
	        infinite: true,
	        slidesToShow: 2,
	        slidesToScroll: 1,
	        dots: false,
	        arrows: true,
	        responsive: [
	        {
	          breakpoint: 1415,
	          settings: {
	            arrows:false,
	          }
	        },
	        {
	          breakpoint: 1025,
	          settings: {
	            slidesToShow: 1,
	              arrows:false,
	          }
	        }
	      ]
	    });

		if(!isOpenCookie){
			$('.HeadBnrWrap .Bnr').slick('slickPause');
		}
	}else{
		$("button.btn_topPopup").hide();
	}
	
	
	setTimeout(function(){
		$('.HeadBnrWrap .Bnr .item').css("position","relative")
		
	,3000})
});
</script>

<!-- headTop_bnr -->
<div class="HeadBnrWrap">
    <div class="Bnr" style="display: none;">
    	
        <div class="item">
        	
        	
        	
        	
            <a href="http://blog.naver.com/prkac/221598720859" target="_blank" >
                <img src="/ajaxa/fileCpnt/fileView.do?gbn=m03&POPUP_SEQ=11" alt="">
                <b>공항주변지역, <br />드론비행은 금지입니다.</b>
                
                	<span>자세히보기</span>
                
            </a>
        </div>
        
        <div class="item">
        	
        	
        	
        	
            <a href="https://park.airport.co.kr/humandiscount/intro.do" target="_blank" >
                <img src="/ajaxa/fileCpnt/fileView.do?gbn=m03&POPUP_SEQ=16" alt="다자녀가구 주차료 감면">
                <b>다자녀가구 주차료 감면!<br />편리하게 이용하세요</b>
                
                	<span>자세히보기</span>
                
            </a>
        </div>
        
        <div class="item">
        	
        	
        	
        	
            <a href="https://www.airport.co.kr/gimpo/cms/frCon/index.do?MENU_ID=1480" target="_blank" >
                <img src="/ajaxa/fileCpnt/fileView.do?gbn=m03&POPUP_SEQ=30" alt="김포공항 교통약자 이동서비스">
                <b>김포공항 교통약자 이동서비스</b>
                
                	<span>자세히보기</span>
                
            </a>
        </div>
        
        <div class="item">
        	
        	
        	
        	
            <a href="https://www.airport.co.kr/www/cms/frBoardCon/boardView.do?pageNo=1&pagePerCnt=15&MENU_ID=1100&CONTENTS_NO=&SITE_NO=2&BOARD_SEQ=1&BBS_SEQ=3554283&PWD=&SEARCH_FLD=&SEARCH=" target="_blank" >
                <img src="/ajaxa/fileCpnt/fileView.do?gbn=m03&POPUP_SEQ=138" alt="">
                <b>더욱 편리해진 </br> 스마트공항 앱 3.0</b>
                
                	<span>자세히보기</span>
                
            </a>
        </div>
        
        <div class="item">
        	
        	
        	
        	
            <a href="https://www.airport.co.kr/booking/cms/frCon/index.do?MENU_ID=340" target="_blank" >
                <img src="/ajaxa/fileCpnt/fileView.do?gbn=m03&POPUP_SEQ=10" alt="">
                <b>국내선 도착수하물 </br> 짐배송 서비스</b>
                
                	<span>자세히보기</span>
                
            </a>
        </div>
        
        <div class="item">
        	
        	
        	
        	
            <a href="https://www.molit.go.kr/USR/WPGE0201/m_37196/DTL.jsp" target="_blank" >
                <img src="/ajaxa/fileCpnt/fileView.do?gbn=m03&POPUP_SEQ=145" alt="월간 항공 소비자 리포트">
                <b>월간 항공 소비자 리포트</b>
                
                	<span>자세히보기</span>
                
            </a>
        </div>
        
        <div class="item">
        	
        	
        	
        	
            <a href="https://forms.gle/SPXA1uhC26kU119P9" target="_blank" >
                <img src="/ajaxa/fileCpnt/fileView.do?gbn=m03&POPUP_SEQ=105" alt="설문조사 참여하기">
                <b>2024년 홈페이지 이용만족도</br> 설문조사 참여하기</b>
                
                	<span>자세히보기</span>
                
            </a>
        </div>
        
    </div>
    <button class="HeadBnrControll">정지</button>
    <button type="button" class="HeadBnrClosed">팝업닫기</button>
</div>
<!-- //headTop_bnr -->
	

<script>
function setHref(obj, org){
	if($(obj).find("> div").length > 0){
		if($(obj).find("> div> ul > li").length > 0){
			if($(obj).find(">a").data("sub")=="Y"){
				$(org).find(">a").attr("href",$(obj).find("> div> ul > li:eq(0) > a").attr("href"));
				$(org).find(">a").attr("target",$(obj).find("> div> ul > li:eq(0) > a").attr("target"));
				
				setHref($(obj).find("> div> ul > li:eq(0)"),org);
			}else{
				$(org).find(">a").attr("href",$(org).find(">a").attr("href"));
			}
		}
	}else{
		if($(obj).find("> ul > li").length > 0){
			if($(obj).find(">a").data("sub")=="Y"){
				$(org).find(">a").attr("href",$(obj).find("> ul > li:eq(0) > a").attr("href"));
				$(org).find(">a").attr("target",$(obj).find("> ul > li:eq(0) > a").attr("target"));
				
				setHref($(obj).find("> ul > li:eq(0)"),org);
			}else{
				$(org).find(">a").attr("href",$(org).find(">a").attr("href"));
			}
		}
	}
}

$(function(){
	$(document).on("click", "ul#gnb li, ul#snb li", function(){
		setHref($(this),$(this));
	});
	
	$(document).on("click", ".btn_topSearch", function(){
		var ifrSrc = "/search/searchPop.do";
		$('<iframe id="iframeSearchPop" class="pop_iframe on" src="'+ifrSrc+'" title="통합검색 팝업 아이프레임" frameborder="0" style="left: 0;border: 0px currentColor; border-image: none; top: 0px; width: 100%; height: 100%; position: absolute; z-index: 999999;"/>').appendTo($("body #contents"));
		$('#iframeSearchPop').load(function(){
	    	LayerPop.draw('#iframeSearchPop');
	    });
	});
	
	if($('#gnb li.on').parents('ul').hasClass('menuS')){
		gnbDep1 = $('#gnb > li').index($('#gnb li.on').parents('ul.menuM').parent())+1;
		gnbDep2 = $('#gnb li.on').parents('ul.menuM').find('>li').index($('#gnb li.on').parents('ul.menuS').parent())+1;
		gnbDep3 = $('#gnb li.on').parents('ul.menuS').find('>li').index($('#gnb li.on'))+1;
	}else if($('#gnb li.on').parents('ul').hasClass('menuM')){
		gnbDep1 = $('#gnb > li').index($('#gnb li.on').parents('ul.menuM').parent())+1;
		gnbDep2 = $('#gnb li.on').parents('ul.menuM').find('>li').index($('#gnb li.on'))+1;
	}else{
		gnbDep1 = $('#gnb > li').index($('#gnb li.on'))+1;
	}
	$('.sVisual strong').text($('#gnb li.on > a').text());
	
	$(document).on('click', '.btn_Routemap', function(){
		routeMap_click();
	});
	$(document).on('click', '.btn_topLogin', function(){
		location.href = "/gimpo/cms/login/topUtilLink.do?pRetUrl=" + encodeURIComponent(window.location.pathname + window.location.search);
	});
});
function routeMap_click(){
	var ifrSrc = "/gimpo/cms/frRouteMapCon/routeMap.do";
    $('<iframe id="iframePop" class="pop_iframe on" src="'+ifrSrc+'" frameborder="0" title="루트맵 팝업 아이프레임" style="left: 0;border: 0px currentColor; border-image: none; top: 0px; width: 100%; height: 100%; position: absolute; z-index: 999999;"/>').appendTo($("body #container"));
    $('#iframePop').load(function(){
    	LayerPop.draw('#iframePop');
    });
}

function facPop(airportCd){
	var ifrSrc = "/gimpo/cms/frFacCon/facilityPop.do?acd="+airportCd;
    $('<iframe id="iframeFacPop" class="pop_iframe on" src="'+ifrSrc+'" frameborder="0" title="시설안내 팝업 아이프레임" style="left: 0;border: 0px currentColor; border-image: none; top: 0px; width: 100%; height: 100%; position: absolute; z-index: 999999;"/>').appendTo($("body #container"));
    $('#iframeFacPop').load(function(){
    	LayerPop.draw('#iframeFacPop');
    });
}

</script>
<form id="searchPopForm" method="post" action="/search/ko/index.do">
	<input type="hidden" name="pText"/>
</form>
<div id="header">
	<header>
		<h1 class="logo">
			<a href="/gimpo/index.do">
				<img src="/ajaxa/fileCpnt/fileView.do?gbn=x01&SITE_GROUP_NO=3&SITE_NO=4" alt="KAC 한국공항공사 - KOREA AIRPORTS CORPORATION" />
	            <span><img src="/ajaxa/fileCpnt/fileView.do?gbn=x02&SITE_GROUP_NO=3&SITE_NO=4" alt="KAC 한국공항공사 - KOREA AIRPORTS CORPORATION" /></span>
			</a>
		</h1>
		
		<h1 class="mLogo"><!-- 모바일 전용 -->
			<a href="/gimpo/index.do">
				<img src="/ajaxa/fileCpnt/fileView.do?gbn=x02&SITE_GROUP_NO=3&SITE_NO=4" alt="KAC 한국공항공사 - KOREA AIRPORTS CORPORATION" />
	        </a>
		</h1>
		
		<button type="button" class="mBtn_topMenu">MENU</button>
		
		<div id="gnb_dim"></div>
		
		<nav>
			<ul id="gnb">
			
        		<li class="child" >
					<a href="/booking/index.do?rApcd=GMP" title="통합예약  새창 이동" data-sub="N" target="_blank" class="highlight" >통합예약</a>
					
					<ul class="menuM Integrated">
						<li><a href="/booking/cms/frCon/index.do?MENU_ID=80&rDep=GMP" title="새창" target="_blank"><span class="icon1"></span>항공권</a></li>
<li><a href="/booking/cms/frCon/index.do?MENU_ID=100" title="새창" target="_blank"><span class="icon2"></span>주차</a></li>
<li><a href="/booking/cms/frCon/index.do?MENU_ID=110" title="새창" target="_blank"><span class="icon3"></span>렌터카</a></li>
<li><a href="/booking/cms/frCon/index.do?MENU_ID=120" title="새창" target="_blank"><span class="icon4"></span>호텔</a></li>
<li><a href="/booking/cms/frCon/index.do?MENU_ID=130" title="새창" target="_blank"><span class="icon5"></span>여행상품</a></li>
<li><a href="/booking/cms/frCon/index.do?MENU_ID=150" title="새창" target="_blank"><span class="icon6"></span>교통약자</a></li>
<li><a href="/booking/cms/frCon/index.do?MENU_ID=170" title="새창" target="_blank"><span class="icon7"></span>문화공연</a></li>
<li><a href="/booking/cms/frCon/index.do?MENU_ID=360" title="새창" target="_blank"><span class="icon9"></span>면세품</a></li>

					</ul>
					
					
				</li>
			
        		<li class="child" >
					<a href="/gimpo/cms/frCon/index.do?MENU_ID=1000" title="운항정보 현재창  이동" data-sub="Y" target="_self" class="" >운항정보</a>
					
					
					<ul class="menuM">
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1010" title="출발/도착안내 현재창  이동" data-sub="Y" target="_self">출발/도착안내</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1100" title="탑승시뮬레이션 현재창  이동" data-sub="Y" target="_self">탑승시뮬레이션</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1130" title="빠른수속 현재창  이동" data-sub="Y" target="_self">빠른수속</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1210" title="항공기 탑승 현재창  이동" data-sub="Y" target="_self">항공기 탑승</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1240" title="도착시뮬레이션 현재창  이동" data-sub="Y" target="_self">도착시뮬레이션</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1060" title="운항스케줄 현재창  이동" data-sub="Y" target="_self">운항스케줄</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=2500" title="취항항공사 현재창  이동" data-sub="Y" target="_self">취항항공사</a>
						    
						</li>
					
					</ul>
					
				</li>
			
        		<li class="child" >
					<a href="/gimpo/cms/frCon/index.do?MENU_ID=1090" title="교통정보 현재창  이동" data-sub="Y" target="_self" class="" >교통정보</a>
					
					
					<ul class="menuM">
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1290" title="대중교통 현재창  이동" data-sub="Y" target="_self">대중교통</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1930" title="렌터카 현재창  이동" data-sub="Y" target="_self">렌터카</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1360" title="주차안내 현재창  이동" data-sub="Y" target="_self">주차안내</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="https://park.airport.co.kr/humandiscount/intro.do" title="다자녀가구 할인 등록  새창 이동" data-sub="N" target="_blank">다자녀가구 할인 등록</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="https://park.airport.co.kr/refund/privacy.do" title="주차료 사후할인신청  새창 이동" data-sub="N" target="_blank">주차료 사후할인신청</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1280" title="오시는 길 현재창  이동" data-sub="Y" target="_self">오시는 길</a>
						    
						</li>
					
					</ul>
					
				</li>
			
        		<li class="child" >
					<a href="/gimpo/cms/frCon/index.do?MENU_ID=1410" title="시설정보 현재창  이동" data-sub="Y" target="_self" class="" >시설정보</a>
					
					
					<ul class="menuM">
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1420&acd=A1101" title="시설안내 현재창  이동" data-sub="N" target="_self">시설안내</a>
						    
						</li>
					
				   		<li class="child" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1490" title="공항시설 현재창  이동" data-sub="Y" target="_self">공항시설</a>
						    
						    <ul class="menuS">
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1500" title="" target="_self">SGBAC</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1530" title="" target="_self">공항 전망대</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1540" title="" target="_self">유료 대합실</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1550" title="" target="_self">스카이시티</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1570" title="" target="_self">장애인시설</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2490" title="" target="_self">애견센터</a>
								</li>
							
							</ul>
							
						</li>
					
				   		<li class="child" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1430" title="공항이용 가이드 현재창  이동" data-sub="Y" target="_self">공항이용 가이드</a>
						    
						    <ul class="menuS">
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1440" title="" target="_self">임산부 및 영유아 동반</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1450" title="" target="_self">장애인, 고령자 동반</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1460" title="" target="_self">반려동물 동반</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1480" title="" target="_self">교통약자 이동서비스</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2000" title="" target="_self">교통약자 우선수속</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2520" title="" target="_self">보안검색 금지품목</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2530" title="" target="_self">출입국 우선검색대 이용안내</a>
								</li>
							
							</ul>
							
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1580" title="공항시설 전화번호 현재창  이동" data-sub="Y" target="_self">공항시설 전화번호</a>
						    
						</li>
					
					</ul>
					
				</li>
			
        		<li class="child" >
					<a href="/gimpo/cms/frCon/index.do?MENU_ID=1590" title="여행정보 현재창  이동" data-sub="Y" target="_self" class="" >여행정보</a>
					
					
					<ul class="menuM">
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1600" title="여행지 정보 현재창  이동" data-sub="Y" target="_self">여행지 정보</a>
						    
						</li>
					
				   		<li class="child" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1630" title="알짜여행팁 현재창  이동" data-sub="Y" target="_self">알짜여행팁</a>
						    
						    <ul class="menuS">
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2380" title="" target="_self">항공권 소지자 혜택</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2390" title="" target="_self">공항이용 알짜팁</a>
								</li>
							
							</ul>
							
						</li>
					
					</ul>
					
				</li>
			
        		<li class="child" >
					<a href="/gimpo/cms/frCon/index.do?MENU_ID=2010" title="업무지원 현재창  이동" data-sub="Y" target="_self" class="" >업무지원</a>
					
					
					<ul class="menuM">
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=2020" title="공항소개 현재창  이동" data-sub="Y" target="_self">공항소개</a>
						    
						</li>
					
				   		<li class="child" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=2030" title="보호구역출입증 현재창  이동" data-sub="Y" target="_self">보호구역출입증</a>
						    
						    <ul class="menuS">
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2040" title="" target="_self">보호구역출입증 안내</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2050" title="" target="_self">공항별 공지사항</a>
								</li>
							
							</ul>
							
						</li>
					
				   		<li class="child" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=2060" title="공항 시설사용 현재창  이동" data-sub="Y" target="_self">공항 시설사용</a>
						    
						    <ul class="menuS">
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2070" title="" target="_self">공항시설사용료</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2080" title="" target="_self">항공사 사용계약</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2100" title="" target="_self">임대시설 사용안내</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2110" title="" target="_self">이동지역</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2470" title="" target="_self">체육시설 예약</a>
								</li>
							
							</ul>
							
						</li>
					
				   		<li class="child" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=2120" title="안전관리시스템 현재창  이동" data-sub="Y" target="_self">안전관리시스템</a>
						    
						    <ul class="menuS">
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2130" title="" target="_self">개요</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2140" title="" target="_self">안전정책</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2150" title="" target="_self">안전성과지표 관리대상</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2160" title="" target="_self">안전회보</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2170" title="" target="_self">자발적 비밀보고</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2180" title="" target="_self">관련사이트</a>
								</li>
							
							</ul>
							
						</li>
					
				   		<li class="child" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=2190" title="산업안전보건 현재창  이동" data-sub="Y" target="_self">산업안전보건</a>
						    
						    <ul class="menuS">
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2200" title="" target="_self">개요</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2210" title="" target="_self">안전보건방침</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2220" title="" target="_self">안전보건경영시스템</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2230" title="" target="_self">안전관련 법령</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2250" title="" target="_self">작업중지 요청</a>
								</li>
							
							</ul>
							
						</li>
					
				   		<li class="child" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=2260" title="특허이전 현재창  이동" data-sub="Y" target="_self">특허이전</a>
						    
						    <ul class="menuS">
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2270" title="" target="_self">특허 허여</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2280" title="" target="_self">KAC 특허보유현황</a>
								</li>
							
							</ul>
							
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=2290" title="공항소방 구조대 현재창  이동" data-sub="Y" target="_self">공항소방 구조대</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="http://airport.billkorea.co.kr/ebill/index.ac" title="전자고지  새창 이동" data-sub="N" target="_blank">전자고지</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="https://park.airport.co.kr/login/loginUsr.do" title="월정기권 납부  새창 이동" data-sub="N" target="_blank">월정기권 납부</a>
						    
						</li>
					
					</ul>
					
				</li>
			
        		<li class="child" >
					<a href="/gimpo/cms/frCon/index.do?MENU_ID=1720" title="고객참여 현재창  이동" data-sub="Y" target="_self" class="" >고객참여</a>
					
					
					<ul class="menuM">
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1730" title="공지사항 현재창  이동" data-sub="Y" target="_self">공지사항</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1740" title="이벤트 정보 현재창  이동" data-sub="Y" target="_self">이벤트 정보</a>
						    
						</li>
					
				   		<li class="" >
				   			<a href="https://www.lost112.go.kr/find/findList.do?DEP_PLACE=%EA%B9%80%ED%8F%AC%EA%B5%AD%EC%A0%9C%EA%B3%B5%ED%95%AD" title="유실물관리센터  새창 이동" data-sub="N" target="_blank">유실물관리센터</a>
						    
						</li>
					
				   		<li class="child" >
				   			<a href="/gimpo/cms/frCon/index.do?MENU_ID=1790" title="고객의 소리 현재창  이동" data-sub="Y" target="_self">고객의 소리</a>
						    
						    <ul class="menuS">
							
								<li class="on" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1800" title="" target="_self">고객의 소리</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=1810" title="" target="_self">Airport Community</a>
								</li>
							
								<li class="" >
									<a href="/gimpo/cms/frCon/index.do?MENU_ID=2240" title="" target="_self">KAC 안전신문고</a>
								</li>
							
							</ul>
							
						</li>
					
					</ul>
					
				</li>
			
            </ul>
		</nav>
		
		<div class="top_util">
		
		
			
				<a href="/gimpo/cms/mypage/topUtilLink.do" class="btn_topMypage">마이페이지</a>
			
			
			
			<a href="/gimpo/logout.do" class="btn_topLogout">로그아웃</a>
		
			<a href="/gimpo/cms/sitemap/topUtilLink.do" class="btn_topSitemap">사이트맵</a>
		
		
			
			<div class="topLanguage">
				<button type="button" class="btn_topLanguage">KOR</button>
				<div class="listBox">
					<ul>
						<li><a href="/gimpo/cms/ko/changeLang.do" class="on">KOR</a></li>
						<li><a href="/gimpo/cms/en/changeLang.do">ENG</a></li>
					
						<li><a href="/gimpo/cms/cn/changeLang.do">CHN</a></li>
						<li><a href="/gimpo/cms/jn/changeLang.do">JPN</a></li>
					
					</ul>
				</div>
			</div>
			
			<button type="button" class="btn_topPopup">팝업열기</button>
	    </div>
		
		<div class="gnb_util">
			<div class="topAirport">
				<button type="button" class="btn_topAirport">공항이동</button>
				<div class="listBox">
					<ul>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1101" target="_blank" class="on">김포국제공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1105" target="_blank" >울산공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1102" target="_blank" >김해국제공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1108" target="_blank" >광주공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1103" target="_blank" >제주국제공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1109" target="_blank" >여수공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1104" target="_blank" >대구국제공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1110" target="_blank" >포항경주공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1106" target="_blank" >청주국제공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1112" target="_blank" >사천공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1107" target="_blank" >무안국제공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1113" target="_blank" >군산공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1111" target="_blank" >양양국제공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1114" target="_blank" >원주공항</a></li>
					
						<li><a href="/gimpo/cms/ko/changeAirport.do?apcd=A1115" target="_blank" >울릉신공항</a></li>
					
					</ul>
					<button type="button" class="btn_listBox_close">닫기</button>
				</div>
			</div>

			<button type="button" class="btn_topSearch">검색</button>
            <button type="button" class="btn_Routemap"><span>루트맵</span></button>
	    </div>

		<button class="mBtn_close">메뉴 닫기</button>
	</header>
</div>			
<hr />




<script>
$().ready(function() {
	
});

function fn_centerPop(airportCd, type){
	var options = {
		      width:490, 
		      height:800,
		      top:0,
		      resizable:true,
		      scrollbar:true
		    };
	
	var chatbotUrl = "https://chat.airport.co.kr/kacchat/xns.xnsChatbot.do?airport="+airportCd;
	var counselUrl = "https://chat.airport.co.kr/kacchat/xns.xnsChatbot.do?scnr_id=XSNR_CHATCOUNSEL&airport="+airportCd;
	
	if(type == "chatbot"){
		fn_centerPopupOpen(chatbotUrl, options, "chatbot");
	}else{
		fn_centerPopupOpen(counselUrl, options, "counsel");
	}
}

function fn_centerPopupOpen(url, options, windowName) {

	var nagent = navigator.userAgent.toLowerCase(); 
	var features = "channelmode=no, directories=no, fullscreen=no, location=no, menubar=no, status=no, titlebar=no, toolbar=no";
	features += ", width=" + (options.width||200) + ", height=" + (options.height||200);
	features += ", left=" + (!isNaN(options.left) ? options.left : (Math.floor((screen.availWidth - options.width) / 2) + (nagent.indexOf("msie") == -1 ? 0 : screen.availLeft)));  // IE의 경우 사이즈 계산을 못하나 NaN으로 입력시 무시하고 센터로 보내짐.
	features += ", top=" + (!isNaN(options.top) ? options.top : (Math.floor((screen.availHeight - options.height) / 2) + (nagent.indexOf("msie") == -1 ? 0 : screen.availTop)));
	
	features += ", resizable=" + (options.resizable ? "yes" : "no");
	features += ", scrollbars=" + (options.scrollbar ? "yes" : "no");
	
	windowName = (windowName && windowName.replace(/\s/g, "")) || "_blank"; // 공백 제거
	
	var popup = window.open(url, windowName, features);
	
	url = null; windowName = null; features = null; nagent = null;
	
	return popup;
}

</script>

<div class="MainScrollQuickFix">
    <div>
    	
    	
    	<div class="Quick KAC">
    		<i>
    			<img src="/ajaxa/fileCpnt/fileView.do?gbn=m02&TEMP_CODE=airportKor&CONFIG_CD=C1420&CONFIG_SEQ=1&SITE_NO=4" alt="KAC 바로가기"> <!--PC-->
            	<span><img src="/ajaxa/fileCpnt/fileView.do?gbn=m02&TEMP_CODE=airportKor&CONFIG_CD=C1420&CONFIG_SEQ=1&SITE_NO=4&MOBILE_YN=Y" alt="KAC 바로가기"></span> <!--mobile-->
    		</i>
    		<span>KAC 바로가기</span>
            <div class="AddLink">
            
            	<a href="/www/cms/frCon/index.do?MENU_ID=410" target="_blank"
            		title="새창 이동">공사소개</a>
            
            	<a href="/www/cms/frCon/index.do?MENU_ID=550" target="_blank"
            		title="새창 이동">채용정보</a>
            
            	<a href="/www/cms/frCon/index.do?MENU_ID=1250" target="_blank"
            		title="새창 이동">항공통계</a>
            
            	<a href="/www/index.do" target="_blank"
            		title="새창 이동">공사메인</a>
            
            </div>
    	</div>
    	
        
	       	
		    
		        <a href="https://finbot.co.kr/testfint" target="_blank"
		        	title="새창 이동" class="Quick icon1">
		        	<i>	
		            	<img src="/ajaxa/fileCpnt/fileView.do?gbn=m01&TEMP_CODE=airportKor&CONFIG_CD=C1402&CONFIG_SEQ=1&SITE_NO=4&SUB_SEQ=5" alt="AI상담(테스트)"> <!--PC-->
		            	<span><img src="/ajaxa/fileCpnt/fileView.do?gbn=m01&TEMP_CODE=airportKor&CONFIG_CD=C1402&CONFIG_SEQ=1&SITE_NO=4&SUB_SEQ=5&MOBILE_YN=Y" alt="공항챗봇"></span> <!--mobile-->
		            </i>
		        	<span>공항챗봇</span>
		        </a>
		    
		    
		    
		        <a href="javascript:fn_centerPop('gimpo','chatbot');" target="_self"
		        	title="현재창 이동" class="Quick icon1">
		        	<i>	
		            	<img src="/ajaxa/fileCpnt/fileView.do?gbn=m01&TEMP_CODE=airportKor&CONFIG_CD=C1402&CONFIG_SEQ=1&SITE_NO=4&SUB_SEQ=2" alt="챗봇안내"> <!--PC-->
		            	<span><img src="/ajaxa/fileCpnt/fileView.do?gbn=m01&TEMP_CODE=airportKor&CONFIG_CD=C1402&CONFIG_SEQ=1&SITE_NO=4&SUB_SEQ=2&MOBILE_YN=Y" alt="챗봇안내"></span> <!--mobile-->
		            </i>
		        	<span>챗봇안내</span>
		        </a>
		    
		    
		    
		        <a href="javascript:fn_centerPop('gimpo','counsel');" target="_self"
		        	title="현재창 이동" class="Quick icon1">
		        	<i>	
		            	<img src="/ajaxa/fileCpnt/fileView.do?gbn=m01&TEMP_CODE=airportKor&CONFIG_CD=C1402&CONFIG_SEQ=1&SITE_NO=4&SUB_SEQ=1" alt="채팅상담"> <!--PC-->
		            	<span><img src="/ajaxa/fileCpnt/fileView.do?gbn=m01&TEMP_CODE=airportKor&CONFIG_CD=C1402&CONFIG_SEQ=1&SITE_NO=4&SUB_SEQ=1&MOBILE_YN=Y" alt="채팅상담"></span> <!--mobile-->
		            </i>
		        	<span>채팅상담</span>
		        </a>
		    
		    
		    
		        <a href="javascript:routeMap_click();" target="_self"
		        	title="현재창 이동" class="Quick icon1">
		        	<i>	
		            	<img src="/ajaxa/fileCpnt/fileView.do?gbn=m01&TEMP_CODE=airportKor&CONFIG_CD=C1402&CONFIG_SEQ=1&SITE_NO=4&SUB_SEQ=4" alt="루트맵"> <!--PC-->
		            	<span><img src="/ajaxa/fileCpnt/fileView.do?gbn=m01&TEMP_CODE=airportKor&CONFIG_CD=C1402&CONFIG_SEQ=1&SITE_NO=4&SUB_SEQ=4&MOBILE_YN=Y" alt="루트맵"></span> <!--mobile-->
		            </i>
		        	<span>루트맵</span>
		        </a>
		    
		    
	    
    </div>
	<button class="MobilePlus" type="button"><span>QUICK</span><span>MENU</span></button>
	<button class="MobileClose" type="button">닫기</button>
</div>


<script type="text/javascript" src="/type/airportKor/js/layout.js"></script><!-- layout -->

	<!-- container -->
	<div id="container">
		

<script>
$(function(){
	$(".btn_print").bind("click", function(){
		window.print();	
	});
});
</script>
<div class="sVisual" style="background-image:url(/ajaxa/fileCpnt/fileView.do?gbn=X03p&SITE_NO=4&MENU_NO=1720)">
    <div style="background-image:url(/ajaxa/fileCpnt/fileView.do?gbn=X03m&SITE_NO=4&MENU_NO=1720)"></div><!-- mobile 서브비주얼 -->
    <strong></strong>
</div>
<nav id="snb_nav">
    <div class="snb_area">
		<a class="btn_home" href="/gimpo/index.do" title="HOME">HOME</a>
		
		<ul id="snb">
			
          	<li class="child">
				<a href="/booking/index.do?rApcd=GMP" data-menuno="1990" title="통합예약  새창 이동" data-sub="N" target="_blank">통합예약</a>
				
			</li>
     	 	
          	<li class="child">
				<a href="/gimpo/cms/frCon/index.do?MENU_ID=1000" data-menuno="1000" title="운항정보 현재창  이동" data-sub="Y" target="_self">운항정보</a>
				
				<ul>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1010" title="" data-sub="Y" target="_self">출발/도착안내</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1100" title="" data-sub="Y" target="_self">탑승시뮬레이션</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1130" title="" data-sub="Y" target="_self">빠른수속</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1210" title="" data-sub="Y" target="_self">항공기 탑승</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1240" title="" data-sub="Y" target="_self">도착시뮬레이션</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1060" title="" data-sub="Y" target="_self">운항스케줄</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=2500" title="" data-sub="Y" target="_self">취항항공사</a>
				       	
				    </li>
					
				</ul>
				
			</li>
     	 	
          	<li class="child">
				<a href="/gimpo/cms/frCon/index.do?MENU_ID=1090" data-menuno="1090" title="교통정보 현재창  이동" data-sub="Y" target="_self">교통정보</a>
				
				<ul>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1290" title="" data-sub="Y" target="_self">대중교통</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1930" title="" data-sub="Y" target="_self">렌터카</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1360" title="" data-sub="Y" target="_self">주차안내</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="https://park.airport.co.kr/humandiscount/intro.do" title="새창열림" data-sub="N" target="_blank">다자녀가구 할인 등록</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="https://park.airport.co.kr/refund/privacy.do" title="새창열림" data-sub="N" target="_blank">주차료 사후할인신청</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1280" title="" data-sub="Y" target="_self">오시는 길</a>
				       	
				    </li>
					
				</ul>
				
			</li>
     	 	
          	<li class="child">
				<a href="/gimpo/cms/frCon/index.do?MENU_ID=1410" data-menuno="1410" title="시설정보 현재창  이동" data-sub="Y" target="_self">시설정보</a>
				
				<ul>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1420&acd=A1101" title="" data-sub="N" target="_self">시설안내</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1490" title="" data-sub="Y" target="_self">공항시설</a>
				       	
						<ul>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1500" title="" data-sub="Y" target="_self">SGBAC</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1530" title="" data-sub="Y" target="_self">공항 전망대</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1540" title="" data-sub="Y" target="_self">유료 대합실</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1550" title="" data-sub="Y" target="_self">스카이시티</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1570" title="" data-sub="Y" target="_self">장애인시설</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2490" title="" data-sub="Y" target="_self">애견센터</a>
							</li>
							
						</ul>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1430" title="" data-sub="Y" target="_self">공항이용 가이드</a>
				       	
						<ul>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1440" title="" data-sub="Y" target="_self">임산부 및 영유아 동반</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1450" title="" data-sub="Y" target="_self">장애인, 고령자 동반</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1460" title="" data-sub="Y" target="_self">반려동물 동반</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1480" title="" data-sub="Y" target="_self">교통약자 이동서비스</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2000" title="" data-sub="Y" target="_self">교통약자 우선수속</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2520" title="" data-sub="Y" target="_self">보안검색 금지품목</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2530" title="" data-sub="Y" target="_self">출입국 우선검색대 이용안내</a>
							</li>
							
						</ul>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1580" title="" data-sub="Y" target="_self">공항시설 전화번호</a>
				       	
				    </li>
					
				</ul>
				
			</li>
     	 	
          	<li class="child">
				<a href="/gimpo/cms/frCon/index.do?MENU_ID=1590" data-menuno="1590" title="여행정보 현재창  이동" data-sub="Y" target="_self">여행정보</a>
				
				<ul>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1600" title="" data-sub="Y" target="_self">여행지 정보</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1630" title="" data-sub="Y" target="_self">알짜여행팁</a>
				       	
						<ul>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2380" title="" data-sub="Y" target="_self">항공권 소지자 혜택</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2390" title="" data-sub="Y" target="_self">공항이용 알짜팁</a>
							</li>
							
						</ul>
				       	
				    </li>
					
				</ul>
				
			</li>
     	 	
          	<li class="child">
				<a href="/gimpo/cms/frCon/index.do?MENU_ID=2010" data-menuno="2010" title="업무지원 현재창  이동" data-sub="Y" target="_self">업무지원</a>
				
				<ul>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=2020" title="" data-sub="Y" target="_self">공항소개</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=2030" title="" data-sub="Y" target="_self">보호구역출입증</a>
				       	
						<ul>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2040" title="" data-sub="Y" target="_self">보호구역출입증 안내</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2050" title="" data-sub="Y" target="_self">공항별 공지사항</a>
							</li>
							
						</ul>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=2060" title="" data-sub="Y" target="_self">공항 시설사용</a>
				       	
						<ul>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2070" title="" data-sub="Y" target="_self">공항시설사용료</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2080" title="" data-sub="Y" target="_self">항공사 사용계약</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2100" title="" data-sub="Y" target="_self">임대시설 사용안내</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2110" title="" data-sub="Y" target="_self">이동지역</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2470" title="" data-sub="Y" target="_self">체육시설 예약</a>
							</li>
							
						</ul>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=2120" title="" data-sub="Y" target="_self">안전관리시스템</a>
				       	
						<ul>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2130" title="" data-sub="Y" target="_self">개요</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2140" title="" data-sub="Y" target="_self">안전정책</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2150" title="" data-sub="Y" target="_self">안전성과지표 관리대상</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2160" title="" data-sub="Y" target="_self">안전회보</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2170" title="" data-sub="Y" target="_self">자발적 비밀보고</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2180" title="" data-sub="Y" target="_self">관련사이트</a>
							</li>
							
						</ul>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=2190" title="" data-sub="Y" target="_self">산업안전보건</a>
				       	
						<ul>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2200" title="" data-sub="Y" target="_self">개요</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2210" title="" data-sub="Y" target="_self">안전보건방침</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2220" title="" data-sub="Y" target="_self">안전보건경영시스템</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2230" title="" data-sub="Y" target="_self">안전관련 법령</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2250" title="" data-sub="Y" target="_self">작업중지 요청</a>
							</li>
							
						</ul>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=2260" title="" data-sub="Y" target="_self">특허이전</a>
				       	
						<ul>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2270" title="" data-sub="Y" target="_self">특허 허여</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2280" title="" data-sub="Y" target="_self">KAC 특허보유현황</a>
							</li>
							
						</ul>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=2290" title="" data-sub="Y" target="_self">공항소방 구조대</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="http://airport.billkorea.co.kr/ebill/index.ac" title="새창열림" data-sub="N" target="_blank">전자고지</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="https://park.airport.co.kr/login/loginUsr.do" title="새창열림" data-sub="N" target="_blank">월정기권 납부</a>
				       	
				    </li>
					
				</ul>
				
			</li>
     	 	
          	<li class="child">
				<a href="/gimpo/cms/frCon/index.do?MENU_ID=1720" data-menuno="1720" title="고객참여 현재창  이동" data-sub="Y" target="_self">고객참여</a>
				
				<ul>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1730" title="" data-sub="Y" target="_self">공지사항</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1740" title="" data-sub="Y" target="_self">이벤트 정보</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="https://www.lost112.go.kr/find/findList.do?DEP_PLACE=%EA%B9%80%ED%8F%AC%EA%B5%AD%EC%A0%9C%EA%B3%B5%ED%95%AD" title="새창열림" data-sub="N" target="_blank">유실물관리센터</a>
				       	
				    </li>
					
				    <li class="child">
				       	<a href="/gimpo/cms/frCon/index.do?MENU_ID=1790" title="" data-sub="Y" target="_self">고객의 소리</a>
				       	
						<ul>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1800" title="" data-sub="Y" target="_self">고객의 소리</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=1810" title="" data-sub="Y" target="_self">Airport Community</a>
							</li>
							
							<li>
								<a href="/gimpo/cms/frCon/index.do?MENU_ID=2240" title="" data-sub="Y" target="_self">KAC 안전신문고</a>
							</li>
							
						</ul>
				       	
				    </li>
					
				</ul>
				
			</li>
     	 	 
		</ul>
		<span class="btn_snbView"><a href="#none">메뉴 전체</a></span>
		
		
		<div class="snb_util">
			<button type="button" class="btn_print">인쇄</button>
            <button type="button" class="btn_share">공유</button>
            <!-- 공유박스 -->
            <div class="shareBox">
				<ul>
					<li><a href="#" id="mailShare" title="새창"><span class="sns_gmail" ></span>메일</a></li>
					<li><a href="javascript:shareSns('instagram');" title="새창"><span class="sns_instagram"></span>인스타그램</a></li>
					<li><a href="javascript:shareSns('facebook');" title="새창"><span class="sns_facebook"></span>페이스북</a></li>
					<!--li><a href="javascript:shareSns('blog');" title="새창"><span class="sns_nBlog"></span>블로그</a></li>
					<li><a href="javascript:shareSns('twitter');" title="새창"><span class="sns_twitter"></span>트위터</a></li-->
				</ul>
				<div class="urlCopy">
					<input type="text" id="copyUrl" title="페이지 url 주소" readonly/><button type="button">URL복사</button>
				</div>
			</div>
            <!-- //공유박스 -->
            <button type="button" class="btn_top">위로</button>
        </div>
	</div>
</nav>

		
		<div id="contents">
		
			

			
		
			<article>
	            




<script type="text/javascript">
console.log("0");
$(function() {
	$("input:radio[name=scores]").click(function() {
		switch ($(this)[0].id) {
		case "lv1":
		case "lv2":
		case "lv3": $("#cmpln").hide(); $("#scoreCmplnCd option:eq(0)").prop("selected", true); $("#scoreDesc").val(""); break;
		case "lv4":
		case "lv5": $("#cmpln").show(); break;
		}
	});
});

function deleteReq() {
	if(!confirm("삭제하시겠습니까?")) {
        return;
    }
	
	fn_comm_ajax({
	    url : "/gimpo/ajaxf/frVocSvc/deleteReq.do",
	    data : {
	    	"vocSeq": 12250
	    },
	    dataType : "json",
	    success : function(data) {
	    	
	    	alert(data.MSG);
	    	
	    	if(data.RESULT == '1'){
		    	
	    		location.href = "/gimpo/cms/frCon/index.do?MENU_ID=1800&CONTENTS_NO=2&searchKey=&searchVal=&currentPage=1";
	    	}
	    	
	    }
	});
}

function scoreReq() {
	var scoreRadio = document.getElementsByName("scores");
	var checked = false;
	var score = "";
	for (var i = 0; i < scoreRadio.length; i++) {
		if (scoreRadio[i].checked == true) {
			checked = true;
			score = scoreRadio[i].value;
			break;
		}
	}
	
	if (!checked) {
		alert("만족도를 선택해주세요.");
		return;
	}
	
	if (Number(score) <= 25) {
		if ($("#scoreCmplnCd").val() == "") {
			alert("불만족 사유를 선택해주세요.");
			return;
		}
		
		if ($("#scoreDesc").val() == "") {
			alert("불만족 내용을 입력해주세요.");
			return;
		}
	}

	if(!confirm("만족도를 등록하시겠습니까?")) {
        return;
    }
	
	fn_comm_ajax({
	    url : "/gimpo/ajaxf/frVocSvc/scoreReq.do",
	    data : {
	    	"vocSeq": 12250,
	    	"orderNos": "1",
	    	"scores": score,
	    	"scoreCmplnCd": $("#scoreCmplnCd").val(),
	    	"scoreDesc": $("#scoreDesc").val()
	    },
	    dataType : "json",
	    success : function(data) {
	    	
	    	alert(data.MSG);
	    	
	    	if(data.RESULT == '1'){
		    	
	    		location.href = "/gimpo/cms/frVocCon/vocDetail.do?MENU_ID=1800&vocSeq=12250&searchKey=&searchVal=&currentPage=1&vocCd=1&pageType=1";
	    	}
	    	
	    }
	});
}

</script>

<div class="voc-wrap Noto">
	
	
    <div class="board_area">
        <p class="subTit2">김**님의 고객의 소리 입니다.</p>
        <div class="lineList_tbW">
            <table>
            	<caption>제목, 발생지(공항), 등록일, 처리상태, 답변필요여부, 내용, 첨부파일이 표기된 표입니다.</caption>
                <colgroup>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">
                            제목
                        </th>
                        <td colspan="3">
                            d
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">
                            발생지(공항)
                        </th>
                        <td>
							
                            김포공항
                            
							
                        </td>
                        <th scope="row">
                            등록일
                        </th>
                        <td class="Roboto">
                            2024-10-11 12:47:38
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">
                            처리상태
                        </th>
                        <td>
							
                            미접수
                            
							
                        </td>
                        <th scope="row">
                            답변필요여부
                        </th>
                        <td >
                            아니오
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">
                            내용
                        </th>
                        <td colspan="3">
                            <p class="tabTxt1">
                                d
                            </p>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">
                            발생일시
                        </th>
                        <td colspan="3">
                            
                        </td>
                    </tr>

                    <tr class="w_txt">
                        <th scope="row">
                            첨부파일
                        </th>
                        <td colspan="3">
                        	
                        	
                        		
	                        		
	                        		<a href="/gimpo/ajaxf/frVocSvc/fileDownload.do?vocSeq=12250&id=298fed65-6812-4406-9ed3-a2e173dd4765">예약_완료.PNG</a>
                        		
                        	
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
      	
      	
      		
  		
        
        	<!-- 버튼영역 -->
			<div class="tbArea_btn iTem3">
				<a href="javascript:deleteReq();" class="btnC"><span>삭제하기</span></a>
				<a href="/gimpo/cms/frVocCon/vocWrite.do?MENU_ID=1800&vocSeq=12250&vocCd=1&searchKey=&searchVal=&currentPage=1" class="btnC"><span>수정하기</span></a>
				<a href="/gimpo/cms/frCon/index.do?MENU_ID=1800&searchKey=&searchVal=&currentPage=1&CONTENTS_NO=2" class="btnC btnGray"><span>목록으로</span></a>
			</div>
			<!-- //버튼영역 -->
        
        
    </div>
    
    
</div>

			
				
	            
				
					<div class="pageCharge">
						<ul>
							<li><b>담당부서</b> 서비스개발부</li>
							
							<li><b>연락처</b> 02-2660-2443</li>
						</ul>

					</div>
				
					
				
					<div class="pageEval">
						<form id="satisForm" method="post">
							<input type="hidden" name="SITE_NO" value="4"/>
							<input type="hidden" name="MENU_NO" value="1800"/>
							<input type="hidden" name="CONTENTS_NO" value="1"/>
							<p>현재 페이지에서 제공하는 안내 및 정보 제공에 만족하십니까?</p>
							<div class="eval_sel">
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_5" value="5"><label for="pageEval_5">매우 만족</label></span>
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_4" value="4"><label for="pageEval_4">만족</label></span>
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_3" value="3"><label for="pageEval_3">보통</label></span>
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_2" value="2"><label for="pageEval_2">불만</label></span>
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_1" value="1"><label for="pageEval_1">매우 불만</label></span>
							</div>
							<fieldset class="eval_txt">
								<legend>페이지 평가 작성</legend>
								<input type="text" class="inp_t" name="OPINION" title="페이지 평가 입력" />
								<button type="button" onclick="fn_save_opinion();">평가하기</button>
							</fieldset>
						</form>
					</div>
				
				
			</article>
		</div>
		
	</div>
	



<div id="footer" class="typeSelFamily">
	<footer>
	
		<div class="selFamilySite">
			<ul class="family_btn">
			
				<li><button type="button" class="btn_family01" id="familySite1Btn">패밀리사이트</button></li>
			
			</ul>
			
			<!-- 패밀리 팝업 -->
			
				<div class="pop_wrap" id="familySite1">
					<!-- popup layer(레이어) -->
					<section class="popLayout popLayer">
						<h1 class="popTit">패밀리사이트</h1>
			
						<div class="popConts">
						<!-- 팝업 내용 입력-->
							<div class="popInner limit">
								<div class="pop_familySite">
									<ul class="grp01">
										
											
											
												<li><a href="/www/index.do" target="_blank">한국공항공사</a></li>
											
											
											
												<li><a href="/gimpo/index.do" target="_blank">김포국제공항</a></li>
											
											
											
												<li><a href="/gimhae/index.do" target="_blank">김해국제공항</a></li>
											
											
											
												<li><a href="/jeju/index.do" target="_blank">제주국제공항</a></li>
											
											
											
												<li><a href="/daegu/index.do" target="_blank">대구국제공항</a></li>
											
											
											
												<li><a href="/cheongju/index.do" target="_blank">청주국제공항</a></li>
											
											
											
												<li><a href="/muan/index.do" target="_blank">무안국제공항</a></li>
											
											
											
												<li><a href="/yangyang/index.do" target="_blank">양양국제공항</a></li>
											
											
											
												<li><a href="/ulsan/index.do" target="_blank">울산공항</a></li>
											
											
											
												<li><a href="/gwangju/index.do" target="_blank">광주공항</a></li>
											
											
											
												<li><a href="/yeosu/index.do" target="_blank">여수공항</a></li>
											
											
											
												<li><a href="/pohang/index.do" target="_blank">포항경주공항</a></li>
											
											
											
												<li><a href="/sacheon/index.do" target="_blank">사천공항</a></li>
											
											
											
												<li><a href="/gunsan/index.do" target="_blank">군산공항</a></li>
											
											
											
												<li><a href="/wonju/index.do" target="_blank">원주공항</a></li>
											
											
											
												<li><a href="/acc/index.do" target="_blank">항로시설본부</a></li>
											
											
											
												<li><a href="/kcaa/index.do" target="_blank">항공기술훈련원</a></li>
											
											
											
												<li><a href="https://www.airportnoise.kr/anps/main" target="_blank">공항소음포털</a></li>
											
											
											
												<li><a href="http://cafe.daum.net/kamaperson" target="_blank">항우회</a></li>
											
											
											
												<li><a href="/booking/index.do" target="_blank">통합예약</a></li>
											
											
										
									</ul>
								</div>
							</div>
						<!-- //팝업 내용 입력 -->
						</div>
			
						<button type="button" class="btn_popClose">창닫기</button>
					</section>
					<!-- //popup layer(레이어) -->
				</div>
			
		</div>
		
	


		
		
			<ul class="f_menu">
				
					<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=1830" target="_self">개인정보처리방침</a></li>
				
					<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=1940" target="_self">영상정보처리기기 운영관리방침</a></li>
				
					<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=2330" target="_self">서비스 제휴안내</a></li>
				
					<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=1840" target="_self">이메일무단수집거부</a></li>
				
					<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=1850" target="_self">고객서비스헌장</a></li>
						
			</ul>
		
			
		
		<div class="f_util">
			<ul class="f_sns">
				
					<li><a href="https://www.facebook.com/airportkorea" style="background:url(/ajaxa/fileCpnt/fileView.do?gbn=f02&BASIC_SEQ=8&INFO_SEQ=1) no-repeat center;" target="_blank" title='페이스북 새창 이동'>페이스북</a></li>
				
					<li><a href="http://blog.naver.com/prkac" style="background:url(/ajaxa/fileCpnt/fileView.do?gbn=f02&BASIC_SEQ=8&INFO_SEQ=2) no-repeat center;" target="_blank" title='네이버블로그 새창 이동'>네이버블로그</a></li>
				
					<li><a href="https://www.instagram.com/airport.korea/" style="background:url(/ajaxa/fileCpnt/fileView.do?gbn=f02&BASIC_SEQ=8&INFO_SEQ=3) no-repeat center;" target="_blank" title='인스타그램 새창 이동'>인스타그램</a></li>
				
			</ul>
		</div>
		
		
		<p class="tel">한국공항공사 고객센터 1661-2626</p><address><span>07505 서울시 강서구 하늘길 112(공항동)</span></address>
<p class="copyright">&copy; 2020 Korea Airports Corporation. All Rights Reserved.</p>

	</footer>
</div>
<!-- WebLog -->
<script src="/type/common/js/UserScriptConf.js"></script>
<!-- Google Analytics -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-74304977-1', 'auto');
  ga('send', 'pageview');
</script>
</body>
</html>