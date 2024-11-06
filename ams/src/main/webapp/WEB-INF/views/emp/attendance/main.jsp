<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/attendance/main.css">
<link rel="stylesheet" href="/resources/css/attendance/main.css"
	media="all">
<link type="text/css" href="/resources/css/mypage/docEditor.css"
	rel="stylesheet" media="screen" />
<link type="text/css" href="/resources/css/mypage/goApp1.css"
	rel="stylesheet" media="screen" />
<link type="text/css" href="/resources/css/mypage/goApp2.css"
	rel="stylesheet" media="screen" />
<link type="text/css" href="/resources/css/mypage/goStyle.css"
	rel="stylesheet" media="screen" />
<script>
console.log("잔여휴가 : " + "${workRecordVO.totVacdyCnt}");
console.log("workRecord : " + "${workRecordVO}");
console.log("list : " + "${list}");
</script>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memberVO" />
</sec:authorize>
<!-- <section class="content"> -->

<div class="titleHeader d-flex align-items-center">
	<div>
		<span
			style="color: #A4A4A4; font-size: 20px; font-weight: 600; word-wrap: break-word;">인사
			- </span> <span
			style="font-size: 20px; font-weight: 600; word-wrap: break-word;">근태현황
			</span>
	</div>
</div>
<!-- 근무이력 테이블 -->

<div class="container-fluid">
	<div class="card card-default">
		<h2 class="card-title">근무 이력</h2>
		<div class="card-body">
			<div class="row">
				<div class="space"></div>
				<!-- 근태현황 박스 시작 -->
				<div class="block1">

					<label>근태현황</label>
					<div class="info-box bg-right">
						<!-- 박스 안 텍스트 단위 -->
						<div class="info-box-content">
							<span class="info-box-text text-center text-muted">지각</span> <span
								class="info-box-number text-center text-muted mb-0">0</span>
						</div>
						<!--  -->
						<!-- 박스 안 텍스트 단위 -->
						<div class="info-box-content">
							<span class="info-box-text text-center text-muted">반차</span> <span
								class="info-box-number text-center text-muted mb-0">0</span>

						</div>
						<!--  -->
						<!-- 박스 안 텍스트 단위 -->
						<div class="info-box-content">
							<span class="info-box-text text-center text-muted">결근</span>
							<c:if test="${workRecordVO.totBizdyCnt == null}">
								<span class="info-box-number text-center text-muted mb-0">0</span>
							</c:if>
							<span class="info-box-number text-center text-muted mb-0">${workRecordVO.totBizdyCnt}</span>
						</div>
						<!--  -->

					</div>

				</div>
				<!-- 근태현황박스 시작 -->
				<div class="space"></div>
				<div class="block2">

					<label>휴가</label>

					<div class="info-box bg-right">
						<div class="info-box-content">
							<span class="info-box-text text-center text-muted">잔여휴가</span> <span
								class="info-box-number text-center text-muted mb-0">${getHolidayVO.empYrycDaycnt}</span>
						</div>
						<button type="button" id="goPaymentForm" class="btn btn-primary">휴가신청</button>
					</div>
				</div>
				<!-- 근태현황 끝 -->
				<div class="space"></div>
				<!-- 근무시간 시작 -->
				<div class="block3">

					<label>근무시간</label>
					<div class="info-box bg-right">
						<div class="info-box-content">
							<span class="info-box-text text-center text-muted">근무일수</span>
							<c:if test="${workRecordVO.workCnt == null}">
								<span class="info-box-number text-center text-muted mb-0">0</span>
							</c:if>
							<span class="info-box-number text-center text-muted mb-0">${workRecordVO.workCnt }</span>
						</div>
						<div class="info-box-content">
							<span class="info-box-text text-center text-muted">근무시간</span>
							<c:if test="${workRecordVO.allAttend == null}">
								<span class="info-box-number text-center text-muted mb-0">${workRecordVO.allAttend}</span>

							</c:if>
							<span class="info-box-number text-center text-muted mb-0">${workRecordVO.allAttend}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--금일 근무 현황 테이블   -->
<div class="container-fluid">
	<div class="card card-default">
		<h2 class="card-title">금일 근무 현황</h2>
		<div class="card-body">
			<div class="attend_contents_wrap2">
				<p class="txt">
				<div id="serverTm">${serverTime}</div>
				<!-- 						<span class="time" id="timelineGadgetTime">06:56:28</span> -->
				</p>
				<div class="ehr_stat_data summary">
					<%-- 						<div id="serverTm">${serverTime}</div> --%>
					<div id="b2-1-work-time"></div>

					<c:if test="${workRecordVO.minuite == null}">
						<p class="stat_tit">${workRecordVO.nowHh}<b>h</b>${workRecordVO.nowMi}<b>m</b>
						</p>
					</c:if>
					<c:if test="${workRecordVO.minuite != null}">
						<p class="stat_tit">${workRecordVO.hour}<b>h</b>${workRecordVO.minuite}<b>m</b>
						</p>
					</c:if>
					<div class="type_flexible_summary">
						<div class="wrap_progress">
							<div class="time min" title="주간 근무시간은 40h입니다." style="left: 76%">최소
								40h</div>
							<div class="bar" style="left: 76%"></div>
							<div class="time max" title="최대 근무시간은 52h입니다.">최대 52h</div>

							<div class="progress">
								<c:set var="maxHours" value="8" />
								<c:set var="percentage"
									value="${(workRecordVO.hour/ maxHours) * 100}" />
								<c:choose>
									<c:when test="${percentage < 10}">
										<div class="part_default" title="0% 완료" style="width: 0%"></div>
									</c:when>
									<c:when test="${percentage < 20}">
										<div class="part_default" title="10% 완료" style="width: 10%"></div>
									</c:when>
									<c:when test="${percentage < 30}">
										<div class="part_default" title="20% 완료" style="width: 20%"></div>
									</c:when>
									<c:when test="${percentage < 40}">
										<div class="part_default" title="30% 완료" style="width: 30%"></div>
									</c:when>
									<c:when test="${percentage < 50}">
										<div class="part_default" title="40% 완료" style="width: 40%"></div>
									</c:when>
									<c:when test="${percentage < 60}">
										<div class="part_default" title="50% 완료" style="width: 50%"></div>
									</c:when>
									<c:when test="${percentage < 70}">
										<div class="part_default" title="60% 완료" style="width: 60%"></div>
									</c:when>
									<c:when test="${percentage < 80}">
										<div class="part_default" title="70% 완료" style="width: 70%"></div>
									</c:when>
									<c:when test="${percentage < 90}">
										<div class="part_default" title="80% 완료" style="width: 80%"></div>
									</c:when>
									<c:when test="${percentage < 100}">
										<div class="part_default" title="90% 완료" style="width: 90%"></div>
									</c:when>
									<c:when test="${percentage >= 100}">
										<div class="part_default" title="100% 완료" style="width: 100%"></div>
									</c:when>
								</c:choose>
								<c:if test="${workRecordVO.hour == null}">
									<c:set var="maxHours" value="8" />
									<c:set var="percentage"
										value="${(workRecordVO.nowHh/ maxHours) * 100}" />
									<c:choose>
										<c:when test="${percentage < 10}">
											<div class="part_default" title="0% 완료" style="width: 0%"></div>
										</c:when>
										<c:when test="${percentage < 20}">
											<div class="part_default" title="10% 완료" style="width: 10%"></div>
										</c:when>
										<c:when test="${percentage < 30}">
											<div class="part_default" title="20% 완료" style="width: 20%"></div>
										</c:when>
										<c:when test="${percentage < 40}">
											<div class="part_default" title="30% 완료" style="width: 30%"></div>
										</c:when>
										<c:when test="${percentage < 50}">
											<div class="part_default" title="40% 완료" style="width: 40%"></div>
										</c:when>
										<c:when test="${percentage < 60}">
											<div class="part_default" title="50% 완료" style="width: 50%"></div>
										</c:when>
										<c:when test="${percentage < 70}">
											<div class="part_default" title="60% 완료" style="width: 60%"></div>
										</c:when>
										<c:when test="${percentage < 80}">
											<div class="part_default" title="70% 완료" style="width: 70%"></div>
										</c:when>
										<c:when test="${percentage < 90}">
											<div class="part_default" title="80% 완료" style="width: 80%"></div>
										</c:when>
										<c:when test="${percentage < 100}">
											<div class="part_default" title="90% 완료" style="width: 90%"></div>
										</c:when>
										<c:when test="${percentage >= 100}">
											<div class="part_default" title="100% 완료" style="width: 100%"></div>
										</c:when>
									</c:choose>
								</c:if>
							</div>
							<div class="log_view_wrap">
								<ul class="log_view">
									<li>
										<dl class="log_item">
											<dt>출근시간</dt>

											<!-- 출근 시간 업데이트 -->
											<c:if test="${workRecordVO.attendTm == null}">
												<dd id="workInTime">${workRecordVO.attendTm}</dd>
											</c:if>
											<c:if test="${workRecordVO.attendTm != null}">
												<dd id="workInTime">${workRecordVO.attendTm}</dd>
											</c:if>
										</dl>
									</li>
									<li>
										<dl class="log_item">
											<dt>퇴근시간</dt>

											<dd id="workOutTime">${workRecordVO.lvffcTm}</dd>

											<!-- 퇴근 시간 업데이트 -->
										</dl>
									</li>
								</ul>
							</div>

							<div class="vertical_bar"></div>
							<section class="function function_attend">
								<div class="function_btn_wrap">
									<input type="hidden" id="memId" value="${memberVO.memId}" />
									<c:if test="${workRecordVO.attendTm == null}">
										<input class="inoutBtnIn" type="button" value="출근하기"
											id="workIn" />
									</c:if>
									<c:if test="${workRecordVO.attendTm != null}">
										<input class="inoutBtnIn" type="button" value="출근하기"
											id="workOk" disabled="disabled" />
									</c:if>
									<!-- 퇴근로직 -->

									<div id="workOut">
										<form name="OutForm" id="OutForm"
											enctype="multipart/form-data">
											<input type="hidden" name="memId" value="${memberVO.memId}" />
											<input type="hidden" name="wrNo" value="${workRecordVO.wrNo}" />
											<button type="button" class="inoutBtnOut" id="workOutBtn">퇴근하기</button>
										</form>
									</div>
									<div class="works_state"></div>
									<div class="layer_transition" id="layer_transition"
										style="z-index: 100; display: none;">
										<div class="ui-menu-container container">
											<div class="content">
												<div class="row_wrap menuitem my-todo-list foldable">
													<ul class="submenu-list statusList">
														<li class="timelineStatus"><span class="txt "
															data-code="3">업무</span></li>
														<li class="timelineStatus"><span class="txt "
															data-code="4">업무종료</span></li>
														<li class="timelineStatus"><span class="txt "
															data-code="5">외근</span></li>
														<li class="timelineStatus"><span class="txt "
															data-code="6">출장</span></li>
														<li class="timelineStatus"><span class="txt "
															data-code="30">반차</span></li>
													</ul>
												</div>
												<hr>
											</div>
										</div>
									</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 근태리스트 -->

<div class="container-fluid">
	<div class="card card-default">
		<h2 class="card-title">주간 근무현황</h2>
		<div class="listAttend">
			<div class="tableDiv">
				<table>
					<thead>
						<tr>
							<th style="width: 20%; text-align: center;">일자</th>
							<th style="width: 20%; text-align: center;">출근시간</th>
							<th style="width: 20%; text-align: center;">퇴근시간</th>
							<th style="width: 20%; text-align: center;">총근무시간</th>
						</tr>
					</thead>
					<tbody>
						<!-- list에서 각 항목을 반복하면서 테이블에 출력 -->
						<c:forEach var="attendanceVO" items="${list}" varStatus="status">
							<tr class="MaintenTR">
								<!-- 근무 일자 (wrNo의 첫 8자리) -->
								<td style="width: 20%; text-align: center;"><c:set
										var="year" value="${attendanceVO.wrNo.substring(0, 4)}" /> <c:set
										var="month" value="${attendanceVO.wrNo.substring(4, 6)}" /> <c:set
										var="day" value="${attendanceVO.wrNo.substring(6, 8)}" />
									${year}-${month}-${day}</td>

								<!-- 출근 시간 -->
								<td style="width: 20%; text-align: center;"><c:out
										value="${attendanceVO.attendTm != null ? attendanceVO.attendTm : '미등록'}" />
								</td>

								<!-- 퇴근 시간 (null일 경우 미등록 표시) -->
								<td style="width: 20%; text-align: center;"><c:out
										value="${attendanceVO.lvffcTm != null ? attendanceVO.lvffcTm : '미등록'}" />
								</td>

								<!-- 총 근무시간 (null일 경우 0시간으로 표시) -->
								<td style="width: 20%; text-align: center;"><c:out
										value="${attendanceVO.allHour != null ? attendanceVO.allHour : '00h00m'}" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- Add Modal for Completion -->
<!-- <div id="completionModal" class="modal" style="display: none;"> -->
<!-- 	<div class="modal-content"> -->
<!-- 		<p>등록 완료되었습니다.</p> -->
<!-- 		<button onclick="$('#completionModal').hide();">닫기</button> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- </section> -->
<script>
	$(document)
			.ready(
					function() {
						var memId = $("#memId").val(); // 미리 선언

						// 출근 처리
						$('#workIn').on(
								'click',
								function() {
									if (!memId) {
										alert("사용자 ID를 찾을 수 없습니다.");
										return;
									}

									$.ajax({
										url : "/emp/attendance/workIn",
										type : "POST",
										data : {
											"memId" : memId
										},
										beforeSend : function(xhr) {
											xhr.setRequestHeader(
													"${_csrf.headerName}",
													"${_csrf.token}");
										},
										success : function(response) {
											if (response.status === "success") {
												// 																alert("출근 등록 완료.");
												// 출근 시간을 즉시 화면에 반영
												$("#workInTime").text(
														response.attendTm); // 출근 시간 업데이트
												$('#workIn').prop('disabled',
														true); // 출근 버튼 비활성화
												$("#IncompletionModal").modal(
														'show');
												updateAttendanceList(); // 주간 근무 현황 테이블 갱신
											} else {
												// 																alert(response.message
												// 																		|| "출근 처리 중 오류가 발생했습니다.");
												$("#InfailureModal").modal(
														"show");
											}
										},
										error : function(xhr, status, error) {
											alert("출근 처리 중 오류가 발생했습니다.");
										}
									});
								});

						// 퇴근 처리
						// 						var outForm = $('#OutForm');
						// 						outForm.on("submit", function(e) {
						// 							e.preventDefault(); // Prevent default form submission

						// 퇴근 버튼 클릭 이벤트
						// 						$('#workOut button').on('click', function() { // id 변경
						// 							outForm.submit(); // Trigger form submission
						// 						});

						// 날짜 설정 (기존의 날짜 관련 코드)
						let serverTm = new Date();
						const weekDays = [ "일", "월", "화", "수", "목", "금", "토" ];
						let formattedDate = serverTm.getFullYear()
								+ ". "
								+ String(serverTm.getMonth() + 1).padStart(2,
										'0') + ". "
								+ String(serverTm.getDate()).padStart(2, '0')
								+ ". " + "(" + weekDays[serverTm.getDay()]
								+ ")";

						$("#serverTm").text(formattedDate);

						$("#goPaymentForm")
								.on(
										"click",
										function() {
											window.location.href = "/elecApv/paymentForm?selectedValue=I3";
										})

					});
</script>

<!-- 등록 완료 모달 -->
<div class="modal fade" id="IncompletionModal" tabindex="-1"
	role="dialog" aria-labelledby="IncompletionModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<!--                 <h5 class="modal-title" id="completionModalLabel">수정 완료</h5> -->
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">출근 등록이 완료되었습니다.</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- 등록 완료 모달 -->

<!-- 등록 실패 모달 -->
<div class="modal fade" id="InfailureModal" tabindex="-1" role="dialog"
	aria-labelledby="completionModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<!--                 <h5 class="modal-title" id="completionModalLabel">수정 실패</h5> -->
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">출근 등록 실패하였습니다.</div>
			<div class="modal-footer">
				<button type="button" id="failureModalCloseBtn"
					class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


<!-- Modal (등록 완료) -->
<div class="modal fade" id="completionModal" tabindex="-1" role="dialog"
	aria-labelledby="completionModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">퇴근 처리가 완료되었습니다.</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!-- Modal (등록 실패) -->
<div class="modal fade" id="failureModal" tabindex="-1" role="dialog"
	aria-labelledby="completionModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">퇴근 처리에 실패했습니다.</div>
			<div class="modal-footer">
				<button type="button" id="failureModalCloseBtn"
					class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(
			function() {
				// 퇴근 처리 버튼 클릭 시 AJAX 호출
				$('#workOutBtn').on(
						'click',
						function() {
							var memId = $("input[name='memId']").val();
							var wrNo = $("input[name='wrNo']").val();

							if (!memId || !wrNo) {
								alert("필요한 정보가 없습니다.");
								return;
							}

							$.ajax({
								url : "/emp/attendance/workOut", // 퇴근 처리 요청 URL
								type : "POST",
								data : {
									memId : memId,
									wrNo : wrNo
								},
								beforeSend : function(xhr) {
									xhr.setRequestHeader("${_csrf.headerName}",
											"${_csrf.token}");
								},
								success : function(response) {
									if (response === "success") {
										// 성공 시 퇴근 시간을 화면에 반영
										var now = new Date();
										var hours = now.getHours().toString()
												.padStart(2, '0');
										var minutes = now.getMinutes()
												.toString().padStart(2, '0');
										var time = hours + ":" + minutes + ":" + seconds;
										$('#workOutTime').text(time); // 퇴근 시간 업데이트

										// 성공 모달 표시
										$("#completionModal").modal('show');
									} else {
										// 실패 시 에러 모달 표시
										$("#failureModal").modal("show");
									}
								},
								error : function(xhr, status, error) {
									// 오류 처리
									alert("퇴근 처리 중 오류가 발생했습니다.");
									$("#failureModal").modal("show");
								}
							});
						});
			});
</script>