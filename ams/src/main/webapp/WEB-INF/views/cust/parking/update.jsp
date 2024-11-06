<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		action="/reservation/update.do" method="post">
		<input type="hidden" id="airportNm" name="airportNm" value="김포공항" /> <input
			type="hidden" id="parkingName" name="parkingName"
			value="국내선 제2주차장 주차타워 2, 3층" /> <input type="hidden" id="sectnId"
			name="sectnId" value="2" /> <input type="hidden" id="reservationId"
			name="reservationId" value="224342" /> <input type="hidden"
			id="reservationNo" name="reservationNo" value="1234FJ0006" /> <input
			type="hidden" id="beforeAirportNm" name="beforeAirportNm"
			value="김포공항" /> <input type="hidden" id="beforeParkingName"
			name="beforeParkingName" value="국내선 제2주차장 주차타워 2, 3층" /> <input
			type="hidden" id="beforeCarNo" name="beforeCarNo" value="서울12사1234" />
		<input type="hidden" id="beforeMobile" name="beforeMobile"
			value="01090590210" /> <input type="hidden" id="beforeInDttm"
			name="beforeInDttm" value="2024-10-24 05:50:00" /> <input
			type="hidden" id="beforeOutDttm" name="beforeOutDttm"
			value="2024-10-28 07:40:00" /> <input type="hidden"
			id="reservationInfo" name="reservationInfo" value="국내선 제2주차장 2,3층" />
		<input type="hidden" id="encryptId" name="encryptId"
			value="rOogjExFRnss1Neo1m8Uhpv+dUTPysR503RqjYTCH0I=" /> <input
			type="hidden" id="parkingTelNo" name="parkingTelNo" value="1544-7877" />
		<input type="hidden" id="discountCd" name="discountCd" /> <input
			type="hidden" id="calculateAmt" name="calculateAmt" value="0" /> <input
			type="hidden" id="depositAmt" name="depositAmt" value="0" /> <input
			type="hidden" id="receiptAmt" name="receiptAmt" value="0" /> <input
			type="hidden" id="discountAmt" name="discountAmt" value="0" /> <input
			type="hidden" id="paymentAmt" name="paymentAmt" value="0" /> <input
			type="hidden" name="menuParamNo" value="" /> <input type="hidden"
			name="upperMenuParamId" value="" /> <input type="hidden"
			name="subMenu1" value="" /> <input type="hidden" name="subMenu2"
			value="" />

		<script>
			$(function() {
				$('#reservationVO [name="menuParamNo"]').val(
						$('#mainManageLeftForm [name="menuParamNo"]').val());
				$('#reservationVO [name="upperMenuParamId"]').val(
						$('#mainManageLeftForm [name="upperMenuParamId"]')
								.val());
				$('#reservationVO [name="subMenu1"]').val(
						$('#mainManageLeftForm [name="subMenu1"]').val());
				$('#reservationVO [name="subMenu2"]').val(
						$('#mainManageLeftForm [name="subMenu2"]').val());
			});
		</script>
		<div id="content">
			<div class="inner">
				<!--location-->




				<div class="location">
					<h4 class="subTitle">예약조회/변경/취소</h4>
					<!--breadcrumb-->
					<ul class="breadcrumb web">
						<li><a href="/cust/main" class="home">Home</a></li>
						<li><a href="/cust/parking/main">주차예약</a></li>
						<li><a href="/cust/parking/reservation">예약조회/변경/취소</a></li>
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
					<div class="section">
						<!--web-->

						<div class="table type03 web">
							<table>
								<caption>예약변경 테이블이며 예약주차, 차량번호, 입차예정일시, 출차예정일시, 차량종류,
									예약가능여부, 츄대전화번호, 이메일주소, 비밀번호 등의 정보를 나타냅니다.</caption>
								<colgroup>
									<col style="width: 16%; min-width: 100px;">
									<col style="width: 34%">
									<col style="width: 16%; min-width: 100px;">
									<col style="width: auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="mobile">휴대폰번호</label></th>
										<td><input id="mobile" name="mobile" title="휴대폰번호 입력"
											placeholder="예) 010-0000-0000" type="text"
											oninput="this.value = this.value.replace(/[^0-9]/g, &#39;&#39;).replace(/(\..*)\./g, &#39;$1&#39;);"
											value="01090590210" /></td>
										<th scope="row"><label for="email">이메일주소</label></th>
										<td><input id="email" name="email" title="이메일주소 입력"
											placeholder="예) iam@domain.com" type="text"
											oninput="this.value = this.value.replace(/\s| /gi,&#39;&#39;);"
											value="3memi173@gmail.com" /></td>
									</tr>
									<tr>
										<th scope="row"><label for="">공항구분</label></th>
										<td><select id="parkingDivCd" name="parkingDivCd"
											title="공항 선택" class="valid">

												<option value="PLT-002" selected="selected">김포공항</option>

												<option value="PLT-003">김해공항</option>

										</select></td>
										<th scope="row"><label for="">주차장</label></th>
										<td><select id="parkingNm" name="parkingNm"
											title="주차장 선택" data-selvalue="2" class="valid"></select></td>
									</tr>
									<tr>
										<th scope="row"><label for="carNo">차량번호</label></th>
										<td><input id="carNo" name="carNo" title="차량번호 입력"
											placeholder="예) 00가0000, 서울00가0000, 외교000000" type="text"
											oninput="this.value = this.value.replace(/\s| /gi,&#39;&#39;);"
											value="서울12사1234" /></td>
										<th scope="row"><label for="">차량종류</label></th>
										<td><select id="carKind" name="carKind" title="차량 종류 선택">
												<option value="DC001">일반 차량</option>
												<option value="DC002">장애인 차량</option>
										</select></td>
									</tr>
									<tr>
										<th scope="row"><label for="resInDttm">입차 예정일시</label></th>
										<td><input id="resInDttm" name="resInDttm"
											title="입차예정날짜 입력" type="text" class="cal"
											value="2024-10-24 05:50:00" /></td>
										<th scope="row"><label for="resOutDttm">출차 예정일시</label></th>
										<td><input id="resOutDttm" name="resOutDttm"
											title="출차예정날짜 입력" type="text" class="cal"
											value="2024-10-28 07:40:00" /></td>
									</tr>
									<tr>
										<th scope="row"><label for="">예상할인금액</label></th>
										<td colspan="3">
											<button type="button" class="button dkBlue"
												id="discountAmtCalBtn">할인금액조회</button>
											<div class="flex discountAmtCalDiv">
												<p>할인유형 :</p>
												<input type="text" id="discount" class="colorType red w728"
													placeholder="차량번호 입력 후 할인적용 버튼을 눌러주세요" title="할인유형"
													readonly />
												<p>할인금액 :</p>
												<input type="text" id="discountAmtCal"
													class="colorType red w728"
													placeholder="차량번호 입력 후 할인적용 버튼을 눌러주세요" title="할인적용되는 금액"
													readonly />

											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>


						<!--mobile-->


						<!--btnArea-->
						<div class="btnArea flex txt-center mt40">
							<button type="button" class="button gray" onclick="goMain();">취소</button>
							<button type="button" class="button dkBlue" onclick="update();">예약변경</button>
						</div>
						<!--//btnArea-->
					</div>
				</div>
			</div>
		</div>
	</form>
</main>
<a href="javascript:void(0);" type="button" class="btnTop"><span
	class="hidden">위로가기</span></a>
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
									<th scope="row" class="txt-left"><label for="discountType">할인유형<span
											class="redDot" title="필수입력">*</span></label></th>
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
													sectnId : $("#parkingLot")
															.val(),
													inDttm : $("#inDttm").val(),
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
<script>
	$(function() {
		var msg = "";

		if (msg != "") {
			alertMessage(msg);
		}

		var parkingDivCd = $("#parkingDivCd").val();

		$('#parkingDivCd').selectLink({
			dst : $('#parkingNm'),
			url : '/reservation/parkingList.json',
			paramFn : function($me) {
				return {
					parkingDivCd : $me.val(),
					puOrgnCd : $('#puOrgnCd').val()
				}
			}
		}).trigger('change');

		$(".cal").datetimepicker({
			format : 'Y-m-d H:00:00'
		});

		$(document).ready(function() {
			// calculateAmt : 실제 계산되는 예상주차요금 (value로 넣어 계산)

			// 예상주차요금 세팅
			parkingAmt();
		});

		$("#parkingNm").change(
				function() {
					$.ajax({
						type : "POST",
						url : "/reservation/apiParkingInfo.json",
						dataType : "json",
						data : {
							sectnId : $("#parkingNm").val()
						},
						success : function(data) {
							$("#reservationInfo").val(
									data.parkingInfo.reservationInfo);
						}
					});
				});

		/*
		할인적용 버튼
		 */
		$("#discountAmtCalBtn").click(function() {
			discountAmtCal();
		});

	});

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
	 할인 적용된 요금 계산
	 */
	function discountReqAmt() {
		var calculateAmt = $("#calculateAmt").val();
		var discountAmt = $("#discountAmt").val();

		settingAmt(calculateAmt - discountAmt);
	}

	function parkingAmt() {
		var sectnId = $("#parkingNm").val();
		if (sectnId == "" || sectnId == null) {
			sectnId = $("#sectnId").val()
		}
		$.getJSON('calc.json', {
			sectnId : sectnId,
			carNo : $("#carNo").val(),
			inDttm : $("#resInDttm").val(),
			outDttm : $("#resOutDttm").val()
		}, function(data) {
			$("#calculateAmt").val(data.result.reqAmt);
			settingAmt(data.result.reqAmt);
		});
	}

	/* 
	 * 주차요금에 상관없이 보증금 10000원일 경우
	 */
	function settingAmt(calculate) {
		var ramt = calculate - 10000;
		//$("#rcpAmt").val(numberWithCommas(ramt));

		$("#depositAmt").val(10000);
		$("#paymentAmt").val($("#depositAmt").val());
		$("#receiptAmt").val(calculate - $("#depositAmt").val());
	}

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function update() {
		var sectnId = $("#parkingNm").val();
		var carKind = $("#carKind").val();
		var inDttm = $("#resInDttm").val();
		var outDttm = $("#resOutDttm").val();
		var date = new Date();
		var mobileChk = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
		var mobile = $("#mobile").val();
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);

		if (sectnId == "") {
			alertMessage("주차장을 선택해주세요.")
		} else if (mobile == null || mobile == "") {
			alertMessage("휴대번호를 입력해주세요.");
		} else if (!mobileChk.test(mobile)) {
			alertMessage("휴대폰번호 형식에 맞지 않습니다");
		} else if (carKind == "") {
			alertMessage("차량종류를 선택해주세요.")
		} else if (inDttm == null || inDttm == "") {
			alertMessage("입차일자를 선택해주세요.");
		} else if (outDttm == null || outDttm == "") {
			alertMessage("출차일자를 선택해주세요.");
		} else if (moment($("#resOutDttm").val()).diff(
				moment($("#resInDttm").val()), 'hours') < 2) {
			alertMessage("주차예약은 현재 시간 기준 최소 2시간 이상 사용 시 예약 가능합니다.");
		} else if (moment($("#resOutDttm").val()).diff(
				moment($("#resInDttm").val()), 'days') > 30) {
			alertMessage("주차예약은 현재 날짜 기준 최대 30일까지 사용 시 예약 가능합니다.");
		} else if (moment($("#resInDttm").val()) <= moment(new Date())) {
			alertMessage("예약 입차 시간 이후는 예약할 수 없습니다.");
		} else if (moment($("#resInDttm").val()).diff(moment(date), 'days') > 45) {
			alertMessage("주차예약은 현재 날짜 기준 최대 45일 이내의 날짜까지 예약이 가능합니다.");
		} else if (moment($("#resOutDttm").val()).diff(moment(date), 'days') > 45) {
			alertMessage("주차예약은 현재 날짜 기준 최대 45일 이내의 날짜까지 예약이 가능합니다.");
		} else {

			if ($("#beforeAirportNm").val() != $("#airportNm").val()
					|| $("#beforeParkingName").val() != $("#parkingName").val()
					|| $("#beforeInDttm").val() != $("#resInDttm").val()
					|| $("#beforeOutDttm").val() != $("#resOutDttm").val()
					|| $("#beforeMobile").val() != $("#mobile").val()) {

				if (discountAmtCal()) {
					$.loadingStart();
					$.ajax({
						url : "/reservation/reservationCheck.json",
						type : "POST",
						dataType : "json",
						data : {
							sectnId : sectnId,
							resInDttm : $("#resInDttm").val(),
							resOutDttm : $("#resOutDttm").val(),
							carKind : carKind
						},
						success : function(data) {
							var fullChkCode = data.result.code;

							if (fullChkCode == "00") {
								updateAction();
							} else {
								alertMessage("예약가능한 주차면수가 없습니다.(만차)");
							}

						},
						error : function(request, error) {
							alertMessage("서버와의 통신이 끊어졌습니다.");
						},
						complete : function() {
							$.loadingStop();
						}
					});
				}
			} else {
				updateAction();
			}

		}

	}

	function updateAction() {

		if ($("#beforeAirportNm").val() != $("#airportNm").val()
				|| $("#beforeParkingName").val() != $("#parkingName").val()
				|| $("#beforeCarNo").val() != $("#carNo").val()
				|| $("#beforeMobile").val() != $("#mobile").val()
				|| $("#beforeInDttm").val() != $("#resInDttm").val()
				|| $("#beforeOutDttm").val() != $("#resOutDttm").val()) {
			var data = {
				"변경전공항정보" : $("#beforeAirportNm").val(),
				"변경전주차장명" : $("#beforeParkingName").val(),
				"변경전차량번호" : $("#beforeCarNo").val(),
				"변경전시작일자" : $("#beforeInDttm").val(),
				"변경전종료일자" : $("#beforeOutDttm").val(),
				"공항정보" : $("#parkingDivCd option:selected").text(),
				"주차장명" : $("#parkingNm option:selected").text(),
				"차량번호" : $("#carNo").val(),
				"시작일자" : $("#resInDttm").val(),
				"종료일자" : $("#resOutDttm").val(),
				"예약주차장위치" : $("#reservationInfo").val(),
				"공항별연락처" : $("#parkingTelNo").val()
			}
		}

		$.ajax({
			url : "/reservation/updateAction.json",
			type : "POST",
			dataType : "json",
			data : {
				reservationId : $("#reservationId").val(),
				parkingDivCd : $("#parkingDivCd").val(),
				sectnId : $("#parkingNm").val(),
				carNo : $("#carNo").val(),
				resInDttm : $("#resInDttm").val(),
				resOutDttm : $("#resOutDttm").val(),
				mobile : $("#mobile").val(),
				email : $("#email").val(),
				carKind : $("#carKind").val(),
				map : JSON.stringify(data)
			},
			success : function(data) {
				if (data.code == "00") {
					alertMessage("예약정보가 변경되었습니다.");
					goMain();
				} else {
					alertMessage("서버와 통신중 오류가 발생하였습니다.");
					goMain();
				}
			}

		});
	}

	function discountAmtCal() {

		var bool = false;

		var carNoChk1 = /^\s*([가-힣]{2}){0,1}\s*[0-9]{1,3}[\s]*[가-힣]{1}[\s]*[0-9]{4}\s*$/gi; //기본차량
		var carNoChk2 = /^\s*([가-힣]{1,2})\s*[0-9]{4,6}\s*$/gi; //외교123456, 임시1234, 임시123456
		var carNoChk3 = /^\s*([가-힣]{0,2})\s*[0-9]{2,4}[\s]*[-][\s]*[0-9]{2,4}\s*$/gi; //1234-1234, 대구12-1111, 1234-12, 123-1234
		var carNo = $("#carNo").val();
		var sectnId = $("#parkingNm").val();
		var carKind = $("#carKind").val();
		var inDttm = $("#resInDttm").val();
		var outDttm = $("#resOutDttm").val();
		var date = new Date();
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);

		if (carNo == "") {
			alertMessage("차량번호를 입력해주세요.");
		} else if (!carNoChk1.test(carNo) && !carNoChk2.test(carNo)
				&& !carNoChk3.test(carNo)) {
			alertMessage("차량번호 형식에 맞지 않습니다.");
		} else if (sectnId == "") {
			alertMessage("주차장을 선택해주세요.")
		} else if (carKind == "") {
			alertMessage("차량종류를 선택해주세요.")
		} else if (inDttm == null || inDttm == "") {
			alert("입차일자를 선택해주세요.");
		} else {
			$.loadingStart();
			$.ajax({
				type : "POST",
				url : "/member/ajax_moisChk.do",
				dataType : "json",
				async : false,
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
						parkingAmt();
						calculateDiscountAmt(discountCd);
						$("#discount").val(discountNm + dscr);
						$("#discountCd").val(discountCd);
						bool = true;
					} else {
						alertMessage("할인적용 여부 조회 중 오류가 발생했습니다.");
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

		return bool;
	}

	function goMain() {
		$("#reservationVO").attr("action", "/reservation/resDetail.do");
		$("#reservationVO").submit();
	}
</script>
</body>
