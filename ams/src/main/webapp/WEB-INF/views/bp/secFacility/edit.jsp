	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
	
	<script>
	
	// 주소 API 카카오
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            // 도로명 주소 선택 시
	            if (data.userSelectedType === 'R') { 
	                addr = data.roadAddress;
	            } else { // 지번 주소 선택 시
	                addr = data.jibunAddress;
	            }
	
	            // 추가 주소 정보가 있는 경우
	            if (data.userSelectedType === 'R') {
	                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
	                    extraAddr += data.bname;
	                }
	                if (data.buildingName !== '' && data.apartment === 'Y') {
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                if (extraAddr !== '') {
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            } else {
	                document.getElementById("sample6_extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보 입력
	            document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("sample6_address").value = addr;
	            document.getElementById("sample6_detailAddress").focus();  // 상세 주소 입력으로 포커스 이동
	
	            // 창이 자동으로 닫힙니다.
	        }
	    }).open();
	}
	
	$(function() {    
	    $("#btnDel").on("click", function() {
	        let facId = $("#facId").val(); // facId가 hidden input으로 존재하는지 확인
	        console.log("선택한 게시물 번호 : " + facId);
	        
	        // 모달을 표시
	        $("#deleteModal").modal("show");
	        
	        // 삭제 버튼 클릭 시
	        $("#confirmDel").off("click").on("click", function() {
	            // 선택한 게시물 삭제 처리    
	            $.ajax({
	                url: "/bp/secFacility/delete",  // URL 경로가 맞는지 확인
	                type: "POST",  // HTTP 메소드가 POST인지 확인
	                data: { "facId": facId },
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); // CSRF 토큰 추가
	                },
	                success: function(result) {
	                    console.log("result : " + result);
	                    window.location.href = "/bp/secFacility/list"; 
	                },
	                error: function(xhr, status, error) {
	                    console.error("에러 발생: ", error);
	                    alert("삭제 중 오류가 발생했습니다.");
	                }
	            });
	            $("#deleteModal").modal("hide");
	        });
	    });
	});
	
	</script>
	<style>
.container {
    max-width: 800px;
    margin-top: 50px;
}
.card {
    border: 1px solid #ced4da;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
.card-header {
    background-color: #f8f9fa;
    border-bottom: 1px solid #ced4da;
    padding: 20px;
    border-radius: 10px 10px 0 0;
}
.card-body {
    padding: 30px;
}
.form-group {
    margin-bottom: 20px;
}
.form-control {
    border-radius: 5px;
}
.btn1 {
     border-radius : 5px;
 background : white;
 color : black;
 width: 60px;
 height : 32.5px;
 margin: 10px;
 border: none;
}
#sample6_postcode {
    width: calc(100% - 120px);
    display: inline-block;
}
#sample6_detailAddress, #sample6_extraAddress {
    margin-top: 10px;
}
</style>

<input type="hidden" id="facId" value="${securityCompanyVO.facId}" />
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-white text-center">
                    <h2 style="font-size: 1.5rem;"><strong>업체수정</strong></h2>
                </div>

                <div class="card-body">
                    <form action="/bp/secFacility/editFrom" method="POST">
                        <input type="hidden" name="facId" value="${securityCompanyVO.facId}" />

                        <div class="form-group">
                            <label for="empName">회사명</label>
                            <input type="text" class="form-control" id="empName" name="empName" value="${securityCompanyVO.empName}" required>
                        </div>

                        <div class="form-group">
                            <label for="expName">대표자</label>
                            <input type="text" class="form-control" id="expName" name="expName" value="${securityCompanyVO.expName}" required>
                        </div>

                        <div class="form-group">
                            <label for="empTel1">전화번호</label>
                            <div class="d-flex">
                                <select class="form-control mr-2" id="empTel1" name="empTel1" style="width: 30%;">
                                    <option value="02" ${securityCompanyVO.empTel1 == '02' ? 'selected' : ''}>02 (서울)</option>
                                    <!-- 다른 옵션들... -->
                                </select>
                                <input type="text" class="form-control mr-2" id="empTel2" name="empTel2" maxlength="4" value="${securityCompanyVO.empTel2}" required style="width: 30%;">
                                <input type="text" class="form-control" id="empTel3" name="empTel3" maxlength="4" value="${securityCompanyVO.empTel3}" required style="width: 30%;">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="sample6_postcode">주소</label>
                            <div class="d-flex mb-2">
                                <input type="text" id="sample6_postcode" name="postcode" class="form-control mr-2" readonly>
                                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary" style="width: 120px; background-color: #1890FF;">
                            </div>
                            <input type="text" id="sample6_address" name="empAdd1" class="form-control mb-2" value="${securityCompanyVO.empAdd1}" required>
                            <input type="text" id="sample6_detailAddress" name="empAdd2" class="form-control mb-2" value="${securityCompanyVO.empAdd2}" required>
                            <input type="text" id="sample6_extraAddress" class="form-control" readonly>
                        </div>

                        <div class="text-center mt-4">
                            <a href="/bp/secFacility/detail?facId=${securityCompanyVO.facId}" class="btn1" style="background-color: #6c757d; color: white; float:left;">취소</a>
                            <button type="submit" class="btn1" style="background-color: #1890FF; color: white; float: right;">저장</button>
                            <button type="button" class="btn1" id="btnDel" style="background-color: #6badf4; color: white; background-color:rgba(255, 0, 0,1); float: right;">삭제</button>
                        </div>

                        <sec:csrfInput/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">삭제 확인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>정말로 삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" id="confirmDel">삭제</button>
            </div>
        </div>
    </div>
</div>