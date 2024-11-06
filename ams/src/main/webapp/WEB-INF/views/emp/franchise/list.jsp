<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function() {
	
	console.log("${franchiseVOList}");
	
	$.ajax({
	    url: "/emp/franchise/getContractList",
	    type: "post",
	    beforeSend: function(xhr) {
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    },
	    success: function(result) {	        
	        let html = "";
	        for (let i = 0; i < result.length; i++) {
	            const selected = result[i].deptCd === "${param.contractGubun}" ? "selected" : "";
	            html += "<option value=" + result[i].comDetCd + selected + ">" + result[i].comDetCdCn + "</option>";
	        }
	        $("#contractGubun").html(html);
	    }
	});

	
    $("#selGubun").on("change", function() {
        // 부서 선택 시 contractDiv 표시
        if ($("#selGubun").val() == "contract") {
            $(".contractDiv").show();			// display, "" 처리해도 안 떠서 이렇게 함
        } else {
            // 다른 선택지일 경우 deptDiv 숨김
            $(".contractDiv").css("display", "none");
            $("#contractGubun").val("");
        }
    });
});

</script>
<style>
/* 가장 큰 틀 */
.container {
	margin-top : 20px;
}

.titleHeader, .searchHeader {
	background : white;
	display : flex;
	justify-content : between;
	align-items : center;
}

/* 페이지 제목 헤더 */
.titleHeader {
	margin : 10px;
	border : none;
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

/* 등록 버튼 */
#registBtn {
	background:#6badf4;
	border:none;
	width:60px;
	font-size:15px;
	color:white;
	border-radius:5px;
	height:calc(1.5em + .5rem + 2px);
	text-align:center;
	line-height:2;
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

.contractDiv {
	margin-right : 10px;
}

/* 검색 버튼 */
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
}

/* 테이블 영역 */
.tableDiv {
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

.tableTr {
	height:45px;
	border:0.5px solid #e4e4e4;
	border-top:none;
	border-left:none;
	border-right:none;
	cursor:pointer;
}

/* 필독 스티커 */
.box {
	width:10px;
	height:25px;
	background-color:red;
	border-radius:3px;
	margin:0px;
}

/* 페이징 버튼 영역 */
.franchise-footer {
	margin-bottom:20px;
	margin-top:20px;
	border:none;
	background:white;
}
</style>

<div class="container">
	<div class="titleHeader">
		<h3>
			<span style="color:#B7B7B7;">상업시설 관리 - </span>
	        <span>상업시설 목록</span>
		</h3>
	</div>
	
	 <div class="card-body table-responsive p-0">
            	<div class="searchHeader">            	
	                <div class="ml-auto d-flex align-items-center"> <!-- ml-auto를 추가하여 오른쪽으로 밀기 -->
	                    <form id="searchForm" class="d-flex align-items-center">
	                        <div class="searchDiv">
	                            <select id="selGubun" name="gubun" class="selBox">
	                                <option value="all" selected>전체</option>
	                                <option value="bpNm" <c:if test="${param.gubun=='bpNm'}">selected</c:if>>시설</option>
	                                <option value="rprsvNm" <c:if test="${param.gubun=='rprsvNm'}">selected</c:if>>대표자</option>
	                                <option value="contract" <c:if test="${param.gubun=='contract'}">selected</c:if>>계약상태</option>
	                            </select>
	                        </div>
	                        <div class="contractDiv"
	                        	<c:if test="${param.gubun == 'contract'}">style="display:block;"</c:if>
     							<c:if test="${param.gubun != 'contract'}">style="display:none;"</c:if>
     						>
	                        	<select id="contractGubun" name="contractGubun" class="selBox">
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
	                            <th style="width: 4%;">No</th>
	                            <th style="width: 25%;">상호</th>
	                            <th style="width: 10%;">대표자</th>
	                            <th style="width: 25%;">전화번호</th>
	                            <th style="width: 10%;">구역</th>
	                            <th style="width: 10%;">위치</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <c:forEach var="franchiseVO" items="${franchiseVOList}" varStatus="status">
	                        	
	                        	<tr class='tableTr' onclick="location.href='/emp/franchise/detail?memId=${franchiseVO.memId}'" >
	                                <td style="width: 4%; text-align:center;">${franchiseVO.rnum}</td>
	                                <td style="width: 25%; text-align:left; padding-left:30px;">${franchiseVO.bpVO.bpNm}</td>
	                                <td style="width: 10%; text-align:center;">${franchiseVO.bpVO.bpRprsvNm}</td>
	                                <td style="width: 25%; text-align:center;">${franchiseVO.bpVO.bpTelno}</td>
								    <c:if test="${franchiseVO.frnFloorLocation == null}">
		                                <td style="width: 10%; text-align:center;">
										        <button type="button" class="newSticker" style="width:60px; height:30px; border:none; border-radius:10px; background:pink; color:white;">신규</button>
										</td>
		                                <td style="width: 10%; text-align:center;">
									        <button type="button" class="newSticker" style="width:60px; height:30px; border:none; border-radius:10px; background:pink; color:white;">신규</button>
										</td>
								    </c:if>
								    <c:if test="${franchiseVO.frnFloorLocation != null}">								    	
		                                <td style="width: 10%; text-align:center;">${franchiseVO.frnPosition}</td>
		                                <td style="width: 10%; text-align:center;">${franchiseVO.frnFloor} - ${franchiseVO.frnZoneLocation}</td>
								    </c:if>
	                            </tr>
	                        </c:forEach>
	                    </tbody>
	                </table>
                <div class="franchise-footer" >
                    ${articlePage.pagingArea}
                </div>
                </div>
            </div>
	
</div>