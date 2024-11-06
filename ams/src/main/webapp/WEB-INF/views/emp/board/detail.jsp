<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board/detail.css">

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script>
$(function() {
    // 드롭다운 버튼 클릭 시 드롭다운 메뉴 토글
    $("#dropbtn").on("click", function() {
        $(".dropdown-content").toggle();
    });

    // 드롭다운 외부 클릭 시 드롭다운 메뉴 숨기기
    $(document).on("click", function(e) {
        if (!$(e.target).closest('.dropdown').length) {
            $(".dropdown-content").hide();
        }
    });

    $("#btnDel").on("click", function() {
        $("#confirmModal").modal('show');
    });

    $("#confirmSubmitBtn").on("click", function() {
        let ntcBrdNo = $("#ntcBrdNo").val();
        let fileGroupNo = $("#fileGroupNo").val() || 0;
        console.log("선택한 게시물 번호 : " + ntcBrdNo);

        // 선택한 게시물 삭제 처리
        if (fileGroupNo != 0) {
            console.log("선택한 게시물의 첨부파일 그룹 번호 : " + fileGroupNo);
        }

        let data = {
            "ntcBrdNo": ntcBrdNo,
            "fileGroupNo": fileGroupNo
        };

        $.ajax({
            url: "/emp/board/delete",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            type: "post",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(result) {
                $("#confirmModal").modal('hide');
                $("#completionModal").modal('show');
                setTimeout(() => window.location.href = "/emp/board/list", 1000);
            },
            error: function(xhr, status, error) {
                $("#failureModal").modal("show");
            }
        });
    });

    // 파일 다운로드 버튼 처리
    $(".fileList").on("click", "#fileDown", function() {
        let filePath = $(this).data("file-path");
        let fileOrgnlFileNm = $(this).siblings("#fileOrgnlFileNm").val();

        console.log(fileOrgnlFileNm);

        if (filePath) {
            window.location.href = "/emp/board/download?filePath=" + encodeURIComponent(filePath) + "&fileOrgnlFileNm=" + encodeURIComponent(fileOrgnlFileNm);
        } else {
            alert("파일 경로를 찾을 수 없습니다.");
        }
    });
});
</script>


<div class="container">
    <div class="row justify-content-center">
        <div class="col">

            <!-- 카드 헤더 -->
            <div class="titleHeader">
                <h4 class="pageTitle">${boardVO.ntcBrdTtl}</h4>
                <input type="hidden" id="ntcBrdNo" value="${boardVO.ntcBrdNo}">

                <div class="ml-auto d-flex align-items-center">
                    <!-- 상단 정보: 작성자와 조회수 -->
                    <div class="top-info">
                    	<div>
	                        <img id="empNmImg" src="/resources/images/icon/writer.png">
	                        	<input type="text" id="empNm" name="empNm" value="${boardVO.empNm}"/>
                        </div>
                        <div>
	                        <img id="eyeImg" src="/resources/images/icon/eyes.png">
	                        	<input type="text" id="ntcBrdInqCnt" name="ntcBrdInqCnt" value="${boardVO.ntcBrdInqCnt}"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="detailDiv" style="height:auto;">
                <div style="height:auto;">                    

                    <!-- 첨부 파일 -->
                    <c:if test="${boardVO.fileGroupNo > 0}">
                        <div class="file-info" style="margin-bottom: 20px;">
                            <div class="fileList">
                                <input type="hidden" name="fileGroupNo" id="fileGroupNo" value="${boardVO.fileGroupNo}">
                                <c:forEach var="fileDetailVO" items="${fileDetailVOList}" varStatus="status">
                                    <div id="fileNum${status.index}" style="display:flex;">
                                        <input style="border:none; width:300px;" type='text' name='fileOrgnlFileNm' id="fileOrgnlFileNm" value="${fileDetailVO.fileOrgnlFileNm}">
                                        <button id="fileDown" data-file-path="${fileDetailVO.fileFilePathNm}" type="button" style="background:none; border:none;">
                                            <img src="/resources/images/icon/download.png" style="width:15px; height:15px;">
                                        </button>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </div>

                <!-- 게시글 내용 -->
                <div class="cntDiv">
                    <div class="cnt" style="clear:both;">
                        <c:out value="${boardVO.ntcBrdCn}" escapeXml="false"/>
                    </div>
                </div>
	            <!-- 하단 버튼 -->
	            <div class="detail-footer">
	                <a href="/emp/board/list" id="listBtn">목록</a>
	                
                    	<c:if test="${fn:length(memVO.authLinkVOList) > 0}">
	                    	<c:set var="hasAccess" value="false" />
	                        <c:forEach var="authLink" items="${memVO.authLinkVOList}">
		                        <c:if test="${(authLink.authCode == 'ROLE_ADMIN' || authLink.authCode == 'ROLE_FA_MNG') && !hasAccess}">
					                   	<a href="/emp/board/edit?ntcBrdNo=${boardVO.ntcBrdNo}" id="editBtn">수정</a>					                    
					                    <button type="button" id="btnDel" name="btnDel">삭제</button>
		                        <c:set var="hasAccess" value="true" />
		                        </c:if>
	                        </c:forEach>
                        </c:if>
	            </div>

            </div>

        </div>
    </div>
</div>

<!-- 삭제 컨펌 모달 -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="comfirmCancelBtn" data-dismiss="modal">취소</button>
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
<!--                 <h5 class="modal-title" id="completionModalLabel">수정 완료</h5> -->
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
<div class="modal fade" id="failureModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
<!--                 <h5 class="modal-title" id="completionModalLabel">수정 실패</h5> -->
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                삭제 실패하였습니다.
            </div>
            <div class="modal-footer">
                <button type="button" id="failureModalCloseBtn" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- 삭제 실패 모달 -->