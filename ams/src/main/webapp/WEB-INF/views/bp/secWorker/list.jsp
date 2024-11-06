<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/secWorker/list.css">



<!-- Spring Security를 사용해 로그인된 사용자 정보 가져오기 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>


<style>
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
.container {
	margin-top : 20px;
}

.header-title, .header-search {
	background : white;
	display : flex;
	justify-content: space-between;
	align-items : center;
}

/* 페이지 제목 헤더 */
.header-title {
	margin : 10px;
	border : none;
}

/* 검색 헤더 */
.searchFilter {
	padding : 20px;
	border : 1px solid #E8E8E8;
	border-bottom : none;
	border-radius : 10px 10px 0 0;
}

.searchDiv {
	margin-right : 10px;
}

/* 등록 버튼 */
#registerButton {
	background:#1890FF;
	border:none;
	font-size:15px;
	color:white;
	text-align:center;
	line-height:2;
	 border-radius : 5px;
 width: 60px;
 height : 32.5px;
}

/* 검색 기능에서 셀렉트 박스, 검색어 입력 칸 */
.searchFilter, .search-input {
	background:#fff;
	color:#495057;
	border:1px solid #ced4da;
	line-height:1.5;
	font-size: .875rem; 
	border-radius: .2rem; 
	height:calc(1.5em + .5rem + 2px);
}

.search-select {
	width:80px;
}

.search-input {
	width:300px;
}

/* 검색 버튼 */
#searchButton {	
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
}

/* 테이블 영역 */
.table-container {
	padding-left:20px;
	padding-right:20px;
	border:0.5px solid #e4e4e4;
	border-top:none;
	margin-bottom:20px;
	border-radius:0 0 10px 10px;
}

table {
	width:100%;
	border:none;
}

thead {
	background:#e4e4e463; 
	height:35px;
	
	th {
		text-align : center;
	}
}

.table-row {
	height:45px;
	border:0.5px solid #e4e4e4;
	border-top:none;
	border-left:none;
	border-right:none;
	cursor:pointer;
}

/* 페이징 버튼 영역 */
.pagination-footer {
	margin-bottom:20px;
	margin-top:20px;
	border:none;
	background:white;
}


</style>

<script type="text/javascript">
$(function() {
    var memId = "${memVO.memId}";
    console.log("로그인된 사용자 ID: ", memId);

    var data = {"memId": memId};
    console.log("로그인 정보:", data);
});
</script>
<div style="margin-bottom: 5px; display: flex; justify-content: space-between; align-items: center;">
    
    <h4 style="color: black; margin-bottom: 10px; margin-top: 20px;">보안점검 관리 - <span style="color: #B7B7B7;
      font-size: 23px;">작업자</span></h4>
    <!-- 등록 버튼 -->
    <button type="button" onclick="location.href='/bp/secWorker/regist'" class="btn btn-primary" 
    style="background-color: #1890FF; font-size:12px; border: none;">작업자등록</button>
</div>


<div class="searchHeader">
					<div class=" d-flex align-items-center">
						<form  id="search_form" class="ml-auto d-flex align-items-center"
							style="margin-bottom: 15px;">
							<div  class="searchDiv">
								<select id="searchFilter" name="searchFilter" class="selBox">
									<option value="ALL" selected>전체</option>
									<option value="EMP_NM"
										<c:if test="${param.searchFilter == 'EMP_NM'}">selected</c:if>>이름 </option>
									<option value="JBGD_CD"
										<c:if test="${param.searchFilter == 'DEPT_NM'}">selected</c:if>>회사명</option>
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
        <tr style="text-align: center;">
            <th>회사명</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>집 주소</th>
            <th>메일</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="SecurityWorkerVO" items="${securiyWorkerVOList}" varStatus="stat">
            <tr onclick="location.href='/bp/secWorker/detail?memSeq=${SecurityWorkerVO.memSeq}';" style="cursor: pointer; text-align: center;">
                <td>${SecurityWorkerVO.empName}</td> <!-- 업체명 -->
                <td>${SecurityWorkerVO.workerName}</td> <!-- 작업자명 -->
                <td>${SecurityWorkerVO.memTel1}-${SecurityWorkerVO.memTel2}-${SecurityWorkerVO.memTel3}</td> <!-- 작업자 전화번호 -->
                <td>
                    <c:choose>
                        <c:when test="${fn:length(SecurityWorkerVO.memAdd1) > 10}">
                            ${fn:substring(SecurityWorkerVO.memAdd1, 0, 10)}...
                        </c:when>
                        <c:otherwise>
                            ${SecurityWorkerVO.memAdd1}
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${fn:length(SecurityWorkerVO.memAdd2) > 10}">
                            ${fn:substring(SecurityWorkerVO.memAdd2, 0, 10)}...
                        </c:when>
                        <c:otherwise>
                            ${SecurityWorkerVO.memAdd2}
                        </c:otherwise>
                    </c:choose>
                </td> <!-- 주소 -->
                <td>${SecurityWorkerVO.mail}</td> <!-- 메일 -->      
            </tr>
        </c:forEach>
    </tbody>
</table>
    </div>
    <div class="card-footer clearfix">
        ${secWorkerPage.pagingArea}
    </div>

    <sec:csrfInput/>
