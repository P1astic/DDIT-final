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
					<li><a href="/cust/parking/main">주차예약 신청</a></li>
					<li class="active"><a href="/cust/parking/detail">예약조회/변경/취소</a></li>
				</ul>
			</div>
		</div>
		<!--//subMenu-->
		<!--subMenu-->
		<div class="subMenu mobile">
			<a>예약조회/변경/취소</a>
			<ul>
				<li><a href="/cust/parking/main" title="새 창 열림">주차예약
						신청</a></li>
				<li><a href="/cust/parking/detail" title="새 창 열림">예약조회/변경/취소</a></li>
			</ul>
		</div>
	</div>
	<!--//subMenu-->
	<form id="parkingRsvtVO" name="parkingRsvtVO"
		action="/cust/parking/" method="post">

			<input type="hidden" id="reservationNo"
			name="reservationNo" value="${parkingRsvtVO.prkRsvtNo}" /> 
			<input type="hidden"
			id="resInDttm" name="resInDttm" value="${parkingRsvtVO.prkEntvhclTm }" /> 
			<input
			type="hidden" id="resOutDttm" name="resOutDttm"
			value="${parkingRsvtVO.prkLvvhclTm}" /> 
			<input type="hidden" id="regDttm"
			name="regDttm" value="${parkingRsvtVO.prkRsvtYmd}" /> 
			<input type="hidden"
			id="depositAmt" name="depositAmt" value="10000" /> 

		
<input
			type="hidden" id="parkingNm" name="parkingNm"
			value="${parkingRsvtVO.prkLotArea}" /> <input type="hidden" id="mobile"
			name="mobile" value="${parkingRsvtVO.prkRsvtMoblphon}" /> <input type="hidden" id="carNo"
			name="carNo" value="${parkingRsvtVO.prkRsvtCarNo}" />
			 <input
			type="hidden" id="sectnId" name="sectnId" value="${parkingRsvtVO.prkLotArea}" /> <input
			type="hidden" id="status" name="status" value="예약완료" />  <input
			type="hidden" id="data" name="data" />
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
						<div class="reserveInfo">
							<p class="titPage mt50">주차예약 신청내역(세부)</p>
							<!--web table-->
							<div class="table type04 web">
								<table>
									<caption>예약 신청내역 테이블이며 예약일시, 주차 등의 정보를 나타냅니다.</caption>
									<colgroup>
										<col style="width: 16%; max-width: 240px; min-width: 100px;">
										<col style="width: auto">
										<col style="width: 16%; max-width: 240px; min-width: 100px;">
										<col style="width: auto">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="mobile">휴대폰번호</label></th>
											<td>${parkingRsvtVO.prkRsvtMoblphon}</td>
											<th scope="row"><label for="">주차장</label></th>
											<td>${parkingRsvtVO.prkLotArea}</td>
										</tr>
									
										<tr>
											<th scope="row"><label for="carNo">차량번호</label></th>
											<td>${parkingRsvtVO.prkRsvtCarNo}</td>
											<th scope="row"><label for="">차량종류</label></th>
											<td>${parkingRsvtVO.prkRsvtCarType}</td>
										</tr>
										<tr>
											<th scope="row"><label for="resInDttm">입차 예정일시</label></th>
											<td>${parkingRsvtVO.prkEntvhclTm}</</td>
											<th scope="row"><label for="resOutDttm">출차 예정일시</label></th>
											<td>${parkingRsvtVO.prkLvvhclTm}</</td>
										</tr>
									</tbody>
								</table>
							</div>

							<!--mobile table-->
							<div class="table type04 mobile">
								<table>
									<caption>예약 신청내역 테이블이며 예약일시, 주차 등의 정보를 나타냅니다.</caption>
									<colgroup>
										<col style="width: 20%; min-width: 100px;">
										<col style="width: auto">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="mobile">휴대폰번호</label></th>
											<td>${parkingRsvtVO.prkRsvtMoblphon}</td>
										</tr>
										<tr>
											<th scope="row"><label for="">주차장</label></th>
											<td>${parkingRsvtVO.prkLotArea}</td>
										</tr>
										<tr>
											<th scope="row"><label for="carNo">차량번호</label></th>
											<td>${parkingRsvtVO.prkRsvtCarNo}</td>
										</tr>
										<tr>
											<th scope="row"><label for="">차량종류</label></th>
											<td>${parkingRsvtVO.prkRsvtCarType}</td>
										</tr>
										<tr>
											<th scope="row"><label for="resInDttm">입차 예정일시</label></th>
											<td>${parkingRsvtVO.prkEntvhclTm}</td>
										</tr>
										<tr>
											<th scope="row"><label for="resOutDttm">출차 예정일시</label></th>
											<td>${parkingRsvtVO.prkLvvhclTm}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!--btnArea-->
							<div class="btnArea flex txt-center mt40">


								<button type="button" class="button white" id="cancelBtn">예약취소</button>
								<button type="button" class="button white" id="updateBtn">예약변경</button>


								<button type="button" class="button dkBlue" id="mainBtn">확인</button>
							</div>
							<!--//btnArea-->
							<div class="flex mt40">

								<span class="colorType red">* 예약주차장 미이용시 <span
									class="boldFont">예약취소</span>를 진행하셔서 <span class="boldFont">예약보증금을
										환불</span> 받으시기 바랍니다.
								</span> </span>
							</div>

							<!--개인정보처리방침 팝업-->
							<div class="popup refundPopup" style="display: none;">
								<div class="popupPd">
									<div class="popHead">환불 규정</div>
									<div class="popCont">
										<div class="policy">
											<section>
												<p class="noTxt">취소 전 반드시 읽어주세요</p>
												<div class="table type04">
													<table>
														<caption>table 테이블입니다.</caption>
														<colgroup>
															<col style="width: 70%; min-width: 100px;">
															<col style="width: auto;">
														</colgroup>
														<tbody>
															<tr>
																<th scope="col" class="sky txt-left"><strong>예약시점~입차
																		예정시간 1시간 전까지</strong></th>
																<td>
																	<ul class="bulletList">
																		<li>전액환불</li>
																	</ul>
																</td>
															</tr>
															<tr>
																<th scope="col" class="sky txt-left"><strong>입차
																		예정시간 1시간 전~ 입차예정시간 2시간 경과까지</strong></th>
																<td>
																	<ul class="bulletList">
																		<li>예약보증금 50%환불<br />(50%위약금)
																		</li>
																	</ul>
																</td>
															</tr>
															<tr>
																<th scope="col" class="sky txt-left"><strong>입차
																		예정시간 1시간 전 구매 후 20분 이내 취소 시</strong></th>
																<td>
																	<ul class="bulletList">
																		<li>전액 환불</li>
																	</ul>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<p class="colorType green">
													※ 공사는 환불 처리 시 이용자의 성명, 연락처, 환불적용계좌, 환불금액, 환불사유 확인을 추가로 요구 할
													수 있다.<br /> ※ 공항의 책임으로 인한 예약취소는 수수료 없이 전액 환불이 원칙이나 아래와 같은
													사유로 인한 예약취소는 환불에서 제외된다.<br /> 1. 전쟁이나 전쟁의 위협, 폭동, 내란, 테러<br />
													2. 자연·방사능 재난, 화재, 노동쟁의, 악천후, 화산폭발 또는 화산재<br /> 3. 정부규제, 항공
													스케쥴의 변경 또는 취소<br />
												</p>
											</section>
										</div>
										<button type="button" class="button btnClose">
											<span class="hidden">닫기</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</form>
</main>
<a href="javascript:void(0);" type="button" class="btnTop"><span
	class="hidden">위로가기</span></a>





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

		$('#parkingCd').on(
				'change',
				function() {
					$("#parkingLot").empty();
					$.ajax({
						url : "/main/parkingList.json",
						type : "POST",
						data : {
							parkingCd : $("#parkingCd").val()
						},
						success : function(data) {
							for (var i = 0; i < data.parkingList.length; i++) {
								$("#parkingLot").append(
										"<option value="+data.parkingList[i].value+">"
												+ data.parkingList[i].label
												+ "</option>");
							}

						}
					});
				});

		//입력정보 초기화
		$(".retry").click(function() {
			$("#parkingLot").val("");
			$("#discountType").val("DC001");
			$("#inDttm").val("");
			$("#outDttm").val("");
		
		});

		$(".calculate")
				.click(
						function() {

							if ($("#parkingLot").val() == "") {
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
												outDttm : $("#outDttm").val(),
												discountCd : $("#discountType")
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

		$("#mainBtn").click(function() {
			$("#parkingRsvtVO").attr("action", "/reservation/recheck.do");
			$("#parkingRsvtVO").submit();
		});

		$("#updateBtn")
				.click(
						function() {
							var resInDttm = $("#resInDttm").val();
							var regDttm = $("#regDttm").val();
							var resStatus = $("#resStatus").val();

							if (possibleChk(resInDttm, regDttm, "update") > 0) {
								$.loadingStart();
								$("#parkingRsvtVO").attr("action",
										"/cust/parking/update");
								$("#parkingRsvtVO").submit();
							} else {
								alertMessage("변경이 불가한 예약건입니다.<br/><br/>(기존 예약건은 유지됩니다. <br/>취소를 원하시면 예약취소를 진행해주세요.)");
								return;
							}
						});

		$("#cancelBtn").click(
				function() {
					var resInDttm = $("#resInDttm").val();
					var regDttm = $("#regDttm").val();
					var resStatus = $("#resStatus").val();
					var refundAmt = possibleChk(resInDttm, regDttm, "cancel");
					var penalty = $("#depositAmt").val() - refundAmt;

					$(".refundPopup").css("display", "block");
					$(".dimmed, #dimmed").css("display", "block");

					$(function() {
						$('.btnClose').on({
							'click' : function() {
								$(this).closest('.popup, .alert').hide();
								$('.dimmed, #dimmed').hide();
							}
						});
					});

					if (refundAmt > 0) {
						$("#confirm").modal("show");
						$("#confirmMassage")
								.html(
										"환불가능금액은 " + refundAmt + "원 입니다. (위약금"
												+ penalty
												+ "원)<br><br>주차예약을 취소하시겠습니까?");
						$("#confirmOk").click(
								function() {
									$.loadingStart();
									$("#refundAmt").val(refundAmt);
									$("#receiptAmt").val(penalty);
									var parkingNm = $("#parkingNm").val();
									/* if($("#sectnId").val() == '14'){
										parkingNm = "여객주차장(P2) 주차빌딩 3,4층"
									} */
									var data = {
										"차량번호" : $("#carNo").val(),
										"예약번호" : $("#reservationNo").val(),
										"주차장명" : parkingNm,
										"시작일자" : $("#resInDttm").val(),
										"종료일자" : $("#resOutDttm").val(),
										"공항별연락처" : $("#parkingTelNo").val(),
										"보증금환불액" : refundAmt
									};
									if (penalty > 0) {
										$("#reviseTypeCode").val("32");
									} else {
										$("#reviseTypeCode").val("40");
									}

									$("#data").val(JSON.stringify(data));
									$("#parkingRsvtVO").attr("action",
											"/cust/parking/delete");
									$("#parkingRsvtVO").submit();
								});
					} else {
						alertMessage("취소가 불가한 예약건입니다.");
						return;
					}
				});

	});

	function possibleChk(resInDttm, regDttm, resStatus) {
		// 환불금액 = 보증금 - 위약금
		var refundAmt = $("#depositAmt").val();
		// 현재 시간
		var currentTm = moment(new Date());
		// 입차 예정시간 1시간 전
		var res1HourBefere = moment(resInDttm).subtract(1, "hours");
		// 입차 예정시간 2시간 후
		var res2HourLater = moment(resInDttm).add(2.0165, "hours"); //0.0165는 59초를 의미
		// 예약 신청시간 20분 후
		var reg20MinLater = moment(regDttm).add(20, "minutes");

		// [예약서비스 이용약관] 
		// 제2장 제8조 ① 예약의 변경 및 취소는 입차 예정시간(resInDttm) 1시간 전까지 가능하다.
		// 제3장 제13조 1-1 예약시점 ~ 입차 예정시간 1시간 전까지 : 전액 환불
		if (moment(currentTm).isSameOrBefore(res1HourBefere)) {

			// 제2장 제8조 ② 입차 예정시간(resInDttm) 전 1시간이내에 예약한 경우, 예약신청시간(regDttm)으로부터 20분 이내에는 예약의 변경 및 취소가 가능하다.
			// 제3장 제13조 1-4 입차 예정시간 1시간 전 구매 후 20분 이내 취소시 : 전액 환불
		} else if (moment(res1HourBefere).isBefore(regDttm)
				&& moment(currentTm).isSameOrBefore(reg20MinLater)) {

			// 제3장 제13조 1-2 입차 예정시간 1시간 전 ~ 입차 예정시간 2시간 경과까지 : 예약 보증금 50% 환불
		} else if (moment(currentTm).isBetween(res1HourBefere, res2HourLater)
				&& resStatus == "cancel") {
			refundAmt = refundAmt / 2
		} else {
			refundAmt = refundAmt - refundAmt
		}
		return refundAmt;
	}

	function validate() {
		var validTot = $(".valid").length, validCnt = 0;

		if (!$("#certValue").val()) {
			validN("#certValue", "#certValueChk");
			alertMessage("인증할 정보를 입력해주세요.");
			return;
		} else {
			validY("#certValue", "#certValueChk");
			validCnt++;
		}

		if (!$("#mobile").val()) {
			validN("#mobile", "#mobileChk");
			alertMessage("휴대폰번호를 입력해주세요.");
			return;
		} else {
			var chk = /^[0-9]{3}[0-9]{3,4}[0-9]{4}/;

			if (!chk.test($("#mobile").val())) {
				validN("#mobile", "#mobileChk");
				alertMessage("휴대폰번호를 다시 확인해주세요.");
			} else {
				validY("#mobile", "#mobileChk");
				validCnt++;
			}
		}

		if (!$("#password").val()) {
			validN("#password", "#passwordChk");
			alertMessage("비밀번호를 입력해주세요.");
			return;
		} else {
			var chk = /^[0-9a-zA-Z]{4,}$/;

			if (!chk.test($("#password").val())) {
				validN("#password", "#passwordChk");
				alertMessage("비밀번호는 4자리 이상 입력해야 합니다.");
			} else {

				if ($("#password").val() != $("#passwordCk").val()) {
					validN("#password", "#passwordChk");
					alertMessage("비밀번호를 다시 확인해주세요.");
				} else {
					validY("#password", "#passwordChk");
					validCnt++;
				}
			}
		}

		//console.log("validTot: "+ validTot);
		//console.log("validCnt: "+ validCnt);

		if (validTot == validCnt) {
			return true;
		} else {
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
</script>
</body>
</html>