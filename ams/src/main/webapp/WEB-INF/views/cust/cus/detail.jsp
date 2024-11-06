<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css"
	rel="stylesheet" media="screen" />
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
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





<script type="text/javascript">
$(document).ready(function() {
    $("#btnDel").on("click", function(event) {
        event.preventDefault(); // 기본 동작 방지
        $("#confirmModal").modal('show');
    });

    $("#confirmSubmitBtn").on("click", function() {
        let custBrdNo = $("#custBrdNo").val();
        let fileGroupNo = $("#fileGroupNo").val() || 0;

        let data = {
            "custBrdNo": custBrdNo,
            "fileGroupNo": fileGroupNo
        };

        $.ajax({
            url: "/cust/cus/delete",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            type: "POST",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(result) {
                $("#confirmModal").modal('hide');
                $("#completionModal").modal('show');
                setTimeout(() => window.location.href = "/cust/cus/cusList?phone=${custBoardVO.custBrdMbiph}&name=${custBoardVO.name}", 1000);
            },
            error: function(xhr, status, error) {
                $("#failureModal").modal("show");
            }
        });
    });
});
</script>


<div id="contents">





	<article>
		<div class="voc-wrap Noto">


			<div class="board_area">
				<p class="subTit2">${custBoardVO.custBrdNm}님의고객의소리입니다.</p>
				 <input type="hidden" id="custBrdNo" value="${custBoardVO.custBrdNo}">
				 <input type="hidden" id="fileGroupNo" value="${custBoardVO.fileGroupNo}">
				<div class="lineList_tbW">
					<table>
						<caption>제목, 발생지(공항), 등록일, 처리상태, 답변필요여부, 내용, 첨부파일이 표기된
							표입니다.</caption>
						<colgroup>
							<col>
							<col>
							<col>
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td colspan="3">${custBoardVO.custBrdTtl}</td>
							</tr>

							<tr>
								<th scope="row">답변방법</th>
								<c:if test="${(custBoardVO.custBrdAnsty == 'E')}">
									<td>메일</td>
								</c:if>
								<c:if test="${(custBoardVO.custBrdAnsty == 'M')}">
									<td>문자</td>
								</c:if>
								<c:if test="${(custBoardVO.custBrdAnsty == NULL)}">
									<td>답변 받지 않음</td>
								</c:if>

								<th scope="row">등록일</th>
								
								<td class="Roboto"><fmt:formatDate value="${custBoardVO.custBrdRegYmd}" pattern="yyyy-MM-dd"/></td>
							</tr>

							<tr>
								<th scope="row">처리상태</th>
								<c:if test="${(custBoardVO.custBrdAnsYmd == NULL)}">
									<td>접수 대기</td>
								</c:if>
								<c:if test="${(custBoardVO.custBrdAnsYmd != NULL)}">
									<td>답변 완료</td>
								</c:if>
								<th scope="row">답변일</th>
								<td>${custBoardVO.custBrdAnsYmd}</td>

							</tr>

							<tr>
								<th scope="row">내용</th>
								<td colspan="3">
									<p class="tabTxt1">${custBoardVO.custBrdCn}</p>
								</td>
							</tr>

							<tr class="w_txt">
								<th scope="row">첨부파일</th>
								<c:if test="${custBoardVO.fileGroupNo == 0}">
									<td colspan="3"><a> </a>
								</c:if>


								<c:if test="${custBoardVO.fileGroupNo > 0}">
									<div class="file-info">
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
								</c:if>
							</tr>




						</tbody>
					</table>
				</div>





				<!-- <button type="button" id="btnDel" name="btnDel"><span>삭제</span></button> -->
				<!-- 버튼영역 -->
				<div class="tbArea_btn iTem3">
					<a href="#" class="btnC" id="btnDel" name="btnDel"><span>삭제하기</span></a>
					<a
						href="/cust/cus/cusList?phone=${custBoardVO.custBrdMbiph}&name=${custBoardVO.name}"
						class="btnC btnGray"><span>목록으로</span></a>
				</div>
				<!-- //버튼영역 -->


			</div>


		</div>








	</article>
</div>



</body>


<!-- 삭제 컨펌 모달 -->
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
			<div class="modal-body">삭제하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="confirmSubmitBtn">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- 삭제 컨펌 모달 -->

<!-- 삭제 완료 모달 -->
<div class="modal fade" id="completionModal" tabindex="-1" role="dialog"
	aria-labelledby="completionModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<!--                 <h5 class="modal-title" id="completionModalLabel">수정 완료</h5> -->
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">삭제 완료되었습니다.</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- 삭제 완료 모달 -->

<!-- 삭제 실패 모달 -->
<div class="modal fade" id="failureModal" tabindex="-1" role="dialog"
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
			<div class="modal-body">삭제 실패하였습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 삭제 실패 모달 -->
<script>
	$(function() {

		// 파일 다운로드 버튼 처리
		$(".fileList")
				.on(
						"click",
						"#fileDown",
						function() {
							let filePath = $(this).data("file-path");
							let fileOrgnlFileNm = $(this).siblings(
									"#fileOrgnlFileNm").val();

							console.log(fileOrgnlFileNm);

							if (filePath) {
								window.location.href = "/cus/cusBoard/download?filePath="
										+ encodeURIComponent(filePath)
										+ "&fileOrgnlFileNm="
										+ encodeURIComponent(fileOrgnlFileNm);
							} else {
								alert("파일 경로를 찾을 수 없습니다.");
							}
						});
	})
</script>
