<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- SDK 추가 -->
<script src="https://js.tosspayments.com/v2/standard"></script>
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
<div class="modal fade" id="delete" tabindex="-1" role="dialog"
	aria-labelledby="tempTomatoReActInfo" aria-hidden="true"
	style="z-index: 1080">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">안내</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="info-txt mt15" id="deleteMassage"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="tpms-btn add" data-dismiss="modal"
					id="deleteOk">확인</button>
				<button type="button" class="tpms-btn default" class="close"
					data-dismiss="modal" aria-label="Close">취소</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="fileDelete" tabindex="-1" role="dialog"
	aria-labelledby="tempTomatoReActInfo" aria-hidden="true"
	style="z-index: 1080">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">안내</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="info-txt mt15" id="fileDeleteMassage"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="tpms-btn add" data-dismiss="modal"
					id="fileDeleteOk">확인</button>
				<button type="button" class="tpms-btn default" class="close"
					data-dismiss="modal" aria-label="Close">취소</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="flashMessage" tabindex="-1" role="dialog"
	aria-labelledby="tempTomatoReActInfo" aria-hidden="true"
	style="z-index: 9999">
	<div class="alert" role="document">
		<!--alertPd-->
		<div class="alertPd type01">
			<p id="alertMassage"></p>
			<!--btnArea-->
			<div class="btnArea">
				<button type="button" class="button dkBlue" id="flashMessageClose"
					data-dismiss="modal" aria-label="Close">확인</button>
			</div>
			<!--//btnArea-->
			<button type="button" class="button btnClose" data-dismiss="modal"
				aria-label="Close">
				<span class="hidden">닫기</span>
			</button>
		</div>
		<!--//alertPd-->
	</div>
</div>

<div class="modal fade" id="flashMessageNice" tabindex="-1"
	role="dialog" aria-labelledby="tempTomatoReActInfo" aria-hidden="true"
	style="z-index: 9999">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">안내</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p class="info-txt mt15" id="alertflashMessageNice"></p>
			</div>
			<div class="modal-footer">
				<button type="button" id="flashMessageNiceClose"
					class="tpms-btn add" data-dismiss="modal" aria-label="Close">확인</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="loginAlert" tabindex="-1" role="dialog"
	aria-labelledby="loginAlert" aria-hidden="true" style="z-index: 1080">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">안내</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p id="loginMessage" class="info-txt center mt25"></p>
			</div>
			<div class="modal-footer">
				<button type="button" onclick="location.href='/login/loginUsr.do'"
					class="tpms-btn add" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="confirm" tabindex="-1" role="dialog"
	aria-labelledby="tempTomatoReActInfo" aria-hidden="true"
	style="z-index: 1080">
	<div class="alert" role="document">
		<!--alertPd-->
		<div class="alertPd type01">
			<p id="confirmMassage"></p>
			<!--btnArea-->
			<div class="btnArea flex txt-center">
				<button type="button" class="button gray close" id="confirmNo"
					data-dismiss="modal" aria-label="Close">취소</button>
				<button type="button" class="button dkBlue" id="confirmOk">확인</button>
			</div>
			<!--//btnArea-->
			<!-- <button type="button" class="button btnClose" data-dismiss="modal" aria-label="Close"><span class="hidden">닫기</span></button> -->
		</div>
		<!--//alertPd-->
	</div>
</div>


<div class="modal fade" id="memberDeleteConfirm" tabindex="-1"
	role="dialog" aria-labelledby="tempTomatoReActInfo" aria-hidden="true"
	style="z-index: 1080">
	<div class="alert" role="document">
		<!--alertPd-->
		<div class="alertPd type01">
			<p id="memberDeleteMessage"></p>
			<!--btnArea-->
			<div class="btnArea flex txt-center">
				<button type="button" class="button gray close" id="memberDeleteNo"
					data-dismiss="modal" aria-label="Close">취소</button>
				<button type="button" class="button dkBlue" id="memberDeleteOk">확인</button>
			</div>
			<!--//btnArea-->
			<!-- <button type="button" class="button btnClose" data-dismiss="modal" aria-label="Close"><span class="hidden">닫기</span></button> -->
		</div>
		<!--//alertPd-->
	</div>
</div>


<!-- External Scripts -->
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/jquery-2.2.4.min.js"></script>

<script src="/resources/js/bootstrap/bootstrap.min.js"></script>
<script src="/resources/js/moment-2.29.3/package/min/moment.min.js"></script>



<script src="/resources/js/bootstrap-select/bootstrap-select.min.js"></script>
<script src="/resources/js/owlcarousel/owl.carousel.js"></script>
<script src="/resources/js/owlcarousel/owl.autoplay.js"></script>

<!-- iNerv Works Custom -->
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/var.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/ckeditor/sub/js/sub.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/plupload.full.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/jsrender.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/select2.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/i18n/ko.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/works.dialogform.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/cal/DhiccCalPopup.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/showModalDialog.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/utils.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/multiFile.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/attachFile.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/works.js"></script>
<script type="text/javascript" charset="UTF-8" src="/resources/js/ui.js"></script>


<script type="text/javascript" charset="UTF-8"
	src="/resources/js/jquery-ui.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/jquery-cookie.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/pagination.js"></script>

<script type="text/javascript" charset="UTF-8"
	src="/resources/js/swiper/swiper.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/datepicker/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/datepicker/jquery.datetimepicker.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"
	integrity="sha512-rMGGF4wg1R73ehtnxXBt5mbUfN9JUJwbk21KMlnLZDJh7BkPmeovBuddZCENJddHYYMkCh9hPFnPmS9sspki8g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="/resources/js/slick.min.js"></script>

<script type="text/javascript">
	function insertPaymentLog() {
		$.ajax({
			url : "/smartro/insertPaymentLog.json",
			type : "post",
			data : $("#paymentForm").serialize(),
			dataType : "json",
			success : function(data) {
				console.dir(data);
			},
			error : function(error) {
				alert("에러가 발생하였습니다. 관리자에게 문의 바랍니다.");
			}
		});
	}

	/*******************************
	 * PG 결제 URL을 반환
	 *******************************/
	function getPGUrl(formId, mode) {

		var _vResult, _vPcUrl, _vMobileUrl;
		if (mode == "ssb") {
			_vPcUrl = "";
			_vMobileUrl = "";
		} else {
			_vPcUrl = "";
			_vMobileUrl = "";
		}

		var _vFormId = formId ? formId : "paymentForm";
		var _vFilter = "win16|win32|win64|mac|macintel";
		var _vDevice = "";

		if (navigator.platform) {
			if (_vFilter.indexOf(navigator.platform.toLowerCase()) < 0) {
				_vDevice = "mobile";
			} else {
				_vDevice = "pc";
			}
		} else {
			_vDevice = "mobile";
		}

		if (_vDevice == "pc") {
			_vResult = _vPcUrl;
			$("#" + _vFormId).attr("accept-charset", "EUC-KR");
		} else {
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
					<a href="/" title="한국공항공사"> <img
						src="/resources/images/common/logo-w.svg" alt="한국공항공사">
					</a>
				</h1>
				<!-- //logo -->
				<!--gnb-->
				<nav id="gnb" class="web">
					<ul class="depth01">
						<li><a href="/reservation/recheck.do">주차예약</a> <!--depth02-->
							<ul class="depth02">
								<li><a href="/reservation/recheck.do">주차예약 신청</a></li>
								<li><a href="/reservation/resView.do">예약조회/변경</a></li>
							</ul> <!--//depth02--></li>
						<li><a href="/humandiscount/intro.do">다자녀할인등록</a> <!--depth02-->
							<ul class="depth02">
								<li><a href="/humandiscount/intro.do">사전(사후) 등록신청</a></li>
								<li><a href="/humandiscount/viewChk.do">신청내역 확인/변경</a></li>
							</ul> <!--//depth02--></li>
						<li><a href="/refund/privacy.do">주차요금환불</a> <!--depth02-->
							<ul class="depth02">
								<li><a href="/refund/privacy.do">요금 환불 신청</a></li>
								<li><a href="/refund/search.do">신청결과 조회</a></li>
							</ul> <!--//depth02--></li>
						<li class="period"><a href="/period/applyPage.do">상주직원
								정기권</a> <!--depth02-->
							<ul class="depth02">
								<li><a href="/period/noticeList.do">공지사항</a></li>
								<li><a href="/period/applyPage.do">이용안내</a></li>
								<li><a href="/period/periodApply.do">정기권 현황/신청</a></li>
								<li><a href="/period/refundList.do">정기권 환불</a></li>
							</ul> <!--//depth02--></li>
						<li><a href="/notice/notice.do">이용안내</a> <!--depth02-->
							<ul class="depth02">
								<li><a href="/notice/notice.do">이용안내</a></li>
								<li><a href="/notice/questionsList.do">자주묻는 질문</a></li>
								<li><a href="/notice/privacyInfo.do">개인정보처리방침</a></li>
							</ul> <!--//depth02--></li>
					</ul>

				</nav>
				<!--//gnb-->
				<!--btnMoGnb-->
				<button type="button" class="btnMoGnb mobile">
					<span class="hidden">모바일gnb버튼</span>
				</button>
				<!--//btnMoGnb-->

				<!--moGnb-->
				<div class="moGnb mobile">
					<div class="inner pos-r">
						<!-- logo -->
						<h1 class="logo">
							<a href="#" title="한국공항공사"> <img
								src="/resources/images/common/logo-w.svg" alt="한국공항공사">
							</a>
						</h1>
						<!-- //logo -->
						<!--depth01-->
						<ul class="depth01">
							<li><a href="/reservation/recheck.do">주차예약</a> <!--depth02-->
								<ul class="depth02">
									<li><a href="/reservation/recheck.do">주차예약 신청</a></li>
									<li><a href="/reservation/resView.do">예약조회/변경</a></li>
								</ul> <!--//depth02--></li>
							<li><a href="/humandiscount/intro.do">다자녀할인등록</a> <!--depth02-->
								<ul class="depth02">
									<li><a href="/humandiscount/intro.do">사전(사후) 등록신청</a></li>
									<li><a href="/humandiscount/viewChk.do">신청내역 확인/변경</a></li>
								</ul> <!--//depth02--></li>
						</ul>
						<ul class="depth01">
							<li><a href="/refund/privacy.do">주차요금환불</a> <!--depth02-->
								<ul class="depth02">
									<li><a href="/refund/privacy.do">요금 환불 신청</a></li>
									<li><a href="/refund/search.do">신청결과 조회</a></li>
								</ul> <!--//depth02--></li>
							<li><a href="/period/applyPage.do">상주직원 정기권</a> <!--depth02-->
								<ul class="depth02">
									<li><a href="/period/noticeList.do">공지사항</a></li>
									<li><a href="/period/applyPage.do">이용안내</a></li>
									<li><a href="/period/periodApply.do">정기권 현황/신청</a></li>
									<li><a href="/period/refundList.do">정기권 환불</a></li>
								</ul> <!--//depth02--></li>
						</ul>
						<ul class="depth01" style="width: 50%;">
							<li><a href="/notice/notice.do">이용안내</a> <!--depth02-->
								<ul class="depth02">
									<li><a href="/notice/notice.do">이용안내</a></li>
									<li><a href="/notice/questionsList.do">자주묻는 질문</a></li>
								</ul> <!--//depth02--></li>
						</ul>
						<!--//depth01-->
						<button type="button" class="button gnbClose">
							<span class="hidden">닫기</span>
						</button>
					</div>
				</div>
				<!--//moGnb-->
			</div>
			<!--//inner-->

			<div class="header-sub-bg"></div>


		</header>
		<script type="text/javascript">
			$(function() {
				jQuery.datetimepicker.setLocale('ko');
				moment.locale('ko');
			});
		</script>
	</header>
	<main id="container">
		<h2 class="hidden">본문 시작</h2>





		<form name="mainManageLeftForm" id="mainManageLeftForm" method="post">
			<input type="hidden" name="menuParamNo" value="10000" /> <input
				type="hidden" name="upperMenuParamId" value="0" /> <input
				type="hidden" name="subMenu1" value="0" /> <input type="hidden"
				name="subMenu2" value="0" />
		</form>

		<script type="text/javaScript" language="javascript" defer="defer">
			function fCallUrl(menuNo, upperMenuId, url) {
				var form = document.mainManageLeftForm;
				form.subMenu1.value = menuNo;
				form.subMenu2.value = upperMenuId;
				form.upperMenuParamId.value = upperMenuId;
				form.action = '' + url;
				form.submit();
			}

			function pop_up(url) {
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
						<li class="active"><a href="/reservation/recheck.do">주차예약
								신청</a></li>
						<li><a href="/reservation/resView.do">예약조회/변경/취소</a></li>
					</ul>
				</div>
			</div>
			<!--//subMenu-->
			<!--subMenu-->
			<div class="subMenu mobile">
				<a>주차예약 신청</a>
				<ul>
					<li><a href="/reservation/recheck.do" title="새 창 열림">주차예약
							신청</a></li>
					<li><a href="/reservation/resView.do" title="새 창 열림">예약조회/변경/취소</a></li>
				</ul>
			</div>
			<!--//subMenu-->
		</div>
		<form id="reservationVO" name="reservationVO"
			action="/reservation/resInsert.do" method="post">
			<input type="hidden" id="resInDttm" name="resInDttm"
				value="2024-10-25 08:00:00" /> <input type="hidden" id="resOutDttm"
				name="resOutDttm" value="2024-10-28 00:00:00" /> <input
				type="hidden" id="airportNm" name="airportNm" value="김포공항" /> <input
				type="hidden" id="parkingName" name="parkingName"
				value="국내선 제2주차장 주차타워 2, 3층" /> <input type="hidden" id="sectnId"
				name="sectnId" value="2" /> <input type="hidden" id="parkingDivCd"
				name="parkingDivCd" value="PLT-002" /> <input type="hidden"
				id="carKind" name="carKind" value="DC001" /> <input type="hidden"
				id="calculateAmt" name="calculateAmt" /> <input type="hidden"
				id="depositAmt" name="depositAmt" /> <input type="hidden"
				id="receiptAmt" name="receiptAmt" /> <input type="hidden"
				id="discountAmt" name="discountAmt" value="0" /> <input
				type="hidden" id="paymentAmt" name="paymentAmt" />


			<div id="content">
				<div class="inner">
					<!--location-->




					<div class="location">
						<h4 class="subTitle">주차예약</h4>
						<!--breadcrumb-->
						<ul class="breadcrumb web">
							<li><a href="/" class="home">Home</a></li>
							<li><a href="/reservation/recheck.do">주차예약</a></li>
							<li><a href="/reservation/recheck.do">주차예약(주차조회)</a></li>
						</ul>
						<!--//breadcrumb-->
					</div>

					<script>
						function fCallUrl(menuNo, upperMenuId, url) {
							var form = document.mainManageLeftForm;
							form.subMenu1.value = menuNo;
							form.subMenu2.value = upperMenuId;
							form.upperMenuParamId.value = upperMenuId;
							form.action = '<c:out value=""/>' + url;
							form.submit();
						}
					</script>
					<!--//location-->
					<div id="subCont">
						<ul class="tabMenu">
							<li><span>예약가능조회</span></li>
							<li class="active"><span>예약신청</span></li>
							<li><span>예약확인</span></li>
						</ul>
						<div class="section">
							<p class="titPage">예약신청</p>
							<!--table-->
							<div class="table type03">
								<table>
									<caption>예약/예약대기 신청 테이블이며 예약일시, 예약주차, 차량번호, 차량종류,
										휴대전화번호, 이메일주소 등의 정보를 나타냅니다.</caption>
									<colgroup>
										<col style="width: 17%; min-width: 100px;">
										<col style="width: auto">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">예약일시</th>
											<td>2024-10-25 08:00:00 ~ 2024-10-28 00:00:00</td>
										</tr>
										<tr>
											<th scope="row">예약주차</th>
											<td>김포공항 국내선 제2주차장 주차타워 2, 3층

												<p class="colorType green">
													<span class="colorType red">* 주차타워 내에 엘리베이터 또는
														에스컬레이터가 마련되어 있지 않습니다. 일행 중 보행이 불편하신 분이 있는 경우 예약 주차서비스 대신
														국내선 제1주차장 또는 국내선 제2주차장 1층을 이용하시기 바랍니다.</span>
												</p>

											</td>
										</tr>
										<tr>
											<th scope="row"><label for="carNo">차량번호<span
													class="redDot" title="필수입력">*</span></label></th>
											<td><input id="carNo" name="carNo" title="차량번호 입력"
												placeholder="예) 00가0000, 서울00가0000, 외교000000" type="text"
												class="valid"
												oninput="this.value = this.value.replace(/\s| /gi,&#39;&#39;);"
												value="" />
												<p class="colorType green">* 영업용 등 특수차량의 경우 지역명을 포함한
													차량번호 전체를 입력하여야 예약주차장 입차가 가능합니다. 예) 차량번호가 ‘서울12사1234’인 경우
													‘12사1234’로 입력 시 입차불가</p></td>
										</tr>
										<tr>
											<th scope="row"><label for="">할인차량유형</th>
											<td><select id="discountCd" name="discountCd"
												title="할인유형 선택">
													<option value="DC001">(할인없음) 일반차량</option>
													<option value="DC005">(50%) 경형자동차, 저공해(1,2종),
														국가유공상이자, 장애인자동차, 다자녀가구</option>
													<option value="DC007">(20%) 저공해(3종)</option>
											</select>
												<p class="colorType green">
													* 예상주차금액 조회를 위한 할인차량유형 선택이며, <span class="colorType red">다자녀할인의
														경우 별도 사전등록하지 않으면 현장할인이 불가합니다.</span>(상단 다자녀할인등록 메뉴에서 등록신청)
												</p></td>
											<!-- <td>
												<button type="button" class="button dkBlue"
													id="discountAmtCalBtn">
													할인금액조회
												</button>
												<div class="flex discountAmtCalDiv">
													<p>할인유형 : </p>
													<input type="text" id="discount"
														class="colorType red w728"
														placeholder="차량번호 입력 후 할인적용 버튼을 눌러주세요" title="할인유형"
														readonly />
													<p>할인금액 : </p>
													<input type="text" id="discountAmtCal"
														class="colorType red w728"
														placeholder="차량번호 입력 후 할인적용 버튼을 눌러주세요" title="할인적용되는 금액"
														readonly />
												</div>
											</td> -->
										</tr>
										<tr>
											<th scope="row"><label for="mobile">휴대전화번호<span
													class="redDot" title="필수입력">*</span></label></th>
											<td><input id="mobile" name="mobile" title="휴대전화번호 입력"
												placeholder="예) 01012345678" type="text" class="valid"
												oninput="this.value = this.value.replace(/[^0-9]/g, &#39;&#39;).replace(/(\..*)\./g, &#39;$1&#39;);"
												value="" /></td>
										</tr>
										<tr>
											<th scope="row"><label for="email">이메일주소</label></th>
											<td><input id="email" name="email" title="이메일주소 입력"
												placeholder="예) iam@domain.com" type="text" value="" /></td>
										</tr>
										<tr>
											<th scope="row"><label for="password">비밀번호<span
													class="redDot" title="필수입력">*</span></label></th>
											<td><input id="password" name="password" title="비밀번호 입력"
												minlength="4" placeholder="4자리 이상 입력" type="password"
												class="valid" value="" /></td>
										</tr>
										<tr>
											<th scope="row"><label for="passwordCk">비밀번호 확인<span
													class="redDot" title="필수입력">*</span></label></th>
											<td><input type="password" id="passwordCk"
												title="비밀번호확인 입력" class="" placeholder="4자리 이상 입력"
												minlength="4" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!--//table-->
						</div>
						<!--//section-->
						<!--section-->
						<div class="section">
							<p class="titPage sm">주차예약보증금 선결제</p>
							<button class="button" style="margin-top: 30px"
								onclick="requestPayment()">결제하기</button>


							<!--web table-->
							<div class="table type01 web">
								<table>
									<caption>주차요금 테이블이며, 예상주차요금, 선결제 할인 요금 등을 나타냅니다.</caption>
									<colgroup>
										<col style="width: 25%;">
										<col style="width: auto">
										<col style="width: 25%;">
										<col style="width: auto">
										<!-- <col style="width: 17%;">
										<col style="width: auto"> -->
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">예상 주차요금<br /> <span
												class="colorType red boldFont">(출차 시 결제)</span></th>
											<td><p name="ccAmt" />원</td>
											<th scope="row">예약 보증금</br> <span
												class="colorType red boldFont">(선결제 필요)</span></th>
											<td><span class="colorType red"><p name="dpsAmt" />원</span></td>
											<!-- <th scope="row">예상 현장결제요금</th>
											<td><strong><p id="rcpAmt" />원</strong></td> -->
										</tr>
									</tbody>
								</table>
							</div>
							<!--//web table-->
							<!--mobile table-->
							<div class="table type01 mobile">
								<table>
									<caption>주차요금 테이블이며, 예상주차요금, 선결제 할인 요금 등을 나타냅니다.</caption>
									<colgroup>
										<col style="width: 48%;">
										<col style="width: auto">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">총 주차요금</th>
											<td><p name="ccAmt" />원</td>
										</tr>
										<tr>
											<th scope="row">예약 보증금</br>(선결제 필요)
											</th>
											<td><span class="colorType red"><p name="dpsAmt" />원</span></td>
										</tr>
										<!-- <tr>
											<th scope="row">예상 현장결제요금</th>
											<td><strong><p id="rcpAmt" />원</strong></td>
										</tr> -->
									</tbody>
								</table>
							</div>
							<!--//mobile table-->
							<p class="colorType green">
								※ <span class="colorType red boldFont">예상 주차요금</span>은 <span
									class="colorType red boldFont">출차 시 결제하셔야 할 요금</span>이며, 현
								단계에서는 <span class="colorType red boldFont">예약보증금 10,000원만
									선결제 함으로써 예약이 완료</span>됩니다.
							</p>
							<p class="colorType green">
								※ 출차시 주차요금을 결제 하시면 <span class="colorType red boldFont">선결제한
									예약보증금은 자동 환불처리</span> 됩니다. (단, 수수료 발생 시 수수료 제외한 금액 환불)
							</p>
						</div>
						<!--//section-->
						<!--section-->
						<div class="section">
							<p class="titPage sm">※ 예약취소 및 미입차 시 수수료 부과기준</p>
							<!--table-->
							<div class="table type04 sm scroll-x w335">
								<table>
									<caption>예약취소 및 미입차 시 수수료 부과기준 정보를 나타냅니다.</caption>
									<colgroup>
										<col style="width: 33.333%; min-width: 80px;">
										<col style="width: 33.333%; min-width: 220px;">
										<col style="width: 33.333%; min-width: 140px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="2">구분</th>
											<th scope="col">예약취소 수수료</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" rowspan="3" class="sky">예약취소</th>
											<td>입차 예정시간 1시간 전</td>
											<td>없음</td>
										</tr>
										<tr>
											<td>입차 예정시간 1시간 전 예약 후 20분이내 취소시</td>
											<td>없음</td>
										</tr>
										<tr>
											<td>입차 예정시간 1시간전 ~ 입차 예정시간 2시간 경과까지</td>
											<td>예약보증금의 50%</td>
										</tr>
										<tr>
											<th scope="row" class="sky">예약부도(No-show)</th>
											<td>입차 예정시간 2시간 이후</td>
											<td>예약보증금의 100%</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!--//table-->
							<p class="colorType green">※ 예약 보증금 및 주차요금</p>
							<p class="colorType green">&emsp;- 예약보증금 : 10,000원</p>
							<p class="colorType green">&emsp;- 정상산방법 : 예약주차장을 이용한 차량은
								주차요금만 부과되며, 예약보증금은 환불조치 됨 (단, 수수료 발생 시 수수료 제외금액 환불)</p>
							<!--checkArea-->
							<div class="checkArea txt-right">
								<p class="checkbox">
									<input type="checkbox" id="agree04" class="hidden"
										title="동의 체크"> <label for="agree04"
										class="colorType red">예약취소 또는 예약부도(미입차) 시 예약 취소수수료가
										부과됨을 확인하였습니다.</label>
								</p>
							</div>
							<!--//checkArea-->
						</div>
						<!--//section-->
						<!--section-->
						<div class="section">
							<p class="titPage sm">주차예약 이용안내</p>
							<!--txtInfo-->
							<div class="txtInfo">
								<div class="txtBox reserve" title="주차예약 이용안내 내용" tabindex="0">
									<div class="termsBox">
										[전국공항 주차장 예약서비스 이용약관]<br> <br> 제1장 총칙<br>
										제1조(목적) 이 약관은 한국공항공사(이하 ‘공사’라 한다)가 관리・운영하는 공항 예약 주차장에서 공사와 주차장
										예약 서비스 이용자 사이의 권리와 의무, 책임・준수사항 등을 정하는 것을 목적으로 한다. <br> <br>
										제2조(정의) 이 약관에서 사용하는 용어의 정의는 다음 각 호와 같다. <br> 1. “주차장”이란
										공사가 직접 또는 위탁용역으로 관리・운영하는 주차장을 말한다. <br> 2. “예약 주차장”이란 공항
										주차장 중 예약하여 이용할 수 있는 주차장을 말한다. <br> 3. “주차장 예약서비스”란 인터넷을
										통해 공항 예약 주차장 내 주차공간을 미리 예약하는 서비스를 말한다. <br> 4. “이용자”라고 함은
										본 약관에 동의하고 공사가 제공하는 주차장의 예약서비스를 이용하는 자를 말한다. <br> 5.
										“예약부도”란 예약을 해놓고 아무런 연락 없이 나타나지 않는 것을 말한다. <br> <br>
										제3조(적용 등)<br> ① 이 약관은 공사가 제공하는 주차장 예약 서비스 및 이에 부대하는 모든
										업무에 적용한다. <br> ② 이 약관에서 정하지 않은 사항은 법령 또는 공사 주차장관리운영예규를
										적용한다.<br> <br> 제4조(약관의 변경)<br> ① 공사는 적용법령의 개정,
										정부의 명령・지시 또는 공사가 필요한 경우에는 이 약관을 변경 할 수 있다. <br> ② 제1항에 따라
										약관을 변경한 경우 공사는 인터넷 홈페이지 등에 변경사항을 게시한다. 이 때 이용자의 명시적인 이의가 없는 경우
										이용자는 변경된 약관에 동의하는 것으로 간주한다.<br> 제5조(이용자 정보 사용에 대한 동의) ①
										이용자의 개인정보는 개인정보보호법에 의하여 보호된다.<br> ② 공사는 주차장 예약서비스 제공과
										관련해서 수집한 이용자의 정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않는다. 단, 법률의 규정에 의하여
										적법한 절차에 따라 요청이 있는 경우는 예외로 한다.<br> <br>
									</div>
									<div class="termsBox">
										제2장 주차장 예약서비스 이용계약<br> <br> 제6조(주차장 예약서비스 이용계약의 성립)
										<br> ① 본 약관에 따른 이용계약은 이용자가 본 약관에 대한 동의와 함께 서비스에 대한 이용신청을
										하고 예약이 확정됨으로써 성립한다.<br> ② 예약 주차장을 이용하고자 할 경우 온라인(인터넷
										홈페이지, 웹, 모바일 앱)으로 접수 신청을 하여야 한다. <br> ③ 주차장 예약은 예약신청 시점부터
										45일 후까지로 예약일을 지정할 수 있고, 최소 2시간부터 최대 30일까지 예약할 수 있다.<br> ④
										이용자는 여러 대의 차량을 예약 신청하거나, 동일 차량에 대하여 여러 차례 예약 신청할 수 있다. 단, 동일
										차량을 여러 차례 예약 신청하는 경우 일정이 중복되도록 예약하는 것은 불가하다.<br> <br>
										제7조(예약 확인)<br> ① 예약번호는 예약 접수 완료 시 생성되며 공사는 이용자에게 SMS 또는
										E-mail 등을 통하여 예약내역을 통지한다. <br> ② 예약접수 이후 예약을 확인하고자 하는
										경우에는 예약번호, 차량번호, 이메일 중 한 가지를 기재하고, 이후 예약 시 입력하였던 휴대전화번호 및
										비밀번호도 함께 기재하여야 한다.<br> <br> 제8조(예약 변경)<br> ①
										이용자는 다음 각 호에 해당하는 경우 예약의 변경 신청을 할 수 있다. <br> 1. 입차 예정시간
										1시간 전까지 신청하는 경우<br> 2. 입차 예정시간 전 1시간 이내에 예약한 경우에는 예약
										신청시간으로부터 20분 이내 신청하는 경우 <br> ② 고객의 이용 희망일 예약 주차장 잔여면 수가
										충분하지 않을 경우(이하 “만차”이라 한다) 예약의 변경이 불가능 할 수 있다. <br> <br>
										제9조(예약 주차장 이용 및 입차 제한) <br> ① 입차는 예약 입차시간 기준 2시간 전부터 2시간
										후까지 가능하다.<br> ② 이용자는 다음 절차에 따라 공사 직원의 지시를 준수하며 예약 주차 공간을
										이용 하여야 한다.<br> 1. 예약된 입차 시간까지 예약 주차장 입구에 도착<br> 2.
										예약 주차 입구로 진입하여 차량번호 인식 후 입차<br> 3. 예약 주차장 내 비어 있는 주차면에 주차<br>
										4. 출차 시, 예약 주차장 출구를 통해 출차<br> ③ 장애인 차량의 경우 장애인 전용 주차면을
										예약하고 이용할 수 있다. 단, 장애인 자동차 표지가 부착된 자동차에 보행상 장애가 있는 자가 탑승한 경우에만
										주차할 수 있고, 이를 위반한 자가 이용하는 경우에는 관련법에 따라 과태료를 부과 받을 수 있다.<br>
										④ 공사는 다음 각 호의 사유가 있는 경우 예약서비스 이용자의 입차를 제한할 수 있다.<br> 1.
										예약 주차장의 주차단위구획(주차빌딩 등인 경우 높이 포함)을 벗어나는 차량<br> 2. 위험물을
										적재하였거나 악취를 현저하게 발생시키는 차량<br> 3. 자동차의 구조상 주차가 불가능하거나 곤란한
										경우<br> 4. 주차장 설비 및 다른 차량을 손상할 우려가 있는 차량<br> 5. 주차장
										내에서 공사의 승인을 받지 않은 영업행위를 하는 차량<br> 6. 이륜자동차<br> 7. 기타
										주차장 관리에 지장이 있는 차량이 주차하려고 할 때<br> <br>
									</div>
									<div class="termsBox">
										제3장 주차요금 및 환불규정<br> 제10조 (예약 보증금 및 주차요금) <br> ① 이용자는
										아래와 같이 예약 보증금을 부담하고 제11조와 같이 각 공항 주차장의 주차요금 산정방법에 따라 정산한다. <br>
										1. 예약 보증금 : 10,000원 (vat 포함) <br> ② 주차요금 면제 및 감면 등은
										주차장관리운영예규 제8조를 준용하여 적용한다. <br> <br> 제11조 (주차요금 정산) ①
										예약 주차장을 이용한 차량은 주차장 출차 시, 예약 주차장 출구를 통해 출차하며, 예약 보증금으로 선 정산되며
										추가 정산이 필요한 차량은 사전 무인정산기 또는 주차장 출구 등에서 정산 후 출차한다. <br> ②
										주차요금은 입차시간 및 출차시간을 기준으로 정산하는 것을 원칙으로 한다. <br> <br>
										제12조 (예약부도 패널티)<br> ① 입차 예정시간 2시간이 경과하는 때까지 입차하지 아니하는 경우
										예약부도(No-show)로 간주한다. <br> ② 예약부도시 위약금은 예약 보증금의 100%로 한다.<br>
										③ 예약일 기준 1년간 2회 이상 예약부도 시 예약 출차일로부터 3개월 동안 공항 주차 예약서비스를 이용할 수
										없다. <br> <br> 제13조 (예약 취소 및 환불 처리)<br> ① 제8조
										제1항 각 호에 해당하여 예약을 취소하는 경우 전액 환불이 가능하나, 제8조 제1항 각 호에서 규정한 시간보다
										임박하여 예약을 취소하는 경우 위약금 공제 후 환불이 가능하다. 구체적인 산정방법은 아래와 같다.<br>
										1. 예약시점 ∼ 입차 예정시간 1시간 전까지 : 전액 환불<br> 2. 입차 예정시간 1시간 전 ∼
										입차 예정시간 2시간 경과까지 : 예약 보증금 50% 환불 (50% 위약금)<br> 3. 입차 예정시간
										2시간 이후(예약부도) ∼ : 환불 불가<br> 4. 입차 예정시간 1시간 전 구매 후 20분 이내
										취소 시 : 전액 환불<br> ② 공사는 환불 처리 시 이용자의 성명, 연락처, 환불적용계좌,
										환불금액, 환불사유 확인을 추가로 요구 할 수 있다.<br> ③ 공항의 책임으로 인한 예약취소는 수수료
										없이 전액 환불이 원칙이나 아래와 같은 사유로 인한 예약취소는 환불에서 제외된다.<br> 1. 전쟁이나
										전쟁의 위협, 폭동, 내란, 테러<br> 2. 자연·방사능 재난, 화재, 노동쟁의, 악천후, 화산폭발
										또는 화산재<br> 3. 정부규제, 항공 스케쥴의 변경 또는 취소<br> <br>
									</div>
									<div class="termsBox">
										제4장 이용제한 및 면책사항<br> 제14조 (예약서비스 이용의 제한 및 일시적 중단) 공사는 이용자에
										대해 다음에 제시하는 사유가 있을 경우 예약 서비스가 제한되거나 일시적으로 중단될 수 있다.<br>
										1. 예약 주차장이 만차인 경우<br> 2. 예약 접수가 불가능한 날짜에 예약을 신청하는 경우<br>
										3. 시스템에 보수공사가 필요하거나 부득이한 장애가 있는 등 기술적인 문제로 서비스 제공이 불가능한 경우<br>
										4. 지진, 화재, 정전, 홍수, 해일, 분화, 폭동, 소요, 전쟁, 그 외의 비상사태로 인해 서비스 제공을
										정상적으로 할 수 없게 된 경우<br> 5. 회사에 긴급한 사정이 있거나, 이용자의 정당한 권리 침해
										방지 등을 위해 필요한 경우<br> 6. 기타 공사의 사정상 이용자의 서비스 이용을 제한하거나
										일시적으로 중단할 필요성이 있는 경우<br> 제15조(이용자에 대한 서비스 이용정지) 공사는 이용자에
										대해 다음에 제시하는 몇 가지 사유가 있을 경우 서비스 이용을 통지 및 권고 없이 정지할 수 있다.<br>
										① 이용자가 본 규약을 위반한 경우<br> ② 이용자가 관리자에게 허위의 정보를 등록한 경우<br>
										③ 기타 관리자가 본 서비스 이용자로서 부적합하다고 판단하는 경우<br> <br>
										제16조(공사의 책임 및 면책사항)<br> ① 공사는 이용자가 본 서비스를 안정적으로 이용 할 수
										있도록 서비스를 운영하여야 하며 서비스용 설비에 장애가 발생하는 경우 그 설비를 수리하거나 복구할 의무가 있다.
										② 제1항에도 불구하고, 공사는 다음 각 호의 책임이 면제된다.<br> 1. 서비스 장애가 발생하여
										예약서비스가 제한되거나 일시적으로 중단, 지연되는 경우의 책임<br> 2. 이용자의 귀책사유로 발생하는
										손해에 대한 책임<br> 3. 이용자가 등록한 정보가 설비 고장 등으로 인해 멸실됨에 따라 이용자에게
										생긴 손해에 대한 책임<br> 4. 이용자가 서비스 이용과 관련하여 이용자간에 발생한 손해 중 이용자의
										고의, 과실에 의한 손해 및 타 이용자로 인하여 입게 되는 피해에 대하여 보상할 책임<br> <br>
									</div>
									<div class="termsBox">
										제5장 기타<br> 제17조(관할법원) 서비스 이용으로 발생한 분쟁에 대한 소송은 공사 본사 소재지를
										관할하는 법원을 관할법원으로 한다.<br> <br> 부칙 <2022. 9. 20><br>
										<br> 이 약관은 2022년 9월 20일부터 시행한다.
									</div>
								</div>
							</div>
							<!--//txtInfo-->
							<!--checkArea-->
							<div class="checkArea">
								<p class="checkbox">
									<input type="checkbox" id="agree01" class="hidden"
										title="동의 체크"> <label for="agree01"
										class="colorType red">주차예약 이용안내 모든 내용을 읽고 동의합니다.</label>
								</p>
							</div>
							<!--//checkArea-->
						</div>
						<!--//section-->

						<!--section-->
						<div class="section">
							<p class="titPage sm">개인정보 수집·이용동의</p>
							<p class="">
								한국공항공사는 주차예약 서비스 제공을 위해 아래와 같이 개인정보를 수집·이용·제공하고 있습니다.<br /> <br />
								□ 개인정보의 수집·이용에 관한 사항 (필수)
							</p>
							<!--txtInfo-->
							<div class="txtInfo">
								<div class="txtBox reserve" title="개인정보 수집·이용동의 내용" tabindex="0">
									<div class="termsBox">
										○ 수집·이용 목적 : 주차장 예약서비스 이용 및 관리 <br /> ○ 수집하는 항목 :차량번호,
										휴대전화번호, 예약비밀번호, 할인유형 <br /> ○ 보유·이용 기간 : <span
											class="termsPoint2">3년</span> <br /> ※ 위의 개인정보 수집·이용 필수항목에
										대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 주차예약 서비스가 제한됨을 알려드립니다. <br />
									</div>
								</div>
							</div>
							<!--checkArea-->
							<div class="checkArea">
								<p class="checkbox">
									<input type="checkbox" id="agree05" class="hidden"
										title="동의 체크"> <label for="agree05"
										class="colorType red">개인정보 수집·이용에 동의합니다.</label>
								</p>
							</div>
							<!--//checkArea-->
						</div>
						<!--//section-->

						<!--section-->
						<!-- !!!!!!! -->
						<div class="section">
							<div class="flex row1">
								<p class="titPage sm">개인정보 처리방침</p>
								<button type="button" class="button white"
									onclick="privacyButton(); return false;">개인정보처리방침</button>

								<!--개인정보처리방침 팝업-->
								<div class="popup scroll privacyPopup" style="display: none;">
									<div class="popupPd">
										<div class="popHead">개인정보처리방침</div>
										<div class="popCont">
											<div class="policy">
												<div class="notice">
													<ul>
														<li>한국공항공사는 취급하는 모든 개인정보에 대해서 관련법령에 근거하거나 정보주체의 동의에
															의하여 수집·보유 및 처리하고 있습니다.</li>
														<li>한국공항공사는 개인정보보호법 제30조(개인정보 처리방침의 수립 및 공개)에 따라
															정보주체의 개인정보보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록
															다음과 같이 개인정보 처리방침을 수립·공개하고 있습니다.</li>
													</ul>
												</div>

												<section>
													<p class="titPage">개인정보 자동 수집 장치의 설치·운영 및 그 거부에 관한 사항</p>
													<ul class="list_dotBlue">
														<li>한국공항공사는 이용자의 웹사이트 방문기록 파악을 위해 이용정보를 저장하고 불러오는
															''쿠키(cookie)''를 사용합니다.</li>
														<li>쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게
															보내는 소량의 정보이며 이용자의 PC 내의 하드디스크에 저장되기도 합니다.
															<ul class="list_dotblack_s">
																<li>쿠키의 사용목적 : 이용자의 웹사이트 방문 기록을 파악하여 이용자에게 최적화된 정보를
																	제공하는데 사용됩니다.</li>
																<li>쿠키의 설치·운영 및 거부 : 웹브라우저 상단의 도구→인터넷옵션→개인정보 메뉴의 옵션
																	설정을 통해 쿠키 저장을 거부할 수 있습니다.</li>
															</ul>
														</li>
													</ul>
												</section>

												<section>
													<p class="titPage">개인정보 보호책임자</p>
													<p class="subTxt">한국공항공사는 개인정보 처리에 관한 업무를 총괄해서 책임지고,
														개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보보호책임자를
														지정하고 있습니다.</p>
													<div class="table type04 colType">
														<table>
															<caption>
																<p>개인정보 보호책임자, 개인정보 보호담당자 항목 순으로 개인정보 보호책임자 정보</p>
															</caption>
															<colgroup>
																<col style="width: 50%;">
																<col style="width: 50%;">
															</colgroup>
															<thead>
																<tr>
																	<th colspan="2" scope="col">개인정보 보호책임자</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>담당부서</td>
																	<td>사이버보안센터</td>
																</tr>
																<tr>
																	<td>성 명</td>
																	<td>홍 기 철</td>
																</tr>
																<tr>
																	<td>전 화</td>
																	<td>02-2660-2681<br>(FAX)02-2660-2690
																	</td>
																</tr>
																<tr>
																	<td>전자우편</td>
																	<td>kchong@airport.co.kr</td>
																</tr>
															</tbody>
														</table>
														<br>
													</div>
													<div class="table type04 colType">
														<table>
															<caption>
																<p>개인정보 보호책임자, 개인정보 보호담당자 항목 순으로 개인정보 보호책임자 정보</p>
															</caption>
															<colgroup>
																<col style="width: 20%;">
																<col style="width: 40%;">
																<col style="width: 40%;">
															</colgroup>
															<thead>
																<tr>
																	<th colspan="3" scope="col">개인정보 보호담당자</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>담당부서</td>
																	<td colspan="2">사이버보안센터</td>
																</tr>
																<tr>
																	<td>성 명</td>
																	<td>김 수 진</td>
																	<td>조 경 현</td>
																</tr>
																<tr>
																	<td>전 화</td>
																	<td>02-2660-2686<br>(FAX)02-2660-2690
																	</td>
																	<td>02-2660-2677<br>(FAX)02-2660-2690
																	</td>
																</tr>
																<tr>
																	<td>전자우편</td>
																	<td>tnwls654@airport.co.kr</td>
																	<td>ckg3597@airport.co.kr</td>
																</tr>
															</tbody>
														</table>
														<br>
													</div>
													<p class="subTxt">정보주체는 한국공항공사의 서비스를 이용하시면서 발생한 모든 개인정보
														보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수
														있습니다. 한국공항공사는 정보주체의 문의에대해 지체 없이 답변 및 처리해드릴 것입니다.</p>
												</section>

												<p class="noTxt">자세한 내용은 홈페이지 하단의 개인 정보처리 방침을 확인해 주세요.</p>
											</div>
											<button type="button" class="button btnClose">
												<span class="hidden">닫기</span>
											</button>
										</div>
									</div>
								</div>
								<div id="dimmed" style="display: none;"></div>
								<!--checkArea-->
								<div class="checkArea">
									<p class="checkbox">
										<input type="checkbox" id="agree02" class="hidden"
											title="동의 체크"> <label for="agree02"
											class="colorType red">개인청보처리방침의 모든 내용을 읽고 동의합니다.</label>
									</p>
								</div>
								<!--//checkArea-->
							</div>
						</div>
						<!--//section-->
						<!--section-->
						<div class="section"">
							<p class="titPage sm">주차장 위치</p>
							<div class="mapArea" style="text-align: center;">
								<img src="/resources/images/parkingImg/sectnId2.png" alt="지도영역">
							</div>
							<!--checkArea-->
							<div class="checkArea txt-right">
								<p class="checkbox">
									<input type="checkbox" id="agree03" class="hidden"
										title="동의 체크"> <label for="agree03"
										class="colorType red">예약주차존 위치를 확인하였으며, 예약주차존 외 구역에 주차
										후 예약 미취소 시 보증금 환불 불가함을 확인하였습니다.</label>
								</p>
							</div>
							<!--//checkArea-->
						</div>
						<!--//section-->
						<!--btnArea-->
						<div class="btnArea txt-center mt40">
							<div id="paymentDiv"></div>
							<button type="button" class="button dkBlue" id="reservationBtn">예약</button>
						</div>
						<!--//btnArea-->
					</div>
				</div>
			</div>
		</form>
	</main>
	<footer>





		<!--aside-->
		<div id="aside" class="">
			<div class="pos-r">
				<div class="asideToggle">
					<a href="javascript:void(0);">주차요금 간편계산</a>
				</div>

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
								<caption>주차요금 간편 계산 테이블이며 공항, 주차장, 할인유형, 이용일시 등의 정보를
									나타냅니다.</caption>
								<colgroup>
									<col style="width: 24%; min-width: 100px;">
									<col style="width: auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" class="txt-left"><label for="parkingCd">공항<span
												class="redDot" title="필수입력">*</span></label></th>
										<td><select name="parkingCd" id="parkingCd" class=""
											title="공항 선택">
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


										</select></td>
									</tr>
									<tr>
										<th scope="row" class="txt-left"><label for="parkingLot">주차장<span
												class="redDot" title="필수입력">*</span></label></th>
										<td><select name="parkingLot" id="parkingLot" class=""
											title="주차장 선택">
												<option value="">주차장을 선택해주세요.</option>

										</select></td>
									</tr>
									<tr>
										<th scope="row" class="txt-left"><label
											for="discountType">할인유형<span class="redDot"
												title="필수입력">*</span></label></th>
										<td><select id="discountType" name="discountType"
											title="할인유형 선택">
												<option value="DC001">일반</option>
												<option value="DC005">경차</option>
												<option value="DC002">장애인(1~3급)</option>
												<option value="DC003">장애인(4~6급)</option>
												<option value="DC006">저공해(1,2종)</option>
												<option value="DC007">저공해(3종)</option>
												<option value="DC012">다자녀</option>
										</select></td>
									</tr>
									<tr>
										<th scope="row" class="txt-left"><label for="">이용일시<span
												class="redDot" title="필수입력">*</span></label></th>
										<td>
											<div class="flex">
												<input type="text" id="inDttm" class="cal picker"
													title="이용시작날짜 입력" readonly="readonly"> <span
													class="hyphen">-</span> <input type="text" id="outDttm"
													class="cal picker" title="이용종료날짜 입력" readonly="readonly">
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
						<div class="skyBox">
							<p id="amt" />
							예상 주차요금은 &nbsp;원 입니다.
						</div>
						<p class="colorType green">* 예상 주차요금은 실제 요금과 차이가 발생할 수 있습니다.</p>
					</div>
					<!-- //asideCont -->
					<!--btnClose-->
					<button type="button" class="btnClose">
						<span class="hidden">닫기</span>
					</button>
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
					<li><a href="http://www.airport.co.kr" target="_airport"
						class="airport">한국공항공사</a></li>
					<li><a href="/period/applyPage.do" class="green">상주직원 정기권</a>


					</li>
				</ul>
				<!--//fMenu-->
				<!--fNotice-->
				<div class="fNotice">
					<p>
						한국공항공사 주차장 관련 문의 ( ☏ 1544-7877 ) <a href="javascript:void(0);"
							onclick="airportNumberList(); return false;" class="btn_pop">공항별
							안내번호</a>
					</p>
					<p class="copyright">COPYRIGHT Ⓒ KAC. ALL RIGHTS RESERVED.</p>
				</div>
				<!--//fNotice-->
			</div>
			<div id="dimmed" style="display: none;"></div>
			<div class="alert tell" style="display: none;">
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
							<tbody>
								<tr>
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

				$('#parkingCd')
						.on(
								'change',
								function() {
									$("#parkingLot").empty();
									$
											.ajax({
												url : "/main/parkingList.json",
												type : "POST",
												data : {
													parkingCd : $("#parkingCd")
															.val()
												},
												success : function(data) {
													for (var i = 0; i < data.parkingList.length; i++) {
														$("#parkingLot")
																.append(
																		"<option value="+data.parkingList[i].value+">"
																				+ data.parkingList[i].label
																				+ "</option>");
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

				$(".calculate")
						.click(
								function() {

									if ($("#parkingCd").val() == "") {
										$("#amt").html("공항을 선택해주세요.")
									} else if ($("#parkingLot").val() == "") {
										$("#amt").html("주차장을 선택해주세요.")
									} else if ($("#inDttm").val() == null
											|| $("#inDttm").val() == "") {
										$("#amt").html("입차일자를 선택해주세요.");
									} else if ($("#outDttm").val() == null
											|| $("#outDttm").val() == "") {
										$("#amt").html("출차일자를 선택해주세요.");
									}/* else if(moment($("#outDttm").val()).diff(moment($("#inDttm").val()), 'hours') < 2) {
																					$("#amt").html("주차예약은 현재 시간 기준 최소 2시간 이상 사용 시 예약 가능합니다.");
																				}else if(moment($("#outDttm").val()).diff(moment($("#inDttm").val()), 'days') > 30) {
																					$("#amt").html("주차예약은 현재 날짜 기준 최대 30일까지 사용 시 예약 가능합니다.");
																				} */else {
										$
												.ajax({
													url : "/main/calculateAmt.json",
													type : "POST",
													data : {
														sectnId : $(
																"#parkingLot")
																.val(),
														inDttm : $("#inDttm")
																.val(),
														outDttm : $("#outDttm")
																.val(),
														discountCd : $(
																"#discountType")
																.val()

													},
													success : function(data) {
														if (data.calculateAmt != null
																&& data.calculateAmt != "") {
															$("#amt")
																	.html(
																			"예상 주차요금은 &nbsp;<strong>"
																					+ numberWithCommas(data.calculateAmt)
																					+ "</strong>원 입니다.");
														}

													}
												});
									}

								});

				$(".picker").datetimepicker({
					//format: 'Y-m-d H:00:00'
					format : 'Y-m-d H:i:00',
					formatTime : 'H:i',
					formatDate : 'Y/m/d',
					step : 10,
				});
			});
		</script>
	</footer>
	<script type="text/javascript" src="/resources/js/default.js"></script>
	<script type="text/javascript"
		src="https://testsp.easypay.co.kr/ep8/EasypayCard_Web.js"></script>
	<script type="text/javascript"
		src="https://testpg.easypay.co.kr/webpay/EasypayCard_Web.js"></script>
	<script>
		$(function() {
			$(document).ready(function() {
				// ccAmt : 화면에 보여지는 예상주차요금
				// calculateAmt : 실제 계산되는 예상주차요금 (value로 넣어 계산)

				// 예상주차요금 세팅
				$("#calculateAmt").val("90000");

				settingAmt($("#calculateAmt").val());
			});

			/********* 할인적용 div - 할인 radio 클릭 시 보이게 *********/
			$("#radio01").click(function() {
				$(".discountAmtCalDiv").hide();
				normalReqAmt();
			});

			$("#radio02").click(function() {
				discountReqAmt();
				$(".discountAmtCalDiv").show();
			});

			$("#discountCd").change(function() {
				var discountCd = $("#discountCd").val();
				calculateDiscountAmt(discountCd);
			});

			/****************************************************/

			/*
				할인적용 버튼
			 */
			$("#discountAmtCalBtn")
					.click(
							function() {
								var carNoChk1 = /^\s*([가-힣]{2}){0,1}\s*[0-9]{1,3}[\s]*[가-힣]{1}[\s]*[0-9]{4}\s*$/gi; //기본차량
								var carNoChk2 = /^\s*([가-힣]{1,2})\s*[0-9]{4,6}\s*$/gi; //외교123456, 임시1234, 임시123456
								var carNoChk3 = /^\s*([가-힣]{0,2})\s*[0-9]{2,4}[\s]*[-][\s]*[0-9]{2,4}\s*$/gi; //1234-1234, 대구12-1111, 1234-12, 123-1234
								var carNo = $("#carNo").val();

								if ($("#radio01").is(":checked")) {
									alert("할인 차량만 할인적용이 가능합니다.");
								} else if (carNo == "") {
									alert("차량번호를 입력해주세요.");
								} else if (!carNoChk1.test(carNo)
										&& !carNoChk2.test(carNo)
										&& !carNoChk3.test(carNo)) {
									alert("차량번호 형식에 맞지 않습니다.");
								} else {
									$.loadingStart();
									$
											.ajax({
												type : "POST",
												url : "/member/ajax_moisChk.do",
												dataType : "json",
												data : {
													carNo : carNo
												},
												success : function(data) {
													// 할인코드 IRS 조회
													var result = data.value.result;
													var discountCd = data.value.discountCd;
													var discountNm = data.value.discountNm;
													var dscr = data.value.dscr;

													if (result == "true") {
														// 할인금액 계산
														calculateDiscountAmt(discountCd);
														$("#discount").val(
																discountNm
																		+ dscr);
														$("#discountCd").val(
																discountCd);
													} else {
														alert("할인적용 여부 조회 중 오류가 발생했습니다.");
													}
												},
												error : function(request, error) {
													alertMessage("에러가 발생했습니다. 관리자에게 문의해주세요.");
												},
												complete : function() {
													$.loadingStop();
												}
											});
								}
							});

			$("#reservationBtn")
					.click(
							function() {
								if ($("#agree01").is(":checked")
										&& $("#agree02").is(":checked")
										&& $("#agree03").is(":checked")
										&& $("#agree04").is(":checked")
										&& $("#agree05").is(":checked")) {
									// 					if ($("#discountAmtCal").val() == null || $("#discountAmtCal").val() == "") {
									// 						alert("할인금액조회 버튼을 눌러 할인될 금액을 확인해주세요.");
									// 						return;
									// 					}
									if (validate()) {
										$
												.getJSON(
														'duplicateReservation.json',
														{
															carNo : $("#carNo")
																	.val()
																	.replace(
																			/(\s*)/g,
																			''),
															resInDttm : $(
																	"#resInDttm")
																	.val(),
															resOutDttm : $(
																	"#resOutDttm")
																	.val(),
															parkingDivCd : $(
																	"#parkingDivCd")
																	.val(),
															sectnId : $(
																	"#sectnId")
																	.val()
														},
														function(data) {
															var code = data.code;

															if (code == "10") {
																alertMessage("해당 주차장에 같은 시간대에 예약한 내역이 있습니다.");
																return;
															} else if (code == "20") {
																alertMessage("해당 차량번호는 예약일 기준 1년간 2회 이상<br/>예약부도 내역이 있습니다.<br/>마지막 예약 출차일 기준 3개월동안<br/>공항 주차예약서비스 이용이 제한됩니다.");
																return;
															} else if (code == "00") {
																var confirmMsg = "작성 내용을 다시 한번 확인해주세요.\n\n"
																		+ "- 예약일시 : 2024-10-25 08:00:00 ~ 2024-10-28 00:00:00 \n"
																		+ "- 선택주차장 : 김포공항국내선 제2주차장 주차타워 2, 3층 \n"
																		+ "- 차량번호 : "
																		+ $(
																				"#carNo")
																				.val()
																		+ "\n"
																		+ "- 휴대전화 : "
																		+ $(
																				"#mobile")
																				.val()
																		+ "\n"
																		+ "- 이 메 일 : "
																		+ $(
																				"#email")
																				.val()
																		+ "\n\n"
																		+ "※ 예약 정보에 오류가 없으면 [확인] 버튼을, 틀린 정보가있다면 [취소] 버튼을 눌러주세요. \n"
																		+ "※ 고객 입력 정보의 불일치로 인한 로그인 오류, 입차 오류 등 발생 시 예약보증금이 환불되지 않습니다.";
																if (confirm(confirmMsg)) {
																	$
																			.ajax({
																				url : "/reservation/reservationCheck.json",
																				type : "POST",
																				dataType : "json",
																				data : {
																					sectnId : $(
																							"#sectnId")
																							.val(),
																					resInDttm : $(
																							"#resInDttm")
																							.val(),
																					resOutDttm : $(
																							"#resOutDttm")
																							.val(),
																					carKind : $(
																							"#carKind")
																							.val()
																				},
																				success : function(
																						data) {
																					var fullChkCode = data.result.code;
																					var carKind = $(
																							"#carKind")
																							.val();

																					if (fullChkCode == "00") {
																						if ($(
																								"#paymentAmt")
																								.val() <= 0) {
																							$(
																									"#reservationVO")
																									.attr(
																											"action",
																											"/reservation/insertAction.do");
																							$(
																									"#reservationVO")
																									.submit();
																						} else {
																							payment();
																						}
																					} else {
																						alertMessage("예약가능 주차면수 : 0");
																					}
																				}
																			});
																} else {
																	return;
																}

															}
														});
									}
								} else {
									alert("동의 및 확인 항목을 모두 체크해주세요.");
									return;
								}
							});
		});

		function validate() {
			var validTot = $(".valid").length, validCnt = 0;

			if (!$("#password").val()) {
				validN("#password", "#passwordChk");
			} else {
				var chk = /^[0-9a-zA-Z]{4,}$/;

				if (!chk.test($("#password").val())) {
					validN("#password", "#passwordChk");
					alert("비밀번호는 특수문자 사용이 불가하며 4자리 이상 입력해야 합니다.");
				} else {

					if ($("#password").val() != $("#passwordCk").val()) {
						validN("#password", "#passwordChk");
						alert("비밀번호를 다시 확인해주세요.");
					} else {
						validY("#password", "#passwordChk");
						validCnt++;
					}
				}
			}

			if (!$("#email").val()) {
				//validN("#email", "#emailChk");
			} else {
				var chk = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

				if (!chk.test($("#email").val())) {
					validN("#email", "#emailChk");
					alert("이메일 주소 형식을 다시 확인해주세요.");
					return;
					//} else {
					//validY("#email", "#emailChk");
					//validCnt++;
				}
			}

			if (!$("#mobile").val()) {
				validN("#mobile", "#mobileChk");
			} else {
				var chk = /^[0-9]{3}[0-9]{3,4}[0-9]{4}/;

				if (!chk.test($("#mobile").val())) {
					validN("#mobile", "#mobileChk");
					alert("휴대폰번호를 다시 확인해주세요.");
				} else {
					validY("#mobile", "#mobileChk");
					validCnt++;
				}
			}

			var carNoChk1 = /^\s*([가-힣]{2}){0,1}\s*[0-9]{1,3}[\s]*[가-힣]{1}[\s]*[0-9]{4}\s*$/gi; //기본차량
			var carNoChk2 = /^\s*([가-힣]{1,2})\s*[0-9]{4,6}\s*$/gi; //외교123456, 임시1234, 임시123456
			var carNoChk3 = /^\s*([가-힣]{0,2})\s*[0-9]{2,4}[\s]*[-][\s]*[0-9]{2,4}\s*$/gi; //1234-1234, 대구12-1111, 1234-12, 123-1234
			if (!$("#carNo").val()
					|| (!carNoChk1.test($("#carNo").val())
							&& !carNoChk2.test($("#carNo").val()) && !carNoChk3
							.test($("#carNo").val()))) {
				validN("#carNo", "#carNoChk");
				alert("차량번호를 다시 확인해주세요.");
			} else {
				validY("#carNo", "#carNoChk");
				validCnt++;
			}

			console.log("validTot: " + validTot);
			console.log("validCnt: " + validCnt);

			if (validTot == validCnt) {
				return true;
			} else {
				alertMessage("필수값을 다시 확인해주세요.");
				return false;
			}
		}

		/*
		 할인코드 조회 후 할인율 적용, 할인금액 받기
		 */
		function calculateDiscountAmt(discountCd) {
			$.getJSON('calculateDiscountAmt.json', {
				discountCd : discountCd,
				calculateAmt : $("#calculateAmt").val()
			}, function(data) {
				$("#discountAmtCal").val(data.discountAmt);
				$("#discountAmt").val(data.discountAmt);
				discountReqAmt();
			});
		}
		/*
		 일반(개인) 요금 계산
		 */
		function normalReqAmt() {
			settingAmt($("#calculateAmt").val());
		}

		/*
		 할인 적용된 요금 계산
		 */
		function discountReqAmt() {
			var calculateAmt = $("#calculateAmt").val();
			var discountAmt = $("#discountAmt").val();

			settingAmt(calculateAmt - discountAmt);
		}

		/*
		 * 1안) 예상주차요금 바뀌면 -> 예상주차요금 금액 판단 (10000원 이상/이하) -> 예약 보증금, 예상현장결제요금 변경 
		 */
		//  		function settingAmt(calculate) {
		// 			if (calculate <= 10000) {
		// 				$("#ccAmt").text(numberWithCommas(calculate));
		// 				$("#dpsAmt").text(numberWithCommas(calculate));
		// 				$("#rcpAmt").text(Number(0));
		// 				$("#depositAmt").val(calculate);
		// 				$("#receiptAmt").val(calculate - $("#depositAmt").val());
		// 				$("#paymentAmt").val($("#depositAmt").val());
		// 			} else {
		// 				var ramt = calculate - 10000;
		// 				$("#ccAmt").text(numberWithCommas(calculate));
		// 				$("#dpsAmt").text(numberWithCommas(10000));
		// 				$("#rcpAmt").text(numberWithCommas(ramt));
		// 				$("#depositAmt").val(10000);
		// 				$("#paymentAmt").val($("#depositAmt").val());
		// 				$("#receiptAmt").val(calculate - $("#depositAmt").val());
		// 			}
		// 		} 
		/* 
		 * 2안) 주차요금에 상관없이 보증금 10000원일 경우
		 */
		function settingAmt(calculate) {
			var ramt = calculate - 10000;
			$("#ccAmt").text(numberWithCommas(calculate));
			$("#dpsAmt").text(numberWithCommas(10000));
			$("#rcpAmt").text(numberWithCommas(ramt));
			$("p[name=ccAmt]").text(numberWithCommas(calculate));
			$("p[name=dpsAmt]").text(numberWithCommas(10000));
			$("p[name=rcpAmt]").text(numberWithCommas(ramt));

			$("#depositAmt").val(10000);
			$("#paymentAmt").val($("#depositAmt").val());
			$("#receiptAmt").val(calculate - $("#depositAmt").val());
		}

		function payment() {
			var _vMsg = "결제 중 팝업창은 결제가 완료 될 때까지 닫지 마십시오.\n"
					+ "팝업창을 닫을 경우 결제 비정상 에러가 발생 할 수 있습니다.\n"
					+ "문제 발생시 관리자에게 문의 바랍니다.\n" + "결제 하시겠습니까?";
			$("#confirm").modal("show");
			$("#confirmMassage").html(_vMsg);

			$("#confirmOk").click(
					function() {
						$.ajax({
							url : "/reservation/payment.json",
							type : "post",
							data : $("#reservationVO").serialize(),
							dataType : "json",
							success : function(data) {

								$('#paymentDiv').empty().append(
										data.paymentMap.paymentForm);

								if (!$("#EP_mall_id").val()
										&& !$("#sp_mall_id").val()) {
									alert("* 사업자가 준비중입니다.");
								} else {
									var device = data.paymentMap.device;

									if (device == true) {

										easyPayMobileEvent();

									} else {

										easyPayEvent();

									}
								}
							}
						});
					});
		}

		/**
		 * 숫자 콤마를 적용후 돌려준다.
		 * @param x
		 * @returns
		 */
		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		/*
		 개인정보처리방침 팝업
		 */

		function privacyButton() {
			$(".privacyPopup").css("display", "block");
			$(".dimmed, #dimmed").css("display", "block");
		}

		$(function() {
			$('.btnClose').on({
				'click' : function() {
					$(this).closest('.popup, .alert').hide();
					$('.dimmed, #dimmed').hide();
				}
			});
		});
	
						<!-- 토스페이먼츠 -->
							<script>
      // ------  SDK 초기화 ------
      // @docs https://docs.tosspayments.com/sdk/v2/js#토스페이먼츠-초기화
      const clientKey = "";
      const customerKey = "";
      const tossPayments = TossPayments(clientKey);
      // 회원 결제
      // @docs https://docs.tosspayments.com/sdk/v2/js#tosspaymentspayment
      const payment = tossPayments.payment({ customerKey });
      // 비회원 결제
      // const payment = tossPayments.payment({customerKey: TossPayments.ANONYMOUS})

      // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
      // @docs https://docs.tosspayments.com/sdk/v2/js#paymentrequestpayment
      async function requestPayment() {
        // 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요.
        // 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.
        await payment.requestPayment({
          method: "CARD", // 카드 결제
          amount: {
            currency: "KRW",
            value: 10000,
          },
          orderId: "xb70A9o0iKxFjfzXGFhLY", // 고유 주분번호
          orderName: "주차비",
          successUrl: window.location.origin + "/cust/parking/regist2", // 결제 요청이 성공하면 리다이렉트되는 URL
          failUrl: window.location.origin + "/csut/parking/fail", // 결제 요청이 실패하면 리다이렉트되는 URL
          customerEmail: "customer123@gmail.com",
          customerName: "김예영",
          customerMobilePhone: "01012341234",
          // 카드 결제에 필요한 정보
          card: {
            useEscrow: false,
            flowMode: "DEFAULT", // 통합결제창 여는 옵션
            useCardPoint: false,
            useAppCardOnly: false,
          },
        });
      }
 </script>
	<script>    
      const brandpay = tossPayments.brandpay({
    	  customerKey,
    	  redirectUrl: window.location.origin + "/cust/parking/regist2?orderId={ORDER_ID}&paymentKey={PAYMENT_KEY}&amount={AMOUNT}"
    	});
      
      const brandpay = tossPayments.brandpay({
    	  customerKey,
    	  redirectUrl: window.location.origin + "/cust/parking/fail?code={ERROR_CODE}&message={ERROR_MESSAGE}&orderId={ORDER_ID}"
    	});
    </script>
	<!-- 토스페이먼츠 끝 -->