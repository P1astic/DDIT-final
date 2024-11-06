<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
	src="/resources/js/jquery-2.2.4.min.js"></script>

<script src="/resources/js/bootstrap/bootstrap.min.js"></script>
<script src="/resources/js/moment-2.29.3/package/min/moment.min.js"></script>



<script src="/resources/js/bootstrap-select/bootstrap-select.min.js"></script>
<script src="/resources/js/owlcarousel/owl.carousel.js"></script>
<script src="/resources/js/owlcarousel/owl.autoplay.js"></script>


<script type="text/javascript" src="/resources/js/slick.min.js"></script>


<body>
	<main id="regist2">
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
		</script>

		<form id="parkingRsvtVO" name="parkingRsvtVO" action="/parking/insert"
			method="post">
			<input type="hidden" id="prkEntvhclTm" name="prkEntvhclTm"
				value="${parkingRsvtVO.prkEntvhclTm }" /> <input type="hidden"
				id="prkLvvhclTm" name="prkLvvhclTm"
				value="${parkingRsvtVO.prkLvvhclTm }" /> <input type="hidden"
				id="airportNm" name="airportNm" value="김포공항" />
			<!-- 				<input -->
			<!-- 				type="hidden" id="prkRsvtCarNo" name="prkRsvtCarNo" -->
			<%-- 				value="${parkingRsvtVO.prkRsvtCarNo }" />  --%>
			<input type="hidden" id="parkingDivCd" name="parkingDivCd" value="" />


			<div id="content">
				<div class="parkingall">
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
											<td>${parkingRsvtVO.prkEntvhclTm}~
												${parkingRsvtVO.prkLvvhclTm}</td>
											<%-- 											<input type="text" name="prkEntvhclTm" value="${parkingRsvtVO.prkEntvhclTm}" readonly /></td> --%>
										</tr>
										<tr>
											<th scope="row">예약주차 <input id="prkLotArea"
												name="prkLotArea" title="야외주차장" type="hidden" class="valid"
												value="P1" /></th>

											<td>

												<p class="colorType green">
													<span class="colorType red">* 주차타워 내에 엘리베이터 또는
														에스컬레이터가 마련되어 있지 않습니다. 일행 중 보행이 불편하신 분이 있는 경우 예약 주차서비스 대신
														국내선 제1주차장 또는 국내선 제2주차장 1층을 이용하시기 바랍니다.</span>
												</p>

											</td>
										</tr>
										<tr>

											<th scope="row"><label for="prkRsvtCarNo">차량번호<span
													class="redDot" title="필수입력">*</span></label></th>
											<td><input type="text" id="prkRsvtCarNo"
												name="prkRsvtCarNo" title="차량번호 입력"
												placeholder="예) 00가0000, 서울00가0000, 외교000000" class="valid"
												oninput="this.value = this.value.replace(/\s| /gi, '');"
												value="" />
												<p class="colorType green">* 영업용 등 특수차량의 경우 지역명을 포함한
													차량번호 전체를 입력하여야 예약주차장 입차가 가능합니다. 예) 차량번호가 ‘서울12사1234’인 경우
													‘12사1234’로 입력 시 입차불가</p></td>
										</tr>
										<tr>
											<th scope="row"><label for="prkRsvtCarType">할인차량유형</th>
											<td><select id="prkRsvtCarType" name="prkRsvtCarType"
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

										</tr>
										<tr>
											<th scope="row"><label for="prkRsvtMoblphon">휴대전화번호<span
													class="redDot" title="필수입력">*</span></label></th>
											<td><input id="prkRsvtMoblphon" name="prkRsvtMoblphon"
												title="휴대전화번호 입력" placeholder="예) 01012345678" type="text"
												class="valid"
												oninput="this.value = this.value.replace(/[^0-9]/g, &#39;&#39;).replace(/(\..*)\./g, &#39;$1&#39;);"
												value="${custInfoVO.phone}" /></td>
										</tr>

										<tr>
											<th scope="row"><label for="prkRsvtPswd">비밀번호<span
													class="redDot" title="필수입력">*</span></label></th>
											<td><input id="prkRsvtPswd" name="prkRsvtPswd"
												title="비밀번호 입력" minlength="4" placeholder="4자리 이상 입력"
												type="prkRsvtPswd" class="valid" value="" /></td>
										</tr>
										<tr>
											<th scope="row"><label for="passwordCk">비밀번호 확인<span
													class="redDot" title="필수입력">*</span></label></th>
											<td><input type="prkRsvtPswd" id="passwordCk"
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
							<!--web table-->
							<div class="table type01 web">
								<table>
									<caption>주차요금 테이블이며, 예상주차요금, 선결제 할인 요금 등을 나타냅니다.</caption>
									<colgroup>
										<col style="width: 25%;">
										<col style="width: auto">
										<col style="width: 25%;">
										<col style="width: auto">

									</colgroup>
									<tbody>
										<tr>

											<th scope="row">예약 보증금</br> <span
												class="colorType red boldFont">(선결제 필요)</span></th>
											<td><span class="colorType red"><p name="dpsAmt" />10000원</span></td>

										</tr>
									</tbody>
								</table>
							</div>
							<!--//원래 결제테이블 지금은 안 함 table-->

							<!--prkRsvtMoblphon table-->
							<!-- 							<div class="table type01 prkRsvtMoblphon"> -->
							<!-- 								<table> -->
							<%-- 									<caption>주차요금 테이블이며, 선결제 할인 요금 등을 나타냅니다.</caption> --%>
							<%-- 									<colgroup> --%>
							<%-- 										<col style="width: 48%;"> --%>
							<%-- 										<col style="width: auto"> --%>
							<%-- 									</colgroup> --%>
							<!-- 									<tbody> -->
							<!-- 										<tr> -->

							<!-- 																						<td><p name="ccAmt" />원</td> -->
							<!-- 											<td><p name="10000" />원</td> -->
							<!-- 										</tr> -->
							<!-- 										<tr> -->
							<!-- 											<th scope="row">예약 보증금</br>(선결제 필요) -->
							<!-- 											</th> -->
							<!-- 											<td><span class="colorType red"><p name="10000" />원</span></td> -->
							<!-- 										</tr> -->

							<!-- 									</tbody> -->
							<!-- 								</table> -->
							<!-- </div> -->
						</div>
						<!--//prkRsvtMoblphon table-->

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
								<input type="checkbox" id="agree03" class="hidden" title="동의 체크">
								<label for="agree03" class="colorType red">예약취소 또는
									예약부도(미입차) 시 예약 취소수수료가 부과됨을 확인하였습니다.</label>
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
									주차장 중 예약하여 이용할 수 있는 주차장을 말한다. <br> 3. “주차장 예약서비스”란 인터넷을 통해
									공항 예약 주차장 내 주차공간을 미리 예약하는 서비스를 말한다. <br> 4. “이용자”라고 함은 본
									약관에 동의하고 공사가 제공하는 주차장의 예약서비스를 이용하는 자를 말한다. <br> 5. “예약부도”란
									예약을 해놓고 아무런 연락 없이 나타나지 않는 것을 말한다. <br> <br> 제3조(적용 등)<br>
									① 이 약관은 공사가 제공하는 주차장 예약 서비스 및 이에 부대하는 모든 업무에 적용한다. <br> ②
									이 약관에서 정하지 않은 사항은 법령 또는 공사 주차장관리운영예규를 적용한다.<br> <br>
									제4조(약관의 변경)<br> ① 공사는 적용법령의 개정, 정부의 명령・지시 또는 공사가 필요한 경우에는
									이 약관을 변경 할 수 있다. <br> ② 제1항에 따라 약관을 변경한 경우 공사는 인터넷 홈페이지 등에
									변경사항을 게시한다. 이 때 이용자의 명시적인 이의가 없는 경우 이용자는 변경된 약관에 동의하는 것으로 간주한다.<br>
									제5조(이용자 정보 사용에 대한 동의) ① 이용자의 개인정보는 개인정보보호법에 의하여 보호된다.<br>
									② 공사는 주차장 예약서비스 제공과 관련해서 수집한 이용자의 정보를 본인의 승낙 없이 제3자에게 누설, 배포하지
									않는다. 단, 법률의 규정에 의하여 적법한 절차에 따라 요청이 있는 경우는 예외로 한다.<br> <br>
								</div>
								<div class="termsBox">
									제2장 주차장 예약서비스 이용계약<br> <br> 제6조(주차장 예약서비스 이용계약의 성립) <br>
									① 본 약관에 따른 이용계약은 이용자가 본 약관에 대한 동의와 함께 서비스에 대한 이용신청을 하고 예약이
									확정됨으로써 성립한다.<br> ② 예약 주차장을 이용하고자 할 경우 온라인(인터넷 홈페이지, 웹, 모바일
									앱)으로 접수 신청을 하여야 한다. <br> ③ 주차장 예약은 예약신청 시점부터 45일 후까지로 예약일을
									지정할 수 있고, 최소 2시간부터 최대 30일까지 예약할 수 있다.<br> ④ 이용자는 여러 대의 차량을
									예약 신청하거나, 동일 차량에 대하여 여러 차례 예약 신청할 수 있다. 단, 동일 차량을 여러 차례 예약 신청하는
									경우 일정이 중복되도록 예약하는 것은 불가하다.<br> <br> 제7조(예약 확인)<br>
									① 예약번호는 예약 접수 완료 시 생성되며 공사는 이용자에게 SMS 또는 E-mail 등을 통하여 예약내역을
									통지한다. <br> ② 예약접수 이후 예약을 확인하고자 하는 경우에는 예약번호, 차량번호, 이메일 중 한
									가지를 기재하고, 이후 예약 시 입력하였던 휴대전화번호 및 비밀번호도 함께 기재하여야 한다.<br> <br>
									제8조(예약 변경)<br> ① 이용자는 다음 각 호에 해당하는 경우 예약의 변경 신청을 할 수 있다. <br>
									1. 입차 예정시간 1시간 전까지 신청하는 경우<br> 2. 입차 예정시간 전 1시간 이내에 예약한
									경우에는 예약 신청시간으로부터 20분 이내 신청하는 경우 <br> ② 고객의 이용 희망일 예약 주차장
									잔여면 수가 충분하지 않을 경우(이하 “만차”이라 한다) 예약의 변경이 불가능 할 수 있다. <br> <br>
									제9조(예약 주차장 이용 및 입차 제한) <br> ① 입차는 예약 입차시간 기준 2시간 전부터 2시간
									후까지 가능하다.<br> ② 이용자는 다음 절차에 따라 공사 직원의 지시를 준수하며 예약 주차 공간을
									이용 하여야 한다.<br> 1. 예약된 입차 시간까지 예약 주차장 입구에 도착<br> 2. 예약
									주차 입구로 진입하여 차량번호 인식 후 입차<br> 3. 예약 주차장 내 비어 있는 주차면에 주차<br>
									4. 출차 시, 예약 주차장 출구를 통해 출차<br> ③ 장애인 차량의 경우 장애인 전용 주차면을
									예약하고 이용할 수 있다. 단, 장애인 자동차 표지가 부착된 자동차에 보행상 장애가 있는 자가 탑승한 경우에만
									주차할 수 있고, 이를 위반한 자가 이용하는 경우에는 관련법에 따라 과태료를 부과 받을 수 있다.<br>
									④ 공사는 다음 각 호의 사유가 있는 경우 예약서비스 이용자의 입차를 제한할 수 있다.<br> 1. 예약
									주차장의 주차단위구획(주차빌딩 등인 경우 높이 포함)을 벗어나는 차량<br> 2. 위험물을 적재하였거나
									악취를 현저하게 발생시키는 차량<br> 3. 자동차의 구조상 주차가 불가능하거나 곤란한 경우<br>
									4. 주차장 설비 및 다른 차량을 손상할 우려가 있는 차량<br> 5. 주차장 내에서 공사의 승인을 받지
									않은 영업행위를 하는 차량<br> 6. 이륜자동차<br> 7. 기타 주차장 관리에 지장이 있는
									차량이 주차하려고 할 때<br> <br>
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
									없다. <br> <br> 제13조 (예약 취소 및 환불 처리)<br> ① 제8조 제1항
									각 호에 해당하여 예약을 취소하는 경우 전액 환불이 가능하나, 제8조 제1항 각 호에서 규정한 시간보다 임박하여
									예약을 취소하는 경우 위약금 공제 후 환불이 가능하다. 구체적인 산정방법은 아래와 같다.<br> 1.
									예약시점 ∼ 입차 예정시간 1시간 전까지 : 전액 환불<br> 2. 입차 예정시간 1시간 전 ∼ 입차
									예정시간 2시간 경과까지 : 예약 보증금 50% 환불 (50% 위약금)<br> 3. 입차 예정시간 2시간
									이후(예약부도) ∼ : 환불 불가<br> 4. 입차 예정시간 1시간 전 구매 후 20분 이내 취소 시 :
									전액 환불<br> ② 공사는 환불 처리 시 이용자의 성명, 연락처, 환불적용계좌, 환불금액, 환불사유
									확인을 추가로 요구 할 수 있다.<br> ③ 공항의 책임으로 인한 예약취소는 수수료 없이 전액 환불이
									원칙이나 아래와 같은 사유로 인한 예약취소는 환불에서 제외된다.<br> 1. 전쟁이나 전쟁의 위협,
									폭동, 내란, 테러<br> 2. 자연·방사능 재난, 화재, 노동쟁의, 악천후, 화산폭발 또는 화산재<br>
									3. 정부규제, 항공 스케쥴의 변경 또는 취소<br> <br>
								</div>
								<div class="termsBox">
									제4장 이용제한 및 면책사항<br> 제14조 (예약서비스 이용의 제한 및 일시적 중단) 공사는 이용자에
									대해 다음에 제시하는 사유가 있을 경우 예약 서비스가 제한되거나 일시적으로 중단될 수 있다.<br> 1.
									예약 주차장이 만차인 경우<br> 2. 예약 접수가 불가능한 날짜에 예약을 신청하는 경우<br>
									3. 시스템에 보수공사가 필요하거나 부득이한 장애가 있는 등 기술적인 문제로 서비스 제공이 불가능한 경우<br>
									4. 지진, 화재, 정전, 홍수, 해일, 분화, 폭동, 소요, 전쟁, 그 외의 비상사태로 인해 서비스 제공을
									정상적으로 할 수 없게 된 경우<br> 5. 회사에 긴급한 사정이 있거나, 이용자의 정당한 권리 침해
									방지 등을 위해 필요한 경우<br> 6. 기타 공사의 사정상 이용자의 서비스 이용을 제한하거나 일시적으로
									중단할 필요성이 있는 경우<br> 제15조(이용자에 대한 서비스 이용정지) 공사는 이용자에 대해 다음에
									제시하는 몇 가지 사유가 있을 경우 서비스 이용을 통지 및 권고 없이 정지할 수 있다.<br> ①
									이용자가 본 규약을 위반한 경우<br> ② 이용자가 관리자에게 허위의 정보를 등록한 경우<br>
									③ 기타 관리자가 본 서비스 이용자로서 부적합하다고 판단하는 경우<br> <br>
									제16조(공사의 책임 및 면책사항)<br> ① 공사는 이용자가 본 서비스를 안정적으로 이용 할 수 있도록
									서비스를 운영하여야 하며 서비스용 설비에 장애가 발생하는 경우 그 설비를 수리하거나 복구할 의무가 있다. ②
									제1항에도 불구하고, 공사는 다음 각 호의 책임이 면제된다.<br> 1. 서비스 장애가 발생하여
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
								<input type="checkbox" id="agree01" class="hidden" title="동의 체크">
								<label for="agree01" class="colorType red">주차예약 이용안내 모든
									내용을 읽고 동의합니다.</label>
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
									○ 수집·이용 목적 : 주차장 예약서비스 이용 및 관리 <br /> ○ 수집하는 항목 :차량번호, 휴대전화번호,
									예약비밀번호, 할인유형 <br /> ○ 보유·이용 기간 : <span class="termsPoint2">3년</span>
									<br /> ※ 위의 개인정보 수집·이용 필수항목에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할
									경우 주차예약 서비스가 제한됨을 알려드립니다. <br />
								</div>
							</div>
						</div>
						<!--checkArea-->
						<div class="checkArea">
							<p class="checkbox">
								<input type="checkbox" id="agree04" class="hidden" title="동의 체크">
								<label for="agree04" class="colorType red">개인정보 수집·이용에
									동의합니다.</label>
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
													<li>한국공항공사는 개인정보보호법 제30조(개인정보 처리방침의 수립 및 공개)에 따라 정보주체의
														개인정보보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같이
														개인정보 처리방침을 수립·공개하고 있습니다.</li>
												</ul>
											</div>

											<section>
												<p class="titPage">개인정보 자동 수집 장치의 설치·운영 및 그 거부에 관한 사항</p>
												<ul class="list_dotBlue">
													<li>한국공항공사는 이용자의 웹사이트 방문기록 파악을 위해 이용정보를 저장하고 불러오는
														''쿠키(cookie)''를 사용합니다.</li>
													<li>쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는
														소량의 정보이며 이용자의 PC 내의 하드디스크에 저장되기도 합니다.
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

						<!--checkArea-->

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

		</form>
	</main>
<div class="modal fade" id="sucessModal" tabindex="-1" role="dialog" aria-labelledby="sucessModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>주차예약이 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>	
<!-- SDK 추가 -->
<script src="https://js.tosspayments.com/v2/standard"></script>
<script>
    const clientKey = "";
    const customerKey = "";
    const tossPayments = TossPayments(clientKey);
    
    function validate() {
        var validTot = $(".valid").length, validCnt = 0;

        $(".valid").each(function() {
            if ($(this).val()) {
                validCnt++; // Increment if the field has a value
            }
        });

        if (validTot === validCnt) {
            return true;
        } else {
            alert("필수값을 다시 확인해주세요.");
            return false;
        }
    }

    // 회원 결제
    const payment = tossPayments.payment({ customerKey });
    
    $(function() {
        $("#reservationBtn").click(async function() {
            if (validate()) {
                if ($("#agree01").is(":checked") && $("#agree02").is(":checked") && $("#agree03").is(":checked") && $("#agree04").is(":checked")) {
                    // Define confirm message
                    var confirmMsg = "작성 내용을 다시 한번 확인해주세요.\n\n"
                        + "- 차량번호 : " + $("#prkRsvtCarNo").val() + "\n"
                        + "- 입차일시 : " + $("#prkEntvhclTm").val() + "\n"
                        + "- 주차장 이름 : " + $("#prkLotArea").val() + "\n"
                        + "- 휴대전화 : " + $("#prkRsvtMoblphon").val() + "\n"
                        + "- 비밀번호 : " + $("#prkRsvtPswd").val() + "\n\n"
                        + "정보에 오류가 없으면 [확인] 버튼을, 틀린 정보가 있으면 [취소] 버튼을 눌러주세요.";

                    if (confirm(confirmMsg)) {
                        try {
                            const response = await $.ajax({
                                url: "/cust/parking/registPost",
                                type: "POST",
                                dataType: "json",
                                data: {
                                    prkRsvtCarNo: $("#prkRsvtCarNo").val(),
                                    prkEntvhclTm: $("#prkEntvhclTm").val(),
                                    prkLvvhclTm: $("#prkLvvhclTm").val(),
                                    prkRsvtCarType: $("#prkRsvtCarType").val(),
                                    prkRsvtMoblphon: $("#prkRsvtMoblphon").val(),
                                    prkRsvtPswd: $("#prkRsvtPswd").val(),
                                    prkLotArea: $("#prkLotArea").val()
                                },
                                beforeSend: function(xhr) {
                                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                                }
                            });

                            if (response.RESULT === '1') {
                                await requestPayment(); // 결제 요청 함수 호출
                            } else {
                                alert("등록 실패: " + response.MSG);
                            }
                        } catch (error) {
                            console.error("AJAX 요청 중 오류 발생:", error);
                            alert("입력값을 확인하세요.");
                        }
                    }
                } else {
                    alert("모든 동의 체크."); // 모든 동의 체크를 요구하는 메시지
                }
            }
        });

        async function requestPayment() {
            try {
                const paymentResponse = await payment.requestPayment({
                    method: "CARD",
                    amount: {
                        currency: "KRW",
                        value: 10000,
                    },
                    orderId: "xb70A9o0iKxFjfzXGFhLY", // 고유 주문번호
                    orderName: "주차비",
                    customerEmail: "customer123@gmail.com",
                    customerName: "김예영",
                    customerMobilePhone: "01012341234",
                    card: {
                        useEscrow: false,
                        flowMode: "DEFAULT", // 통합결제창 여는 옵션
                        useCardPoint: false,
                        useAppCardOnly: false,
                    },
                });
                 
                // 결제 성공 후 처리 로직 추가
                console.log("결제 성공:", paymentResponse);
                setTimeout(() => window.location.href="/cust/parking/reservation?phone=" + $("#prkRsvtMoblphon").val(), 1000);  
                
                
            } catch (error) {
                console.error("결제 요청 중 오류 발생:", error);
                alert("결제에 실패했습니다. 다시 시도해 주세요.");
            }
        }

        $('.btnClose').on('click', function() {
            $(this).closest('.popup, .alert').hide();
            $('.dimmed, #dimmed').hide();
        });
    });
</script>
