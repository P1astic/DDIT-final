<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- <section class="content"> -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memberVO" />
</sec:authorize>
<section class="">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>마이페이지 - 출퇴근</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Advanced Form</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<!-- 박스들 전체 -->
<section class="content">

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
									class="info-box-number text-center text-muted mb-0">2300</span>
							</div>
							<!--  -->
							<!-- 박스 안 텍스트 단위 -->
							<div class="info-box-content">
								<span class="info-box-text text-center text-muted">반차</span> <span
									class="info-box-number text-center text-muted mb-0">2300</span>
							</div>
							<!--  -->
							<!-- 박스 안 텍스트 단위 -->
							<div class="info-box-content">
								<span class="info-
						box-text text-center text-muted">결근</span>
								<span class="info-box-number text-center text-muted mb-0">2300</span>
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
									class="info-box-number text-center text-muted mb-0">2000</span>
							</div>
							<button type="submit" class="btn btn-primary">휴가신청</button>
							<!-- 버튼 -->


						</div>
					</div>
					<!-- 근태현황 끝 -->
					<div class="space"></div>
					<!-- 근무시간 시작 -->
					<div class="block3">

						<label>근무시간</label>
						<div class="info-box bg-right">
							<div class="info-box-content">
								<span class="info-box-text text-center text-muted">근무일수</span> <span
									class="info-box-number text-center text-muted mb-0">20</span>
							</div>
							<div class="info-box-content">
								<span class="info-box-text text-center text-muted">근무시간</span> <span
									class="info-box-number text-center text-muted mb-0">20</span>
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
				<body id="main" data-role="main" data-app-name="none"
					class="go_skin_home_w go_skin_advanced mini" style="">

					<div class="attend_contents_wrap2">
						<p class="txt">
							2024년 10월 7일 (월) <span class="time" id="timelineGadgetTime">06:56:28</span>
						</p>
						<div class="ehr_stat_data summary">
							<p class="stat_tit">
								0<b>h</b> 0<b>m</b>
							</p>
							<div class="type_flexible_summary">
								<div class="wrap_progress">
									<div class="time min" title="주간 근무시간은 40h입니다."
										style="left: 76%">최소 40h</div>
									<div class="bar" style="left: 76%"></div>
									<div class="time max" title="최대 근무시간은 52h입니다.">최대 52h</div>
									<div class="progress">
										<div class="part_default" title="선택근무" style="width: 0%"></div>
										<div class="part_overtime" title="초과근무(연장)" style="width: 0%"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="log_view_wrap">
							<ul class="log_view">
								<li>
									<dl>
										<dt>출근시간</dt>
										<dd id="workInTime">${attendanceVO.attendTm}</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt>퇴근시간</dt>
										<dd id="workOutTime">${attendanceVO.lvffcTm}</dd>
										<dl>
										</dl>
									</dl>
								</li>
							</ul>
						</div>
						<div class="vertical_bar"></div>
						<section class="function function_attend">
							<div class="function_btn_wrap">
								<input type="hidden" id="memId" value="${memberVO.memId}" /> <input
									class="inoutBtnIn" type="button" value="출근하기" id="workIn" />
								<!-- 퇴근로직 -->
								<div class="" id="workOut">
									<form name="OutForm" id="OutForm" action="/mypage/updateBp"
										method="post" enctype="multipart/form-data">
										<a id="workOut" class="inoutBtnOut " data-bypass="true"> <span
											class="txt">퇴근하기</span>

										</a>
										<sec:csrfInput />
									</form>
								</div>

							</div>
							<div class="works_state">
								<a class="btn_function" id="changeStatus" data-bypass="true">
									<span class="txt" id="myStatus">상태변경&nbsp;&nbsp;<span
										class="ic_side ic_show_down"></span></span>
								</a>
							</div>
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
				</body>
			</div>
		</div>
	</div>
	<div class="card-body table-responsive p-0">
		<div class="searchHeader">
			<div class="ml-auto d-flex align-items-center">
				<form id="search_form" class="d-flex align-items-center"
					style="margin-bottom: 0;">
					<div class="searchDiv">
						<select id="searchFilter" name="searchFilter" class="selBox">
							<option value="ALL" selected="">전체</option>
							<option value="EMP_NM">신청자</option>
							<option value="JBGD_CD">부서</option>
							<option value="MNTNC_RSLT">처리결과</option>
						</select>
					</div>
					<div>
						<input type="text" name="table_search" class="searchBox"
							placeholder="검색어 입력" value="">
					</div>
					<button type="submit" id="searchSubmitBtn">
						<img src="/resources/images/icon/searchBtn.png">
					</button>
				</form>
			</div>
		</div>

		<div class="tableDiv">
			<table>
				<thead>
					<tr>
						<th style="width: 15%; text-align: center;">NO</th>
						<th style="width: 40%; text-align: center;">보수내용</th>
						<th style="width: 15%; text-align: center;">신청자</th>
						<th style="width: 15%; text-align: center;">부서</th>
						<th style="width: 15%; text-align: center;">처리결과</th>
					</tr>
				</thead>
				<tbody>

					<tr class="MaintenTR"
						onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-017'">
						<td style="width: 10%; margin-right: 20px; text-align: center;">
							1</td>
						<td style="width: 40%; text-align: left;">


							<p>창문 수리 필...</p>
						</td>
						<td style="width: 15%; text-align: center;">정유진</td>
						<td style="width: 15%; text-align: center;">시설부</td>
						<td style="width: 15%; text-align: center;">조치완료</td>
					</tr>

					<tr class="MaintenTR"
						onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-016'">
						<td style="width: 10%; margin-right: 20px; text-align: center;">
							2</td>
						<td style="width: 40%; text-align: left;">


							<p>지하 주차장 ...</p>
						</td>
						<td style="width: 15%; text-align: center;">오지현</td>
						<td style="width: 15%; text-align: center;">물류부</td>
						<td style="width: 15%; text-align: center;">조치완료</td>
					</tr>

					<tr class="MaintenTR"
						onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-015'">
						<td style="width: 10%; margin-right: 20px; text-align: center;">
							3</td>
						<td style="width: 40%; text-align: left;">


							<p>정수기 필터 ...</p>
						</td>
						<td style="width: 15%; text-align: center;">최윤정</td>
						<td style="width: 15%; text-align: center;">회계부</td>
						<td style="width: 15%; text-align: center;">조치완료</td>
					</tr>

					<tr class="MaintenTR"
						onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-014'">
						<td style="width: 10%; margin-right: 20px; text-align: center;">
							4</td>
						<td style="width: 40%; text-align: left;">바닥 청소 요청</td>
						<td style="width: 15%; text-align: center;">한성민</td>
						<td style="width: 15%; text-align: center;">시설부</td>
						<td style="width: 15%; text-align: center;">신청</td>
					</tr>

					<tr class="MaintenTR"
						onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-012'">
						<td style="width: 10%; margin-right: 20px; text-align: center;">
							5</td>
						<td style="width: 40%; text-align: left;">


							<p>건물 외부 페...</p>
						</td>
						<td style="width: 15%; text-align: center;">임하늘</td>
						<td style="width: 15%; text-align: center;">물류부</td>
						<td style="width: 15%; text-align: center;">조치완료</td>
					</tr>

					<tr class="MaintenTR"
						onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-010'">
						<td style="width: 10%; margin-right: 20px; text-align: center;">
							6</td>
						<td style="width: 40%; text-align: left;">사무실 청소 요청</td>
						<td style="width: 15%; text-align: center;">이하늘</td>
						<td style="width: 15%; text-align: center;">시설부</td>
						<td style="width: 15%; text-align: center;">신청</td>
					</tr>

					<tr class="MaintenTR"
						onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-008'">
						<td style="width: 10%; margin-right: 20px; text-align: center;">
							7</td>
						<td style="width: 40%; text-align: left;">사무실 조명 교체 ...</td>
						<td style="width: 15%; text-align: center;">오세훈</td>
						<td style="width: 15%; text-align: center;">회계부</td>
						<td style="width: 15%; text-align: center;">신청</td>
					</tr>

					<tr class="MaintenTR"
						onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-005'">
						<td style="width: 10%; margin-right: 20px; text-align: center;">
							8</td>
						<td style="width: 40%; text-align: left;">기계 장비 유지보수...</td>
						<td style="width: 15%; text-align: center;">이수진</td>
						<td style="width: 15%; text-align: center;">회계부</td>
						<td style="width: 15%; text-align: center;">신청</td>
					</tr>

					<tr class="MaintenTR"
						onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-002'">
						<td style="width: 10%; margin-right: 20px; text-align: center;">
							9</td>
						<td style="width: 40%; text-align: left;">냉난방기 수리 요청</td>
						<td style="width: 15%; text-align: center;">이영희</td>
						<td style="width: 15%; text-align: center;">물류부</td>
						<td style="width: 15%; text-align: center;">신청</td>
					</tr>

				</tbody>
			</table>
		</div>

		<div class="board-footer">
			<ul
				class="pagination pagination-sm m-0 d-flex justify-content-center">
				<li class="page-item disabled"><a class="page-link"
					href="/emp/maintenance/list?searchFilter=ALL&amp;table_search=&amp;currentPage=-4">«</a></li>
				<li class="page-item  active"><a class="page-link"
					href="/emp/maintenance/list?searchFilter=ALL&amp;table_search=&amp;currentPage=1">1</a></li>
				<li class="page-item disabled "><a class="page-link"
					href="/emp/maintenance/list?searchFilter=ALL&amp;table_search=&amp;currentPage=6">»</a></li>
			</ul>
		</div>
	</div>
</section>


<div class="card-body table-responsive p-0">
	<div class="searchHeader">
		<div class="ml-auto d-flex align-items-center">
			<form id="search_form" class="d-flex align-items-center"
				style="margin-bottom: 0;">
				<div class="searchDiv">
					<select id="searchFilter" name="searchFilter" class="selBox">
						<option value="ALL" selected="">전체</option>
						<option value="EMP_NM">신청자</option>
						<option value="JBGD_CD">부서</option>
						<option value="MNTNC_RSLT">처리결과</option>
					</select>
				</div>
				<div>
					<input type="text" name="table_search" class="searchBox"
						placeholder="검색어 입력" value="">
				</div>
				<button type="submit" id="searchSubmitBtn">
					<img src="/resources/images/icon/searchBtn.png">
				</button>
			</form>
		</div>
	</div>

	<div class="tableDiv">
		<table>
			<thead>
				<tr>
					<th style="width: 15%; text-align: center;">NO</th>
					<th style="width: 40%; text-align: center;">보수내용</th>
					<th style="width: 15%; text-align: center;">신청자</th>
					<th style="width: 15%; text-align: center;">부서</th>
					<th style="width: 15%; text-align: center;">처리결과</th>
				</tr>
			</thead>
			<tbody>

				<tr class="MaintenTR"
					onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-017'">
					<td style="width: 10%; margin-right: 20px; text-align: center;">
						1</td>
					<td style="width: 40%; text-align: left;">


						<p>창문 수리 필...</p>
					</td>
					<td style="width: 15%; text-align: center;">정유진</td>
					<td style="width: 15%; text-align: center;">시설부</td>
					<td style="width: 15%; text-align: center;">조치완료</td>
				</tr>

				<tr class="MaintenTR"
					onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-016'">
					<td style="width: 10%; margin-right: 20px; text-align: center;">
						2</td>
					<td style="width: 40%; text-align: left;">


						<p>지하 주차장 ...</p>
					</td>
					<td style="width: 15%; text-align: center;">오지현</td>
					<td style="width: 15%; text-align: center;">물류부</td>
					<td style="width: 15%; text-align: center;">조치완료</td>
				</tr>

				<tr class="MaintenTR"
					onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-015'">
					<td style="width: 10%; margin-right: 20px; text-align: center;">
						3</td>
					<td style="width: 40%; text-align: left;">


						<p>정수기 필터 ...</p>
					</td>
					<td style="width: 15%; text-align: center;">최윤정</td>
					<td style="width: 15%; text-align: center;">회계부</td>
					<td style="width: 15%; text-align: center;">조치완료</td>
				</tr>

				<tr class="MaintenTR"
					onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-014'">
					<td style="width: 10%; margin-right: 20px; text-align: center;">
						4</td>
					<td style="width: 40%; text-align: left;">바닥 청소 요청</td>
					<td style="width: 15%; text-align: center;">한성민</td>
					<td style="width: 15%; text-align: center;">시설부</td>
					<td style="width: 15%; text-align: center;">신청</td>
				</tr>

				<tr class="MaintenTR"
					onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-012'">
					<td style="width: 10%; margin-right: 20px; text-align: center;">
						5</td>
					<td style="width: 40%; text-align: left;">


						<p>건물 외부 페...</p>
					</td>
					<td style="width: 15%; text-align: center;">임하늘</td>
					<td style="width: 15%; text-align: center;">물류부</td>
					<td style="width: 15%; text-align: center;">조치완료</td>
				</tr>

				<tr class="MaintenTR"
					onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-010'">
					<td style="width: 10%; margin-right: 20px; text-align: center;">
						6</td>
					<td style="width: 40%; text-align: left;">사무실 청소 요청</td>
					<td style="width: 15%; text-align: center;">이하늘</td>
					<td style="width: 15%; text-align: center;">시설부</td>
					<td style="width: 15%; text-align: center;">신청</td>
				</tr>

				<tr class="MaintenTR"
					onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-008'">
					<td style="width: 10%; margin-right: 20px; text-align: center;">
						7</td>
					<td style="width: 40%; text-align: left;">사무실 조명 교체 ...</td>
					<td style="width: 15%; text-align: center;">오세훈</td>
					<td style="width: 15%; text-align: center;">회계부</td>
					<td style="width: 15%; text-align: center;">신청</td>
				</tr>

				<tr class="MaintenTR"
					onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-005'">
					<td style="width: 10%; margin-right: 20px; text-align: center;">
						8</td>
					<td style="width: 40%; text-align: left;">기계 장비 유지보수...</td>
					<td style="width: 15%; text-align: center;">이수진</td>
					<td style="width: 15%; text-align: center;">회계부</td>
					<td style="width: 15%; text-align: center;">신청</td>
				</tr>

				<tr class="MaintenTR"
					onclick="location.href='/emp/maintenance/detail?mntncCode=MNTCODE-241015-002'">
					<td style="width: 10%; margin-right: 20px; text-align: center;">
						9</td>
					<td style="width: 40%; text-align: left;">냉난방기 수리 요청</td>
					<td style="width: 15%; text-align: center;">이영희</td>
					<td style="width: 15%; text-align: center;">물류부</td>
					<td style="width: 15%; text-align: center;">신청</td>
				</tr>

			</tbody>
		</table>
	</div>

	<div class="board-footer">
		<ul class="pagination pagination-sm m-0 d-flex justify-content-center">
			<li class="page-item disabled"><a class="page-link"
				href="/emp/maintenance/list?searchFilter=ALL&amp;table_search=&amp;currentPage=-4">«</a></li>
			<li class="page-item  active"><a class="page-link"
				href="/emp/maintenance/list?searchFilter=ALL&amp;table_search=&amp;currentPage=1">1</a></li>
			<li class="page-item disabled "><a class="page-link"
				href="/emp/maintenance/list?searchFilter=ALL&amp;table_search=&amp;currentPage=6">»</a></li>
		</ul>
	</div>
</div>

<script>
	$(document).ready(

			function() {
				var workInBtn = $('#workIn');
				var outForm = $('#OutForm');
				console.log("memId : ", memId);

				// 출근 처리
				workInBtn.on('click', function() {
					console.log("memId : ", memId);
					var memId = $("#memId").val();

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
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(data) {
							if (data === "error") {
								alert("출근 실패.");
							} else {
								alert("출근 등록 완료.");
								$("#workInTime").text(data);
							}
						},
						error : function(xhr, status, error) {
							alert("등록 중 오류가 발생했습니다.");
						}
					});//ajax
				});

				// 퇴근 처리
				outForm.on("submit", function(e) {
					e.preventDefault(); // Prevent default form submission

					$.ajax({
						url : $(this).attr("action"),
						type : "POST",
						data : new FormData(this),
						contentType : false,
						processData : false,
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(response) {
							$("#completionModal").modal('show'); // Show completion modal
							// Optionally, refresh the attendance log or update the UI
						},
						error : function(xhr, status, error) {
							alert("등록 중 오류가 발생했습니다."); // Show error alert
						}
					});
				});

				// 퇴근 버튼 클릭 이벤트
				$('#workOut').on('click', function() {
					outForm.submit(); // Trigger form submission
				});
			});
</script>






<!-- </section> -->