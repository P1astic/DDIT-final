<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/secCheckList/list.css">


<!-- Spring Security를 사용해 로그인된 사용자 정보 가져오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<style>
    /* 기존 스타일 유지 */
    .searchHeader {
        padding: 20px;
        border: 1px solid #E8E8E8;
        border-bottom: none;
        border-radius: 10px 10px 0 0;
    }

    .search-container {
        display: flex;
        justify-content: flex-end; /* 검색 필드를 우측으로 정렬 */
        align-items: center;
        margin-bottom: 10px;
    }

    .search-container select,
    .search-container input {
        margin-right: 10px;
        width: 120px; /* 입력 필드의 너비 조정 */
    }

    .search-container button {
        height: 39px;
        width: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* 점검표 등록 버튼 스타일 추가 */
    .btn-primary {
        border-radius : 5px;
		 background-color:#1890FF;
		 width: 100px;
		 height : 32.5px;
		 font-size: 13px;
    }

    /* 점검표 제목 스타일 조정 */
    .title-header {
        display: flex;
        align-items: center;
        justify-content: space-between; /* 제목과 버튼 사이 공간 확보 */
        margin-bottom: 5px;
    }

    /* 점검표 제목 스타일 */
    .title-header h4 {
        margin: 20px 0 5px 0;
    }
    
    
    /* 검색 헤더 */
.searchHeader {
	padding : 20px;
	border : 1px solid #E8E8E8;
	border-bottom : none;
	border-radius : 10px 10px 0 0;
}

.searchDiv {
	margin-right : 10px;
}

/* 검색 기능에서 셀렉트 박스, 검색어 입력 칸 */
.selBox, .searchBox {
	background:#fff;
	color:#495057;
	border:1px solid #ced4da;
	line-height:1.5;
	font-size: .875rem; 
	border-radius: .2rem; 
	height:calc(1.5em + .5rem + 2px);
}

.selBox {
	width:80px;
}

.searchBox {
	width:300px;
}
#searchSubmitBtn {
	background:none; 
	height:31px; 
	border:1px solid #ced4da; 
	border-radius: 0 .2rem .2rem 0; /* 좌측상단 우측상단 우측하단 좌측하단 순 */
	border-left : none;
	
	img {
		height: 20px;
		width: 20px;
		line-height:1.5;
		margin-bottom:3px;
	}
</style>

<script type="text/javascript">
$(function() {
    var memId = "${memVO.memId}";
    console.log("로그인된 사용자 ID: ", memId);

    var data = { "memId": memId };
    console.log("로그인 정보:", data);
});
</script>

<!-- 점검표 제목 -->
<div class="title-header">
    <h4 style="color: black;">보안점검 관리 - <span style="color: #B7B7B7; font-size: 23px;">점검표</span></h4>
    <!-- 등록 버튼 -->
    <button type="button" onclick="location.href='/bp/secCheckList/regist'" class="btn btn-primary">점검표등록</button>
</div>

				<div class="searchHeader">
					<div class=" d-flex align-items-center">
						<form  id="search_form" class="ml-auto d-flex align-items-center"
							style="margin-bottom: 15px;">
							<div  class="searchDiv">
								<select id="searchFilter" name="searchFilter" class="selBox">
									<option value="ALL" selected>전체</option>
									<option value="EMP_NM"
										<c:if test="${param.searchFilter == 'EMP_NM'}">selected</c:if>>점검표 명 </option>
									<option value="JBGD_CD"
										<c:if test="${param.searchFilter == 'DEPT_NM'}">selected</c:if>>점검빈도</option>
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
				

<table class="table table-hover text-nowrap">
    <thead>
        <tr style="text-align: center; background-color: #f8f9fa;">
            <th>점검표 명</th>
            <th>점검 빈도</th>
            <th>점검 항목</th>
            <th>등록일</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="SecurityChecklistVO" items="${secCheckListVOList}" varStatus="stat">
            <tr onclick="location.href='/bp/secCheckList/detail?checklistSeq=${SecurityChecklistVO.checklistSeq}';" style="cursor: pointer; text-align: center;">
                <td>${SecurityChecklistVO.checklistName}</td>
                <td>${SecurityChecklistVO.checkFrequency}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty SecurityChecklistVO.checkItems1 || not empty SecurityChecklistVO.checkItems2 || not empty SecurityChecklistVO.checkItems3 || not empty SecurityChecklistVO.checkItems4 || not empty SecurityChecklistVO.checkItems5}">
                            <c:set var="displayCount" value="0"/>
                            <c:if test="${not empty SecurityChecklistVO.checkItems1}">
                                ${SecurityChecklistVO.checkItems1}<br />
                                <c:set var="displayCount" value="${displayCount + 1}"/>
                            </c:if>
                            <c:if test="${not empty SecurityChecklistVO.checkItems2 && displayCount < 2}">
                                ${SecurityChecklistVO.checkItems2}<br />
                                <c:set var="displayCount" value="${displayCount + 1}"/>
                            </c:if>
                            <c:if test="${not empty SecurityChecklistVO.checkItems3 && displayCount < 2}">
                                ${SecurityChecklistVO.checkItems3}<br />
                                <c:set var="displayCount" value="${displayCount + 1}"/>
                            </c:if>
                            <c:if test="${displayCount >= 2}">
                                ...
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            없음
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <fmt:formatDate value="${SecurityChecklistVO.createDt}" pattern="yyyy/MM/dd"/>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>


<div class="card-footer clearfix">
    ${secCheckListPage.pagingArea}
</div>

<sec:csrfInput/>

