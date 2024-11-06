<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<style>
    .center-title {
        text-align: center;
        font-size: 1.5rem;
        margin-top: 20px;
    }

    .larger {
        font-size: 1.1rem; 
    }

    .larger .form-control {
        font-size: 1.1rem;
        padding: 10px;
    }

    .larger .card {
        padding: 20px; 
    }

    /* 버튼 정렬을 위한 Flexbox 스타일 */
    .card-footer {
        display: flex;
        justify-content: space-between; /* 왼쪽-오른쪽 정렬 */
        align-items: center;
    }
</style>

<script type="text/javascript">
$(document).ready(function() {
    var memId = "${memVO.memId}";
    console.log("로그인된 사용자 ID: ", memId);

    var content = "${mainTenanceVO.mntncCn}";
    $('#ntcBrdCn').html(content);

    ClassicEditor
        .create(document.querySelector('#mntncCnEditor'))
        .then(editor => {
            editor.setData(content);
            editor.editing.view.change((writer) => {
                writer.setStyle('height', '300px', editor.editing.view.document.getRoot());
            });
        })
        .catch(error => {
            console.error(error);
        });

    $('#deleteBtn').click(function() {
        $('#deleteConfirmationModal').modal('show');
    });

    $('#confirmDeleteBtn').click(function() {
        var mntncCode = "${mainTenanceVO.mntncCode}";

        console.log("삭제할 코드:", mntncCode);

        $.ajax({
            url: '/emp/maintenance/delete',
            type: 'post',
            data: { mntncCode: mntncCode },
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(response) {
                if (response === "success") {
                    showResultModal('success', '삭제가 완료되었습니다.');
                } else {
                    showResultModal('error', '삭제에 실패했습니다. 다시 시도해주세요.');
                }
            },
            error: function(xhr, status, error) {
                showResultModal('error', '삭제에 실패했습니다. 다시 시도해주세요.');
            }
        });

        $('#deleteConfirmationModal').modal('hide');
    });

    function showResultModal(type, message) {
        var modalTitle = type === 'success' ? '성공' : '실패';
        var modalColor = type === 'success' ? 'text-success' : 'text-danger';

        $('#resultModalLabel').text(modalTitle);
        $('#resultModalBody').text(message).removeClass('text-success text-danger').css('color', 'black');
        $('#resultModal').modal('show');
    }

    $('#resultModalConfirmBtn').click(function() {
        if ($('#resultModalLabel').text() === '성공') {
            window.location.href = '/emp/maintenance/list';
        }
        $('#resultModal').modal('hide');
    });
});
</script>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm larger">
                <div class="center-title">
                    <h4>유지보수 수정</h4>
                </div>

                <div class="card-body">
                    <form action="/emp/maintenance/editPost" method="POST">
                        <div class="form-group mt-3">
                            <label for="name">작성자</label>
                            <input type="text" class="form-control" id="name" name="empNm" value="${mainTenanceVO.empNm}" readonly>
                        </div>
                        
                        <div class="form-group mt-3">
                            <label for="department">부서</label>
                            <input type="text" class="form-control" id="department" name="deptNm" value="${mainTenanceVO.deptNm}" readonly>
                        </div>
                        
                        <div class="form-group mt-3">
                            <label for="position">직책</label>
                            <input type="text" class="form-control" id="position" name="jbgdCd" value="${mainTenanceVO.jbgdCd}" readonly>
                        </div>
                        
                        <div class="form-group mt-4">
                            <label for="mntncCn">내용</label>
                            <textarea id="mntncCnEditor" name="mntncCn" class="form-control" rows="10" style="display: none;"></textarea>
                        </div>

                        <div class="form-group mt-4">
                            <label for="mntncRslt">처리결과 :</label>
                            <select name="mntncRslt" class="form-control">
                                <option value="${mainTenanceVO.mntncRslt}">${mainTenanceVO.mntncRslt}</option>
                                <option value="신청">신청</option>
                                <option value="진행중">진행중</option>
                                <option value="조치완료">조치완료</option>
                            </select>
                        </div>

                        <input id="mntncCode" type="hidden" name="mntncCode" value="${mainTenanceVO.mntncCode}">  
                        
                        <div class="card-footer">
    <!-- 이전 버튼은 왼쪽 정렬 -->
    <div style="flex: 1;">
        <button type="button" class="btn" 
                style="background-color: #6c757d; color: white; margin:5px;" 
                onclick="window.history.back();">
            이전
        </button>
    </div>

    <!-- 삭제 및 수정 버튼은 오른쪽 정렬 -->
    <div style="flex: 1; text-align: right;">
			<button type="button" id="deleteBtn" class="btn" 
			        style="background-color: rgba(255, 0, 0, 1); color: white; margin: 5px;">
			    삭제
			</button>
        <button type="submit" class="btn" 
                style="background-color: #1890FF; color: white; margin:5px;">
            수정
        </button>
    </div>
</div>
                        <sec:csrfInput/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 삭제 확인 모달 -->
<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">삭제 확인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                정말로 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" id="confirmDeleteBtn" class="btn btn-danger">삭제</button>
            </div>
        </div>
    </div>
</div>

<!-- 결과 모달 -->
<div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="resultModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="resultModalBody">
            </div>
            <div class="modal-footer">
                <button type="button" id="resultModalConfirmBtn" class="btn btn-primary">확인</button>
            </div>
        </div>
    </div>
</div>