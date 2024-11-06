<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<link type="text/css" href="/resources/css/mypage/docEditor.css" rel="stylesheet" media="screen" />
<link type="text/css" href="/resources/css/mypage/goApp1.css"	rel="stylesheet" media="screen" />
<link type="text/css" href="/resources/css/mypage/goApp2.css"	rel="stylesheet" media="screen" />
<link type="text/css" href="/resources/css/mypage/goStyle.css" 	rel="stylesheet" media="screen" />

<head>

<link rel="stylesheet" href="/resources/css/attendance/main.css"
	media="all">
</head>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memberVO" />
</sec:authorize>

<body id="main" class="go_skin_home_w go_skin_advanced mini">
	<div class="attend_contents_wrap2">
		<p class="txt">
			2024년 10월 7일 (월) <span class="time" id="timelineGadgetTime">06:56:28</span>
		</p>
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
						<dd id="workOutTime">미등록</dd>
					</dl>
				</li>
			</ul>
		</div>
		<div class="vertical_bar"></div>
		<section class="function function_attend">
			<div class="function_btn_wrap">
				<input type="hidden" id="memId" value="${memberVO.memId}" />
				<!-- Ensure the user ID is available -->
				<input class="btn_function btn_function_s" type="button"
					value="출근하기" id="workIn" />


				<!-- 퇴근 처리 -->
				<div class="tab-pane active" id="workOut">
					<form name="OutForm" id="OutForm" action="/emp/attendance/workOut"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="memId" value="${memberVO.memId}" /> 
						<input
							type="hidden" name="wrNo" value="${attendanceVO.wrNo}" />
						<!-- Include wrNo -->
						<input type="hidden" name="attendTm" id="attendTm"
							value="${currentAttendTime}" />
						<!-- Clock-out time -->
						<a id="workOut" class="btn_function btn_function_s"
							data-bypass="true"><span class="txt">퇴근하기</span></a>
						<sec:csrfInput />
					</form>
				</div>
			</div>
		</section>

	</div>

	<!-- Add Modal for Completion -->
	<div id="completionModal" class="modal" style="display: none;">
		<div class="modal-content">
			<p>등록 완료되었습니다.</p>
			<button onclick="$('#completionModal').hide();">닫기</button>
		</div>
	</div>
</body>

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
