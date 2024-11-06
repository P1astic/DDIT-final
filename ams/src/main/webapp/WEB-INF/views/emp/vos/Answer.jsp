<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/board.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/answerCell.css">

<link rel="stylesheet" type="text/css"
	href="/resources/css/board/answer.css">

<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// phoneChk 버튼 클릭 이벤트 핸들러
						$("#phoneChk")
								.click(
										function() {
											// 입력된 값 가져오기
											var phone = $("#phoneNumber").val();
											var context = $("#context").val();
											var custBrdNo = $("#custBrdNo")
													.val();

											// 값이 제대로 출력되는지 확인
											console.log("phone : ", phone);
											console.log("context : ", context);
											console.log("custBrdNo : ",
													custBrdNo);

											// 첫 번째 AJAX 요청: sendAnswer 실행
											$
													.ajax({
														type : "POST",
														url : "/emp/vos/sendAnswer", // Controller URL
														data : {
															"phone" : phone,
															"context" : context
														},
														cache : false,
														dataType : "text",
														beforeSend : function(
																xhr) {
															xhr
																	.setRequestHeader(
																			"${_csrf.headerName}",
																			"${_csrf.token}");
														},
														success : function(data) {
															console
																	.log(
																			"phoneChk->data : ",
																			data);

															if (data === "error") { // 실패 시
																alert("답변 전송에 오류가 있습니다.");
															} else { // 성공 시
																alert("답변이 전송되었습니다.");

																// 두 번째 AJAX 요청: updateAnswer 실행
																$
																		.ajax({
																			type : "POST",
																			url : "/emp/vos/updateAnswer", // updateAnswer를 호출
																			data : {
																				"custBrdNo" : custBrdNo
																			},
																			beforeSend : function(
																					xhr) {
																				xhr
																						.setRequestHeader(
																								"${_csrf.headerName}",
																								"${_csrf.token}");
																			},
																			success : function(
																					response) {
																				if (response === "success") {
																					console
																							.log("답변 상태가 성공적으로 업데이트되었습니다.");

																					// 모달 닫기
																					$(
																							'#confirmModal')
																							.modal(
																									'hide');
																					$(
																							'.modal-backdrop')
																							.remove(); // 백드롭 강제로 제거
																					$(
																							'body')
																							.removeClass(
																									'modal-open');
																					$(
																							'body')
																							.css(
																									'padding-right',
																									'');

																					// 페이지 데이터 업데이트 (예: 처리 상태 변경)
																					// 상태를 '답변 완료'로 업데이트
																					$(
																							"#status")
																							.text(
																									"답변 완료"); // 처리 상태를 업데이트할 요소에 맞게 수정
																					$(
																							"#answerDate")
																							.text(
																									new Date()
																											.toISOString()
																											.slice(
																													0,
																													10)); // 답변일을 현재 날짜로 업데이트

																				} else {
																					alert("답변 상태 업데이트에 실패했습니다.");
																					$(
																							'#confirmModal')
																							.modal(
																									'hide');
																					$(
																							'.modal-backdrop')
																							.remove(); // 백드롭 강제로 제거
																					$(
																							'body')
																							.removeClass(
																									'modal-open');
																					$(
																							'body')
																							.css(
																									'padding-right',
																									'');
																				}
																			},
																			error : function(
																					error) {
																				console
																						.error(
																								"답변 상태 업데이트 중 오류 발생:",
																								error);
																			}
																		});
															}
														},
														error : function(error) {
															console
																	.error(
																			"답변 전송 중 오류 발생:",
																			error);
														}
													});
										});

						// 파일 다운로드 버튼 처리
						$(".fileList")
								.on(
										"click",
										"#fileDown",
										function() {
											let filePath = $(this).data(
													"file-path");
											let fileOrgnlFileNm = $(this)
													.siblings(
															"#fileOrgnlFileNm")
													.val();

											console.log(fileOrgnlFileNm);

											if (filePath) {
												window.location.href = "/bp/board/download?filePath="
														+ encodeURIComponent(filePath)
														+ "&fileOrgnlFileNm="
														+ encodeURIComponent(fileOrgnlFileNm);
											} else {
												alert("파일 경로를 찾을 수 없습니다.");
											}
										});

						$("#btnDel").on("click", function() {
							$("#confirmModal").modal('show');
						});
					});
</script>


<div class="container">
	<div class="row justify-content-center">
		<div class="col">

			<!-- 카드 헤더 -->
			<div class="titleHeader">
				<h4 class="pageTitle">${custBoardVO.custBrdNm}님의고객의소리입니다.</h4>
				<input type="hidden" id="custBrdNo" value="${custBoardVO.custBrdNo}">

				<div class="ml-auto d-flex align-items-center">
					<!-- 상단 정보: 작성자와 조회수 -->
					<div class="top-info">
						<!-- 						<input type="text" id="empNm" name="empNm" -->
						<%-- 							value="${custBoardVO.custBrdRegYmd}" /> --%>
						<fmt:formatDate value="${custBoardVO.custBrdRegYmd}"
							pattern="yyyy-MM-dd" />

					</div>
				</div>
			</div>




			<!-- 게시글 내용 -->
			<div class="board_area">

				<div class="lineList_tbW">
					<!-- 					<div class="tableDiv"> -->
					<table>

						<colgroup>
							<col>
							<col>
							<col>
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td colspan="3" id="answerN">${custBoardVO.custBrdTtl}</td>
							</tr>
							<tr>
								<th scope="row">답변방법</th>



								<td>답변 받지 않음</td>


								<th scope="row">휴대폰번호</th>
								<td class="Roboto">${custBoardVO.custBrdMbiph}</td>
							</tr>

							<tr>
								<th scope="row">처리상태</th>

								<c:if test="${(custBoardVO.custBrdAnsYmd == NULL)}">
									<td id = "status" style="color: red;">접수 대기</td>
									<!-- 접수 대기일 경우 글자 색상을 빨간색으로 -->
								</c:if>

								<c:if test="${(custBoardVO.custBrdAnsYmd != NULL)}">
									<td id = "status"  style="color: blue;">답변 완료</td>
									<!-- 답변 완료일 경우 기본 색상 -->
								</c:if>


								<th scope="row">답변일</th>
								
								<td id="answerDate" >	<fmt:formatDate value="${custBoardVO.custBrdRegYmd}"
							pattern="yyyy-MM-dd" /></td>

							</tr>

							<tr>
								<th scope="row">내용</th>
								<td colspan="3">
									<p class="tabTxt1">${custBoardVO.custBrdCn}</p>
								</td>
							</tr>

							<tr class="w_txt">
								<th scope="row">첨부파일</th>

								<td colspan="3"><c:if test="${custBoardVO.fileGroupNo > 0}">
										<div class="file-info" style="margin-bottom: 20px;">
											<div class="fileList">
												<input type="hidden" name="fileGroupNo" id="fileGroupNo"
													value="${custBoardVO.fileGroupNo}">
												<c:forEach var="fileDetailVO" items="${fileDetailVOList}"
													varStatus="status">
													<div id="fileNum${status.index}" style="display: flex;">
														<input style="border: none; width: 300px;" type='text'
															name='fileOrgnlFileNm' id="fileOrgnlFileNm"
															value="${fileDetailVO.fileOrgnlFileNm}">
														<button id="fileDown"
															data-file-path="${fileDetailVO.fileFilePathNm}"
															type="button" style="background: none; border: none;">
															<img src="/resources/images/icon/download.png"
																style="width: 15px; height: 15px;">
														</button>
													</div>
												</c:forEach>
											</div>
										</div>
									</c:if></td>
							</tr>




						</tbody>
					</table>
				</div>
			</div>
			<!-- 하단 버튼 -->
			<div class="detail-footer">
				<a href="/emp/vos/vosList" id="editBtn">목록</a>
				<button type="button" id="btnDel" name="btnDel" data-toggle="modal"
					data-target="#confirmModal">답변</button>





			</div>

		</div>

	</div>
</div>
<!-- 답변 등록 모달 -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
	aria-labelledby="completionModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="phoneNumber" name="phoneNumber"
					value="${custBoardVO.custBrdMbiph}" placeholder="전화번호" title="전화번호">
				<input type="text" id="context" name="context" value=""
					placeholder="" title="답변">
			</div>
			<div class="modal-footer">

				<!-- 					<button type="button" class="sbtn red" id="phoneChk" title="답변전송" -->
				<!-- 						onclick="showDiv('passkey')"> -->
				<!-- 						<span>답변전송</span> -->
				<!-- 					</button> -->
				<button type="button" class="sbtn red" id="phoneChk" title="답변전송"
					onclick="showDiv('passkey')">
					<span>답변전송</span>
				</button>
			</div>
		</div>
	</div>
</div>

