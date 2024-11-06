<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<style>
btn{
 border-radius : 5px;
 width: 60px;
 height : 32.5px;
}
    }
    
       .btn-custom {
        margin-left: 10px; /* 버튼 간격 설정 */
    }
</style>
<script>
$(function() {	
	$("#btnDel").on("click", function() {
		let checklistSeq = $("#checklistSeq").val();
		console.log("선택한 게시물 번호 : " + checklistSeq);
		
		// 모달을 표시
		$("#deleteModal").modal("show");
		
		// 삭제 버튼 클릭 시
		$("#confirmDel").off("click").on("click", function() {
			// 선택한 게시물 삭제 처리	
			$.ajax({
				url: "/bp/secCheckList/delete",
				type: "post",
				data: { "checklistSeq": checklistSeq },
				beforeSend: function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(result) {
					console.log("result : " + result);
					window.location.href = "/bp/secCheckList/list"; 
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

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<div class="container" style="background-color: #f8f9fa;">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h4>점검표 수정</h4>
                </div>
                <div class="card-body">
                    <form action="/bp/secCheckList/editFrom" method="post">
                        <input type="hidden" id="checklistSeq" name="checklistSeq" value="${securityChecklistVO.checklistSeq}" />
                        <input type="hidden" name="userId" value="${memVO.memId}" />
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <label for="checklistName" class="col-form-label">점검표 명</label>
                                <input type="text" class="form-control" id="checklistName" name="checklistName" 
                                       value="${securityChecklistVO.checklistName}">
                            </div>
                            <div class="col-sm-4">
                                <label for="empName" class="col-form-label">회사코드</label>
                                <input type="text" class="form-control" id="empName" name="empName" 
                                       value="${securityChecklistVO.empName}" readonly>
                            </div>        
                        </div>

                        <div class="container">
                            <div class="title">점검 빈도</div>
                            <div class="description">점검이 수행되어야 하는 점검 날짜 또는 기간과 점검 횟수를 선택해주세요. 점검 빈도를 자세하게 설정할수록 시설의 점검 현황 여부를 더 정확히 파악할 수 있습니다.</div>
                            <div class="dropdown-container">
                                <label for="checkFrequency" class="dropdown-label">언제 점검하나요?</label>
                                <div class="custom-dropdown">
                                    <select id="checkFrequency" name="checkFrequency">
                                        <option value="특정 점검 빈도 없음" <c:if test="${securityChecklistVO.checkFrequency == '특정 점검 빈도 없음'}">selected</c:if>>특정 점검 빈도 없음</option>
                                        <option value="일별" <c:if test="${securityChecklistVO.checkFrequency == '일별'}">selected</c:if>>일별</option>
                                        <option value="주별" <c:if test="${securityChecklistVO.checkFrequency == '주별'}">selected</c:if>>주별</option>
                                        <option value="월별" <c:if test="${securityChecklistVO.checkFrequency == '월별'}">selected</c:if>>월별</option>
                                    </select>
                                </div>
                                <div class="notice">*점검 빈도가 특정 점검 빈도 없음으로 설정된 경우 특정 날짜에 점검이 배정되지 않아, 점검 현황 여부를 판단할 수 없습니다.</div>
                            </div>
                            <div class="footer">
                                점검항목 <span>*점검 항목은 반드시 한 개 이상 등록해주세요.</span>
                            </div>
                        </div>

                        <div class="checklist-container" id="checklistItems">
                            <c:if test="${not empty securityChecklistVO.checkItems1}">
                                <div class="form-group checklist-item">
                                    <label for="checkItems1" class="col-form-label">점검 항목 1</label>
                                    <textarea class="form-control textarea-box" name="checkItems1" id="checkItems1">${securityChecklistVO.checkItems1}</textarea>
                                </div>
                            </c:if>
                            <c:if test="${not empty securityChecklistVO.checkItems2}">
                                <div class="form-group checklist-item">
                                    <label for="checkItems2" class="col-form-label">점검 항목 2</label>
                                    <textarea class="form-control textarea-box" name="checkItems2" id="checkItems2">${securityChecklistVO.checkItems2}</textarea>
                                </div>
                            </c:if>
                            <c:if test="${not empty securityChecklistVO.checkItems3}">
                                <div class="form-group checklist-item">
                                    <label for="checkItems3" class="col-form-label">점검 항목 3</label>
                                    <textarea class="form-control textarea-box" name="checkItems3" id="checkItems3">${securityChecklistVO.checkItems3}</textarea>
                                </div>
                            </c:if>
                            <c:if test="${not empty securityChecklistVO.checkItems4}">
                                <div class="form-group checklist-item">
                                    <label for="checkItems4" class="col-form-label">점검 항목 4</label>
                                    <textarea class="form-control textarea-box" name="checkItems4" id="checkItems4">${securityChecklistVO.checkItems4}</textarea>
                                </div>
                            </c:if>
                            <c:if test="${not empty securityChecklistVO.checkItems5}">
                                <div class="form-group checklist-item">
                                    <label for="checkItems5" class="col-form-label">점검 항목 5</label>
                                    <textarea class="form-control textarea-box" name="checkItems5" id="checkItems5">${securityChecklistVO.checkItems5}</textarea>
                                </div>
                            </c:if>
                        </div>

                        <sec:csrfInput />

						<div class="card-footer text-center mt-4">
						    <a href="/bp/secCheckList/list" class="btn btn-secondary btn-custom" style="background-color: #6c757d; border-color: #6c757d; float: left; color: white;">목록</a>
						    <button type="submit" class="btn btn-primary btn-custom" style="background-color: #1890FF; border-color: #1890FF; float: right; margin-left:10px; color: white;">저장</button>
						    <button type="button" name="btnDel" class="btn btn-danger btn-custom" id="btnDel" style="background-color:  rgba(255, 0, 0,1); float: right; border-color:  rgba(255, 0, 0,1); color: white;">삭제</button>
						</div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 삭제 확인 모달 -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteModalLabel">삭제 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        선택한 점검표를 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-danger" id="confirmDel">삭제</button>
      </div>
    </div>
  </div>
</div>