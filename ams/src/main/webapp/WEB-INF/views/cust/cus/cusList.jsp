<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/cusList.css">

<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/voc.css">

<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/v2.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/v1.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/layout.css">



<body class="typeSub">
	<div id="contents">
		<div id="contTabFix">
			<ul class="tabList tab02">
				<li onclick="moveToMain()"><a>이용안내 및 등록</a></li>
				<li><a
					href="cust/cus/cusList?custBrdNm=${custBoardVO.custBrdNm}&custBrdMbiph=${custBoardVO.custBrdMbiph}"
					title="선택됨" class="on">나의 고객의 소리</a></li>
			</ul>
		</div>
		<article>

			<div class="voc-wrap Noto">
				<div class="lineList_tb typeSort">
					<table>
						<colgroup>
							<col style="width: 10%" />
							<col style="width: 40%" />
							<col style="width: 10%" />
							<col style="width: 15%" />
							<col style="width: 15%" />
							<col style="width: 10%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="headNum"">No</th>
								<th scope="col" class="headTxt" >제목</th>
								<th scope="col" class="headWriter">고객명</th>
								<th scope="col" class="headDate">등록일</th>
								<th scope="col" class="headStatus">처리상태</th>
								<th scope="col" class="headDownNum">답변일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="custBoardVO" items="${custBoardVOList}"	varStatus="status">
								<tr class='typeNoArticle' onclick="location.href='/cust/cus/detail?custBrdNo=${custBoardVO.custBrdNo}'"	style="cursor: pointer;">
									<td class="headNum" style="text-align:center;">${custBoardVO.custBrdNo}</td>
									<td class="headTxt" style="text-align:left; padding-left:40px;">${custBoardVO.custBrdTtl}</td>
									<td style="text-align: center;">${custBoardVO.custBrdNm}</td>
									<td>
										 <fmt:formatDate value="${custBoardVO.custBrdRegYmd}" pattern="yyyy-MM-dd"/>
									</td>
									<td style="text-align: center;">${custBoardVO.custBrdAnsYn}</td>
									<td style="text-align: center;">${custBoardVO.custBrdAnsYmd}</td>
								</tr>
							</c:forEach>
							<c:if test="${empty custBoardVOList}">
								<tr class="typeNoArticle">
									<td colspan="6">
										<p class="no_article">등록된 게시물이 없습니다.</p>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>

				<!-- 버튼 -->
				<div class="btnAreaR">
					<a href="/cust/cus/cusForm?name=${name}&phone=${phone}"
						class="btnC"> <span>등록하기</span>
					</a>
				</div>
			</div>
		</article>
	</div>
</body>
<script type="text/javascript">
console.log("A1101");
console.log("4");
console.log("ko");
$(function(){
	var pdata = {
		currentPageNo : 1,
		totalRecordCount : 1,
		recordCountPerPage : 10,
		jsFunction : 'listPage'
	}
	ajaxPaging(pdata);
	
});

function ajaxPaging(data){
	$.ajax({
        url: "/bvs/pagingF.do",
        data : {
            currentPageNo : data.currentPageNo,
            totalRecordCount : data.totalRecordCount,
            recordCountPerPage : data.recordCountPerPage,
            paginationJsFunction : data.jsFunction
        },
        type : "POST",
        success : function(data) {
        	$('.pagination').html(data);
        }
    });
}

function linkPage(pageNo){
	$('#listForm input[name=currentPage]').val(pageNo);
	document.listForm.submit();
}

function moveToMain(){
	window.location.href="/cust/cus/main";
}
</script>


