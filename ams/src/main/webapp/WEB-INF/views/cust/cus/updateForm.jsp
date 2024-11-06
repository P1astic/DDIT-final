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
<body class="typeSub">





	<div id="contents">


		<div id="contTabFix">
			<ul class="tabList tab02">



				<li><a
					href="/gimpo/cms/frCon/index.do?MENU_ID=1800&CONTENTS_NO=1">이용안내
						및 등록</a></li>




				<li><a
					href="/gimpo/cms/frCon/index.do?MENU_ID=1800&CONTENTS_NO=2"
					title="선택됨" class="on">나의 고객의 소리</a></li>


			</ul>
		</div>




		<article>





			<script type="text/javascript">
console.log("A1101");
console.log("4");
console.log("ko");
$(function(){
	var pdata = {
		currentPageNo : 1,
		totalRecordCount : ,
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

</script>

			<div class="voc-wrap Noto">
				<form name="listForm" id="listForm" method="post"
					action="/gimpo/cms/frCon/index.do">
					<input type="hidden" name="MENU_ID" value="1800" /> <input
						type="hidden" name="CONTENTS_NO" value="2" /> <input
						type="hidden" name="currentPage" value="1" /> <input
						type="hidden" name="vocCd" value="1" />
					<!-- 리스트 옵션(셀렉트2개) -->
					<div class="BBS_option">
						<!-- 검색 -->
						<fieldset class="searchBox">
							<select class="inp_s" name="searchKey">
								<option value="1000">제목</option>
								<option value="2000">내용</option>
								<option value="7000">제목+내용</option>
							</select>
							<div class="search">
								<input type="text" class="inp_t" name="searchVal" value=""
									placeholder="검색어를 입력하세요." />
								<button class="btn_search" onclick="linkPage(1);">검색</button>
							</div>
						</fieldset>
						<!-- //검색 -->
					</div>
					<!-- //리스트 옵션(셀렉트2개) -->
				</form>
				<div class="lineList_tb typeSort">
					<table>
						<caption>
							<p>번호,제목,고객명,등록일,처리상태,답변일,담당부서,조회수 순으로 확인하실 수 있는 표</p>
						</caption>
						<colgroup>
							<col style="width: 7%" />
							<col style="width: *" />
							<col style="width: 80px" />
							<col style="width: 100px" />
							<col style="width: 90px" />
							<col style="width: 100px" />

							<col style="width: 12%" />

							<col style="width: 9%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="headNum">번호</th>
								<th scope="col" class="headTxt">제목</th>
								<th scope="col" class="headWriter">고객명</th>
								<th scope="col" class="headDate">등록일</th>
								<th scope="col" class="headWriter">처리상태</th>
								<th scope="col" class="headDate">답변일</th>

								<th scope="col" class="headWriter">담당부서</th>

								<th scope="col" class="headView">조회수</th>
							</tr>
						</thead>
						<tbody>

							<tr class="typeNoArticle">

								<td colspan="8">


									<p class="no_article">등록된 게시물이 없습니다.</p>
								</td>
							</tr>


						</tbody>
					</table>
				</div>

				<!-- 페이징 -->
				<div class="pagination"></div>
				<!-- //페이징 -->

				<!-- 버튼 -->
				<div class="btnAreaR">
					<a href="/gimpo/cms/frVocCon/vocWrite.do?MENU_ID=1800&vocCd=1"
						class="btnC"><span>등록하기</span></a>
				</div>
				<!-- //버튼 -->
			</div>



			<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-74304977-1', 'auto');
  ga('send', 'pageview');
</script>
		</article>
	</div>

</body>


