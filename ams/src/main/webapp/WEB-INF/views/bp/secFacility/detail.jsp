<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script>
function checkPassword(empPass, facId, isDelete = false) {
    let check = $("#passwordInput").val();
    if (check === empPass) {
        if (isDelete) {
            alert("삭제가 완료되었습니다.");
        } else {
            location.href = "/bp/secFacility/edit?facId=" + facId;
        }
        $('#passwordModal').modal('hide');
    } else {
        alert("비밀번호가 맞지 않습니다.");
    }
}

$(document).ready(function() {
    var empPass = "${securityCompanyVO.empPass}"; 
    var facId = "${securityCompanyVO.facId}"; 

    $('#btnEdit').click(function() {
        $('#passwordModal').modal('show');
    });

    $('#btnDelete').click(function() {
        $('#deletePasswordModal').modal('show');
    });

    $('#confirmPasswordBtn').click(function() {
        checkPassword(empPass, facId);
    });

    $('#confirmDeletePasswordBtn').click(function() {
        checkPassword(empPass, facId, true);
    });
});
</script>


<style>
body {
    background-color: #f8f9fa;
    color: #333;
}
.container {
    max-width: 800px;
    margin-top: 50px;
    padding: 30px;
}
.card {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}
.card-header {
    background-color: #f8f9fa;
    color: #333;
    text-align: center;
    padding: 20px;
    border-bottom: 2px solid #ddd;
    border-radius: 15px 15px 0 0;
}
.card-body {
    padding: 30px;
}
.form-group {
    margin-bottom: 20px;
}
.form-control {
    font-size: 16px;
    height: 40px;
    border-radius: 5px;
}
.form-group label {
    font-size: 16px;
    margin-bottom: 5px;
    display: block;
    font-weight: bold;
}
.tel-group {
    display: flex;
    justify-content: space-between;
    max-width: 300px;
}
.tel-input {
    width: 30%;
}
.btn {
    font-size: 14px;
    padding: 8px 16px;
    border-radius: 5px;
    cursor: pointer;
}
.modal-content {
    border-radius: 15px;
}
.modal-header, .modal-footer {
    border: none;
    padding: 20px;
}
.modal-body {
    padding: 30px;
}
</style>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<div class="container">
    <div class="card shadow-sm">
        <div class="card-header">
            <h2 style="font-size: 1.75rem;"><strong>업체 상세보기</strong></h2>
        </div>
        <div class="card-body">
            <form id="facilityForm">
                <input type="hidden" id="facId" name="facId" value="${securityCompanyVO.facId}" />

                <div class="form-group">
                    <label for="empNm">회사명</label>
                    <input type="text" class="form-control" id="empName" name="empName" value="${securityCompanyVO.empName}" readonly>
                </div>

                <div class="form-group">
                    <label for="expName">대표자</label>
                    <input type="text" class="form-control" id="expName" name="expName" value="${securityCompanyVO.expName}" readonly>
                </div>

                <div class="form-group">
                    <label for="empTel1">전화번호</label>
                    <div class="tel-group">
                        <input type="text" class="form-control tel-input" id="empTel1" name="empTel1" value="${securityCompanyVO.empTel1}" readonly>
                        <input type="text" class="form-control tel-input" id="empTel2" name="empTel2" value="${securityCompanyVO.empTel2}" readonly>
                        <input type="text" class="form-control tel-input" id="empTel3" name="empTel3" value="${securityCompanyVO.empTel3}" readonly>
                    </div>
                </div>

                <div class="form-group">
                    <label for="empAdd1">주소</label>
                    <input type="text" id="empAdd1" name="empAdd1" class="form-control" value="${securityCompanyVO.empAdd1}" readonly>
                </div>

                <div class="form-group">
                    <label for="empAdd2">상세 주소</label>
                    <input type="text" id="empAdd2" name="empAdd2" class="form-control" value="${securityCompanyVO.empAdd2}" readonly>
                </div>
            </form>
        </div>
        <div class="card-footer text-center">
            <a href="/bp/secFacility/list" class="btn btn-secondary" style="float: left;">목록</a>
            <button id="btnEdit" class="btn btn-primary" style="float: right;">수정</button>
        </div>
    </div>

    <!-- 비밀번호 확인 모달 -->
    <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="passwordModalLabel">비밀번호 확인</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label for="passwordInput">비밀번호 입력:</label>
                    <input type="password" id="passwordInput" class="form-control" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" id="confirmPasswordBtn" class="btn btn-primary">확인</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 비밀번호 확인 모달 (삭제용) -->
    <div class="modal fade" id="deletePasswordModal" tabindex="-1" role="dialog" aria-labelledby="deletePasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deletePasswordModalLabel">비밀번호 확인</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label for="deletePasswordInput">비밀번호 입력:</label>
                    <input type="password" id="deletePasswordInput" class="form-control" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" id="confirmDeletePasswordBtn" class="btn btn-danger">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>