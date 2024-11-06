<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/approv/myPaymentList.css">
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<script>


</script>

	<div id="title-box">
			<div class="title-txt">전자결재</div>
			<div class="title-txt">-</div>
			<div class="title-txt">기안문서</div>
			<div class="title-txt">-</div>
			<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">나의 기안함</div>
	</div>
<div class="container" style="border: 1px solid #d5d0d0; border-radius: 15px;">
	<div class="card-header">
<%-- 	<p>${elecApvVOList}</p> --%>
		<div class="filter-box" style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 20px;">
            <form id="searchForm" class="date-box">
            	<input type="date" name="startDate" value="${param.startDate}" class="date-box"> ~ 
    			<input type="date" name="endDate" value="${param.endDate}" class="date-box">
                <div class="search-box" style="margin-right: 10px;">
                    <select id="selGubun" name="gubun" class="date-box" style="border: 1px solid #aaaab1; border-radius: 5px; margin-left: 15px;">
                        <option value="all" selected class="date-box">전체</option>
                        <option value="title" <c:if test="${param.gubun=='title'}">selected</c:if>>제목</option>
                        <option value="author" <c:if test="${param.gubun=='author'}">selected</c:if>>작성자명</option>
                    </select>
                </div>
                <div class="date-box">
                    <input type="text" id="keyword" name="keyword" placeholder="검색어 입력" value="${param.keyword}" class="date-box"/>
	                <button type="submit" class="date-box" style="display: flex; justify-content: center; width: 41px; font-size: 12px; border: 0.8px solid #e4e4e4; color : #e4e4e4; background-color: white;">
	                <img src="/resources/images/icon/searchBtn.png" style="height: 20px; width: 20px; line-height:1.5; margin-bottom:3px;">
	                </button>
                </div>
            </form>
        </div>
	</div>

	<div>
		<table>
			<thead>
				<tr>
					<th>NO</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>결재상태</th>
					<th>기안일자</th>
					<th>최종결재일자</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach var="elecApvVO" items="${elecApvVOList}" varStatus="stat">
				<c:if test="${memVO.memId.equals(elecApvVO.memId)}">
				<tr onclick="location.href='/elecApv/paymentDetail?elecApvNo=${elecApvVO.elecApvNo}&memId=${elecApvVO.memId}'" >
					<td>${stat.index+1}</td>
					<td>${elecApvVO.elecApvTitle}</td>
					<td>${elecApvVO.employeeVO.empNm}</td>
					<td>${elecApvVO.commonCodeDetailVO.comDetCdCn}</td>
					<td>${elecApvVO.elecApvRegDate}</td>
					<td>${elecApvVO.elecApvLastAtrzYmd}</td>
				</tr>
  				</c:if>
  			</c:forEach>
			</tbody>
		</table>
		<div style="display: flex; justify-content: center;">
       		${articlePage.pagingArea}
        </div>
	</div>
</div>

