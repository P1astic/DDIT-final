<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<script>
$(function() {
    // 삭제 버튼 클릭 시 모달 표시
    $("#btnDel").on("click", function() {
        $("#confirmModal").modal("show"); // 모달 표시
    });

    // 확인 버튼 클릭 시 삭제 처리
    $("#confirmSubmitBtn").on("click", function() {
        let securityFacCd = $("#securityFacCd").val();
        console.log("선택한 게시물 번호 : " + securityFacCd);

        // 선택한 게시물 삭제 처리    
        $.ajax({
            url: "/bp/secCom/delete",
            type: "post",
            data: { "securityFacCd": securityFacCd },
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(result) {
                console.log("result : " + result);
                $("#completionModal").modal("show"); // 삭제 완료 모달 표시
                setTimeout(function() {
                    window.location.href = "/bp/secFacility/list"; 
                }, 2000); // 2초 후 리스트 페이지로 이동
            },
            error: function(xhr, status, error) {
                console.error("에러 발생: ", error);
                $("#failureModal").modal("show"); // 삭제 실패 모달 표시
            }
        });

        $("#confirmModal").modal("hide"); // 확인 후 모달 닫기
    });
});
</script>

<!-- Spring Security를 사용해 로그인된 사용자 정보 가져오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<style>
    /* 기본 스타일 설정 */
   
    h1 {
        font-size: 24px;
        margin-bottom: 10px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .label {
        font-size: 18px;
        margin-bottom: 5px;
        display: block;
    }
    .form-control {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }
   .button {
	   border-radius : 5px;
	 background : #1890FF;
	color : white;
	 width: 60px;
	 height : 32.5px;
	 border: none;
}
    .button:disabled {
        background-color: #ccc;
        cursor: not-allowed;
    }
    .file-upload {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }
    .date-display {
        text-align: right;
        margin-bottom: 20px;
        font-size: 16px;
    }
    .red-dot {
        color: red;
        font-size: 20px;
        margin-left: 5px;
    }
    /* 체크 항목 스타일 */
    .checklist-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .check-btn {
        float: right;
        background-color: #B7B7B7; /* 클릭 전 색상 */
        border: none; /* 테두리 제거 */
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }
    .check-btn.completed {
        background-color: #1890FF; /* 클릭 후 색상 */
        border-color: #1890FF; /* 클릭 후 테두리 색상 */
    }
    
    .form-control {
    width: 20%; /* 너비를 원하는 만큼 줄입니다. */
    height: 30%;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
}
</style>

<input type="hidden" id="securityFacCd" name="securityFacCd" value="${securityFacilityVO.securityFacCd}">
<h1 style="margin: 20px;">점검</h1>

<form method="get" action="/bp/secCom/securityPatrolFrom">
    <div class="form-group">
        <!-- 근무자 셀렉트 박스 -->
        <label class="label">근무자 선택 <span class="red-dot">*</span></label>
        <select name="workerName" class="form-control">
            <c:forEach var="worker" items="${securiyWorkerVOList}">
                <option value="${worker.workerName}">${worker.workerName}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <span class="label">점검 항목</span>
        <input type="hidden" name="securityFacCd" value="${securityFacilityVO.securityFacCd}">

        <div id="checklistItemsContainer">
            <!-- 항목 1 (null 값 체크 후 표시) -->
            <c:if test="${securityFacilityVO.checkItems1 != null}">
                <div class="form-group checklist-item">
                    <input type="hidden" name="inspectionItems1" value="${securityFacilityVO.checkItems1}">
                    <label class="label">점검 항목 1: ${securityFacilityVO.checkItems1} <span class="red-dot">*</span></label>
                    <button type="button" class="button check-btn" style=" width: 90px;">항목 완료</button>
                </div>
                <hr>
            </c:if>

            <!-- 항목 2 (null 값 체크 후 표시) -->
            <c:if test="${securityFacilityVO.checkItems2 != null}">
                <div class="form-group checklist-item">
                    <input type="hidden" name="inspectionItems2" value="${securityFacilityVO.checkItems2}">
                    <label class="label">점검 항목 2: ${securityFacilityVO.checkItems2} <span class="red-dot">*</span></label>
                    <button type="button" class="button check-btn" style=" width: 90px;" >항목 완료</button>
                </div>
                <hr>
            </c:if>

            <!-- 항목 3 (null 값 체크 후 표시) -->
            <c:if test="${securityFacilityVO.checkItems3 != null}">
                <div class="form-group checklist-item">
                    <input type="hidden" name="inspectionItems3" value="${securityFacilityVO.checkItems3}">
                    <label class="label">점검 항목 3: ${securityFacilityVO.checkItems3} <span class="red-dot">*</span></label>
                    <button type="button" class="button check-btn" style=" width: 90px;">항목 완료</button>
                </div>
                <hr>
            </c:if>

            <!-- 항목 4 (null 값 체크 후 표시) -->
            <c:if test="${securityFacilityVO.checkItems4 != null}">
                <div class="form-group checklist-item">
                    <input type="hidden" name="inspectionItems4" value="${securityFacilityVO.checkItems4}">
                    <label class="label">점검 항목 4: ${securityFacilityVO.checkItems4} <span class="red-dot">*</span></label>
                    <button type="button" class="button check-btn" style=" width: 90px;">항목 완료</button>
                </div>
                <hr>
            </c:if>

            <!-- 항목 5 (null 값 체크 후 표시) -->
            <c:if test="${securityFacilityVO.checkItems5 != null}">
                <div class="form-group checklist-item">
                    <input type="hidden" name="inspectionItems5" value="${securityFacilityVO.checkItems5}">
                    <label class="label">점검 항목 5: ${securityFacilityVO.checkItems5} <span class="red-dot">*</span></label>
                    <button type="button" class="button check-btn" style=" width: 90px;">항목 완료</button>
                </div>
                <hr>
            </c:if>
        </div>

        <div style="display: flex; align-items: center; margin-bottom: 15px;">
            <label for="inspectionMemo" style="font-size: 25px; margin-right: 10px;">순찰내용:</label>
            <textarea id="inspectionMemo" name="inspectionMemo" cols="30" rows="5" style="width: 100%; max-width: 600px; font-size: 16px;"></textarea>
        </div>
            <div class="date-display" id="currentDate"></div>

        <!-- 제출 버튼 -->
	<div class="form-group">
	    <button type="submit" class="button" id="submitBtn" disabled style="width: 130px; height: 40px; font-size: 14px;float:right;">제출</button>
	    <button type="button" name="btnDel" class="btn btn-danger btn-lg" id="btnDel" style="background-color: rgba(255, 0, 0,1); color: white;  width: 130px; height: 40px; font-size: 14px; float:left;">삭제</button>
        
	</div>

     

        <script>
            // 현재 날짜 표시
            const dateDisplay = document.getElementById("currentDate");
            const today = new Date();
            dateDisplay.innerHTML = "현재 날짜: " + today.toLocaleDateString();
        </script>
    </div>
</form>









<!-- 삭제 컨펌 모달 -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">삭제 확인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="confirmSubmitBtn">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 삭제 컨펌 모달 -->

<!-- 삭제 완료 모달 -->
<div class="modal fade" id="completionModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">삭제 완료</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                삭제 완료되었습니다.
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- 삭제 완료 모달 -->

<!-- 삭제 실패 모달 -->
<div class="modal fade" id="failureModal" tabindex="-1" role="dialog" aria-labelledby="failureModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">삭제 실패</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                삭제 실패하였습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- 삭제 실패 모달 -->
















<script>
    $(document).ready(function () {
        // 체크 버튼 클릭 시 완료 상태 변경
        $(".check-btn").on("click", function () {
            $(this).toggleClass("completed");
            if ($(this).hasClass("completed")) {
                $(this).text("완료됨");
            } else {
                $(this).text("항목 완료");
            }
            // 제출 버튼 활성화
            $("#submitBtn").prop("disabled", $(".check-btn.completed").length === 0);
        });
    });
</script>