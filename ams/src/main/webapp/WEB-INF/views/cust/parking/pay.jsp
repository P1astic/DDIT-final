<%@page import="java.time.temporal.ChronoUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/emp/empMain.css">
<script>
	$(document).ready(
			function() {

				let attendTm = `${workRecordVO.attendTm}`; // 예: "14:28:34"
				let lvffcTm = `${workRecordVO.lvffcTm}`; // 예: "14:31:22" 또는 null

				// 콜론 제거
				attendTm = attendTm.replace(/:/g, ''); // "142834"

				// 시간을 초로 변환하는 함수
				function timeToSeconds(time) {
					if (!time || time.length !== 6) {
						console.error("Invalid time format:", time);
						return 0; // 유효하지 않은 시간 형식일 경우 0 반환
					}
					let hours = parseInt(time.slice(0, 2), 10); // 시
					let minutes = parseInt(time.slice(2, 4), 10); // 분
					let seconds = parseInt(time.slice(4, 6), 10); // 초
					return hours * 3600 + minutes * 60 + seconds;
				}

				// 퇴근시간이 null일 경우 현재 시간을 사용
				if (!lvffcTm || lvffcTm === "null") {
					let now = new Date();
					lvffcTm = String(now.getHours()).padStart(2, '0')
							+ String(now.getMinutes()).padStart(2, '0')
							+ String(now.getSeconds()).padStart(2, '0');
					console.log("lvffcTm is null, using current time: "
							+ lvffcTm);
				} else {
					// 퇴근시간이 있을 경우 콜론 제거
					lvffcTm = lvffcTm.replace(/:/g, ''); // "143122"
				}

				// 초로 변환
				let startInSeconds = timeToSeconds(attendTm);
				let endInSeconds = timeToSeconds(lvffcTm);

				// 결과 로그 출력
				console.log("attendTm:", attendTm, "=> startInSeconds:",
						startInSeconds);
				console.log("lvffcTm:", lvffcTm, "=> endInSeconds:",
						endInSeconds);

				// 시간 차이 계산
				let differenceInSeconds = endInSeconds - startInSeconds;

				// 초를 시:분:초로 변환
				let hours = Math.floor(differenceInSeconds / 3600);
				let minutes = Math.floor((differenceInSeconds % 3600) / 60);

				// 결과 출력
				console.log('근무 시간: ' + (isNaN(hours) ? 0 : hours) + '시간'
						+ (isNaN(minutes) ? 0 : minutes) + '분');

				// div에 찍어주기
				$("#starttt").text(isNaN(hours) ? 0 : hours);
				$("#endddd").text(isNaN(minutes) ? 0 : minutes);

				// 이미 Date 객체인 serverTm
				let serverTm = new Date(); // 예시 Date 객체, 실제로는 서버에서 받은 Date 객체를 사용

				// 요일 배열 (일요일부터 토요일까지)
				const weekDays = [ "일", "월", "화", "수", "목", "금", "토" ];

				// 포맷팅: YYYY. MM. DD. (요일)
				let formattedDate = serverTm.getFullYear() + ". "
						+ String(serverTm.getMonth() + 1).padStart(2, '0')
						+ ". " + // 월은 0부터 시작하므로 +1 필요
						String(serverTm.getDate()).padStart(2, '0') + ". "
						+ "(" + weekDays[serverTm.getDay()] + ")";

				console.log("formattedDate : " + formattedDate);

				$("#serverTm").text(formattedDate);

				//필독에 효과
				let ddddd = [];

				<c:forEach var="board" items="${currKeyBoard}">
				ddddd.push("${board.ntcBrdType}");
				</c:forEach>

				console.log("ddddd: ", ddddd);
				console.log("ddddd[0]: ", ddddd[0]);
				console.log("ddddd[1]: ", ddddd[1]);

				// ddddd 배열을 순회하며 스타일 변경
				ddddd.forEach(function(type, index) {
					if (type === 'O1') {
						$(".myElement").eq(index).css("background", "red"); // 해당 인덱스의 요소에 스타일 적용
					}
				});

			});

	$(function() {

		$("#a1-1-box").on("click", function() {
			window.location.href = "/emp/main";
		});
		$("#a1-2").on("click", function() {
			window.open("/cust/main", "_blank"); // 새 탭에서 열기
		});

	});
</script>



<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<div id="container">
	<!-- 컨텐츠 -->
	<div id="content">

		<div id="a1">
			<div id="a1-1-box">
				<svg xmlns="http://www.w3.org/2000/svg" height="30px"
					viewBox="0 -960 960 960" width="30px" fill="#2a2828">
					<path
						d="M240-200h120v-200q0-17 11.5-28.5T400-440h160q17 0 28.5 11.5T600-400v200h120v-360L480-740 240-560v360Zm-80 0v-360q0-19 8.5-36t23.5-28l240-180q21-16 48-16t48 16l240 180q15 11 23.5 28t8.5 36v360q0 33-23.5 56.5T720-120H560q-17 0-28.5-11.5T520-160v-200h-80v200q0 17-11.5 28.5T400-120H240q-33 0-56.5-23.5T160-200Zm320-270Z" /></svg>
				<div id="a1-1" style="color: #373737; cursor: pointer;">AMS
					인트라넷 메인홈페이지</div>
			</div>
			<div id="a1-2">공항홈페이지 바로가기</div>
		</div>

		<!-- 프로필 박스 -->
		<div id="b-box">
			<!-- 프로필사진 -->
			<div id="b1">
				<div id="b1-header"></div>
				<div id="b1-image">
					<!-- 프로필 이미지가 없으면 기본 이미지 -->
					<c:if test="${empty employeeVO.empImgUrl}">
						<img id="profileImg" name="profileImg"
							src="/resources/images/profile.jpg" id="profileImage">
					</c:if>
					<!--추가할 프로필 이미지가 있으면 추가한 이미지  -->
					<c:if test="${!empty employeeVO.empImgUrl}">
						<img id="profileImg"
							src="/download?filePath=${employeeVO.empImgUrl}&fileOrgnlFileNm=${employeeVO.empImgNm}" />
					</c:if>
				</div>
				<div id="b1-content">${employeeVO.empNm}</div>
				<div id="b1-info">
					<div id="b1-info-tr">
						<div class="b1-info-td1">아이디</div>
						<div class="b1-info-td2">${employeeVO.memId}</div>
					</div>
					<div id="b1-info-tr">
						<div class="b1-info-td1">부서</div>
						<div class="b1-info-td2">${employeeVO.deptNm}</div>
					</div>
					<div id="b1-info-tr">
						<div class="b1-info-td1">직급</div>
						<div class="b1-info-td2">${employeeVO.authNm}</div>
					</div>

				</div>

			</div>
			<div id="b2">
				<div id="b2-1">
					<div id="b2-1-title">
						<div>금일 근태현황</div>
						<div class="all"
							onclick="window.location.href='/emp/attendance/inout'">전체보기</div>
					</div>

					<div id="b2-1-content">
						<div id="b2-1-content-time">
							<div id="serverTm">${serverTime}</div>
							<div id="b2-1-work-time" style="display: flex;">
								<div id="starttt"></div>
								h
								<div id="endddd"></div>
								m
							</div>
							<div>
								출근시간 :
								<c:choose>
									<c:when test="${not empty workRecordVO.attendTm}">
								            ${workRecordVO.attendTm}
								        </c:when>
									<c:otherwise>
								            - <!-- 값이 null일 때 출력할 내용 -->
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								퇴근시간 :
								<c:choose>
									<c:when test="${not empty workRecordVO.lvffcTm}">
								            ${workRecordVO.lvffcTm}
								        </c:when>
									<c:otherwise>
								            - <!-- 값이 null일 때 출력할 내용 -->
									</c:otherwise>
								</c:choose>
							</div>
							<div id="btnnnn">
								<input type="hidden" id="memId" value="${employeeVO.memId}" />
								<input class="btn_function btn_function_s" type="button"
									value="출근하기" id="workIn" />
								<form name="OutForm" id="OutForm"
									action="/emp/attendance/workOut" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="memId" value="${employeeVO.memId}" />
									<input type="hidden" name="wrNo" value="${workRecordVO.wrNo}" />
									<input type="hidden" name="attendTm" id="attendTm"
										value="${currentAttendTime}" /> <input
										class="btn_function btn_function_s" type="button" value="퇴근하기"
										id="workOut" />

									<sec:csrfInput />
								</form>

							</div>
						</div>
					</div>


				</div>
				<%
					// 현재 날짜를 얻기 위한 자바 코드
				java.util.Date today = new java.util.Date();
				request.setAttribute("today", today); // 현재 날짜를 request 속성으로 설정
				%>

				<div id="b2-2">
					<div id="b2-2-title">
						<div>오늘 일정</div>
						<div class="all"
							onclick="window.location.href='/emp/calendar/list'">전체보기</div>
					</div>

					<!-- 오늘 날짜를 yyyy-MM-dd 형식으로 포맷 -->
					<fmt:formatDate var="formattedToday" value="${today}"
						pattern="yyyy-MM-dd" />

					<c:set var="hasSchedule" value="false" />
					<!-- 일정 여부 초기화 -->

					<c:forEach var="calendarVO" items="${calendarVO}">
						<c:choose>
							<c:when test="${calendarVO.scheEndDate == formattedToday}">
								<c:if
									test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == 'orange'}">
									<div class="colrr" id="per" style="background-color: orange;"
										title="개인"></div>
								</c:if>
								<c:if
									test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == 'yellow'}">
									<div class="colrr" id="per" style="background-color: yellow;"
										title="개인"></div>
								</c:if>
								<c:if
									test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == 'indigo'}">
									<div class="colrr" id="per" style="background-color: indigo;"
										title="개인"></div>
								</c:if>
								<c:if
									test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == 'purple'}">
									<div class="colrr" id="per" style="background-color: purple;"
										title="개인"></div>
								</c:if>
								<c:if
									test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == '#E6E6E6'}">
									<div class="colrr" id="per" style="background-color: #E6E6E6;"
										title="개인"></div>
								</c:if>
								<c:if test="${calendarVO.scheType == 'com'}">
									<div class="colrr" id="com" style="background-color: #F6CED8;"
										title="회사"></div>
								</c:if>
								<c:if test="${calendarVO.scheType == 'videoChat'}">
									<div class="colrr" id="viedoChat"
										style="background-color: green;" title="화상회의"></div>
								</c:if>
								<c:if test="${calendarVO.scheType == 'C1'}">
									<div class="colrr2" id="C1" title="인사팀"></div>
								</c:if>
								<c:if test="${calendarVO.scheType == 'C2'}">
									<div class="colrr2" id="C2" title="회계팀"></div>
								</c:if>
								<c:if test="${calendarVO.scheType == 'C3'}">
									<div class="colrr2" id="C3" title="시설팀"></div>
								</c:if>
								<c:if test="${calendarVO.scheType == 'C4'}">
									<div class="colrr2" id="C4" title="물류팀"></div>
								</c:if>

								<!-- scheEndTime을 ':'로 분리하여 시와 분으로 나누기 -->
								<c:set var="timeParts"
									value="${fn:split(calendarVO.scheEndTime, ':')}" />
								<div>${timeParts[0]}:${timeParts[1]}</div>
								<!-- 시와 분 출력 -->
								<c:set var="hasSchedule" value="true" />
								<div>${calendarVO.scheTitle}</div>
								<!-- 일정이 있을 경우 플래그 설정 -->
							</c:when>
						</c:choose>
					</c:forEach>

					<!-- 일정이 없는 경우에만 한 번 출력 -->
					<c:if test="${!hasSchedule}">
						<div>등록된 일정이 없습니다.</div>
					</c:if>
				</div>
			</div>

		</div>



		<div id="c-d-box">
			<div id="c-box">
				<div id="c-title">
					<div>결재대기 수신문서</div>
					<div class="all"
						onclick="window.location.href='/elecApv/waitPaymentList'">전체보기</div>
				</div>
				<c:set var="count" value="0"></c:set>
				<c:set var="hasDocuments" value="false"></c:set>
				<!-- 문서 존재 여부 체크 -->
				<c:forEach var="elecApvVO" items="${elecApvVOList}" varStatus="stat">
					<c:if
						test="${!memVO.memId.equals(elecApvVO.memId) && fn:contains(elecApvVO.apvDetailVO.apvIds, memVO.memId)}">
						<div style="display: flex;"
							onclick="location.href='/elecApv/paymentDetail?elecApvNo=${elecApvVO.elecApvNo}'">
							<c:set var="count" value="${count + 1}" />
							<div>${count}.&nbsp;</div>
							<div>${elecApvVO.elecApvTitle}</div>
							<div>${elecApvVO.employeeVO.empNm}</div>
							<div>${elecApvVO.elecApvRegDate}</div>
						</div>
						<c:set var="hasDocuments" value="true"></c:set>
						<!-- 문서가 있음을 표시 -->
					</c:if>
				</c:forEach>


				<!-- 문서가 없는 경우 "등록된 문서가 없습니다" 메시지 출력 -->
				<c:if test="${count == 0 || !hasDocuments}">
					<div>등록된 문서가 없습니다.</div>
				</c:if>
			</div>
			<div id="d-box">
				<div id="d-title">
					<div>공지사항</div>
					<div class="all" onclick="window.location.href='/emp/board/list'">전체보기</div>
				</div>
				<c:set var="cnt" value="0"></c:set>
				<c:forEach var="currKeyBoard" items="${currKeyBoard}"
					varStatus="stat">
					<div style="display: flex;">
						<c:set var="cnt" value="${cnt + 1}" />
						<div>${cnt}.&nbsp;</div>
						<div>${currKeyBoard.ntcBrdTtl}</div>
						<div>${currKeyBoard.empNm}</div>
						<div>${currKeyBoard.ntcBrdRegYmd}</div>
						<div class="myElement"
							style="width: 15px; height: 15px; border-radius: 9999px;"></div>
						<!-- ID를 클래스로 변경 -->
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- c-d-box 끝 -->

		<div id="e-box">
			<div id="e-title">
				<div>목록 모아보기</div>
			</div>
			<div style="display: flex; gap: 10px;">
				<div>조직도</div>
				<div>캘린더</div>
				<div>공지사항</div>
				<div>메신저</div>
				<div>운행스케줄조회 국내선</div>
				<div>뭐넣냐</div>
			</div>
		</div>



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
							$("#completionModal").modal('show');
							alert("퇴근 등록 완료.");
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

