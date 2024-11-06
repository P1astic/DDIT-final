<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<script
	src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"	href="/resources/css/maintenance/list.css">

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script type="text/javascript">
$(function() {
    var memId = "${memVO.memId}";
    console.log("로그인된 사용자 ID:", memId);
});
</script>



<div class="row">
	<div class="col-12">
		<div class="container">
			<div class="titleHeader">
				<h3 class="card-title" style="font-size: 1.5rem; margin: 20px 0;">
					유지보수리스트 <span style="color: #B7B7B7; font-size: 1.2rem;">-
						유지보수 관리</span>
				</h3>
				<div class="ml-auto d-flex align-items-center">
					<a id="registBtn" href="/emp/maintenance/regist">등록</a>
				</div>
			</div>
			<!-- card-header 끝 -->

			<div class="card-body table-responsive p-0">
				<div class="searchHeader">
					<div class="ml-auto d-flex align-items-center">
						<form id="search_form" class="d-flex align-items-center"
							style="margin-bottom: 0;">
							<div class="searchDiv">
								<select id="searchFilter" name="searchFilter" class="selBox">
									<option value="ALL" selected>전체</option>
									<option value="EMP_NM"
										<c:if test="${param.searchFilter == 'EMP_NM'}">selected</c:if>>신청자</option>
									<option value="JBGD_CD"
										<c:if test="${param.searchFilter == 'DEPT_NM'}">selected</c:if>>부서</option>
									<option value="MNTNC_RSLT"
										<c:if test="${param.searchFilter == 'MNTNC_RSLT'}">selected</c:if>>처리결과</option>
								</select>
							</div>
							<div>
								<input type="text" name="table_search" class="searchBox"
									placeholder="검색어 입력" value="${param.table_search}" />
							</div>
							<button type="submit" id="searchSubmitBtn">
								<img src="/resources/images/icon/searchBtn.png">
							</button>
						</form>
					</div>
				</div>

				<div class="tableDiv">
					<table>
						<thead>
							<tr>
								<th style="width: 15%; text-align:center;">NO</th>
								<th style="width: 40%; text-align:center;">보수내용</th>
								<th style="width: 15%; text-align:center;">신청자</th>
								<th style="width: 15%; text-align:center;">부서</th>
								<th style="width: 15%; text-align:center;">처리결과</th>
							</tr>
						</thead>
<tbody>
        <c:forEach var="MainTenanceVO" items="${mainTenanceVOList}" varStatus="status">
        <tr class='MaintenTR' onclick="location.href='/emp/maintenance/detail?mntncCode=${MainTenanceVO.MNTNC_CODE}'">
            <td style="width: 10%; margin-right:20px; text-align:center;">
                ${(currentPage-1) * itemsPerPage + status.count}
            </td>
            <td style="width: 40%; text-align:left;">
                <c:choose>
                    <c:when test="${fn:length(MainTenanceVO.MNTNC_CN) > 10}">
                        ${fn:substring(MainTenanceVO.MNTNC_CN, 0, 10)}...
                    </c:when>
                    <c:otherwise>${MainTenanceVO.MNTNC_CN}</c:otherwise>
                </c:choose>
            </td>
            <td style="width: 15%; text-align:center;">${MainTenanceVO.EMP_NM}</td>
            <td style="width: 15%; text-align:center;">${MainTenanceVO.DEPT_NM}</td>
            <td style="width: 15%; text-align:center;">${MainTenanceVO.MNTNC_RSLT}</td>
        </tr>
    </c:forEach>
</tbody>
					</table>
				</div>

				<div class="board-footer">${maintenancePage.pagingArea}</div>
			</div>
		</div>
	</div>
</div>

<sec:csrfInput />