<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/approv/myPaymentList.css">
<sec:authorize access="isAuthenticated()">
	<%-- 		<sec:authentication property="principal.memberVO" /> --%>
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<script>

$(document).ready(function(){
	
	
	
});

</script>
		<div id="title-box">
			<div class="title-txt">전자결재</div>
			<div class="title-txt">-</div>
			<div class="title-txt">결재문서</div>
			<div class="title-txt">-</div>
			<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">결재 완료문서</div>
	</div>
<div class="container" style="border: 1px solid #d5d0d0; border-radius: 15px;">
<div class="card">
	<div class="card-header" style="background-color: white">
<%-- 	<p>${elecApvVOList}</p> --%>
		<div class="ml-auto d-flex align-items-center" style="justify-content: flex-end;"> 
                    <form id="searchForm" class="d-flex align-items-center" style="margin-bottom: 0;">
                        <div class="input-group input-group-sm" style="margin-right: 17px; width: 150px;">
                            <select id="selGubun" name="gubun" class="form-control">
                                <option value="all" selected>전체</option>
                                <option value="title" <c:if test="${param.gubun=='title'}">selected</c:if>>제목</option>
                                <option value="author" <c:if test="${param.gubun=='author'}">selected</c:if>>작성자명</option>
                            </select>
                        </div>
                        <div class="input-group input-group-sm" style="margin-right: 10px;">
                            <input type="text" id="keyword" name="keyword" placeholder="검색어 입력" value="${param.keyword}" class="form-control"/>
	                        <button type="submit" class="btn btn-default" style="display: flex; justify-content: center; width:33px; font-size:10px; background: white;
    border: 1px solid #d5d0d0;">
	                        <img src="/resources/images/icon/searchBtn.png" style="height: 14px; width: 20px; line-height:1.5; margin-bottom:3px;">	
	                        </button>
                        </div>
                    </form>
                </div>
	</div>

	<div class="card-body table-responsive p-0">
		<table class="table table-hover text-nowrap">
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
			<!-- && fn:contains(elecApvVO.apvDetailVO.apvIds, memVO.memId) || elecApvVO.elecApvStat.equals('H4') -->
			<tbody>
			 <c:forEach var="elecApvVO" items="${elecApvVOList}" varStatus="stat">
				<c:if test="${fn:contains(elecApvVO.apvDetailVO.apvIds, memVO.memId) && elecApvVO.elecApvStat.equals('H3') || elecApvVO.elecApvStat.equals('H4')}">
				<tr onclick="location.href='/elecApv/paymentDetail?elecApvNo=${elecApvVO.elecApvNo}'" >
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
		<div class="card-footer clearfix" style="display: flex; justify-content: center; background-color: white">
       		${articlePage.pagingArea}
        </div>
	</div>
</div>
</div>