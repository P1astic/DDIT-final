<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/maintenance/list.css">

<!-- Spring Security를 사용해 로그인된 사용자 정보 가져오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<style>
    .btn-primary {
        background-color: #6badf4;
        border-color: #6badf4;
    }

    .btn-secondary {
        background-color: #6badf4;
        border-color: #6badf4;
    }

    /* CKEditor 높이 조정 (글자 작성 부분) */
    .ck-editor__editable {
        min-height: 300px; /* 필요에 따라 높이 조정 */
    }
</style>

<script type="text/javascript">
$(function() {
    var memId = "${memVO.memId}";
    console.log("로그인된 사용자 ID: ", memId);
});
</script>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-header text-white text-center">
                    <h4 style="color: black;">유지보수 등록</h4>
                </div>

                <div class="card-body">
                    <!-- 유지보수 신청 폼 -->
                    <form action="/emp/maintenance/registForm" method="GET">
                        <!-- 이름 -->
                        <div class="form-group mt-3">
                            <label for="name">작성자</label>
                            <input type="text" class="form-control" id="name" name="empNm" value="${memVO.employeeVO.empNm}" readonly>
                        </div>

                        <!-- 부서 입력 -->
                        <div class="form-group mt-3">
                            <label for="department">부서</label>
                            <input type="text" class="form-control" id="department" name="deptNm" value="${memVO.deptVO.deptNm}" readonly>
                        </div>

                        <!-- 직책 입력 -->
                        <div class="form-group mt-3">
                            <label for="position">직책</label>
                            <input type="text" class="form-control" id="position" name="jbgdCd" value="${memVO.jobGradeVO.jbgdNm}" readonly>
                        </div>

                        <input type="hidden" name="userId" value="${memVO.memId}" />
                        <input type="hidden" name="deptNm" value="${memVO.deptVO.deptNm}" />
                        <input type="hidden" name="jbgdNm" value="${memVO.jobGradeVO.jbgdNm}" />
                        <input type="hidden" name="jbgdNm" value="${memVO.employeeVO.empNm}" />

                        <!-- 내용 (CKEditor 적용) -->
                        <div class="form-group mt-4">
                            <label for="ntcBrdCn">내용</label>
                            <textarea class="form-control" name="mntncCn" id="ntcBrdCn" placeholder="내용을 입력하세요"></textarea>
                            <c:out value="${mainTenanceVO.mntncCn}" escapeXml="false"/>
                        </div>
<!-- 하단 버튼을 왼쪽과 오른쪽으로 정렬 -->
<div class="d-flex justify-content-between mt-4">
    <a href="/emp/maintenance/list" class="btn btn-secondary" style="background-color: #6c757d; border: none;">목록</a>
    <button type="submit" class="btn btn-primary" style="margin-left: 20px; background-color: #1890FF;  border: none;">저장</button>
</div>


                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// CKEditor5 적용
ClassicEditor.create(document.querySelector('#ntcBrdCn'), {
    ckfinder: {
        uploadUrl: '/image/upload?${_csrf.parameterName}=${_csrf.token}'
    }
}).then(editor => {
    window.editor = editor;
}).catch(err => {
    console.error(err.stack);
});
</script>