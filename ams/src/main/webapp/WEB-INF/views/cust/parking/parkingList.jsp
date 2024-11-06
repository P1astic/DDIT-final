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
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/jquery-ui.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/jquery-cookie.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="/resources/js/pagination.js"></script>


<div id="contents">

	<body>





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
					window.open(url, "",
							"width=1600, height=800, resizable=yes");
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
			<form id="parkingRsvtVO" name="parkingRsvtVO"
				action="/reservation/resComplete.do" method="post">
				<div id="content">
					<div class="inner">
						<!--location-->




						<div class="location">
							<h4 class="subTitle">주차예약</h4>
							<!--breadcrumb-->
							<ul class="breadcrumb web">
								<li><a href="/" class="home">Home</a></li>
								<li><a href="/reservation/recheck.do">주차예약</a></li>
								<li><a href="#">주차예약(예약확인)</a></li>
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
								<li><span>주차조회</span></li>
								<li><span>예약신청</span></li>
								<li class="active"><span>예약확인</span></li>
							</ul>
							<div class="complete">
								<p>주차 예약이 완료되었습니다.</p>
							</div>
							<div class="section">
								<p class="titPage">예약 내역</p>
								<!--web table-->
								<div class="table type04 web">
									<table>
										<caption>예약 신청내역 테이블이며 예약일시, 주차 등의 정보를 나타냅니다.</caption>
										<colgroup>
											<col style="width: auto;">
											<col style="width: 20%;">
											<col style="width: 20%;">
											<col style="width: 20%;">
											<col style="width: 21%;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="col" rowspan="2" class="sky">예약일시</th>
												<th scope="col" colspan="2">차량입차</th>
												<th scope="col" colspan="2">차량출차</th>
											</tr>
											<tr>
												<td colspan="2">${parkingRsvtVO.prkEntvhclTm}</td>
												<td colspan="2">${parkingRsvtVO.prkLvvhclTm}</td>
											</tr>
											<tr>
												<th scope="col" rowspan="2" class="sky">주차</th>
												<th scope="col">주차장</th>
												<th scope="col">차량번호</th>
												<th scope="col">차량종류</th>
												<th scope="col">예약상태</th>
											</tr>
											<tr>
												<td>${parkingRsvtVO.prkLotArea}</td>
												<td><span class="colorType blue">${parkingRsvtVO.prkRsvtCarNo}</span></td>
												<td>${parkingRsvtVO.prkRsvtCarType}</td>
												<td>${parkingRsvtVO.prkRsvtRtrcnYn}</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="table type04 web">
									<table>
										<caption>예약 신청내역 테이블이며 신청정보, 결제정보 등의 정보를 나타냅니다.</caption>
										<colgroup>
											<col style="width: auto">
											<col style="width: 27%">
											<col style="width: 27%">
											<col style="width: 27%">
										</colgroup>
										<tbody>
											<tr>
												<th scope="col" rowspan="2" class="sky">예약정보</th>
												<th scope="col">예약번호</th>
												<th scope="col">전화번호</th>
											
											</tr>
											<tr>
												<td>${parkingRsvtVO.prkRsvtNo}</td>
												<td>${parkingRsvtVO.prkRsvtMoblphon}</td>
												
											</tr>
											<tr>
												<th scope="col" rowspan="2" class="sky">결제정보</th>
												
												<th scope="col"">예약 보증금(선결제)</th>
												<th scope="col"></th>
												<!-- <th scope="col">예상 현장결제요금</th> -->
											</tr>
											<tr>
												
												<td><span class="colorType blue">10,000원</span></td>
												<td></td>

											</tr>
										</tbody>
									</table>
								</div>
								<!--//web table-->
								<!--mobile table-->
								<div class="table type04 mobile">
									<table>
										<caption>예약 신청내역 테이블이며 예약일시, 주차, 신청정보, 결제정보 등의 정보를
											나타냅니다.</caption>
										<colgroup>
											<col style="width: 50%;">
											<col style="width: 50%;">
										</colgroup>
										<tbody>
											<tr>
												<th scope="col" colspan="2" class="sky">예약일시</th>
											</tr>
											<tr>
												<th scope="row">차량입차</th>
												<td>${parkingRsvtVO.prkEntvhclTm }</td>
											</tr>
											<tr>
												<th scope="row">차량출차</th>
												<td>${parkingRsvtVO.prkLvvhclTm}</td>
											</tr>
											<tr>
												<th scope="col" colspan="2" class="sky">주차</th>
											</tr>
											<tr>
												<th scope="row">주차장</th>
												<td>${parkingRsvtVO.prkLotArea}</td>
											</tr>
											<tr>
												<th scope="row">차량번호</th>
												<td><span class="colorType green">${parkingRsvtVO.prkRsvtCarNo}</span></td>
											</tr>
											<tr>
												<th scope="row">차량종류</th>
												<td>${parkingRsvtVO.prkRsvtCarType}</td>
											</tr>
											<tr>
												<th scope="row">예약상태</th>
												<td>${parkingRsvtVO.prkRsvtRtrcnYn}</td>
											</tr>
											<tr>
												<th scope="col" colspan="2" class="sky">신청정보</th>
											</tr>
											<tr>
												<th scope="row">예약번호</th>
												<td>${parkingRsvtVO.prkRsvtNo}</td>
											</tr>
											<tr>
												<th scope="row">전화번호</th>
												<td>${parkingRsvtVO.prkRsvtMoblphon}</td>
											</tr>
											<tr>
												<th scope="col" colspan="2" class="sky">결제정보</th>
											</tr>
											<tr>
												<th scope="row">보증금(결제요금)</th>
												<td><span class="colorType red">10,000원</span></td>
											</tr>

										</tbody>
									</table>
								</div>
								<!--//mobile table-->
								<!--notice-->
								<div class="notice">
									<ul>
										<li>[예약 기간] </br>・최소 2시간부터 최장 30일까지 예약이 가능합니다.
										</li>
										<li>[입차 시간] </br>・예약시간 기준 2시간 전 및 예약시간 기준 2시간 후 까지는 예약변경 없이
											입차가 가능합니다.
										</li>
										<li>[예약 변경/취소] </br>・예약의 변경 및 취소(수수료없음)는 입차 예정시간 1시간 전까지
											가능합니다. </br>・입차 예정시간 전 1시간 이내에 예약한 경우, 예약신청시간으로부터 20분 이내에는 예약의 변경
											및 취소(수수료없음)가 가능합니다. </br>・입차 예정시간 1시간 이후 ~ 입차 예정시간 2시간 경과까지
											취소(수수료50%)가 가능합니다.
										</li>
									</ul>
								</div>
								<!--//notice-->
								<!--btnArea-->
								<div class="btnArea txt-center mt40">
									<button type="button" class="button dkBlue" onclick="goMain();">메인으로</button>
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
														parkingCd : $(
																"#parkingCd")
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
			
						$("#parkingLot").val("");
						$("#discountType").val("DC001");
						$("#inDttm").val("");
						$("#outDttm").val("");

					});
//주차요금
// 					$(".calculate")
// 							.click(
// 									function() {

// 										if ($("#parkingLot").val() == "") {
// 											$("#amt").html("주차장을 선택해주세요.")
// 										} else if ($("#inDttm").val() == null
// 												|| $("#inDttm").val() == "") {
// 											$("#amt").html("입차일자를 선택해주세요.");
// 										} else if ($("#outDttm").val() == null
// 												|| $("#outDttm").val() == "") {
// 											$("#amt").html("출차일자를 선택해주세요.");
// 										}/* else if(moment($("#outDttm").val()).diff(moment($("#inDttm").val()), 'hours') < 2) {
// 																																										$("#amt").html("주차예약은 현재 시간 기준 최소 2시간 이상 사용 시 예약 가능합니다.");
// 																																									}else if(moment($("#outDttm").val()).diff(moment($("#inDttm").val()), 'days') > 30) {
// 																																										$("#amt").html("주차예약은 현재 날짜 기준 최대 30일까지 사용 시 예약 가능합니다.");
// 																																									} */else {
// 											$
// 													.ajax({
// 														url : "/main/calculateAmt.json",
// 														type : "POST",
// 														data : {
// 															sectnId : $(
// 																	"#parkingLot")
// 																	.val(),
// 															inDttm : $(
// 																	"#inDttm")
// 																	.val(),
// 															outDttm : $(
// 																	"#outDttm")
// 																	.val()

// 														},
// 														success : function(data) {
// 															if (data.calculateAmt != null
// 																	&& data.calculateAmt != "") {
// 																$("#amt")
// 																		.html(
// 																				"예상 주차요금은 &nbsp;<strong>"
// 																						+ numberWithCommas(data.calculateAmt)
// 																						+ "</strong>원 입니다.");
// 															}

// 														}
// 													});
// 										}

// 									});

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

			});

			function goMain() {
				$("#parkingRsvtVO").attr("action", "/cust/parking/reservation");
				$("#parkingRsvtVO").submit();
			}
		</script>
	</body>
</div>
