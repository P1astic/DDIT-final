<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>



<script>

	$("#btnEdit").on("click", function() {
		// 모달 열기
		$('#passwordModal').modal('show');
	});

	$("#confirmPasswordBtn").on("click", function() {
		let password = $("#passwordInput").val(); // 입력한 비밀번호 가져오기

		$.ajax({
			url: "/bp/secFacility/checkPassword",
			type: "post",
			data: { "password": password },
			beforeSend: function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result) {
				if (result.valid) {
					// 비밀번호가 일치하면 수정 페이지로 리다이렉션
					window.location.href = "/bp/secFacility/edit?facId=" + $("#facId").val();
				} else {
					alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
					$("#passwordInput").val(''); // 비밀번호 입력란 초기화
				}
			},
			error: function(xhr, status, error) {
				console.error("에러 발생: ", error);
				alert("비밀번호 확인 중 오류가 발생했습니다.");
			}
		});
	});
</script>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white text-center">
                    
                    <h2 style="font-size: 2rem;"><strong>시설 상세보기</strong></h2>
                </div>

                <div class="card-body">
                    <form action="/bp/secFacility/delete" method="POST">
                        <input type="hidden" name="userId" value="${memVO.memId}" />
                        <input type="hidden" id="facId" name="facId" value="${securityCompanyVO.facId}" />

                        <div class="form-group row mt-3">
                            <label for="empNm" class="col-sm-3 col-form-label">회사/기관명</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="empName" name="empName" value="${securityCompanyVO.empName}" readonly>
                            </div>

                            <label for="deptNm" class="col-sm-2 col-form-label text-right">대표자</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="expName" name="expName" value="${securityCompanyVO.expName}" readonly>
                            </div>
                        </div>

                        <div class="form-group row mt-3">
                            <label for="empTel1" class="col-sm-3 col-form-label">회사 전화번호</label>
                            <div class="col-sm-9">
                                <div class="d-flex">
                                    <input type="text" class="form-control" id="empTel1" name="empTel1" value="${securityCompanyVO.empTel1}" readonly style="width: 100px; margin-right: 5px;">
                                    <input type="text" class="form-control" id="empTel2" name="empTel2" maxlength="4" value="${securityCompanyVO.empTel2}" readonly style="width: 100px; margin-right: 5px;">
                                    <input type="text" class="form-control" id="empTel3" name="empTel3" maxlength="4" value="${securityCompanyVO.empTel3}" readonly style="width: 100px;">
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mt-4">
                            <label for="sample6_postcode" class="col-sm-3 col-form-label">우편번호</label>
                            <div class="col-sm-9">
                                <input type="text" id="empAdd1" name="empAdd1" class="form-control mt-2" value="${securityCompanyVO.empAdd1}" readonly>
                                <input type="text" id="empAdd2" name="empAdd2" class="form-control mt-2" value="${securityCompanyVO.empAdd2}" readonly>
                            </div>
                        </div>

                        <div class="card-footer text-center mt-4">
                            <a style="color:white;" href="#" class="btn btn-primary" style="margin:5px;" id="btnEdit">수정</a>
                            <!-- <button type="button" class="btn btn-danger" style="margin:5px;" id="btnDel">삭제</button> -->
                            <a href="/bp/secFacility/list" class="btn btn-secondary ml-3">목록</a>
                        </div>
                        <sec:csrfInput/>
                    </form>
                </div>
            </div>
        </div>
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
                <div class="form-group">
                    <label for="passwordInput">비밀번호 입력</label>
                    <input type="password" class="form-control" id="passwordInput" placeholder="비밀번호를 입력하세요">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="confirmPasswordBtn">확인</button>
            </div>
        </div>
    </div>
</div>

<h2>이게 시설</h2>