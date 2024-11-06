<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<div class="subVisual sub01" style="margin-bottom:0px;">
		<h3 class="title" style="padding-top:30px;">주차예약</h3>
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
<!-- 		<div class="subMenu prkRsvtMoblphon"> -->
<!-- 			<a>예약조회/변경/취소</a> -->
<!-- 			<ul> -->
<!-- 				<li><a href="/reservation/recheck.do" title="새 창 열림">주차예약 -->
<!-- 						신청</a></li> -->
<!-- 				<li><a href="/reservation/resView.do" title="새 창 열림">예약조회/변경/취소</a></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
	</div>
	<!--//subMenu-->
	<form id="parkingRsvtVO" name="parkingRsvtVO"
		action="/cust/parking/detail" method="post">
		<input type="hidden" id="prkRsvtNo" name="prkRsvtNo"
			value="${parkingRsvtVO.prkRsvtNo}" />
		<!-- 			<input type="hidden" id="prkRsvtNo"  	name="prkRsvtNo"	value="1234FJ0005"/> -->
		<input type="hidden" id="prkEntvhclTm" name="prkEntvhclTm"
			value="${parkingRsvtVO.prkEntvhclTm}" /> <input type="hidden"
			id="prkLvvhclTm" name="prkLvvhclTm"
			value="${parkingRsvtVO.prkLvvhclTm}" /> <input type="hidden"
			id="prkRsvtYmd" name="prkRsvtYmd" value="${parkingRsvtVO.prkRsvtYmd}" />
		<!-- 			<input type="hidden" id="depositAmt" 		name="depositAmt" 		value="10000"/> -->
		<!-- 			<input type="hidden" id="cardTradeNo" 	 	name="cardTradeNo" 		value="24101506304810906401"/> -->
		<!-- 			<input type="hidden" id="cardApprovalNo" 	name="cardApprovalNo" 	value="41160283"/> -->
		<input type="hidden" id="mallId" name="mallId" value="05563623" /> <input
			type="hidden" id="prkLotArea" name="prkLotArea"
			value="${parkingRsvtVO.prkLotArea}" /> <input type="hidden"
			id="prkRsvtMoblphon" name="prkRsvtMoblphon"
			value="${parkingRsvtVO.prkRsvtMoblphon}" /> <input type="hidden"
			id="prkRsvtCarNo" name="prkRsvtCarNo"
			value="${parkingRsvtVO.prkRsvtCarNo}" /> <input type="hidden"
			id="preReservationYn" name="preReservationYn" value="" /> <input
			type="hidden" id="sectnId" name="sectnId" value="2" /> <input
			type="hidden" id="status" name="status" value="예약완료" /> <input
			type="hidden" id="data" name="data" />
		<div id="content">
			<div class="inner">
				<!--location-->




				<div class="location" style="padding:0px;">
<!-- 					<h4 class="subTitle">예약조회/변경/취소</h4> -->
					<!--breadcrumb-->
<!-- 					<ul class="breadcrumb web"> -->
<!-- 						<li><a href="/" class="home">Home</a></li> -->
<!-- 						<li><a href="/reservation/recheck.do">주차예약</a></li> -->
<!-- 						<li><a href="/reservation/resView.do">주차조회/변경/취소</a></li> -->
<!-- 					</ul> -->
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
				<div id="dimmed" style="display:none;"></div>
					<div class="section">
						<div class="reserveInfo">
							<p class="titPage mt50">주차예약 신청내역(세부)</p>
							<!--web table-->
							<div class="table type04 web">
								<table>
									<caption>예약 신청내역 테이블이며 예약일시, 주차 등의 정보를 나타냅니다.</caption>
<%-- 									<colgroup> --%>
<%-- 										<col style="width: 16%; max-width: 240px; min-width: 100px;"> --%>
<%-- 										<col style="width: auto"> --%>
<%-- 										<col style="width: 16%; max-width: 240px; min-width: 100px;"> --%>
<%-- 										<col style="width: auto"> --%>
<%-- 									</colgroup> --%>
									<tbody>
										<c:forEach var="parkingRsvtVO" items="${parkingRsvtVOList}"	varStatus="status">
											<tr class='typeNoArticle' onclick="changeTableData('${parkingRsvtVO.prkRsvtNo}',  '${parkingRsvtVO.prkRsvtMoblphon}', '${parkingRsvtVO.prkLotArea}',
											'${parkingRsvtVO.prkRsvtCarNo}', '${parkingRsvtVO.prkRsvtCarType}', '${parkingRsvtVO.prkEntvhclTm}', '${parkingRsvtVO.prkLvvhclTm}')"
											style="cursor: pointer;">
												<th scope="row" style="display:none;">
													<label for="prkRsvtNo" style="width:auto;">예약번호</label>
												</th>
												<td style="display:none;">
													${parkingRsvtVO.prkRsvtNo}
												</td>
												<th scope="row">
													<label for="prkRsvtMoblphon" style="width:auto;">휴대폰<br>번호</label>
												</th>
												<td style="word-break:break-all;">
												    ${fn:substring(parkingRsvtVO.prkRsvtMoblphon, 0, 3)}-${fn:substring(parkingRsvtVO.prkRsvtMoblphon, 3, 7)}-${fn:substring(parkingRsvtVO.prkRsvtMoblphon, 7, 11)}	
												</td>
												<th scope="row">
													<label for="">주차장</label>
												</th>
												<td>${parkingRsvtVO.prkLotArea}</td>
												<th scope="row">
													<label for="prkRsvtCarNo">차량번호</label>
												</th>
												<td>${parkingRsvtVO.prkRsvtCarNo}</td>
												<th scope="row">
													<label for="">차량종류</label>
												</th>
												<td>${parkingRsvtVO.prkRsvtCarNo}</td>
												<th scope="row">
													<label for="prkEntvhclTm">입차 예정일시</label>
												</th>
												<td>${parkingRsvtVO.prkEntvhclTm}</td>
												<th scope="row">
													<label for="prkLvvhclTm">출차 예정일시</label>
												</th>
												<td>${parkingRsvtVO.prkLvvhclTm}</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>

							<!--prkRsvtMoblphon table-->
							<div class="table type04 prkRsvtMoblphon">
								<table>
									<caption>예약 신청내역 테이블이며 예약일시, 주차 등의 정보를 나타냅니다.</caption>
									<colgroup>
										<col style="width: 20%; min-width: 100px;">
										<col style="width: auto">
									</colgroup>
									<tbody>
									    <c:if test="${not empty parkingRsvtVOList}">
									        <c:set var="parkingRsvtVO" value="${parkingRsvtVOList[0]}" />
									        <tr style="display:none;">
									            <th scope="row"><label for="prkRsvtNo">예약번호</label></th>
									            <td id="displayprkRsvtNo">${parkingRsvtVO.prkRsvtNo}</td>
									        </tr>
									        <tr>
									            <th scope="row"><label for="prkRsvtMoblphon">휴대폰번호</label></th>
									            <td id="displayMoblphon">${parkingRsvtVO.prkRsvtMoblphon}</td>
									        </tr>
									        <tr>
									            <th scope="row"><label for="prkLotArea">주차장</label></th>
									            <td id="displayLotArea">${parkingRsvtVO.prkLotArea}</td>
									        </tr>
									        <tr>
									            <th scope="row"><label for="prkRsvtCarNo">차량번호</label></th>
									            <td id="displayCarNo">${parkingRsvtVO.prkRsvtCarNo}</td>
									        </tr>
									        <tr>
									            <th scope="row"><label for="prkRsvtCarType">차량종류</label></th>
									            <td id="displayCarType">
									                <c:choose>
									                    <c:when test="${parkingRsvtVO.prkRsvtCarType == 'DC001'}">
									                        	일반
									                    </c:when>
									                    <c:otherwise>
									                        ${parkingRsvtVO.prkRsvtCarType}
									                    </c:otherwise>
									                </c:choose>
									            </td>
									        </tr>
									        <tr>
									            <th scope="row"><label for="prkEntvhclTm">입차 예정일시</label></th>
									            <td id="displayEntvhclTm">${parkingRsvtVO.prkEntvhclTm}</td>
									        </tr>
									        <tr>
									            <th scope="row"><label for="prkLvvhclTm">출차 예정일시</label></th>
									            <td id="displayLvvhclTm">${parkingRsvtVO.prkLvvhclTm}</td>
									        </tr>
									    </c:if>
									    <c:if test="${empty parkingRsvtVOList}">
									        <tr>
									            <td colspan="2">예약된 내역이 없습니다.</td>
									        </tr>
									    </c:if>
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
								</span>
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
																		예정시간 1시간 전</strong></th>
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
											<span>닫기</span>
										</button>
									</div>
									<div class="align-items-center justify-content-center" style="float:right;">
										<button type="button" class="btn btn-primary" id="refundBtn">예약취소</button>
									</div>
								</div>
							</div>
							<div class="popup refundConfirmPopup" style="display:none;">
								<div class="popupPd">
									<div class="popCont">
										<section id="refundMessage">
											환불가능금액은 <span id="refundAmount"></span>원 입니다. 예약을 취소하시겠습니까?
										</section>
									</div>
									<div style="float:right;">
										<button type="button" class="btn btn-primary" id="refundYes">네</button>
										<button type="button" class="btn btn-secondary" id="refundNo">아니오</button>
									</div>
								</div>
							</div>
							<div class="popup updatePopup" style="display:none;">
								<div class="popupPd">
									<div class="popCont" style="padding-bottom:0px;">
										<div class="d-flex flex-column items-align-center justify-content-center" style="margin-left:90px; margin-bottom:10px;">
											<span>변경 차량번호</span>
											<div class="d-flex flex-column">
												<input class="form-control" type="text" id="updatePrkRsvtCarNo" style="width:50%;">
											</div>
										</div>
										<div class="d-flex flex-row items-align-center justify-content-center" style="margin-bottom:30px;">
											<div class="d-flex flex-column items-align-center justify-content-center" style="margin-right:10px;">
												<span>변경 입차시간</span>
												<div class="d-flex flex-column">
													<input class="form-control" type="date" id="updateEntvhclDate">
													<input class="form-control" type="time" id="updateEntvhclTime">
												</div>
											</div>
											<div class="d-flex flex-column items-align-center justify-content-center">
												<span>변경 출차시간</span>
												<div class="d-flex flex-column">
													<input class="form-control" type="date" id="updateLvvhclDate">
													<input class="form-control" type="time" id="updateLvvhclTime">
												</div>													
											</div>
										</div>
									</div>
									<div style="float:right;">
										<button type="button" class="btn btn-primary" id="changeSubmitBtn">예약변경</button>
										<button type="button" class="btn btn-secondary" id="changeCancelBtn">취소</button>
									</div>
								</div>
							</div>
							<div class="popup refundSuccessPopup" style="display:none;">
								<div class="popupPd">
									<div class="popCont">
										<section id="refundMessage">
											예약이 취소되었습니다.
										</section>
									</div>
								</div>
							</div>
							<div class="popup refundFailPopup" style="display:none;">
								<div class="pupupPd">
									<div class="popCont">
										<section id="refundMessage">
											예약 취소에 실패했습니다. 관리자에게 문의하세요.
										</section>
									</div>
								</div>
							</div>
							<div class="popup updateSuccessPopup" style="display:none;">
								<div class="popupPd">
									<div class="popCont">
										<section id="refundMessage">
											예약이 변경되었습니다.
										</section>
									</div>
								</div>
							</div>
							<div class="popup updateFailPopup" style="display:none;">
								<div class="pupupPd">
									<div class="popCont">
										<section id="refundMessage">
											예약 변경에 실패했습니다. 관리자에게 문의하세요.
										</section>
									</div>
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
	$(function() {

		$("#mainBtn").click(function() {
			window.location.href="/cust/parking/main";
		});

		$("#updateBtn")	.click(
				function() {
					var displayEntvhclTm = $("#displayEntvhclTm").text();
					var displayLvvhclTm = $("#displayLvvhclTm").text();
					var displayprkRsvtNo =$("#displayprkRsvtNo").text();
					var displayCarNo = $("#displayCarNo").text();
					
					console.log(displayEntvhclTm);
					console.log(displayLvvhclTm);
					
				    // 입차 시간을 Date 객체로 변환
				    var entvhclDateTime = new Date(displayEntvhclTm);
				    var lvvhclDateTime = new Date(displayLvvhclTm);

				    // 입차 시간의 날짜와 시간 부분을 분리
				    var entvhclDate = entvhclDateTime.toISOString().split("T")[0]; // yyyy-mm-dd
				    var entvhclTime = entvhclDateTime.toTimeString().split(" ")[0].substring(0, 5); // HH:MM

				    // 출차 시간의 날짜와 시간 부분을 분리
				    var lvvhclDate = lvvhclDateTime.toISOString().split("T")[0]; // yyyy-mm-dd
				    var lvvhclTime = lvvhclDateTime.toTimeString().split(" ")[0].substring(0, 5); // HH:MM

				    // Input 필드에 날짜와 시간 값 넣기
				    $("#updateEntvhclDate").val(entvhclDate); // 첫 번째 날짜 input에 입차 날짜 설정
				    $("#updateEntvhclTime").val(entvhclTime); // 첫 번째 시간 input에 입차 시간 설정

				    $("#updateLvvhclDate").val(lvvhclDate); // 두 번째 날짜 input에 출차 날짜 설정
				    $("#updateLvvhclTime").val(lvvhclTime); // 두 번째 시간 input에 출차 시간 설정
				    
				    $("#updatePrkRsvtCarNo").val(displayCarNo);
				    
					if (possibleChk(displayEntvhclTm, "update") > 0) {
						$(".updatePopup").css("display", "block");
						$(".dimmed, #dimmed").css("display", "block");
						
						$(function(){
							$("#changeCancelBtn").on({
								'click' : function(){
									$(".updatePopup").css("display", "none");
									$(".dimmed, #dimmed").css("display", "none");
								}
							})
							
							$("#changeSubmitBtn").on({
								'click' : function(){
									
									var parkingRsvtVO = {
											prkRsvtCarNo : $("#updatePrkRsvtCarNo").val(),
											prkRsvtNo : displayprkRsvtNo,
											prkEntvhclTm : $("#updateEntvhclDate").val() + " " + $("#updateEntvhclTime").val() + ":00",
											prkLvvhclTm : $("#updateLvvhclDate").val() + " " +$("#updateLvvhclTime").val() + ":00"
									}
									
									$.ajax({
										url:"/cust/parking/parkingUpdate",
										contentType:"application/json; charset=utf-8",
										data:JSON.stringify(parkingRsvtVO),
										type:"POST",
										dataType:"json",
										beforeSend:function(xhr){
											xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
										},
										success:function(response){
											$(".updatePopup").hide();
											$('.updateSuccessPopup').css("display", "block");
											setTimeout(() => window.location.href="/cust/parking/reservation?phone=" + $("#prkRsvtMoblphon").val(), 1000);  
										},
										error:function(xhr, status, error){
											console.log("error");
											$(".updatePopup").hide();
											$('.updateFailPopup').css("display", "block");
											setTimeout(() => window.location.href="/cust/parking/reservation?phone=" + $("#prkRsvtMoblphon").val(), 1000);  
										}
									})
									
								}
							})
						})
						
					} else {
						alert("변경이 불가한 예약건입니다.<br/><br/>(기존 예약건은 유지됩니다. <br/>취소를 원하시면 예약취소를 진행해주세요.)");
						return;
					}
				});

		$("#cancelBtn").click(
				function() {
					var displayMoblphon = $("#displayMoblphon").text();
					var displayEntvhclTm = $("#displayEntvhclTm").text();
					var displayLvvhclTm = $("#displayLvvhclTm").text();
					var displayprkRsvtNo =$("#displayprkRsvtNo").text();
					
					let refundAmt = possibleChk(displayEntvhclTm, "cancel");
					$("#refundAmount").text(refundAmt);
					
					$(".refundPopup").css("display", "block");
					$(".dimmed, #dimmed").css("display", "block");
					

					$(function() {
						$('.btnClose').on({
							'click' : function() {
								$(this).closest('.popup, .alert').hide();
								$('.dimmed, #dimmed').css("display", "none");
							}
						});
					});
					
					$(function(){
						$("#refundBtn").on({
							'click' : function(){
								$('.refundPopup').hide();
								$('.refundConfirmPopup').css("display", "block");
							}
						})
					})
					
					$(function(){
						$("#refundYes").on({
							'click' : function(){
								var parkingRsvtVO = {
										prkRsvtNo : displayprkRsvtNo
								}
								
								$.ajax({
									url:"/cust/parking/delete",
									contentType:"application/json; charset=utf-8",
									data:JSON.stringify(parkingRsvtVO),
									type:"POST",
									dataType:"json",
									beforeSend:function(xhr){
										xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
									},
									success:function(response){
										console.log("success");
										$(".refundConfirmPopup").hide();
										$('.refundSuccessPopup').css("display", "block");
										setTimeout(() => window.location.href="/cust/parking/reservation?phone=" + $("#prkRsvtMoblphon").val(), 1000);  
									},
									error:function(xhr, status, error){
										console.log("error");
										$(".refundConfirmPopup").hide();
										$('.refundFailPopup').css("display", "block");
									}
								})
								
							}
						})
					})
					
					$(function(){
						$("#refundNo").on({
							'click' : function(){
								console.log("no")
								$(".refundConfirmPopup").hide();
								$('.dimmed, #dimmed').css("display", "none");
								
							}
						})
					})

// 					if (refundAmt > 0) {
// 						console.log("modal")
// 						$("#confirm").modal("show");
// 						$("#confirmMassage")
// 								.html(
// 										"환불가능금액은 " + refundAmt + "원 입니다. <br>주차예약을 취소하시겠습니까?");
// 						$("#confirmOk").click(
// 								function() {
// 									$.loadingStart();
// 									$("#refundAmt").val(refundAmt);
// 									// 									$("#receiptAmt").val();
// 									var prkLotArea = $("#prkLotArea").val();
// 									/* if($("#sectnId").val() == '14'){
// 										prkLotArea = "여객주차장(P2) 주차빌딩 3,4층"
// 									} */
// 									var data = {
// 										"차량번호" : $("#prkRsvtCarNo").val(),
// 										"예약번호" : $("#prkRsvtNo").val(),
// 										// 										"공항정보" : $("#airportNm").val(),
// 										"주차장명" : $("#prkLotArea").val(),
// 										"시작일자" : $("#prkEntvhclTm").val(),
// 										"종료일자" : $("#prkLvvhclTm").val(),
// 										"공항별연락처" : $("#parkingTelNo").val(),
// 										"보증금환불액" : 10000
// 									};
// 									// 									if (penalty > 0) {
// 									// 										$("#reviseTypeCode").val("32");
// 									// 									} else {
// 									// 										$("#reviseTypeCode").val("40");
// 									// 									}

// 									$("#data").val(JSON.stringify(data));
// 									$("#parkingRsvtVO").attr("action",
// 											"/parking/delete.do");
// 									$("#parkingRsvtVO").submit();
// 								});
// 					} else {
// 						alertMessage("취소가 불가한 예약건입니다.");
// 						return;
// 					}
				});
	});

	//환불로직 - 조미주
// 	function possibleChk(prkEntvhclTm, 
// // 			prkRsvtYmd, 예약한 시간이 테이블에 없어서 제외 - 홍정호
// 			resStatus) {
// 		// 환불금액 = 보증금 - 위약금
// 		var refundAmt = $("10000").val();
// 		// 현재 시간
// 		var currentTm = moment(new Date());
// 		// 입차 예정시간 1시간 전
// 		var res1HourBefere = moment(prkEntvhclTm).subtract(1, "hours");
// 		// 입차 예정시간 2시간 후
// 		var res2HourLater = moment(prkEntvhclTm).add(2.0165, "hours"); //0.0165는 59초를 의미
// 		// 예약 신청시간 20분 후
// // 		var reg20MinLater = moment(prkRsvtYmd).add(20, "minutes");

// 		// [예약서비스 이용약관] 
// 		// 제2장 제8조 ① 예약의 변경 및 취소는 입차 예정시간(prkEntvhclTm) 1시간 전까지 가능하다.
// 		// 제3장 제13조 1-1 예약시점 ~ 입차 예정시간 1시간 전까지 : 전액 환불
// 		if (moment(currentTm).isSameOrBefore(res1HourBefere)) {

// 			// 제2장 제8조 ② 입차 예정시간(prkEntvhclTm) 전 1시간이내에 예약한 경우, 예약신청시간(prkRsvtYmd)으로부터 20분 이내에는 예약의 변경 및 취소가 가능하다.
// 			// 제3장 제13조 1-4 입차 예정시간 1시간 전 구매 후 20분 이내 취소시 : 전액 환불
// 		} else if (moment(res1HourBefere).isBefore(prkRsvtYmd)
// // 				&& moment(currentTm).isSameOrBefore(reg20MinLater)
// 				) {

// 			// 제3장 제13조 1-2 입차 예정시간 1시간 전 ~ 입차 예정시간 2시간 경과까지 : 예약 보증금 50% 환불
// 		} else if (moment(currentTm).isBetween(res1HourBefere, res2HourLater)
// 				&& resStatus == "cancel") {
// 			refundAmt = refundAmt / 2
// 		} else {
// 			refundAmt = refundAmt - refundAmt
// 		}
// 		return refundAmt;
// 	}
	
	//환불로직 - 홍정호, moment.js 에 시간을 변환시켜 넣기에는 시간이 부족
	function possibleChk(prkEntvhclTm, resStatus) {
	    var refundAmt = 10000; // 보증금 설정
	
	    // 입차 예정 시간과 현재 시간을 Date 객체로 변환
	    var entvhclTm = new Date(prkEntvhclTm.replace(" ", "T")); // ISO 형식으로 변환
	    var currentTm = new Date();
	
	    // 입차 예정시간 1시간 전
	    var res1HourBefore = new Date(entvhclTm.getTime() - (60 * 60 * 1000)); // 1시간 전
	    // 입차 예정시간 2시간 후
	    var res2HourLater = new Date(entvhclTm.getTime() + (2 * 60 * 60 * 1000)); // 2시간 후
	
	    // 예약 취소 정책 적용
	    if (currentTm <= res1HourBefore) {
	        // 전액 환불
	        return refundAmt;
	    } else if (currentTm > res1HourBefore && currentTm <= entvhclTm) {
	        // 입차 예정시간 1시간 이내
	        if (resStatus == "cancel") {
	            refundAmt = refundAmt / 2; // 50% 환불
	        }
	    } else if (currentTm > entvhclTm && currentTm <= res2HourLater) {
	        // 입차 예정시간 1시간 후 ~ 입차 예정시간 2시간 경과까지
	        if (resStatus == "cancel") {
	            refundAmt = refundAmt / 2; // 50% 환불
	        }
	    } else {
	        // 환불 없음
	        refundAmt = 0;
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

		if (!$("#prkRsvtMoblphon").val()) {
			validN("#prkRsvtMoblphon", "#prkRsvtMoblphonChk");
			alertMessage("휴대폰번호를 입력해주세요.");
			return;
		} else {
			var chk = /^[0-9]{3}[0-9]{3,4}[0-9]{4}/;

			if (!chk.test($("#prkRsvtMoblphon").val())) {
				validN("#prkRsvtMoblphon", "#prkRsvtMoblphonChk");
				alertMessage("휴대폰번호를 다시 확인해주세요.");
			} else {
				validY("#prkRsvtMoblphon", "#prkRsvtMoblphonChk");
				validCnt++;
			}
		}

		if (!$("#prkRsvtPswd").val()) {
			validN("#prkRsvtPswd", "#prkRsvtPswdChk");
			alertMessage("비밀번호를 입력해주세요.");
			return;
		} else {
			var chk = /^[0-9a-zA-Z]{4,}$/;

			if (!chk.test($("#prkRsvtPswd").val())) {
				validN("#prkRsvtPswd", "#prkRsvtPswdChk");
				alertMessage("비밀번호는 4자리 이상 입력해야 합니다.");
			} else {

				if ($("#prkRsvtPswd").val() != $("#prkRsvtPswdCk").val()) {
					validN("#prkRsvtPswd", "#prkRsvtPswdChk");
					alertMessage("비밀번호를 다시 확인해주세요.");
				} else {
					validY("#prkRsvtPswd", "#prkRsvtPswdChk");
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
	
    function changeTableData(rsvtNo ,moblphon, lotArea, carNo, carType, entvhclTm, lvvhclTm) {
        document.getElementById("displayprkRsvtNo").innerText = rsvtNo;
        document.getElementById("displayMoblphon").innerText = moblphon;
        document.getElementById("displayLotArea").innerText = lotArea;
        document.getElementById("displayCarNo").innerText = carNo;
        document.getElementById("displayCarType").innerText = (carType === 'DC001') ? '일반' : carType;
        document.getElementById("displayEntvhclTm").innerText = entvhclTm;
        document.getElementById("displayLvvhclTm").innerText = lvvhclTm;
	}	
</script>
</body>
</html>