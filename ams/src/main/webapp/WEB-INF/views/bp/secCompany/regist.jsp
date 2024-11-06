<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script type="text/javascript">
$(function() {
    var memId = "${memVO.memId}";
    console.log("로그인된 사용자 ID: ", memId);
    
    // 등록 버튼 비활성화
    var $saveButton = $("#saveButton").prop("disabled", true);
    
    // 중복 검사 버튼 클릭 시 처리
    $("#checkFacilityNameBtn").click(function() {
        var facilityName = $("#securityFacName").val();
        
        if (facilityName) {
            $.get("/bp/secFacility/checkFacilityName", { facilityName: facilityName }, function(data) {
                if (data) {
                    alert("이미 존재하는 시설명입니다.");
                    $saveButton.prop("disabled", true); // 등록 버튼 비활성화
                } else {
                    alert("사용 가능한 시설명입니다.");
                    $saveButton.prop("disabled", false); // 등록 버튼 활성화
                }
            }).fail(function() {
                alert("중복 검사에 실패했습니다. 나중에 다시 시도해주세요.");
            });
        } else {
            alert("시설명을 입력해 주세요.");
        }
    });

    // 점검표 선택 시 점검 항목 불러오기
    $("#checklistSeq").change(function() {
        let checklistSeq = $(this).val(); // 선택한 점검표의 checklistSeq 가져오기
        
        if (checklistSeq) {
            // AJAX 요청으로 점검 항목 가져오기
            $.ajax({
                url: "/bp/secCompany/getChecklistItems", // 컨트롤러의 URL
                type: "get",
                data: { "checklistSeq": checklistSeq },
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); // CSRF 보호
                },
                success: function(data) {
                    console.log("점검 항목 : ", data);
                    
                    // 점검 항목을 표시하되, 수정 불가능한(readonly) 필드로 생성
                    let checkItemsHtml = '';
                    if (Array.isArray(data) && data.length > 0) {
                        for (let i = 0; i < data.length; i++) {
                            checkItemsHtml += '<div class="form-group">' +
                                              '<label for="checkItems' + (i + 1) + '">점검 항목 ' + (i + 1) + '</label>' +
                                              '<input type="text" class="form-control" name="checkItems' + (i + 1) + '" id="checkItems' + (i + 1) + '" value="' + (data[i] !== null ? data[i] : '') + '" readonly>' +
                                              '</div>'; // 수정 불가(readonly) 속성 추가
                        }
                    } else {
                        checkItemsHtml = '<p>점검 항목이 없습니다.</p>'; // 점검 항목이 없을 경우 메시지
                    }
                    $("#checkItemsContainer").html(checkItemsHtml); // HTML 업데이트
                },
                error: function(xhr, status, error) {
                    console.error("에러 발생: ", error);
                    alert("점검 항목을 가져오는 중 오류가 발생했습니다."); 	
                }
            });
        } else {
            $("#checkItemsContainer").empty(); // 선택 해제 시 점검 항목 컨테이너 비우기
        }
    });
});
</script>

<style>
   

    .card-header {
        background-color: white; /* 카드 헤더 배경색을 흰색으로 변경 */
    }
    /* CKEditor 높이 조정 */	
    #particulars {
        height: 500px; /* 원하는 높이 값 설정 */
    }
</style>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8" style="border: 1px solid;">
            <div class="card shadow-sm">
                <div class="card-header text-center">
                    <h2 style="font-size: 2rem;"><strong>시설 등록</strong></h2>
                     
                </div>

                <div class="card-body">
                    <form action="/bp/secCompany/secCompanyRegistFrom" method="POST" >
                        <!-- 시설명 -->
                        <div class="form-group mt-3">
                            <label for="securityFacName">시설 명</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="securityFacName" name="securityFacName" required>
							<div class="input-group-append">
							    <button style="  background-color: #1890FF; color: white;" type="button" class="btn" id="checkFacilityNameBtn">중복 검사</button>
							</div>
                            </div>
                        </div>

                        <!-- 점검표 선택 -->
                        <div class="form-group mt-3">
                            <label for="checklistSeq">점검표 선택</label>
                            <select class="form-control" id="checklistSeq" name="checklistSeq" required>
                                <option value="">선택하세요</option>
                                <c:forEach items="${secCheckListVOList}" var="checklist">
                                    <option value="${checklist.checklistSeq}">${checklist.checklistName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <!-- 점검 항목 표시 (수정 불가 필드) -->
                        <div class="form-group mt-3" id="checkItemsContainer">           
                            <!-- 점검 항목이 여기에 추가됨 -->
                        </div>
                        
                        <!-- 회사명 드롭다운 -->
                        <div class="form-group mt-3">
                            <label for="empName">회사명</label>
                            <select class="form-control" id="empName" name="empName" required>
                                <option value="">선택하세요</option>
                                <c:forEach items="${securityCompanyVOList}" var="company">
                                    <option value="${company.empName}">${company.empName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- 내용 (CKEditor 적용) -->
                       

<div class="card-footer text-center mt-4">
    <a href="/bp/secFacility/list" class="btn" style="background-color: #6c757d;float:left;  color: white;">목록</a>
    <button type="submit" class="btn" style=" background-color: #1890FF;  color: white; margin-left: 10px; float: right;" id="saveButton">저장</button>
</div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
