<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board/list.css">
<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<div class="row" style="font-family:Pretendard;">
    <div class="col-12">
        <div class="container">
            <div class="titleHeader">
                <span class="pageTitle" style="font-size:20px; font-weight: 600; word-wrap: break-word;">공지사항</span>
                <div class="ml-auto d-flex align-items-center">
	                <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_ADMIN") || memVO.authLinkVOList[0].authCode.equals("ROLE_FA_MNG")}'>
		                        <a id="registBtn" href="/emp/board/regist">등록</a>
		            </c:if>
	            </div>
            </div> <!-- card-header 끝 -->
            <div class="card-body table-responsive p-0">
            	<div class="searchHeader">            	
	                <div class="ml-auto d-flex align-items-center"> <!-- ml-auto를 추가하여 오른쪽으로 밀기 -->
	                    <form id="searchForm" class="d-flex align-items-center">
	                        <div class="searchDiv">
	                            <select id="selGubun" name="gubun" class="selBox _input">
	                                <option value="all" selected>전체</option>
	                                <option value="title" <c:if test="${param.gubun=='title'}">selected</c:if>>제목</option>
	                                <option value="content" <c:if test="${param.gubun=='content'}">selected</c:if>>내용</option>
	                                <option value="author" <c:if test="${param.gubun=='author'}">selected</c:if>>작성자명</option>
	                                <option value="dept" <c:if test="${param.gubun=='dept'}">selected</c:if>>부서</option>
	                            </select>
	                        </div>
	                        <div class="deptDiv"
	                        	<c:if test="${param.gubun == 'dept'}">style="display:block;"</c:if>
     							<c:if test="${param.gubun != 'dept'}">style="display:none;"</c:if>
     						>
	                        	<select id="deptGubun" name="deptGubun" class="selBox">
	                        		<option value="" selected disabled>선택</option>
	                        		
	                        	</select>
	                        </div>
	                        <div>
	                            <input type="text" id="keyword" name="keyword" placeholder="검색어 입력" value="${param.keyword}" class="searchBox"/>
	                        </div>
	                        <button id="searchSubmitBtn" type="submit">
	                        	<img src="/resources/images/icon/searchBtn.png">
	                        </button>
	                    </form>
	                    
	                </div>
            	</div>
            	<div class="tableDiv">
	                <table>
	                    <thead>
	                        <tr>
	                            <th style="width: 4%; text-align:center;">No</th>
	                            <th style="width: 60%; text-align:center;">제목</th>
	                            <th style="width: 15%; text-align:center;">작성자</th>
	                            <th style="width: 15%; text-align:center;">등록일</th>
	                        </tr>
	                    </thead>
	                    <tbody>
						    <c:set var="rnum" value="1" /> <!-- RNUM 초기값 설정 -->

							<c:forEach var="boardVO" items="${boardVOList}">
							    <tr class='boardTR' onclick="location.href='/emp/board/detail?ntcBrdNo=${boardVO.ntcBrdNo}'">
							        <td style="width: 4%; text-align:center;">
							            <c:if test='${boardVO.ntcBrdType.equals("O1")}'>
							                <img src="/resources/images/icon/pin.png" alt="필독" style="width:25px; height:25px;" />
							            </c:if>
							            <c:if test='${!boardVO.ntcBrdType.equals("O1")}'>
							                ${rnum} <!-- RNUM 출력 -->
							                <c:set var="rnum" value="${rnum + 1}" /> <!-- RNUM 증가 -->
							            </c:if>
							        </td>
							        <td style="width: 60%; text-align:left; padding-left:30px;">${boardVO.ntcBrdTtl}</td>
							        <td style="width: 15%; text-align:center;">${boardVO.empNm}</td>
							        <td style="width: 15%; text-align:center;">${boardVO.ntcBrdRegYmd}</td>
							    </tr>
							</c:forEach>

						</tbody>

	                </table>
                <div class="board-footer" >
                    ${articlePage.pagingArea}
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$(function() {
	
	$.ajax({
	    url: "/emp/board/getDeptList",
	    type: "post",
	    beforeSend: function(xhr) {
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    },
	    success: function(result) {	        
	        let html = "";
	        for (let i = 0; i < result.length; i++) {
	            // 서버에서 전달된 데이터에 selected 여부를 포함시켜야 함
	            if (result[i].deptCd == "C5" || result[i].deptCd == "C6" || result[i].deptCd == "C7") {
	                continue; // 건너뛰기
	            } else {
	                const selected = result[i].deptCd === "${param.deptGubun}" ? "selected" : "";
	                html += "<option value=" + result[i].deptCd + selected + ">" + result[i].deptNm + "</option>";	            	
	            }
	        }
	        $("#deptGubun").html(html);
	    }
	});

	
    $("#selGubun").on("change", function() {
        // 부서 선택 시 deptDiv 표시
        if ($("#selGubun").val() == "dept") {
            $(".deptDiv").show();			// display, "" 처리해도 안 떠서 이렇게 함
        } else {
            // 다른 선택지일 경우 deptDiv 숨김
            $(".deptDiv").css("display", "none");
            $("#deptGubun").val("");
        }
    });
});
</script>
