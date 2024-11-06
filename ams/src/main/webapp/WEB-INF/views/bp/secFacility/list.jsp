<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

 <link rel="stylesheet" type="text/css" href="/resources/css/secFacility/list.css">

<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>



<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>



<script type="text/javascript">
$(function() {
    var memId = "${memVO.memId}";
    console.log("로그인된 사용자 ID: ", memId);
});

function handlePatrolClick(securityFacCd) {
    var patrolUrl = "/bp/secCom/securityPatrol?securityFacCd=" + encodeURIComponent(securityFacCd);
    window.location.href = patrolUrl;
}
</script>

<!-- 업체 리스트 영역 -->
<div style="display: flex; justify-content: space-between; align-items: center; margin: 15px 0;">
    <h4 style="color: black;">업체 - <span style="color: #B7B7B7; font-size: 23px;">보안점검 관리</span></h4>
    <button type="button" onclick="location.href='/bp/secFacility/regist'" 
            class="btn btn-primary" style="margin-left: 5px; background-color:#1890FF;">업체등록</button>
</div>

<table class="table table-hover text-nowrap" style="margin-top: 10px; margin-bottom:70px;">
    <thead>
        <tr>
            <th>업체명</th>
            <th>대표명</th>
            <th>회사 전화번호</th>
            <th>주소</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="SecurityCompanyVO" items="${securityCompanyVOList}" varStatus="stat">
            <tr onclick="location.href='/bp/secFacility/detail?facId=${SecurityCompanyVO.facId}';" style="cursor: pointer;">
                <td>${SecurityCompanyVO.empName}</td>
                <td>${SecurityCompanyVO.expName}</td>
                <td>${SecurityCompanyVO.empTel1}-${SecurityCompanyVO.empTel2}-${SecurityCompanyVO.empTel3}</td>
                <td>${SecurityCompanyVO.empAdd1} ${SecurityCompanyVO.empAdd2}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- 시설 리스트 영역 -->
<div style="display: flex; justify-content: space-between; align-items: center; margin: 15px 0;">
    <h4 style="color: black;">시설 - <span style="color: #B7B7B7; font-size: 23px;">보안점검 관리</span></h4>
    <button type="button" onclick="location.href='/bp/secCompany/regist'" 
            class="btn btn-primary" style="margin-left: 5px; background-color:#1890FF;">시설등록</button>
</div>

<table class="table table-hover text-nowrap">
    <thead>
        <tr>
            <th>시설명</th>
            <th>총 누적 점검</th>
            <th>점검표 명</th>
            <th>최근 점검시간</th>
            <th>점검시작</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="SecurityFacilityVO" items="${securityFacilityVOList}" varStatus="stat">
            <tr onclick="openModal('${SecurityFacilityVO.securityFacName}', '${SecurityFacilityVO.totalcumcheck}', 
                                   '${SecurityFacilityVO.latestinspectiondt}', '${SecurityFacilityVO.checklistName}');">
                <td>${SecurityFacilityVO.securityFacName}</td>
                <td>${SecurityFacilityVO.totalcumcheck}</td>
                <td>${SecurityFacilityVO.checklistName}</td>
                <td>
                    <fmt:formatDate value="${SecurityFacilityVO.latestinspectiondt}" pattern="yyyy-MM-dd HH:mm" />
                </td>
                <td>
                    <button type="button" class="btn btn-primary"  style="background-color:#1890FF;"
                            onclick="handlePatrolClick('${SecurityFacilityVO.securityFacCd}')">순찰</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="card-footer clearfix">
    ${securityFacilityPage.pagingArea}
</div>