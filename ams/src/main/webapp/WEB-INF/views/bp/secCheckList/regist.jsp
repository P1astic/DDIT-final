<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/secCheckList/regist.css">

<!-- Spring Security를 사용해 로그인된 사용자 정보 가져오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script type="text/javascript">
    $(document).ready(function() {
        // 항목 최대 개수 제한
        const maxItems = 5;

        // 현재 추가된 항목 개수 (기본 항목 포함)
        var itemCount = 1; // 기본 항목 1개가 있음 (checkItems1)

        // 항목 추가 버튼 클릭 이벤트
        $(".btn-add-item").click(function() {
            if (itemCount >= maxItems) {
                alert("점검 항목은 최대 5개까지만 추가할 수 있습니다.");
                return;
            }

            // 항목 개수에 맞게 name 속성 설정
            var itemName = "checkItems" + (itemCount + 1);

            // 숨겨진 항목을 보여주기
            $(".checklist-item:hidden").first().removeClass("d-none").show();

            itemCount++; // 추가된 항목 개수 증가
        });

        // 동적으로 생성된 삭제 버튼 클릭 이벤트 위임
        $(".checklist-container").on("click", ".btn-remove-item", function() {
            $(this).closest(".checklist-item").remove(); // 해당 항목 삭제
            itemCount--; // 항목 개수 감소
        });
    });
</script>


<style>

button {
	border-radius : 5px;
 width: 60px;
 height : 32.5px;

}

.btn-secondary {
	border-radius : 5px;
 width: 60px;
 height : 32.5px;

}

</style>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h4>점검표 등록</h4>
                </div>
                <div class="card-body">
                    <form action="/bp/secCheckList/secCheckListRegistFrom" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="userId" value="${memVO.memId}" />

                        <!-- 점검표명, 시설명, 회사명 -->
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <label for="checklistName" class="col-form-label">점검표 명</label>
                                <input type="text" class="form-control" id="checklistName" name="checklistName" value="${SecurityChecklistVO.checklistName}">
                            </div>

                            <div class="col-sm-4">
                                <label for="empName" class="col-form-label">회사명</label>
                                <select class="form-control" id="empName" name="empName" required>
                                    <option value="">선택하세요</option>
                                    <c:forEach items="${securityCompanyVOList}" var="company">
                                        <option value="${company.facId}" <c:if test="${company.facId == SecurityFacilityVO.empName}">selected</c:if>>${company.empName}</option>
                                    </c:forEach>
                                </select>
                            </div>


                        </div>

                        <!-- 점검 빈도 설정 -->
                       <!-- 점검 빈도 설정 -->
<div class="container mt-4">
    <div class="title text-center mb-3" style="font-size: 24px; font-weight: bold; color: #343a40;">점검 빈도</div>
    <div class="description text-center mb-4" style="font-size: 16px; color: #6c757d;">
        점검이 수행되어야 하는 점검 날짜 또는 기간과 점검 횟수를 선택해주세요. 점검 빈도를 자세하게 설정할수록 시설의 점검 현황 여부를 더 정확히 파악할 수 있습니다.
    </div>
    
    
                            <div class="dropdown-container">
                                <label for="checkFrequency" class="dropdown-label">언제 점검하나요?</label>
                                <div class="custom-dropdown">
                                    <select id="checkFrequency" name="checkFrequency">
                                        <option value="${SecurityFacilityVO.checkFrequency}" <c:if test="${SecurityFacilityVO.checkFrequency == '특정 점검 빈도 없음'}">selected</c:if>>특정 점검 빈도 없음</option>
                                        <option value="일별" <c:if test="${SecurityFacilityVO.checkFrequency == '일별'}">selected</c:if>>일별</option>
                                        <option value="주별" <c:if test="${SecurityFacilityVO.checkFrequency == '주별'}">selected</c:if>>주별</option>
                                        <option value="월별" <c:if test="${SecurityFacilityVO.checkFrequency == '월별'}">selected</c:if>>월별</option>
                                    </select>
                                </div>
                                <div class="notice">*점검 빈도가 특정 점검 빈도 없음으로 설정된 경우 특정 날짜에 점검이 배정되지 않아, 점검 현황 여부를 판단할 수 없습니다.</div>
                            </div>

                            <div class="footer">
                                점검항목 <span>*점검 항목은 반드시 한 개 이상 등록해주세요.</span>
                            </div>
                        </div>

                        <!-- 체크리스트 항목 입력란 -->
                        <div class="checklist-container">
                            <div class="form-group checklist-item">
                                <textarea class="form-control textarea-box" name="checkItems1" id="checkItems1" placeholder="점검 내용을 입력하세요">${SecurityFacilityVO.checkItems1}</textarea>
                            </div>
                            <div class="form-group checklist-item d-none"> <!-- 숨겨진 상태 -->
                                <textarea class="form-control textarea-box" name="checkItems2" id="checkItems2" placeholder="점검 내용을 입력하세요"></textarea>
                            </div>
                            <div class="form-group checklist-item d-none"> <!-- 숨겨진 상태 -->
                                <textarea class="form-control textarea-box" name="checkItems3" id="checkItems3" placeholder="점검 내용을 입력하세요"></textarea>
                            </div>
                            <div class="form-group checklist-item d-none"> <!-- 숨겨진 상태 -->
                                <textarea class="form-control textarea-box" name="checkItems4" id="checkItems4" placeholder="점검 내용을 입력하세요"></textarea>
                            </div>
                            <div class="form-group checklist-item d-none"> <!-- 숨겨진 상태 -->
                                <textarea class="form-control textarea-box" name="checkItems5" id="checkItems5" placeholder="점검 내용을 입력하세요"></textarea>
                            </div>
                        </div>
                        
                        <sec:csrfInput />

                        <!-- 항목 추가 버튼 -->
						<div class="text-right">
						    <button type="button" class="btn btn-primary ml-3 btn-add-item" style="background-color: #1890FF; border-color: #1890FF; width: 90px;">항목 추가</button>
						</div>
						
						<!-- 제출 및 목록 버튼 -->
						<div class="card-footer text-center mt-4">
						    <a href="/bp/secCheckList/list" class="btn btn-secondary" style="background-color: #6c757d; border-color: #6c757d ; float: left;">목록</a>
						    <button type="submit" class="btn btn-primary ml-3" style="background-color: #1890FF; border-color: #1890FF; float: right;">저장</button>
						</div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>