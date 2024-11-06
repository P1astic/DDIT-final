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

<head>${custBoardVO}
</head>
<p>${searchList.custBoardVO}</p>
<script>
function setHref(obj, org){
	if($(obj).find("> div").length > 0){
		if($(obj).find("> div> ul > li").length > 0){
			if($(obj).find(">a").data("sub")=="Y"){
				$(org).find(">a").attr("href",$(obj).find("> div> ul > li:eq(0) > a").attr("href"));
				$(org).find(">a").attr("target",$(obj).find("> div> ul > li:eq(0) > a").attr("target"));
				
				setHref($(obj).find("> div> ul > li:eq(0)"),org);
			}else{
				$(org).find(">a").attr("href",$(org).find(">a").attr("href"));
			}
		}
	}else{
		if($(obj).find("> ul > li").length > 0){
			if($(obj).find(">a").data("sub")=="Y"){
				$(org).find(">a").attr("href",$(obj).find("> ul > li:eq(0) > a").attr("href"));
				$(org).find(">a").attr("target",$(obj).find("> ul > li:eq(0) > a").attr("target"));
				
				setHref($(obj).find("> ul > li:eq(0)"),org);
			}else{
				$(org).find(">a").attr("href",$(org).find(">a").attr("href"));
			}
		}
	}
}

$(function(){
	$(document).on("click", "ul#gnb li, ul#snb li", function(){
		setHref($(this),$(this));
	});
	
	$(document).on("click", ".btn_topSearch", function(){
		var ifrSrc = "/search/searchPop.do";
		$('<iframe id="iframeSearchPop" class="pop_iframe on" src="'+ifrSrc+'" title="통합검색 팝업 아이프레임" frameborder="0" style="left: 0;border: 0px currentColor; border-image: none; top: 0px; width: 100%; height: 100%; position: absolute; z-index: 999999;"/>').appendTo($("body #contents"));
		$('#iframeSearchPop').load(function(){
	    	LayerPop.draw('#iframeSearchPop');
	    });
	});
	
	if($('#gnb li.on').parents('ul').hasClass('menuS')){
		gnbDep1 = $('#gnb > li').index($('#gnb li.on').parents('ul.menuM').parent())+1;
		gnbDep2 = $('#gnb li.on').parents('ul.menuM').find('>li').index($('#gnb li.on').parents('ul.menuS').parent())+1;
		gnbDep3 = $('#gnb li.on').parents('ul.menuS').find('>li').index($('#gnb li.on'))+1;
	}else if($('#gnb li.on').parents('ul').hasClass('menuM')){
		gnbDep1 = $('#gnb > li').index($('#gnb li.on').parents('ul.menuM').parent())+1;
		gnbDep2 = $('#gnb li.on').parents('ul.menuM').find('>li').index($('#gnb li.on'))+1;
	}else{
		gnbDep1 = $('#gnb > li').index($('#gnb li.on'))+1;
	}
	$('.sVisual strong').text($('#gnb li.on > a').text());
	
	$(document).on('click', '.btn_Routemap', function(){
		routeMap_click();
	});
	$(document).on('click', '.btn_topLogin', function(){
		location.href = "/gimpo/cms/login/topUtilLink.do?pRetUrl=" + encodeURIComponent(window.location.pathname + window.location.search);
	});
});
function routeMap_click(){
	var ifrSrc = "/gimpo/cms/frRouteMapCon/routeMap.do";
    $('<iframe id="iframePop" class="pop_iframe on" src="'+ifrSrc+'" frameborder="0" title="루트맵 팝업 아이프레임" style="left: 0;border: 0px currentColor; border-image: none; top: 0px; width: 100%; height: 100%; position: absolute; z-index: 999999;"/>').appendTo($("body #container"));
    $('#iframePop').load(function(){
    	LayerPop.draw('#iframePop');
    });
}

function facPop(airportCd){
	var ifrSrc = "/gimpo/cms/frFacCon/facilityPop.do?acd="+airportCd;
    $('<iframe id="iframeFacPop" class="pop_iframe on" src="'+ifrSrc+'" frameborder="0" title="시설안내 팝업 아이프레임" style="left: 0;border: 0px currentColor; border-image: none; top: 0px; width: 100%; height: 100%; position: absolute; z-index: 999999;"/>').appendTo($("body #container"));
    $('#iframeFacPop').load(function(){
    	LayerPop.draw('#iframeFacPop');
    });
}

</script>


<body class="typeSub">
	<script>
$(function(){
	$(".btn_print").bind("click", function(){
		window.print();	
	});
});
</script>



	<div id="contents">


		<div id="contTabFix">
			<ul class="tabList tab02">



				<li><a href="/cust/cus/main">이용안내 및 등록</a></li>



				<li><a
					href="cust/cus/cusList?custBrdNm=${custBoardVO.custBrdNm}&custBrdMbiph=${custBoardVO.custBrdMbiph}"
					title="선택됨" class="on">나의 고객의 소리</a></li>


			</ul>
		</div>




		<article>





<script type="text/javascript">

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
							<col style="width: 10%" />
							<col style="width: 30%" />
							<col style="width: 10%" />
							<col style="width: 20%" />
							<col style="width: 20%" />
							<col style="width: 10%" />


						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="headNum">번호</th>
								<th scope="col" class="headTxt">제목</th>
								<th scope="col" class="headWriter">고객명</th>
								<th scope="col" class="headDate">등록일</th>
								<th scope="col" class="headWriter">처리상태</th>
								<th scope="col" class="headWriter">답변일</th>


							</tr>
						</thead>
						<tbody>
							<c:forEach var="custBoardVO" items="${custBoardVOList}"
								varStatus="status">

								<tr class='typeNoArticle'
									onclick="location.href='/emp/cus/detail?ntcBrdNo=${custBoardVO.custBrdNo}'"
									style="height: 45px; border: 0.5px solid #e4e4e4; border-top: none; border-left: none; border-right: none; cursor: pointer;">
									<td style="width: 4%; padding-left: 20px;">
										<%-- 	                        		<c:if test='${custBoardVO.ntcBrdType.equals("O1")}'> --%>
										<!-- 		                        		<div class="box" style="width:10px; height:25px; background-color:red; border-radius:3px; margin:0px;"></div> -->
										<%-- 	                        		</c:if> --%>
									</td>
									<td style="width: 4%; text-align: center;">${custBoardVO.custBrdNo}</td>
									<td style="width: 60%; text-align: left; padding-left: 30px;">${custBoardVO.custBrdTtl}</td>
									<td style="width: 15%; text-align: center;">${custBoardVO.custBrdNm}</td>
									<td style="width: 15%; text-align: center;">${custBoardVO.custBrdAnsYn}</td>
									<td style="width: 15%; text-align: center;">${custBoardVO.custBrdAnsty}</td>
								</tr>
							</c:forEach>
						</tbody>
						<c:if test="${custBoardVO.custBrdNo == 'null' }">
							<tbody>

								<tr class="typeNoArticle">

									<td colspan="8">


										<p class="no_article">등록된 게시물이 없습니다.</p>
									</td>
								</tr>


							</tbody>
						</c:if>
					</table>
				</div>

				<!-- 페이징 -->
				<div class="pagination"></div>
				<!-- //페이징 -->

				<!-- 버튼 -->
				<div class="btnAreaR">
					<a href="cust/cus/cusForm?custBrdNm=${custBoardVO.custBrdNm}"
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


