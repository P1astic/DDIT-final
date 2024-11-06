<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
   	














<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" >
	<title>전국공항 주차홈페이지</title>
	<meta name="title"       content="">
	<meta name="description" content="">
	<meta name="url"         content="https://">
	<meta name="google-site-verification" content="R6zkFn5TDtITiXfw1eoMyu-fvqK9EuSWTwhynnFQMws" />
	
	<link rel="icon" type="image/png" sizes="16x16" href="/resources/img/common/favicon.png">

	<!-- iOS,Android웹앱 전체 화면 설정 -->
	<meta name="apple-mobile-web-app-status-bar-style" content="#7e508a">
	<meta name="apple-mobile-web-app-capable"          content="yes">
	<meta name="mobile-web-app-capable"                content="yes">
	
	<!-- 신규추가 -->
	<meta name="format-detection"                      content="telephone=no">

	<!-- Open Graph  -->
	<meta property="og:type"        content="website" />
	<meta property="og:title"       content="">
	<meta property="og:description" content="전국공항 주차 예약">
	<meta property="og:url"         content="http://">
	<meta property="og:image"       content="https://">

	<!-- iNerv Works Custom -->
	
<!-- Fonts -->
<link rel="stylesheet" href="/resources/font/NotoSans/style.css">

<!-- External Style -->
<link rel="stylesheet" type="text/css" href="/resources/js/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/js/datetimepicker/bootstrap-datetimepicker.min.css">

<!-- Style -->


<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/js/owlcarousel/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/select2.css">



<link rel="stylesheet" type="text/css" href="/resources/css/development.css">
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/resources/css/datepicker/jquery.datetimepicker.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/swiper/swiper.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" integrity="sha512-yVvxUQV0QESBt1SyZbNJMAwyKvFTLMyXSyBHDO4BG5t7k/Lw34tyqlSDlKIrIENIzCl+RVUNjmCPG+V/GMesRw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


	
		<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	
	



	



<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="tempTomatoReActInfo" aria-hidden="true" style="z-index:1080">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">안내</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="info-txt mt15" id="deleteMassage"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="tpms-btn add" data-dismiss="modal" id="deleteOk">확인</button>
				<button type="button" class="tpms-btn default" class="close" data-dismiss="modal" aria-label="Close">취소</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="fileDelete" tabindex="-1" role="dialog" aria-labelledby="tempTomatoReActInfo" aria-hidden="true" style="z-index:1080">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">안내</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="info-txt mt15" id="fileDeleteMassage"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="tpms-btn add" data-dismiss="modal" id="fileDeleteOk">확인</button>
				<button type="button" class="tpms-btn default" class="close" data-dismiss="modal" aria-label="Close">취소</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="flashMessage" tabindex="-1" role="dialog" aria-labelledby="tempTomatoReActInfo" aria-hidden="true" style="z-index:9999">
	<div class="alert" role="document">
		<!--alertPd-->
		<div class="alertPd type01">
			<p id="alertMassage"></p>
			<!--btnArea-->
			<div class="btnArea">
				<button type="button" class="button dkBlue" id="flashMessageClose" data-dismiss="modal" aria-label="Close">확인</button>
			</div>
			<!--//btnArea-->
			<button type="button" class="button btnClose"  data-dismiss="modal" aria-label="Close"><span class="hidden">닫기</span></button>
		</div>
		<!--//alertPd-->
	</div>
</div>

<div class="modal fade" id="flashMessageNice" tabindex="-1" role="dialog" aria-labelledby="tempTomatoReActInfo" aria-hidden="true" style="z-index:9999">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">안내</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="info-txt mt15" id="alertflashMessageNice"></p>
			</div>
			<div class="modal-footer">
				<button type="button" id="flashMessageNiceClose" class="tpms-btn add" data-dismiss="modal" aria-label="Close">확인</button>
			</div>
		</div>
	</div>
</div>
	
<div class="modal fade" id="loginAlert" tabindex="-1" role="dialog" aria-labelledby="loginAlert" aria-hidden="true" style="z-index:1080">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">안내</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p id="loginMessage" class="info-txt center mt25"></p>
			</div>
			<div class="modal-footer">
				<button type="button" onclick="location.href='/login/loginUsr.do'" class="tpms-btn add" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-labelledby="tempTomatoReActInfo" aria-hidden="true" style="z-index:1080">
	<div class="alert" role="document">
		<!--alertPd-->
		<div class="alertPd type01">
			<p id="confirmMassage"></p>
			<!--btnArea-->
			<div class="btnArea flex txt-center">
				<button type="button" class="button gray close" id="confirmNo" data-dismiss="modal" aria-label="Close">취소</button>
				<button type="button" class="button dkBlue" id="confirmOk">확인</button>
			</div>
			<!--//btnArea-->
			<!-- <button type="button" class="button btnClose" data-dismiss="modal" aria-label="Close"><span class="hidden">닫기</span></button> -->
		</div>
		<!--//alertPd-->
	</div>
</div>


<div class="modal fade" id="memberDeleteConfirm" tabindex="-1" role="dialog" aria-labelledby="tempTomatoReActInfo" aria-hidden="true" style="z-index:1080">
	<div class="alert" role="document">
		<!--alertPd-->
		<div class="alertPd type01">
			<p id="memberDeleteMessage"></p>
			<!--btnArea-->
			<div class="btnArea flex txt-center">
				<button type="button" class="button gray close" id="memberDeleteNo" data-dismiss="modal" aria-label="Close">취소</button>
				<button type="button" class="button dkBlue" id="memberDeleteOk">확인</button>
			</div>
			<!--//btnArea-->
			<!-- <button type="button" class="button btnClose" data-dismiss="modal" aria-label="Close"><span class="hidden">닫기</span></button> -->
		</div>
		<!--//alertPd-->
	</div>
</div>

	
<!-- External Scripts -->
<script type="text/javascript" charset="UTF-8" src="/resources/js/jquery-2.2.4.min.js"></script>

<script src="/resources/js/bootstrap/bootstrap.min.js"></script>
<script src="/resources/js/moment-2.29.3/package/min/moment.min.js"></script>



<script src="/resources/js/bootstrap-select/bootstrap-select.min.js"></script>
<script src="/resources/js/owlcarousel/owl.carousel.js"></script>
<script src="/resources/js/owlcarousel/owl.autoplay.js"></script>

<!-- iNerv Works Custom -->
<script type="text/javascript" charset="UTF-8" src="/resources/js/var.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/ckeditor/sub/js/sub.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/plupload.full.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/jsrender.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/select2.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/i18n/ko.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/works.dialogform.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/cal/DhiccCalPopup.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/showModalDialog.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/utils.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/multiFile.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/attachFile.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/works.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/ui.js"></script>


<script type="text/javascript" charset="UTF-8" src="/resources/js/jquery-ui.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/jquery-cookie.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/pagination.js"></script>

<script type="text/javascript" charset="UTF-8" src="/resources/js/swiper/swiper.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/datepicker/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/datepicker/jquery.datetimepicker.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js" integrity="sha512-rMGGF4wg1R73ehtnxXBt5mbUfN9JUJwbk21KMlnLZDJh7BkPmeovBuddZCENJddHYYMkCh9hPFnPmS9sspki8g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="/resources/js/slick.min.js"></script>
    
<script type="text/javascript">

function insertPaymentLog(){
	$.ajax({
		  url      : "/smartro/insertPaymentLog.json"
		, type     : "post"
		, data     : $("#paymentForm").serialize()
		, dataType : "json"
		, success  : function(data){
			console.dir(data);
		}
		, error    : function(error){
			alert("에러가 발생하였습니다. 관리자에게 문의 바랍니다.");
		}
	});
}

/*******************************
 * PG 결제 URL을 반환
 *******************************/
function getPGUrl(formId, mode){
	
	var _vResult, _vPcUrl, _vMobileUrl;
	if(mode == "ssb"){
		_vPcUrl     = "";
		_vMobileUrl = "";
	}else{
		_vPcUrl     = "";
		_vMobileUrl = "";
	}
	
	var _vFormId = formId ? formId : "paymentForm";
	var _vFilter = "win16|win32|win64|mac|macintel";
	var _vDevice = "";
	
	if(navigator.platform){
		if(_vFilter.indexOf(navigator.platform.toLowerCase()) < 0){
			_vDevice = "mobile";
		}else{
			_vDevice = "pc";
		}
	}else{
		_vDevice = "mobile";
	}
	
	if(_vDevice == "pc"){
		_vResult = _vPcUrl;
		$("#" + _vFormId).attr("accept-charset", "EUC-KR");
	}else{
		_vResult = _vMobileUrl;
		$("#" + _vFormId).attr("accept-charset", "UTF-8");
	}
	
	return _vResult;
	
}

</script>
</head>
</head>
<body>
	<header>
		




<form name="selectOne" method="post">
	<input type="hidden" name="menuParamNo" />
	
</form>
<header id="header">

<!--accNav-->
<div id="accNav">
    <a href="#container">본문 바로가기</a>
</div>
<!--//accNav-->

<h2 class="hidden">헤더 시작</h2>
<!--inner-->
<div class="inner">
	<!-- logo -->
	<h1 class="logo">
		<a href="/" title="한국공항공사">
			<img src="/resources/images/common/logo-w.svg" alt="한국공항공사">
		</a>
	</h1>
	<!-- //logo -->
	<!--gnb-->
	<nav id="gnb" class="web">
		<ul class="depth01">
			<li>
				<a href="/reservation/recheck.do">주차예약</a>
				<!--depth02-->
				<ul class="depth02">
					<li><a href="/reservation/recheck.do">주차예약 신청</a></li>
					<li><a href="/reservation/resView.do">예약조회/변경</a></li>
				</ul>
				<!--//depth02-->
			</li>
			<li>
				<a href="/humandiscount/intro.do">다자녀할인등록</a>
				<!--depth02-->
				<ul class="depth02">
					<li><a href="/humandiscount/intro.do">사전(사후) 등록신청</a></li>
					<li><a href="/humandiscount/viewChk.do">신청내역 확인/변경</a></li>
				</ul>
				<!--//depth02-->
			</li>
			<li>
				<a href="/refund/privacy.do">주차요금환불</a>
				<!--depth02-->
				<ul class="depth02">
					<li><a href="/refund/privacy.do">요금 환불 신청</a></li>
					<li><a href="/refund/search.do">신청결과 조회</a></li>
				</ul>
				<!--//depth02-->
			</li>
			<li class="period">
                <a href="/period/applyPage.do">상주직원 정기권</a>
                <!--depth02-->
                <ul class="depth02">
                    <li><a href="/period/noticeList.do">공지사항</a></li>
                    <li><a href="/period/applyPage.do">이용안내</a></li>
                    <li><a href="/period/periodApply.do">정기권 현황/신청</a></li>
                    <li><a href="/period/refundList.do">정기권 환불</a></li>
                </ul>
                <!--//depth02-->
            </li>
			<li>
				<a href="/notice/notice.do">이용안내</a>
				<!--depth02-->
				<ul class="depth02">
					<li><a href="/notice/notice.do">이용안내</a></li>
					<li><a href="/notice/questionsList.do">자주묻는 질문</a></li>
					<li><a href="/notice/privacyInfo.do">개인정보처리방침</a></li>
				</ul>
				<!--//depth02-->
			</li>
		</ul>
		
	</nav>
	<!--//gnb-->
	<!--btnMoGnb-->
	<button type="button" class="btnMoGnb mobile"><span class="hidden">모바일gnb버튼</span></button>
	<!--//btnMoGnb-->
	
	<!--moGnb-->
	<div class="moGnb mobile">
		<div class="inner pos-r">
			<!-- logo -->
			<h1 class="logo">
				<a href="#" title="한국공항공사">
					<img src="/resources/images/common/logo-w.svg" alt="한국공항공사">
				</a>
			</h1>
			<!-- //logo -->
			<!--depth01-->
			<ul class="depth01">
				<li>
					<a href="/reservation/recheck.do">주차예약</a>
					<!--depth02-->
					<ul class="depth02">
						<li><a href="/reservation/recheck.do">주차예약 신청</a></li>
						<li><a href="/reservation/resView.do">예약조회/변경</a></li>
					</ul>
					<!--//depth02-->
				</li>
				<li>
					<a href="/humandiscount/intro.do">다자녀할인등록</a>
					<!--depth02-->
					<ul class="depth02">
						<li><a href="/humandiscount/intro.do">사전(사후) 등록신청</a></li>
						<li><a href="/humandiscount/viewChk.do">신청내역 확인/변경</a></li>
					</ul>
				<!--//depth02-->
				</li>
			</ul>
			<ul class="depth01">
				<li>
					<a href="/refund/privacy.do">주차요금환불</a>
					<!--depth02-->
					<ul class="depth02">
						<li><a href="/refund/privacy.do">요금 환불 신청</a></li>
						<li><a href="/refund/search.do">신청결과 조회</a></li>
					</ul>
					<!--//depth02-->
				</li>
				<li>
					<a href="/period/applyPage.do">상주직원 정기권</a>
					<!--depth02-->
					<ul class="depth02">
                        <li><a href="/period/noticeList.do">공지사항</a></li>
                        <li><a href="/period/applyPage.do">이용안내</a></li>
                        <li><a href="/period/periodApply.do">정기권 현황/신청</a></li>
                        <li><a href="/period/refundList.do">정기권 환불</a></li>
                    </ul>
					<!--//depth02-->
				</li>
			</ul>
			<ul class="depth01" style="width: 50%;">
                <li>
                    <a href="/notice/notice.do">이용안내</a>
                    <!--depth02-->
                    <ul class="depth02">
                        <li><a href="/notice/notice.do">이용안내</a></li>
                        <li><a href="/notice/questionsList.do">자주묻는 질문</a></li>
                    </ul>
                    <!--//depth02-->
                </li>
            </ul>
			<!--//depth01-->
			<button type="button" class="button gnbClose"><span class="hidden">닫기</span></button>
		</div>
	</div>
	<!--//moGnb-->
</div>
<!--//inner-->

<div class="header-sub-bg"></div>


</header>
<script type="text/javascript">
$(function(){
	jQuery.datetimepicker.setLocale('ko');
	moment.locale('ko');
});
</script>
	</header>
	<main id="container">
		<h2 class="hidden">본문 시작</h2>
		




<form name="mainManageLeftForm" id="mainManageLeftForm" method="post">
	<input type="hidden" name="menuParamNo" value="10000"/>
	<input type="hidden" name="upperMenuParamId" value="0"/>
	<input type="hidden" name="subMenu1" value="0"/>
	<input type="hidden" name="subMenu2" value="0"/>
</form>

<script type="text/javaScript" language="javascript" defer="defer">

	
	function fCallUrl(menuNo, upperMenuId, url) {
		var form = document.mainManageLeftForm;
		form.subMenu1.value         = menuNo;
		form.subMenu2.value         = upperMenuId;
		form.upperMenuParamId.value = upperMenuId;
		form.action                 =  '' + url;
		form.submit();
	}
	
	function pop_up(url){
		url = '' + url;
		window.open(url, "", "width=1600, height=800, resizable=yes");
		document.getelementbyid('.sidebar').remove();
		document.removeclass('.sidebar');
	}
	
</script>
		<div class="subVisual sub01">
			<h3 class="title">주차예약</h3>
			<!--subMenu-->
			<div class="subMenu web">
				<div class="inner">
					<ul>
						<li><a href="/reservation/recheck.do">주차예약 신청</a></li>
						<li class="active"><a href="/reservation/resView.do">예약조회/변경/취소</a></li>
					</ul>
				</div>
			</div>
			<!--//subMenu-->
			<!--subMenu-->
			<div class="subMenu mobile">
				<a>예약조회/변경/취소</a>
				<ul>
					<li><a href="/reservation/recheck.do" title="새 창 열림">주차예약 신청</a></li>
					<li><a href="/reservation/resView.do" title="새 창 열림">예약조회/변경/취소</a></li>
				</ul>
			</div>
		</div>
		<!--//subMenu-->
		<form id="reservationVO" name="reservationVO" action="/reservation/resView.do" method="post">
			<input type="hidden" id="reservationNo" name="reservationNo" />
			<input type="hidden" id="reservationId" name="reservationId" />
			<input type="hidden" id="encryptId" name="encryptId" />
			<input type="hidden" id="carNo" name="carNo" />
			<input type="hidden" id="resInDttm" name="resInDttm" />
			<input type="hidden" id="regDttm" name="regDttm" />
			<input type="hidden" id="status" name="status" />
			<input id="preReservationYn" name="preReservationYn" type="hidden" value=""/>
			<div id="content">
				<div class="inner">
					<!--location-->
					



<div class="location">
	<h4 class="subTitle">예약조회/변경/취소</h4>
	<!--breadcrumb-->
	<ul class="breadcrumb web">
		<li><a href="/" class="home">Home</a></li>
		<li><a href="/reservation/recheck.do">주차예약</a></li>
		<li><a href="/reservation/resView.do">주차조회/변경/취소</a></li>
	</ul>
	<!--//breadcrumb-->
</div>

<script>
	function fCallUrl(menuNo, upperMenuId, url) {
		var form = document.mainManageLeftForm;
		form.subMenu1.value         = menuNo;
		form.subMenu2.value         = upperMenuId;
		form.upperMenuParamId.value = upperMenuId;
		form.action                 =  '<c:out value=""/>' + url;
		form.submit();
	}
</script>
					<!--//location-->
					<div id="subCont">
						<div class="section">
							<div class="table type03">
								<table>
									<caption>예약조회 테이블이며 차량번호, 휴대폰번호 등의 정보를 나타냅니다.</caption>
									<colgroup>
										<col style="width: 17%;min-width: 100px;">
										<col style="width: auto">
									</colgroup>
									<tbody>
									<tr>
										<th scope="row">인증<span class="redDot" title="필수입력">*</span></th>
										<td>
											<div class="flex radioRow">
												<div class="radioGroup">
													<div class="radio">
														<input id="radio01" name="certWay" checked="checked" type="radio" value="1"/>
														<label for="radio01">차량번호</label>
													</div>
													<div class="radio">
														<input id="radio02" name="certWay" type="radio" value="2"/>
														<label for="radio02">이메일</label>
													</div>
													<div class="radio">
														<input id="radio03" name="certWay" type="radio" value="3"/>
														<label for="radio03">예약번호</label>
													</div>
												</div>
												<div class="flex ml50 discountAmtCalDiv">
													<input id="certValue" name="certValue" title="인증방법 선택" placeholder="인증방법 선택 후 입력해주세요." type="text" class="colorType w728 valid" value=""/>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="mobile">휴대폰번호<span class="redDot" title="필수입력">*</span></label></th>
										<td><input id="mobile" name="mobile" title="휴대폰번호 입력" placeholder="예) 01012345678" type="text" class="valid" oninput="this.value = this.value.replace(/[^0-9]/g, &#39;&#39;).replace(/(\..*)\./g, &#39;$1&#39;);" value=""/></td>
									</tr>
									<tr>
										<th scope="row"><label for="password">비밀번호<span class="redDot" title="필수입력">*</span></label></th>
										<td>
											<input id="password" name="password" title="비밀번호 입력" placeholder="예약신청 시 입력했던 비밀번호를 입력해주세요." type="password" class="valid" value=""/>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="passwordCk">비밀번호 확인<span class="redDot" title="필수입력">*</span></label></th>
										<td>
											<input type="password" id="passwordCk" class="" title="비밀번호 재입력" placeholder="예약신청 시 입력했던 비밀번호를 다시 입력해주세요."/>
										</td>
									</tr>
									</tbody>
								</table>
							</div>
							<!--//table-->
							<!--notice-->
							<!-- <div class="notice">
								<div class="checkArea">
									<p class="checkbox">
										<input type="checkbox" id="agree01" class="hidden" title="약관 동의 체크">
										<label for="agree01"><span class="boldFont">구 홈페이지 예약내역을 조회하시려면 체크해주세요.</span><span class="colorType red boldFont">(비밀번호 없이 조회)</span></label>
									</p>
								</div>
							</div> -->
							<!--//notice-->
							<!--btnArea-->
							<div class="btnArea flex txt-center mt40">
								<button type="button" class="button white" onclick="goPasswordfindView(); return false;" id="">비밀번호찾기</button>
								<button type="button" class="button dkBlue" onclick="resViewBtn();" onkeypress="if(event.keyCode==13){resViewBtn(); return false;}">예약</br>조회/변경/취소</button>
							</div>
							<!--//btnArea-->
							
							<p class="titPage mt80">주차예약 신청내역(요약)</p>
							<p class="colorType green">*예약 세부내역 <span class="colorType red boldFont">조회/변경/취소</span>는 아래 표의 <span class="colorType red boldFont">세부사항을 클릭</span>하여 주시기 바랍니다.</p>
							<div class="table type04 colType scroll-x w335">
								<table>
									<caption>주차예약 신청내역 테이블입니다.</caption>
									<colgroup>
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
										<col style="min-width: 100px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">순번</th>
											<th scope="col">예약번호</th>
											<th scope="col">차량번호</th>
											<th scope="col">공항구분</th>
											<th scope="col">주차장</th>
											<th scope="col">입차예정시간</th>
											<th scope="col">출차예정시간</th>
											<th scope="col">신청일자</th>
										</tr>
									</thead>
									<tbody id="dataList">
										
										<tr class="nodata">
											<td colspan="8">조회된 데이터가 없습니다.</td>
										</tr>
										
										
									</tbody>
								</table>
							</div>
							<div class="pagination clearfix">
								<ul class="pagination"></ul>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</form>
	</main>
	<a href="javascript:void(0);" type="button" class="btnTop"><span class="hidden">위로가기</span></a>
	<footer>
		




<!--aside-->
<div id="aside" class="">
	<div class="pos-r">
		<div class="asideToggle"><a href="javascript:void(0);">주차요금 간편계산</a></div>

		<!-- asideInner -->
		<div class="asideInner">
			<div class="asideHead">
				<p class="title">주차요금 간편 계산</p>
			</div>
			<!-- asideCont -->
			<div class="asideCont">
				<!--table-->
				<div class="table type03">
					<table>
						<caption>주차요금 간편 계산 테이블이며 공항, 주차장, 할인유형, 이용일시 등의 정보를 나타냅니다.</caption>
						<colgroup>
							<col style="width: 24%;min-width: 100px;">
							<col style="width: auto">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row" class="txt-left"><label for="parkingCd">공항<span class="redDot" title="필수입력">*</span></label></th>
							<td>
								<select name="parkingCd" id="parkingCd" class="" title="공항 선택">
									<option value="">공항 선택</option>
									
										
									
										
											<option value="PLT-002">김포공항</option>
										
									
										
											<option value="PLT-003">김해공항</option>
										
									
										
											<option value="PLT-004">제주공항</option>
										
									
										
											<option value="PLT-005">대구공항</option>
										
									
										
											<option value="PLT-006">광주공항</option>
										
									
										
											<option value="PLT-007">여수공항</option>
										
									
										
											<option value="PLT-008">울산공항</option>
										
									
										
											<option value="PLT-009">군산공항</option>
										
									
										
											<option value="PLT-010">원주공항</option>
										
									
										
											<option value="PLT-011">청주공항</option>
										
									
										
											<option value="PLT-012">무안공항</option>
										
									
										
											<option value="PLT-013">사천공항</option>
										
									
										
											<option value="PLT-014">양양공항</option>
										
									
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="txt-left"><label for="parkingLot">주차장<span class="redDot" title="필수입력">*</span></label></th>
							<td>
								<select name="parkingLot" id="parkingLot" class="" title="주차장 선택">
									<option value="">주차장을 선택해주세요.</option>
									
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="txt-left"><label for="discountType">할인유형<span class="redDot" title="필수입력">*</span></label></th>
							<td>
								<select id="discountType" name="discountType" title="할인유형 선택">
									<option value="DC001">일반</option>
									<option value="DC005">경차</option>
									<option value="DC002">장애인(1~3급)</option>
									<option value="DC003">장애인(4~6급)</option>
									<option value="DC006">저공해(1,2종)</option>
									<option value="DC007">저공해(3종)</option>
									<option value="DC012">다자녀</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="txt-left"><label for="">이용일시<span class="redDot" title="필수입력">*</span></label></th>
							<td>
								<div class="flex">
									<input type="text" id="inDttm" class="cal picker" title="이용시작날짜 입력" readonly="readonly">
									<span class="hyphen">-</span>
									<input type="text" id="outDttm" class="cal picker" title="이용종료날짜 입력" readonly="readonly">
								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<!--//table-->
				<!--btnArea-->
				<div class="btnArea flex txt-center">
					<button type="button" class="button white retry">다시계산하기</button>
					<button type="button" class="button dkBlue calculate">계산하기</button>
				</div>
				<!--//btnArea-->
				<div class="skyBox"><p id="amt"/>예상 주차요금은 &nbsp;원 입니다.</div>
				<p class="colorType green">* 예상 주차요금은 실제 요금과 차이가 발생할 수 있습니다.</p>
			</div>
			<!-- //asideCont -->
			<!--btnClose-->
			<button type="button" class="btnClose"><span class="hidden">닫기</span></button>
			<!--//btnClose-->
		</div>
		<!-- //asideInner -->
	</div>
</div>
<!--//aside-->

<footer id="footer">
	<!--inner-->
	<div class="inner">
		<div class="fLogo">
			<img src="/resources/images/common/footer-logo.svg" alt="한국공항공사">
		</div>
		<!--fMenu-->
		<ul class="fMenu">
			<li><a href="/notice/privacyInfo.do" class="green">개인정보처리방침</a></li>
			<li><a href="http://www.airport.co.kr" target="_airport" class="airport">한국공항공사</a></li>
			<li>
				
		            <a href="/period/applyPage.do" class="green">상주직원 정기권</a>
	            
	            
			</li>
		</ul>
		<!--//fMenu-->
		<!--fNotice-->
		<div class="fNotice">
			<p>한국공항공사 주차장 관련 문의 ( ☏ 1544-7877 ) <a href="javascript:void(0);" onclick="airportNumberList(); return false;" class="btn_pop">공항별 안내번호</a></p>
			<p class="copyright">COPYRIGHT Ⓒ KAC. ALL RIGHTS RESERVED.</p>
		</div>
		<!--//fNotice-->
	</div>
	<div id="dimmed" style="display:none;"></div>
	<div class="alert tell" style="display:none;">
		<!--alertPd-->
		<div class="alertPd">
			<p>공항별 주차안내번호</p>
			<div class="table type05">
				<table>
					<caption>공항별 주차안내번호 테이블입니다.</caption>
					<colgroup>
						<col style="width: 40%;">
						<col style="width: auto;">
					</colgroup>
					<tbody><tr>
					<th scope="row">대표번호</th>
						<td>1544-7877</td>
					</tr>
					<tr>
						<th scope="row">김포공항</th>
						<td>02-2660-2515</td>
					</tr>
					<tr>
						<th scope="row">김해공항</th>
						<td>051-974-3718</td>
					</tr>
					<tr>
						<th scope="row">제주공항</th>
						<td>064-797-2701</td>
					</tr>
					<tr>
						<th scope="row">대구공항</th>
						<td>053-980-5254</td>
					</tr>
					<tr>
						<th scope="row">광주공항</th>
						<td>062-940-0327</td>
					</tr>
					<tr>
						<th scope="row">여수공항</th>
						<td>061-689-6255</td>
					</tr>
					<tr>
						<th scope="row">울산공항</th>
						<td>052-219-6318</td>
					</tr>
					<tr>
						<th scope="row">군산공항</th>
						<td>063-469-8323</td>
					</tr>
					<tr>
						<th scope="row">원주공항</th>
						<td>033-340-8315</td>
					</tr>
					<tr>
						<th scope="row">청주공항</th>
						<td>043-210-6677</td>
					</tr>
					<tr>
						<th scope="row">무안공항</th>
						<td>061-455-2314</td>
					</tr>
					<tr>
						<th scope="row">양양공항</th>
						<td>033-670-7397</td>
					</tr>
					<tr>
						<th scope="row">사천공항</th>
						<td>055-831-9374</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!--//alertPd-->
		<!--btnArea-->
		<div class="btnArea">
			<button type="button" class="button dkBlue" id="footerClose">확인</button>
		</div>
		<!--//btnArea-->
	</div>
	<!--//inner-->
</footer>
<script>

function airportNumberList() {
	$(".alert.tell").css("display", "block");
	$(".dimmed, #dimmed").css("display", "block");
}

/**
 * 숫자 콤마를 적용후 돌려준다.
 * @param x
 * @returns
 */
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(function() {
	$("#footerClose").click(function() {
		$(".alert.tell").css("display", "none");
		$(".dimmed, #dimmed").css("display", "none");
	});
	
	$('#parkingCd').on('change',function(){
		$("#parkingLot").empty();
		$.ajax({
			  url      : "/main/parkingList.json"
			, type     : "POST"
			, data     : { parkingCd : $("#parkingCd").val() }
			, success  : function(data){
				for(var i =0; i<data.parkingList.length; i++){
	                 $("#parkingLot").append("<option value="+data.parkingList[i].value+">"+data.parkingList[i].label+"</option>");
	             }
				
			}
		});
	});
	
	//입력정보 초기화
	$(".retry").click(function() {
		$("#parkingCd").val("");
		$("#parkingLot").val("");
		$("#discountType").val("DC001");
		$("#inDttm").val("");
		$("#outDttm").val("");
		$("#amt").html("예상 주차요금은 &nbsp;원 입니다.");
	});
	
	$(".calculate").click(function() {
		
		if($("#parkingCd").val() == ""){
			$("#amt").html("공항을 선택해주세요.")
		}else if($("#parkingLot").val() == ""){
			$("#amt").html("주차장을 선택해주세요.")
		}else if($("#inDttm").val() == null || $("#inDttm").val() == "") {
			$("#amt").html("입차일자를 선택해주세요.");
		}else if($("#outDttm").val() == null || $("#outDttm").val() == "") {
			$("#amt").html("출차일자를 선택해주세요.");
		}/* else if(moment($("#outDttm").val()).diff(moment($("#inDttm").val()), 'hours') < 2) {
			$("#amt").html("주차예약은 현재 시간 기준 최소 2시간 이상 사용 시 예약 가능합니다.");
		}else if(moment($("#outDttm").val()).diff(moment($("#inDttm").val()), 'days') > 30) {
			$("#amt").html("주차예약은 현재 날짜 기준 최대 30일까지 사용 시 예약 가능합니다.");
		} */else{
			$.ajax({
				  url      : "/main/calculateAmt.json"
				, type     : "POST"
				, data     : { 
					sectnId    : $("#parkingLot").val(),
					inDttm     : $("#inDttm").val(),
					outDttm    : $("#outDttm").val(),
					discountCd : $("#discountType").val()
					
				}
				, success  : function(data){
					if(data.calculateAmt != null && data.calculateAmt != ""){
						$("#amt").html("예상 주차요금은 &nbsp;<strong>"+numberWithCommas(data.calculateAmt)+"</strong>원 입니다.");
					}
					
				}
			});
		}
		
	});
	
	$(".picker").datetimepicker({
		//format: 'Y-m-d H:00:00'
		format: 'Y-m-d H:i:00',
        formatTime: 'H:i',
        formatDate: 'Y/m/d',
        step: 10,
	});
});
</script>
	</footer>

	<div class="modal fade findPassword" id="findPassword" tabindex="-1" role="dialog" aria-labelledby="findPassword" aria-hidden="true" style="z-index: 1070">
		<div class="popup">
			<!--popupPd-->
			<div class="popupPd">
				<div class="popHead">비밀번호 변경</div>
				<div class="popCont">
				
					<div class="certifyArea">
						<!--table-->
						<div class="table type07">
							<table>
								<caption>비밀번호 찾기 테이블입니다.</caption>
								<tbody>
							<!--	<tr>
										<th scope="col"><label for="certWay">예약번호</label></th>
									</tr>
									<tr>
										<td><input type="text" id="resNo" title="예약번호 입력" placeholder="예약번호를 입력해주세요."></td>
									</tr>-->
									<tr>
										<th scope="col"><label for="empMobile">휴대폰번호</label></th>
									</tr> 
									<tr>
										<td>
											<div class="flex tell">
											<select name="empMobile1" id="empMobile1" title="휴대폰 앞자리 선택">
												<option value="010">010</option>
											</select> 
											<input type="text" id="empMobile2" title="휴대폰번호 중간자리 입력" placeholder="1234" minlength="4" maxlength="4"> 
											<input type="text" id="empMobile3" title="휴대폰번호 끝자리 입력" placeholder="5678" minlength="4" maxlength="4">
											<button type="button" id="sendChkNo" class="button white">인증번호발송</button>
											</div>
										</td>
									</tr>
									<tr class="num">
										<th scope="col"><label for="certificationNo">인증번호</label></th>
									</tr>
									<tr class="num">
										<td>
											<div class="flex">
												<div class="inputWrap">
													<input type="text" id="certificationNo" title="인증번호 입력">
													<span class="time"><i class="ico"></i><span id="timer" /></span>
												</div>
												<button type="button" class="button white" onclick="timeExtensionBtn()">시간연장</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--//table-->
						<!--btnArea-->
						<div class="btnArea num" >
						    <button type="button" class="button blue" id="certification">인증</button>
						</div>
						<!--//btnArea-->
					</div>
					<!--############### 비밀번호 변경 ###############-->
					<div class="findPwArea"  style="display:none;">
						<div class="table type07">
							<table>
								<caption>비밀번호 찾기 테이블입니다.</caption>
								<tbody>
									<tr>
										<th scope="col"><label for="newPassword">변경할 비밀번호</label></th>
									</tr>
									<tr>
										<td><input type="password" id="newPassword" title="변경할 비밀번호 입력" placeholder="변경하실 비밀번호를 입력해주세요."></td>
									</tr>
									<tr>
										<th scope="col"><label for="newPasswordCk">비밀번호 확인</label></th>
									</tr>
									<tr>
										<td><input type="password" id="newPasswordCk" title="변경할 비밀번호 재입력" placeholder="변경하실 비밀번호를 다시 입력해주세요."></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<div id="msg" class="skyBox changePwBtn">휴대폰번호 입력 후 인증을 완료해주세요.</div>
					<!--btnArea-->
					<div class="btnArea flex txt-center certifyArea">
						<button type="button" class="button gray cancel" id="cancel">취소</button>
						<button type="button" class="button dkBlue w138 notuse certification"  disabled="disabled"  id="next">다음</button>
					</div>
					<div class="btnArea flex txt-center findPwArea" style="display:none;">
						<button type="button" class="button gray" id="prev">이전</button>
						<!--############### 비밀번호 변경 ###############-->
						<button type="button" class="button dkBlue w138" id="targetBtn">비밀번호 변경</button>
						<!--############### 비밀번호 초기화 ###############-->
						<!-- <button type="button" class="button dkBlue w138 notuse" id="clearPwBtn">비밀번호 초기화</button> -->
					</div>
					<!--//btnArea-->
					<button type="button" class="button btnClose" data-dismiss="modal" aria-label="Close" id="btnClose">
						<span class="hidden" aria-hidden="true">&times;</span>
					</button>
				</div>
				<!--############### 비밀번호 초기화 ###############-->
				<!-- <p class="colorType green bottomTxt">※비밀번호 초기화 하신 후에 로그인 하셔서 새로운 비밀번호로 변경 해 주세요.</p> -->
				<!--##########################################-->
			</div>
			<!--//popupPd-->
		</div>
	</div>
	
<script>
	var resNo;
	var empMobile;
	var chkStart;
	var chkEnd;
	var chkCurr;
	
	var timer;
	var isRunning = false;
	var setCnt = 180;
	
	if($("#preReservationYn").val() == "Y"){
		$("input[type=checkbox]").prop("checked", true);
	}
	
	function view(id, carNo, encryptId) {
		$.loadingStart();
 		$("#reservationId").val(id);
 		$("#carNo").val(carNo);
 		$("#encryptId").val(encryptId);
		document.reservationVO.action = "/reservation/resDetail.do";
		document.reservationVO.submit();
	}
		
	function resViewBtn() {
		if(validate()) {
			$.loadingStart();
			document.reservationVO.action = "/reservation/resView.do";
			document.reservationVO.submit();
		}
	}

	function validate(){
		var validTot = $(".valid").length,
			validCnt = 0;
		
		if(!$("#certValue").val()){
			validN("#certValue", "#certValueChk");
			alertMessage("인증할 정보를 입력해주세요.");
			return;
		}else{
			validY("#certValue", "#certValueChk");
			validCnt++;
		}
		
		if(!$("#mobile").val()){
			validN("#mobile", "#mobileChk");
			alertMessage("휴대폰번호를 입력해주세요.");
			return;
		}else{
			var chk = /^[0-9]{3}[0-9]{3,4}[0-9]{4}/;
			
			if(!chk.test($("#mobile").val())) {
				validN("#mobile", "#mobileChk");
				alertMessage("휴대폰번호를 다시 확인해주세요.");
				return;
			} else {
				validY("#mobile", "#mobileChk");
				validCnt++;
			}
		}
		
		if($("#preReservationYn").val() == "Y"){
			$("#password").val(null);
			$("#passwordCk").val(null);
			validCnt++;	
		}else {
			if(!$("#password").val()) {
				validN("#password", "#passwordChk");
				alertMessage("비밀번호를 입력해주세요.");
				return;
			} else {
				var chk = /^[0-9a-zA-Z]{4,}$/;
				
				if(!chk.test($("#password").val())) {
					validN("#password", "#passwordChk");
					alertMessage("비밀번호는 숫자와 영문만 입력이 가능합니다.(4자리 이상)");
					return;
				} else {
					
					if($("#password").val() != $("#passwordCk").val()){
						validN("#password", "#passwordChk");
						alertMessage("비밀번호가 일치하지 않습니다.");
						return;
					}else{
						validY("#password", "#passwordChk");
						validCnt++;	
					}
				}
			}
		}
		
		
		console.log("validTot: "+ validTot);
		console.log("validCnt: "+ validCnt);

		if(validTot == validCnt){
			return true;
		}else{
			alertMessage("필수값을 다시 확인해주세요.");
			return false;
		}
	}
	/**
	 * 숫자 콤마를 적용후 돌려준다.
	 * @param x
	 * @returns
	 */
	
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function goPasswordfindView() {
		$("#findPassword").modal("show");
		$(".popup .findPassword").css("display", "block");
		$(".page2").hide();
		$(".num").hide();
	}
	
	function timeExtensionBtn() {
		chkCurr = moment().format('YYYYMMDDHHmmss');
		var plusTimer = chkCurr - chkStart;
		
		if(isRunning) {
			clearInterval(timer);
			ftimer(setCnt);
			chkEnd = Number(chkEnd) + Number(plusTimer);
		}
	}
	
	function ftimer(count) {
		var minutes, seconds;
		timer = setInterval(function() {
			minutes = parseInt(count / 60, 10);
			seconds = parseInt(count % 60, 10);
			
			minutes = minutes < 10 ? '0' + minutes : minutes;
			seconds = seconds < 10 ? '0' + seconds : seconds;
			$("#timer").html(minutes + ":" + seconds);
			
			if(--count < 0) {
				clearInterval(timer);
				isRunning = false;
			} else {
				isRunning = true;
			}
		}, 1000);
	}
	
	function findPassValid(resNo, empMobile) {
		
		$(".num").hide();
		
		if(resNo == "") {
			alertMessage("예약번호를 입력해주세요.");
			$(".num").hide();
			return false;
		} else if ($("#empMobile2").val() == "" || $("#empMobile3").val() == "") {
			alertMessage("전화번호를 입력해주세요.");
			$(".num").hide();
			return false;
		} else {
			return true;
		}
		
	}
	
	function sendMessage(empMobile) {
		
		$.ajax({
			url : "/reservation/sendMessage.do" ,
			type : "post" ,
			data : {
				  msgcodeId	: "112"
				, destPhone	: empMobile
			} ,
			dataType : "json" , 
			success : function(data) {
				
				var code = data.code;
				
				if(code == "00") {
					chkStart = moment().format('YYYYMMDDHHmmss');
					//타이머시작
					ftimer(setCnt);
				} else {
					$("#msg").html("인증번호 전송에 실패하였습니다.");
				}
			}
		});
		
	}
	
	function chkNo() {
		var result = false;
		$.ajax({
			url   : "/reservation/chkNo.do" ,
			type  : "post" ,
			async : false,
			data  : {
				  certifiNo	: $("#certificationNo").val()
				, empMobile	: empMobile
			} ,
			dataType : "json" , 
			success : function(data) {
				var code = data.code;
				
				if(code == "00") {
					result = true;
				}else {
					result = false;
				}
			}
		});
		return result;
	}
	
	function reset(){
		$('.certifyArea').show();
		$('.findPwArea').hide();
		
		$('#resNo').val("");
		$('#empMobile2').val("");
		$('#empMobile3').val("");
		$('#newPassword').val("");
		$('#newPasswordCk').val("");
		
		isRunning = false;
		clearInterval(timer);
		$("#next").prop("disabled", true);
		$("#next").addClass("notuse");
		$(".num").hide();
		$("#certificationNo").val("");
		$("#msg").html("예약번호와 휴대폰번호 입력 후 인증을 완료해주세요.");
	}
	
	$(function() {
		
		if($("#certValue").val() != "" && $("#mobile").val() != "" && $("#password").val() != ""){
			if(''){
				$("html, body").animate({ scrollTop: $(document).height() }, 500);
				alertMessage("정상적으로 조회되었습니다.<br/>스크롤을 아래로 내려 주차예약세부내역을<br/>클릭하시어 변경/취소 바랍니다.");
			}else{
				alertMessage("해당 인증값(차량번호/이메일/예약번호)의<br/>예약정보가 존재하지 않습니다.");
			}
		}
		
		if('99' == '10'){
			alertMessage("비밀번호가 맞지 않습니다. </br></br> [비밀번호찾기]를 통해 비밀번호를 변경할 수 있습니다.");
			
		}
		
		$("#agree01").change(function() {
			if($(this).is(":checked") == true) {
	   			$("#preReservationYn").val("Y");
	   			$("#password").val(null);
	   			$("#passwordCk").val(null);
			}else{
				$("#preReservationYn").val("N");
			}
		});
		
		$("#next").click(function() {
			$('.certifyArea').hide();
			$('.findPwArea').show();
			// ############### 비밀번호 변경 ###############
			$("#msg").html("변경할 비밀번호를 입력해주세요.");
			// ############### 비밀번호 초기화 ###############
			//$("#msg").html("[비밀번호 초기화] 버튼 클릭시 가입한 핸드폰번호로 새로운 비밀번호가 전송됩니다.");
		});
		
		$("#prev").click(function() {
			$('.findPwArea').hide();
			$('.certifyArea').show();
			
			isRunning = false;
			clearInterval(timer);
			$("#next").prop("disabled", true);
			$("#next").addClass("notuse");
			$(".num").hide();
			$("#certificationNo").val("");
			$("#msg").html("예약번호와 휴대폰번호 입력 후 인증을 완료해주세요.");
		});
		
		$("#btnClose").click(function() {
			reset();
		});
		
		//인증번호 발송
		$("#sendChkNo").click(function() {
			resNo = $("#resNo").val();
			empMobile = $("#empMobile1").val() + $("#empMobile2").val() + $("#empMobile3").val();
			
			if(isRunning) {
				alertMessage("전송한 인증번호로 인증을 완료해주세요.");
				
			}else{
				
				if(findPassValid(resNo, empMobile)){
					$.ajax({
						url : "/reservation/resConfirm.json" ,
						type : "post" ,
						data : {
							  resNo       : resNo 
							, empMobile   : empMobile
						} ,
						dataType : "json" , 
						success : function(data) {
							var code = data.code;
							
							if(code == "00") {
								$(".num").show();
								$("#msg").html("인증번호를 입력해주세요.");
								
								sendMessage(empMobile);
							} else {
								$(".num").hide();
								$("#certificationNo").val("");
								$("#msg").html("예약번호와 휴대폰번호에 해당하는 예약목록이 없습니다. <br/> 번호를 다시 한번 확인해주세요");
							}
							
						}
					});
				}
					
			}
		});
		
		$("#certification").click(function() {
			chkCurr = moment().format('YYYYMMDDHHmmss');
			if(chkCurr < chkStart || chkCurr > chkEnd) {
				$(".num").hide();
				alertMessage("인증 유효시간이 지났습니다. 인증번호를 재발송 하시기 바랍니다.");
				$("#certificationNo").val("");
				$("#msg").html("");
				$("#msg").html("인증 유효시간이 지났습니다. 인증번호를 재발송 하시기 바랍니다.");
				clearInterval(timer);
			} else {
				if(!chkNo()) {
					$("#msg").html("");
					$("#msg").html("인증번호가 다릅니다.");
				} else if($("#certificationNo").val() == "") {
					$("#msg").html("");
					$("#msg").html("인증번호를 입력해주세요.");
				} else {
					$("#msg").html("인증이 완료되었습니다. <br/> 비밀번호 변경 버튼을 누르시면 비밀번호 변경창으로 넘어갑니다.");
					$("#next").prop("disabled", false);
					$("#next").removeClass("notuse");
					isRunning = false;
					clearInterval(timer);
				}
			}
		});
		
		$("#cancel").click(function() {
			$("#findPassword").modal("hide");
		})

		// ############### 비밀번호 변경 ###############
		$("#targetBtn").click(function() {
			
			var chk = /^[0-9a-zA-Z]{4,}$/;
			
			if(chk.test($("#newPassword").val())) {
				if($("#newPassword").val() == $("#newPasswordCk").val()){
					$.ajax({
						url : "/reservation/changePassword.json" ,
						type : "post" ,
						data : {
							  empMobile   : empMobile
								, newPassword : $("#newPassword").val()
							, certifiNo	: $("#certificationNo").val()
							, empMobile	: empMobile
						} ,
						dataType : "json" , 
						success : function(data) {
							var code = data.code;
							
							if(code == "00") {
								alertMessage("비밀번호 변경이 완료되었습니다.");
								reset();
								//알림톡 전송 필요
								$("#findPassword").modal("hide");
							} else {
								$("#msg").html("비밀번호를 변경할 수 없습니다.");
							}
						}
					});
				}else{
					alertMessage("비밀번호를 다시 한번 확인해주세요.");
				}
			}else{
				alertMessage("비밀번호는 4자리 이상 입력해야 합니다.");
			}
			
		});
		
		// ############### 비밀번호 초기화 ###############
		$("#clearPwBtn").click(function() {
			$.ajax({
				url : "/reservation/resetPassword.json" ,
				type : "post" ,
				data : {
					  resNo       : resNo 
					, empMobile   : empMobile
				} ,
				dataType : "json" , 
				success : function(data) {
					var code = data.code;
					
					if(code == "00") {
						alertMessage("비밀번호가 초기화되었습니다.");
						//알림톡 전송 필요
						$("#findPassword").modal("hide");
						reset();
					} else {
						alertMessage("비밀번호가 초기화에 실패하였습니다.");
					}
				}
			});
		});

	})
</script>

</body>
</html>