<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/secCheckList/detail.css">

<!-- Spring Security를 사용해 로그인된 사용자 정보 가져오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<div class="container" style="background-color: #f8f9fa;"> <!-- 배경색 추가 -->
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h4>점검표 상세보기</h4>
                </div>
                <div class="card-body">
                    <form action="/bp/secWorker/secWorkerDetail" method="get">
                        <input type="hidden" id="checklistSeq" name="checklistSeq" value="${securityChecklistVO.checklistSeq}" />
                        <input type="hidden" name="userId" value="${memVO.memId}" />

                        <!-- 점검표명, 회사명 -->
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <label for="checklistName" class="col-form-label">점검표 명</label>
                                <input type="text" class="form-control" id="checklistName" name="checklistName" 
                                       value="${securityChecklistVO.checklistName}" readonly>
                            </div>
<div class="col-sm-4">
    <label for="empName" class="col-form-label">회사코드</label>
    <input type="hidden" id="empName" name="empName" value="${securityChecklistVO.empName}" />
    <input type="text" class="form-control" value="${securityChecklistVO.empName}" readonly />
</div>
                        </div>

                        <!-- 점검 빈도 설정 -->
                      <div class="container mt-4">
    <div class="title text-center mb-3" style="font-size: 24px; font-weight: bold; color: #343a40;">점검 빈도</div>
    <div class="description text-center mb-4" style="font-size: 16px; color: #6c757d;">
        점검이 수행되어야 하는 점검 날짜 또는 기간과 점검 횟수를 선택해주세요. 점검 빈도를 자세하게 설정할수록 시설의 점검 현황 여부를 더 정확히 파악할 수 있습니다.
    </div>
                            <div class="dropdown-container">
                                <label for="checkFrequency" class="dropdown-label">언제 점검하나요?</label>
                                <div class="custom-dropdown">
                                    <select id="checkFrequency" name="checkFrequency" disabled>
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

                        <!-- 체크리스트 항목 입력란 -->
						      <div class="checklist-container">
						    <c:if test="${not empty securityChecklistVO.checkItems1}">
						        <div class="form-group checklist-item">
						            <textarea class="form-control textarea-box" name="checkItems1" id="checkItems1" readonly>${securityChecklistVO.checkItems1}</textarea>
						        </div>
						    </c:if>
						    <c:if test="${not empty securityChecklistVO.checkItems2}">
						        <div class="form-group checklist-item">
						            <textarea class="form-control textarea-box" name="checkItems2" id="checkItems2" readonly>${securityChecklistVO.checkItems2}</textarea>
						        </div>
						    </c:if>
						    <c:if test="${not empty securityChecklistVO.checkItems3}">
						        <div class="form-group checklist-item">
						            <textarea class="form-control textarea-box" name="checkItems3" id="checkItems3" readonly>${securityChecklistVO.checkItems3}</textarea>
						        </div>
						    </c:if>
						    <c:if test="${not empty securityChecklistVO.checkItems4}">
						        <div class="form-group checklist-item">
						            <textarea class="form-control textarea-box" name="checkItems4" id="checkItems4" readonly>${securityChecklistVO.checkItems4}</textarea>
						        </div>
						    </c:if>
						    <c:if test="${not empty securityChecklistVO.checkItems5}">
						        <div class="form-group checklist-item">
						            <textarea class="form-control textarea-box" name="checkItems5" id="checkItems5" readonly>${securityChecklistVO.checkItems5}</textarea>
						        </div>
						    </c:if>
						</div>

                        <sec:csrfInput />

                        <!-- 제출 및 목록 버튼 -->
					<div class="card-footer text-center mt-4">
					    <a href="/bp/secCheckList/list" class="btn btn-secondary" style="background-color: #6c757d; float: left; border-color: #6c757d; color: white;">목록</a>
					    <a href="/bp/secCheckList/edit?checklistSeq=${securityChecklistVO.checklistSeq}" style="color: white;  text-decoration: none; margin-left: 20px;"> <!-- 간격을 넓히기 위해 margin-left 추가 -->
					        <button type="button" id="mntBtn" class="btn btn-primary" style="background-color: #1890FF; float: right; border-color: #1890FF;">수정</button>
					    </a>
					</div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>