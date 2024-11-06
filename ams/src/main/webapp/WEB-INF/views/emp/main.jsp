<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/emp/empMain.css">
<script>
$(document).ready(function() {

			//[1]출퇴근 시간 찍어주기
			let start = `${workRecordVO.attendTm}`;//출근시간  
			let end = `${workRecordVO.lvffcTm}`;//퇴근시간   

			//출퇴근시간이 공백이면 0으로
			if (start === '') {
				console.log("출근시간 null임");
				$("#hh").text("0");
				$("#mm").text("0");

			} else {
				console.log(" start : " + start);
				console.log(" end : " + end);

				// 콜론 제거
				start = start.replace(/:/g, ''); //
				end = end.replace(/:/g, ''); // 

				console.log(" start : " + start);
				console.log(" end : " + end);

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
				// 출퇴근 시간이 모두 null일 경우
				if (!start || start === "null") {
					$("#hh").text(""); // hh에 아무것도 찍지 않음
					$("#mm").text(""); // mm에 아무것도 찍지 않음
					return; // 더 이상의 계산을 중단
				}

				// 퇴근시간이 null일 경우 현재 시간을 사용
				if (!end || end === "null") {
					let now = new Date();
					end = String(now.getHours()).padStart(2, '0')
							+ String(now.getMinutes()).padStart(2, '0')
							+ String(now.getSeconds()).padStart(2, '0');
					console.log("end : " + end);
				}

				// 초로 변환
				let startInSeconds = timeToSeconds(start);
				let endInSeconds = timeToSeconds(end);

				console.log("startInSeconds :" + startInSeconds);
				console.log("endInSeconds :" + endInSeconds);

				let total = endInSeconds - startInSeconds;
				console.log("total :" + total);

				// 시간 차가 음수일 경우 0으로 설정
				if (total < 0) {
					total = 0;
				}

				// 초를 시:분으로 변환
				let hours = Math.floor(total / 3600);
				let minutes = Math.floor((total % 3600) / 60);

				console.log("hours :" + hours);
				console.log("minutes :" + minutes);

				// div에 찍어주기
				$("#hh").text(isNaN(hours) ? 0 : hours);
				$("#mm").text(isNaN(minutes) ? 0 : minutes);
			}

			// [3] 오늘날짜 찍어주기 
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

			// [4] 필독효과
			let ddddd = [];

			<c:forEach var="board" items="${currKeyBoard}">
			ddddd.push("${board.ntcBrdType}");
			</c:forEach>

			console.log("ddddd: ", ddddd);
			console.log("ddddd[0]: ", ddddd[0]);
			console.log("ddddd[1]: ", ddddd[1]);

			// ddddd 배열을 순회하며 스타일 변경
			ddddd.forEach(function(type, index) {
// 				if (type === 'O1') {
// 					$(".myElement").eq(index).append('<img src="/resources/images/icon/pin.png" alt="필독" style="width:25px; height:25px;">');
// 				}
			});

	});
	

	$(function() {

		$("#a1-1-box").on("click", function() {
			window.location.href = "/emp/main";
		});
		
	      $("#scheduleList").on("click", function() {
		           window.location.href = "/emp/calendar/list" ;
    	 });
	      
	
		$("#a1-2").on("click", function() {
			window.open("/cust/main", "_blank"); // 새 탭에서 열기
		});

	});
</script>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<!-- <form id="ff"> -->

<div id="container">
	<!-- 컨텐츠 -->
	<div id="content">

		<div id="a1">
			<div id="a1-1-box">
				<svg xmlns="http://www.w3.org/2000/svg" height="30px" viewBox="0 -960 960 960" width="30px" fill="#2a2828"><path d="M240-200h120v-200q0-17 11.5-28.5T400-440h160q17 0 28.5 11.5T600-400v200h120v-360L480-740 240-560v360Zm-80 0v-360q0-19 8.5-36t23.5-28l240-180q21-16 48-16t48 16l240 180q15 11 23.5 28t8.5 36v360q0 33-23.5 56.5T720-120H560q-17 0-28.5-11.5T520-160v-200h-80v200q0 17-11.5 28.5T400-120H240q-33 0-56.5-23.5T160-200Zm320-270Z" /></svg>
				<div id="a1-1" style="color: #373737; cursor: pointer;">AMS 인트라넷 메인홈페이지</div>
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
					<c:choose>
					    <c:when test="${!empty employeeVO.empImgUrl}">
					        <img id="profileImg" src="/download?filePath=${employeeVO.empImgUrl}&fileOrgnlFileNm=${employeeVO.empImgUrl}" onerror="this.onerror=null; this.src='/resources/images/profile.jpg';" />
					    </c:when>
					    <c:otherwise>
					        <img id="profileImg" src="/resources/images/profile.jpg" />
					    </c:otherwise>
					</c:choose>

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
						<div class="all" onclick="window.location.href='/emp/attendance/main'">전체보기</div>
					</div>

					<div id="b2-1-content">
						<div id="b2-1-content-time">
							<div id="b2-1-tmtm">
								<div id="serverTm">${serverTime}</div>
								<div id="b2-1-work-time">
									<div id="hh-box" class="hh-mm-box">
										<div id="hh"></div>h
									</div>
									<div id="mm-box" class="hh-mm-box">
										<div id="mm"></div>m
									</div>
								</div>
							</div>
							<div id="b2-1-info">
								<div id="start-end-box">
									<div id="start-tm" class="tmtmtm">
										출근시간 
										<c:choose>
											<c:when test="${not empty workRecordVO.attendTm}">
										           <div style="color:#1890FF;">
										          &nbsp;&nbsp;&nbsp;&nbsp;  ${workRecordVO.attendTm}
										           </div> 
										        </c:when>
											<c:otherwise>
										           &nbsp;&nbsp;&nbsp;&nbsp; - <!-- 값이 null일 때 출력할 내용 -->
											</c:otherwise>
										</c:choose>
									</div>
									<div id="end-tm"  class="tmtmtm">
										퇴근시간 
										<c:choose>
											<c:when test="${not empty workRecordVO.lvffcTm}">
											
												 <div style="color:#1890FF;">
										            &nbsp;&nbsp;&nbsp;&nbsp; ${workRecordVO.lvffcTm}
										           </div> 
										        </c:when>
											<c:otherwise>
										          &nbsp;&nbsp;&nbsp;&nbsp;  - <!-- 값이 null일 때 출력할 내용 -->
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div id="btnnnn">
									<input type="hidden" id="memId" value="${employeeVO.memId}" />
									<input class="btnEdit" type="button"
										value="출근하기" id="workIn" />
									<form name="OutForm" id="OutForm"
										action="/emp/attendance/workOut" method="post"
										enctype="multipart/form-data">
										<input type="hidden" name="memId" value="${employeeVO.memId}" />
										<input type="hidden" name="wrNo" value="${workRecordVO.wrNo}" />
										<input type="hidden" name="attendTm" id="attendTm"
											value="${currentAttendTime}" /> <input
											class="btnEdit" type="button" value="퇴근하기"
											id="workOut" />
	
										<sec:csrfInput />
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>


		<div id="b2-2">
    <div id="b2-2-title">
        <div>오늘 일정</div>
        <div class="all" onclick="window.location.href='/emp/calendar/list'">전체보기</div>
    </div>
  <div id="b2-2-content">
    <c:set var="hasTodaySchedule" value="false" />
    <c:set var="hasOtherSchedule" value="false" />
    <div id="scheduleList">
        <c:if test="${empty calendarVO}">
            <!-- 일정이 하나도 없을 경우 -->
            <div class="notSch">등록된 일정이 없습니다.</div>
        </c:if>

        <c:if test="${not empty calendarVO}">
            <c:forEach var="calendarVO" items="${calendarVO}">
                <c:set var="endd" value="${calendarVO.scheEndDate}" />
                <c:set var="startt" value="${calendarVO.scheStartDate}" />
                
                <!-- 오늘과 일치하는 스케줄 여부 확인 -->
                <c:if test="${endd == formattedToday}">
                    <c:set var="hasTodaySchedule" value="true" />
                    <div id="schedule">
	                        <!-- 스케줄 색상 처리 -->
	                        <c:choose>
	                            <c:when test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == 'orange'}">
	                                <div class="colrr" style="background-color: orange;" title="개인"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == 'yellow'}">
	                                <div class="colrr" style="background-color: yellow;" title="개인"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == 'indigo'}">
	                                <div class="colrr" style="background-color: indigo;" title="개인"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == 'purple'}">
	                                <div class="colrr" style="background-color: purple;" title="개인"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'per' && calendarVO.backGroundColor == '#E6E6E6'}">
	                                <div class="colrr" style="background-color: #E6E6E6;" title="개인"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'com'}">
	                                <div class="colrr" style="background-color: #F6CED8;" title="회사"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'videoChat'}">
	                                <div class="colrr" style="background-color: green;" title="화상회의"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'C1'}">
	                                <div class="colrr2" title="인사팀"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'C2'}">
	                                <div class="colrr2" title="회계팀"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'C3'}">
	                                <div class="colrr2" title="시설팀"></div>
	                            </c:when>
	                            <c:when test="${calendarVO.scheType == 'C4'}">
	                                <div class="colrr2" title="물류팀"></div>
	                            </c:when>
	                        </c:choose>
	
	                        <!-- 스케줄 시간 출력 -->
	                        <c:set var="timeParts" value="${fn:split(calendarVO.scheEndTime, ':')}" />
	                        <div>${timeParts[0]}:${timeParts[1]}</div>
	                        <div>${calendarVO.scheTitle}</div>
	                    </div>
				                </c:if>
				                
				                <!-- 마감일이 오늘이 아닌일과 시작일이 오늘일이 아닐때 -->
				                <c:if test="${endd != formattedToday}">
				                    <c:set var="hasOtherSchedule" value="true" />
				                </c:if>
				            </c:forEach>
				        </c:if>
				    </div>
				
				    <!-- 오늘과 일치하는 스케줄이 없고, 오늘이 아닌 스케줄이 있는 경우 -->
				    <c:if test="${!hasTodaySchedule && hasOtherSchedule}">
				        <div class="notSch">등록된 일정이 없습니다.</div>
				    </c:if>
				</div>
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

				<div id="c-contList">
					<!-- 문서 존재 여부 체크 -->
					<c:forEach var="elecApvVO" items="${elecApvVOList}" varStatus="stat">
						<c:if test="${!memVO.memId.equals(elecApvVO.memId) && fn:contains(elecApvVO.apvDetailVO.apvIds, memVO.memId)}">
						<div id="c-cont">
							<div class="notDoc" style="display: flex;" id="elecTr"
								onclick="location.href='/elecApv/paymentDetail?elecApvNo=${elecApvVO.elecApvNo}'">
								<c:set var="count" value="${count + 1}" />
								<div id="c-elec" >
									<div>${count}.&nbsp;</div>
									<div>${elecApvVO.elecApvTitle}</div>
									<div>[${elecApvVO.employeeVO.empNm}]</div>
								</div>
								<div>${elecApvVO.elecApvRegDate}</div>
							</div>
							<c:set var="hasDocuments" value="true"></c:set>
							<!-- 문서가 있음을 표시 -->
						</div>
						</c:if>
					</c:forEach>
				</div>
				
				<!-- 문서가 없는 경우 "등록된 문서가 없습니다" 메시지 출력 -->
				<c:if test="${!hasDocuments}">
					<div class="notDoc">등록된 문서가 없습니다.</div>
				</c:if>
			</div>
			<div id="d-box">
				<div id="d-title">
					<div>공지사항</div>
					<div class="all" onclick="window.location.href='/emp/board/list'">전체보기</div>
				</div>
				<div id="currBoard">
				    <c:set var="cnt" value="0"></c:set>
				    <c:forEach var="currKeyBoard" items="${currKeyBoard}" varStatus="stat">
				        <div id="zzz" onclick="location.href='/emp/board/detail?ntcBrdNo=${currKeyBoard.ntcBrdNo}'">
				            <c:if test="${currKeyBoard.ntcBrdType != 'O1'}">
				                <c:set var="cnt" value="${cnt + 1}" />
				                <div id="cc1">
				                    <div>${cnt}.&nbsp;</div>
				                    <div style="flex: 7;">${currKeyBoard.ntcBrdTtl}</div>
					                <div>${currKeyBoard.ntcBrdRegYmd}</div>
				                </div>
				            </c:if>
				            <c:if test="${currKeyBoard.ntcBrdType == 'O1'}">
				                <div id="cc1">
<!-- 					                <div class="myElement"></div> -->
									<img src="/resources/images/icon/pin.png" alt="필독" style="width:20px; height:20px;">
					                <div style="flex: 7;">${currKeyBoard.ntcBrdTtl}</div>
					                <div>${currKeyBoard.ntcBrdRegYmd}</div>
				                </div>
				            </c:if>
				        </div>
				    </c:forEach>
				</div> <!-- currBoard -->
			</div>
		</div>
		<!-- c-d-box 끝 -->

	</div>
</div>
<!-- </form> -->
<div class="modal fade" id="attendSuccessModal" tabindex="-1" role="dialog" aria-labelledby="attendSuccessModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>출근 등록 완료</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="leaveWorkSuccessModal" tabindex="-1" role="dialog" aria-labelledby="leaveWorkSuccessModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>퇴근 등록 완료</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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
							console.log("data : "+data);
							
							if (data === "error") {
								alert("출근 실패.");
							} else {
								$("#workInTime").text(data);
// 								alert("출근 등록 완료.");
// 								$("#ff").submit();
								$("#attendSuccessModal").modal('show');
								setTimeout(() => window.location.reload(), 1000);  
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
// 							$("#completionModal").modal('show');
// 							alert("퇴근 등록 완료.");
// 							$("#ff").submit();
							$("#leaveWorkSuccessModal").modal('show');
							setTimeout(() => window.location.reload(), 1000); 
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
