<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/maintenance/detail.css">

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>


<script type="text/javascript">
$(document).ready(function() {
    var content = "${mainTenanceVO.mntncCn}";
    $('#ntcBrdCn').html(content);
});


$(document).ready(function() {
    // 날짜 변환 함수: '241016' -> '2024-10-16'
    function formatDate(dateStr) {
        if (dateStr.length === 6) {
            return '20' + dateStr.substring(0, 2) + '-' + 
                   dateStr.substring(2, 4) + '-' + 
                   dateStr.substring(4, 6);
        }
        return dateStr;
    }

    // 작성날짜와 처리날짜를 변환하여 화면에 표시
    const mntncYmd = formatDate("${mainTenanceVO.mntncYmd}");
    const processingDate = formatDate("${mainTenanceVO.processingDate}");

    $("#mntncYmd").text(mntncYmd);
    $("#processingDate").text(processingDate);
});
</script>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-header text-center">
                    <h4>유지보수 상세</h4>
                </div>

                <div class="card-body">
                    <form action="/emp/maintenance/delete" method="POST">
                        <div class="status-container" >
                            <span class="label">처리상태</span>
                            <span>${mainTenanceVO.mntncRslt}</span>
                        </div>
                        

                       <div class="date-info">
    <div>
        <span class="label">작성날짜</span>
        <span id="mntncYmd"></span>
    </div>
    <div>
        <span class="label">처리날짜</span>
        <span id="processingDate"></span>
    </div>
</div>

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

                        <div class="form-group mt-4" style="height: 300px;">
                            <label for="ntcBrdCn">내용</label>
                            <c:out value="${mainTenanceVO.mntncCn}" escapeXml="false"/>
                        </div>

                        <div style="display: none;">
                            <label>처리결과 :</label>
                            <select name="mntncRslt">
                                <option value="${mainTenanceVO.mntncRslt}">${mainTenanceVO.mntncRslt}</option>
                                <option value="진행중">진행중</option>
                                <option value="조치완료">조치완료</option>
                            </select>
                        </div>

                        <div class="card-header">
                            <input id="mntncCode" type="hidden" value="${mainTenanceVO.mntncCode}">

                            <div id="div1" style="float:right; display:flex;">
                                <c:if test="${mainTenanceVO.userId == memVO.memId || 
                                              (fn:length(memVO.authLinkVOList) > 0 && 
                                               (memVO.authLinkVOList[0].authCode == 'ROLE_ADMIN' || 
                                                (fn:length(memVO.authLinkVOList) > 1 && 
                                                 memVO.authLinkVOList[1].authCode == 'ROLE_FA_MNG')))}">
                                    <input type="hidden" name="mntncCode" value="${mainTenanceVO.mntncCode}">
                                </c:if>
                            </div>

                           <div class="text-center mt-3" style="display: flex; justify-content: space-between;">
    <a href="/emp/maintenance/list" class="btn btn-secondary" style="margin: 5px; background-color:#6c757d">목록</a>
    
    <c:if test="${mainTenanceVO.userId == memVO.memId || 
                  (fn:length(memVO.authLinkVOList) > 0 && 
                   (memVO.authLinkVOList[0].authCode == 'ROLE_ADMIN' || 
                    (fn:length(memVO.authLinkVOList) > 1 && 
                     memVO.authLinkVOList[1].authCode == 'ROLE_FA_MNG')))}">
        <a href="/emp/maintenance/edit?mntncCode=${mainTenanceVO.mntncCode}">
            <button type="button" id="mntBtn" class="btn btn-primary" style="margin: 5px;background-color:#1890FF">수정</button>
        </a>
    </c:if>
</div>
                        </div>
                        <sec:csrfInput/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>