<div id="info" class="Info">
		<div id="info.header" class="header">
			<div id="info.header.main" class="main">
				<div role="navigation">
					<h2 class="screen_out">검색 메뉴</h2>
					<ul class="menu">
						<li id="search.tab1" class="keyword keyword-INACTIVE"><a href="#" class="mainmenutab" title="검색">검색</a></li>
						<li id="search.tab2" class="carRoute carRoute-ACTIVE"><a href="#" class="mainmenutab" title="길찾기">길찾기</a></li>
						<li id="search.tab3" class="transitRoute transitRoute-INACTIVE">
							<a href="#" class="mainmenutab" title="버스">버스</a>
						</li>
						<li id="search.tab4" class="subwayRoute subwayRoute-INACTIVE">
							<a href="#" class="mainmenutab" title="지하철">지하철</a>
						</li>
						<li id="search.tab5" class="favorite favorite-INACTIVE"><a href="#" class="mainmenutab" title="즐겨찾기">MY</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="info.body" class="body" style="height: 897px;">
			<div id="info.main" class="Main INFOLEFT HIDDEN">
				<div id="info.main.home" class="home">
					<div id="info.location" class="theme HIDDEN">
						<div class="reportError">
							<h3 class="screen_out">현재위치</h3>
							<span id="info.location.approxAddr" class="approxAddr">&nbsp;</span>
							<div id="info.location.weather" class="infoAir HIDDEN">
								<strong class="screen_out">날씨정보</strong> <span class="txt_air"></span>
								<span class="temper"></span> <span class="txt_change"></span> <span class="txt_bar"></span> <span class="txt_dust">미세<span data-id="dust_state" class="txt_state"></span></span> <span class="txt_dust">초미세<span data-id="micro_dust_state" class="txt_state"></span></span>
							</div>
							<a id="info.location.reportError" href="iptargeting/form" class="reportbug">오류신고</a>
						</div>
					</div>
					<div id="info.main.famous" class="famous"></div>
					<div id="info.main.around" class="infoAround">
						<h3 class="tit_around">주변 탐색</h3>
						<ul class="list_around"><li><button type="button" class="btn_around"><span class="ico_food"></span><span class="txt_around">음식점</span></button></li><li><button type="button" class="btn_around"><span class="ico_cafe"></span><span class="txt_around">카페</span></button></li><li><button type="button" class="btn_around"><span class="ico_bus"></span><span class="txt_around">버스</span></button></li><li><button type="button" class="btn_around"><span class="ico_sub"></span><span class="txt_around">지하철</span></button></li><li><button type="button" class="btn_around"><span class="ico_hotel"></span><span class="txt_around">숙박</span></button></li><li><button type="button" class="btn_around"><span class="ico_bank"></span><span class="txt_around">은행</span></button></li><li><button type="button" class="btn_around"><span class="ico_cvs"></span><span class="txt_around">편의점</span></button></li></ul>
					</div>
					<div id="info.main.myplace" class="regfav myplace"><div class="favorite_exposed">
    <h3 class="tit_favorite tit_myfavorite">
        <a data-id="more" href="#none" class="link_myfavorite">내 장소</a>
    </h3>
    <ul data-id="list" class="list_registerated"><li class="">
    <div class="favorite_registerated">
        <a href="#" data-id="link" class="link_registerated ">
            <span class="ico_pin ico_home"></span>
            <span class="txt_personal">집 주소를 등록하세요.</span>
        </a>
    </div>
</li><li class="">
    <div class="favorite_registerated">
        <a href="#" data-id="link" class="link_registerated ">
            <span class="ico_pin ico_myjob"></span>
            <span class="txt_personal">회사/학교 주소를 등록하세요.</span>
        </a>
    </div>
</li><li class="">
    <div class="favorite_registerated">
        <a href="#" data-id="link" class="link_registerated ">
            <span class="ico_pin ico_myplace"></span>
            <span class="txt_personal">자주 가는 장소 주소를 등록하세요.<span class="txt_max">(최대 5개)</span></span>
        </a>
    </div>
</li></ul>
</div></div>
					<div id="info.main.favorite" class="regfav"><div class="favorite_exposed">
    <h3 class="tit_favorite tit_myfavorite">
        <a data-id="more" href="#none" class="link_myfavorite">즐겨찾기</a>
    </h3>
    <ul data-id="list" class="list_registerated HIDDEN"></ul>
        <p class="desc_place" data-id="defaultMessage">저장한 즐겨찾기에 대해 '홈 목록 추가'한 장소가 나옵니다.<br>자주 쓰는 즐겨찾기를 더 빠르게 사용해 보세요.</p>
</div></div>
					<div id="info.main.newplace" class="newplace">
						<div class="newPlace">
							<h6 class="tit_newplace">새로운 장소</h6>
							<p class="desc_place">
								새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다.
							</p>
							<a href="#none" class="xc link_newplace link_suggest" data-pos="left" data-channel="SEARCH_MIDDLE_NEWPLACE">신규 장소
								등록</a>
						</div>
					</div>
				</div>

				<div id="info.main.header" class="mainHeader HIDDEN">
					<ul id="info.main.options" class="sub"><li class="option0 option0-ACTIVE"><a href="#">전체</a></li><li class="option1"><a href="#">장소</a></li><li class="option2"><a href="#">주소</a></li><li class="option3"><a href="#">버스</a></li><li class="option4"><a href="#">정류장</a></li></ul>
					<a href="#none" id="info.main.header.clear" class="clear" title="모두 지우기">모두 지우기</a>
					<div id="info.main.header.activeOption" class="screen_out"></div>
				</div>

				<div id="info.related.keyword" class="relatedKeyword HIDDEN">
					<span class="ico">관련검색어</span>
					<div class="frameKeywords">
						<p class="wrapKeywords"></p>
					</div>
					<div class="more closed HIDDEN">
						<a href="#">더보기</a><span class="ico"></span>
					</div>
					<div class="more opened HIDDEN">
						<a href="#">접기</a><span class="ico"></span>
					</div>
				</div>
				<div id="info.searchHeader" class="searchHeader HIDDEN">
					<div id="info.search.boundsTitle" class="HIDDEN">
						<p class="desc_search">
							현재 지도 내 <em id="info.search.boundsTitle.text"></em> 검색결과
						</p>
					</div>
					<div id="info.search.correction" class="correction HIDDEN">
						<div class="correctionTop">
							<p class="desc_search">
								<em id="info.search.correction.orig"></em>에서 <em id="info.search.correction.new"></em>으로 검색한 결과
							</p>
						</div>
						<p class="correctionBottom">
							<a href="#" id="info.search.correction.goorig" class="link_search">입력한 '<span id="info.search.correction.orig2"></span>'(으)로 재검색 <span class="ico_arr"></span></a>
						</p><p id="info.search.correction.error" class="desc_error HIDDEN"></p>
						<p></p>
					</div>
					<div id="info.searchHeader.message" class="message HIDDEN"></div>
					<div id="info.searchHeader.banner" class="keywordBanner HIDDEN">
						<a href="#" class="banner"></a>
					</div>
					<div id="info.searchHeader.postCodeMessage" class="postCodeMessage HIDDEN">
						<a href="#none" class="link_search">우편번호 검색<span class="ico_arr"></span></a>
					</div>
					<div id="info.searchHeader.spellcheck" class="spellcheck HIDDEN">
						<div id="info.searchHeader.spellcheck.titleresult" class="desc_search HIDDEN">
							<em id="info.searchHeader.spellcheck.title"></em> 검색결과
						</div>
						<p>
							<a href="#" class="link_search" id="info.searchHeader.spellcheck.candidate">'<span id="info.searchHeader.spellcheck.text"></span>'(으)로 재검색 <span class="ico_arr"></span></a>
						</p>
					</div>
				</div>
				<div id="info.noPlace" class="noPlace HIDDEN">
					<div class="inner_noPlace">
						<h3 class="noKeyword">
							<em id="info.noPlace.keyword" class="txt_keyword"></em> 검색 결과가
							없어요.
						</h3>
						<p class="noResultDesc">
							검색어의 철자가 정확한지 다시 한번 확인해 주세요.<br>장소를 찾을 때 전화번호, 주소도 활용해 보세요.
						</p>
						<a href="http://search.daum.net/search?w=tot&amp;DA=54X&amp;q=" class="noKeywordLink" id="info.noPlace.daum.link" target="_blank">Daum
							검색 결과 보기</a>
						<div id="info.noPlace.register" class="register">
							새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다. <a id="info.noPlace.register.btn" class="registerBtn" href="#" target="_blank">신규 장소 등록</a>
						</div>
					</div>
				</div>
				<div id="info.search.noW3w" class="noPlace noPlace_type2 HIDDEN">
					<div class="inner_noPlace">
						<h3 class="noKeyword">검색 결과가 없어요.</h3>
					</div>
				</div>



				<div id="info.search" class="keywordSearch HIDDEN">
					<div id="info.search.buses" class="section buses">
						<div class="sectiontitle sectionBus">
							<h5 class="busestit">버스번호</h5>
							<span class="cntwrap"><em id="info.search.buses.cnt" class="cnt"></em></span> <span id="info.search.buses.busstop" class="busstop HIDDEN"> 버스 정류장<em id="info.search.buses.busstop.cnt" class="cnt"></em>
							</span>
							<div id="info.search.buses.regions" class="regionsbox"></div>
						</div>
						<ul id="info.search.buses.list"></ul>
						<a id="info.search.buses.more" class="more" href="#">버스 더보기</a>
					</div>

					<div id="info.search.busstops" class="section busstops">
						<div class="sectiontitle sectionBus">
							<h3 class="busstoptitle">버스 정류장</h3>
							<span class="cntwrap"><em id="info.search.busstops.cnt" class="cnt"></em></span>
							<div id="info.search.busstops.regions" class="regionsbox"></div>
						</div>
						<ul id="info.search.busstops.list"></ul>
						<a id="info.search.busstops.more" class="more" href="#">버스 정류장
							더보기<span class="ico_road_arrow"></span>
						</a>
					</div>

					<div id="info.search.address" class="section addresses">


						<div class="sectiontitle">
							<h3 class="addrtitle">주소</h3>
							<span class="cntwrap"><em id="info.search.address.cnt" class="cnt"></em></span>
						</div>
						<div id="info.search.address.retry" class="retry HIDDEN">
							<div class="content">
								<span class="ico"></span> <span class="txt">찾으시는 주소가 없어
									유사한 주소를 제공합니다.</span>
							</div>
						</div>
						<ul id="info.search.address.list"></ul>
						<a id="info.search.address.more" class="more" href="#">주소 더보기<span class="ico_road_arrow"></span></a>
					</div>

					<div id="info.search.place" class="section places">
						<div class="sectiontitle">
							<h5 class="placetit">장소</h5>
							<span class="cntwrap"><em id="info.search.place.cnt" class="cnt"></em></span>
							<ol id="info.search.place.sort" class="Sort"></ol>
						</div>
						<div id="info.search.place.breadcrumb" class="breadcrumb"></div>
						<ul id="info.search.place.list" class="placelist"></ul>
						<a id="info.search.place.more" class="more" href="#">장소 더보기</a>
					</div>
					<div id="info.search.page" class="pages HIDDEN">
						<div class="pageWrap">
							<button type="button" id="info.search.page.prev" class="prev disabled">이전</button>
							<a id="info.search.page.no1" class="INACTIVE" href="#">1</a> <a id="info.search.page.no2" class="INACTIVE" href="#">2</a> <a id="info.search.page.no3" class="INACTIVE" href="#">3</a> <a id="info.search.page.no4" class="INACTIVE" href="#">4</a> <a id="info.search.page.no5" class="INACTIVE" href="#">5</a>
							<button type="button" id="info.search.page.next" class="next">다음</button>
						</div>
					</div>

				</div>

				<div id="info.addNewPlace" class="info_addplace HIDDEN">
					<strong class="tit_addplace">새로운 수정된 장소를 알고 계세요?<br>장소
						제안은 지도 품질 향상에 큰 도움이 됩니다.
					</strong> <a id="info.addNewPlace.btn" href="#" class="ico_place link_addplace">신규 장소 등록</a>
				</div>

				<div id="info.noSuchPlace" class="noPlace noSuchPlace HIDDEN">
					<p>
						<strong>'해당위치'</strong>에 대한 검색 결과가 없습니다.
					</p>
				</div>

				<div id="info.noPlaceInBounds" class="noPlace noInBounds HIDDEN">
					<div class="inner_noPlace">
						<h3 class="noKeyword">
							<em id="info.noPlaceInBounds.keyword" class="txt_keyword"></em>
							검색 결과가 없어요.
						</h3>
						<p class="noResultDesc">
							검색어의 철자가 정확한지 다시 한번 확인해 주세요.<br>장소를 찾을 때 전화번호, 주소도 활용해 보세요.
						</p>
						<a href="http://search.daum.net/search?w=tot&amp;DA=54X&amp;q=" class="noKeywordLink" id="info.noPlaceInBounds.daum.link" target="_blank">Daum 검색 결과 보기</a>
						<div id="info.noPlaceInBounds.register" class="register">
							새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다. <a id="info.noPlaceInBounds.register.btn" class="registerBtn" href="#" target="_blank">신규 장소 등록</a>
						</div>
					</div>
				</div>

				<div id="info.noThemePlace" class="noThemePlace HIDDEN">
					<p id="info.noThemePlace.category" class="reviewcategories HIDDEN">
						<a id="info.noThemePlace.category.n1" href="#">전체</a> <a id="info.noThemePlace.category.n2" href="#">음식</a> <a id="info.noThemePlace.category.n3" href="#">여행</a> <a id="info.noThemePlace.category.n4" href="#">기타</a>
					</p>
					<p class="l1">
						<strong>'주변 <span id="info.noThemePlace.title"></span>'
						</strong>에 대한 검색 결과가 없습니다.
					</p>
					<p class="l2">지도를 축소하여 다시 테마 지도를 이용해 주세요.</p>
				</div>



			</div>
			<div id="info.route" class="RouteSearch">

				<h2 class="screen_out">길찾기 검색</h2>
				<div class="routeUtil">
					<div id="info.route.searchBox" class="RouteSearchBox WHITEOUT">
						<div id="info.route.searchBox.list"><div class="WaypointBoxView origin" sortid="0" style="left: 0px; top: 0px; position: relative;"><div class="dragArea"><span class="title origin"></span></div><div class="waypointWindow" style="position: relative;"><input class="valueBox" readonly="" placeholder="출발지를 입력하세요"><form class="WaypointInput"><input id="info.route.waypointSuggest.input0" title="검색어 입력" class="input" type="text" autocomplete="off"><input class="submit" type="submit" value=""><blockquote id="info.route.waypointSuggest.input0Suggest" class="inputSuggest"><div class="suggestBox box_sub" style="display: none;"><div class="baseBox bg"><div class="list"><ul class="suggest_list_target"></ul></div></div><div class="favorite_find HIDDEN"><ul class="list_find"></ul></div><div class="search_recent recent_none">
    <em class="tit_recent">히스토리가 없어요.</em>
    <ul data-id="wrap" class="list_recent"></ul>
    <div class="favorite_recent">
        <button data-id="disabled" type="button" class="btn_recentoff">히스토리 끄기</button>
        <button data-id="clear" type="button" class="btn_deleteall HIDDEN">전체삭제</button>
    </div>
</div></div></blockquote></form></div></div><div class="WaypointBoxView dest" sortid="1" style="left: 0px; top: 0px; position: relative;"><div class="dragArea"><span class="title dest"></span></div><div class="waypointWindow"><input class="valueBox" readonly="" placeholder="도착지를 입력하세요"><form class="WaypointInput HIDDEN"><input id="info.route.waypointSuggest.input1" title="검색어 입력" class="input" type="text" autocomplete="off"><input class="submit" type="submit" value=""><blockquote id="info.route.waypointSuggest.input1Suggest" class="inputSuggest"><div class="suggestBox box_sub"><div class="baseBox bg"><div class="list"><ul class="suggest_list_target"></ul></div></div><div class="favorite_find HIDDEN"><ul class="list_find"></ul></div><div class="search_recent recent_none">
    <em class="tit_recent">히스토리가 없어요.</em>
    <ul data-id="wrap" class="list_recent"></ul>
    <div class="favorite_recent">
        <button data-id="disabled" type="button" class="btn_recentoff">히스토리 끄기</button>
        <button data-id="clear" type="button" class="btn_deleteall HIDDEN">전체삭제</button>
    </div>
</div></div></blockquote></form></div></div></div>
						<a href="#none" id="info.route.searchBox.toggleVia" class="btn_roadsearch toggleVia">경유지 추가</a> <a href="#none" id="info.route.searchBox.change" class="btn_roadsearch routechange" title="출발/도착 순서 바꾸기">출발/도착
							순서 바꾸기</a> <a href="#none" id="info.route.searchBox.clearVia" class="btn_roadsearch clearVia" title="모두 지우기">모두 지우기</a>
					</div>
					<div id="info.flagsearch.method" class="routeMethod"><div class="RouteMethodTabView">
	<a id="cartab" data-id="car" class="car" href="#"></a>
	<a id="transittab" data-id="transit" class="transit" href="#"></a>
	<a id="walktab" data-id="walk" class="walk" href="#"></a>
	<a id="biketab" data-id="bike" class="bike" href="#"></a>
</div></div>
				</div>

				<div id="info.route.home" class="routeHistory routedesc"></div>
				<div id="info.route.intro" class="Howto">
					<strong class="tit_intro">오늘은<br>어디로 안내할까요?
					</strong>
					<p class="desc_intro">
						매일매일 업데이트되는 최신정보로<br>가장 빠른 경로를 알려드려요.
					</p>
				</div>

				<div id="info.flagsearch" class="HIDDEN Flagsearch" style="min-height: 3px;">
					<div class="search">
						<div id="info.flagsearch.divided" class="flagDivided">
							<div id="info.flagsearch.correction" class="correction HIDDEN">
								<p class="correctionTop">
									'<strong id="info.flagsearch.correction.orig"></strong>'에서 '<strong id="info.flagsearch.correction.new"></strong>'으로 검색한 결과
								</p>
								<p class="correctionBottom">
									<a href="#" id="info.flagsearch.correction.goorig">입력한 '<span id="info.flagsearch.correction.orig2"></span>'(으)로 재검색 ‣
									</a>
								</p>
							</div>

							<div id="info.flagsearch.spellcheck" class="spellcheck HIDDEN">
								<div class="spellcheckTitle HIDDEN" id="info.flagsearch.spellcheck.titleText">
									'<strong id="info.flagsearch.spellcheck.title"></strong>' 검색결과
								</div>
								<p>
									<a href="#" class="candidate" id="info.flagsearch.spellcheck.candidate">'<span id="info.flagsearch.spellcheck.text"></span>'(으)로 검색하시겠습니까?
									</a>
								</p>
							</div>

							<div id="info.flagsearch.message" class="message"></div>

						</div>
						<div id="info.flagsearch.options" class="filterwrap">
							<div class="filter" data-mypage="true">
								<a href="#" class="ACTIVE" id="info.flagsearch.filter.all">전체</a>
								<a href="#" class="INACTIVE" id="info.flagsearch.filter.place">장소</a>
								<a href="#" class="INACTIVE" id="info.flagsearch.filter.address">주소</a>
								<a href="#" class="INACTIVE" id="info.flagsearch.filter.busstop">버스</a>
							</div>
						</div>
						<div id="info.flagsearch.address" class="section addresses">
							<div class="sectiontitle">
								<h3 class="addrtitle">주소</h3>
								<span class="cntwrap"><em id="info.flagsearch.address.cnt" class="cnt"></em></span>
							</div>
							<ul id="info.flagsearch.address.list"></ul>
							<a id="info.flagsearch.address.more" class="more" href="#">주소
								더보기<span class="ico_road_arrow"></span>
							</a>
						</div>

						<div id="info.flagsearch.place" class="section places">
							<h5 class="sectiontitle">
								<span class="placetitle">장소</span> <span class="cntwrap"><em id="info.flagsearch.place.cnt" class="cnt"></em></span>
							</h5>
							<ul id="info.flagsearch.place.list"></ul>
							<a id="info.flagsearch.place.more" class="more" href="#">장소
								더보기</a>
						</div>

						<div id="info.flagsearch.busstop" class="section busstopList HIDDEN">
							<div class="sectiontitle">
								<h3 class="busstoptitle">버스정류장</h3>
								<span class="cntwrap"><em id="info.flagsearch.busstop.cnt" class="cnt"></em></span>
							</div>
							<ul id="info.flagsearch.busstop.list"></ul>
							<a id="info.flagsearch.busstop.more" class="more" href="#">버스정류장
								더보기<span class="ico_road_arrow"></span>
							</a>
						</div>

						<div id="info.flagsearch.page" class="pages HIDDEN">
							<div class="pageWrap">
								<button type="button" id="info.flagsearch.page.prev" class="prev disabled">이전</button>
								<a id="info.flagsearch.page.no1" class="INACTIVE" href="#">1</a>
								<a id="info.flagsearch.page.no2" class="INACTIVE" href="#">2</a>
								<a id="info.flagsearch.page.no3" class="INACTIVE" href="#">3</a>
								<a id="info.flagsearch.page.no4" class="INACTIVE" href="#">4</a>
								<a id="info.flagsearch.page.no5" class="INACTIVE" href="#">5</a>
								<button type="button" id="info.flagsearch.page.next" class="next">다음</button>
							</div>
						</div>

						<div id="info.noFlagPlace" class="noPlace HIDDEN">
							<div class="inner_noPlace">
								<h3 class="noKeyword">
									<em id="info.noFlagPlace.keyword" class="txt_keyword"></em> 검색
									결과가 없어요.
								</h3>
								<p class="noResultDesc">
									검색어의 철자가 정확한지 다시 한번 확인해 주세요.<br>장소를 찾을 때 전화번호, 주소도 활용해
									보세요.
								</p>
								<a href="http://search.daum.net/search?w=tot&amp;DA=54X&amp;q=" class="noKeywordLink" id="info.noPlace.daum.link" target="_blank">Daum 검색 결과 보기</a>
								<div id="info.noFlagPlace.register" class="register">
									새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다. <a id="info.noFlagPlace.register.btn" class="registerBtn" href="#" target="_blank">신규 장소 등록</a>
								</div>
							</div>
						</div>
						<div id="info.noW3w" class="noPlace noPlace_type2 ">
							<div class="inner_noPlace">
								<h3 class="noKeyword">w3w를 지원하지 않는 기능이에요.</h3>
							</div>
						</div>

						<div id="info.flagsearch.addNewPlace" class="info_addplace HIDDEN">
							<strong class="tit_addplace">새로운 수정된 장소를 알고 계세요?<br>장소
								제안은 지도 품질 향상에 큰 도움이 됩니다.
							</strong> <a id="info.flagsearch.addNewPlace.btn" href="#" class="ico_place link_addplace">신규 장소 등록</a>
						</div>
					</div>

					<div id="info.carRoute" class="HIDDEN"></div>
					<div id="info.walkRoute" class="walkroute HIDDEN"><div class="WalkRouteResultView">
	<ul data-id="list" class="list"></ul>
	<div class="notice">
		<span class="first"> 소요시간은 성인 도보기준 4km/h로 환산하여 제공됩니다.</span>
		<span class="second"> 도보 길찾기는 실제 구간과 다를 수 있으니 참고 부탁 드립니다.</span>
	</div>
	<div class="info_top">
		<a href="#none" class="link_top HIDDEN" data-id="goToTop">위로 가기</a>
	</div>
    <div class="info_fixroute">
        길찾기 정보가 잘못되었나요?<br>정보 수정 제안은 지도 품질 향상에 큰 도움이 됩니다.
        <a href="#none" class="link_fixroute" data-id="fixRoute">
            틀린정보 신고
        </a>
    </div>
</div><div class="NoRouteView HIDDEN"><div class="NoRouteContentView">
    <div class="wrap" data-id="content">
        <h3 class="noKeyword" data-id="titleInfo">길찾기 검색 결과가 없어요.</h3>
        <div class="noRouteDesc" data-id="noRouteDesc"></div>
        <a href="http://kakaomap.tistory.com/210" target="_blank" class="link_suggest HIDDEN" data-id="link">도보 길찾기 제공지역 안내</a>
        <div class="intercityBox HIDDEN" data-id="intercityBox"></div>
    </div>
    <div class="info_fixroute">
        <div data-id="fiyContent">
            길찾기 정보가 잘못되었나요?<br>정보 수정 제안은 지도 품질 향상에 큰 도움이 됩니다.
            <a href="#" class="ico_place link_fixroute" data-id="fiyBtn">틀린정보 신고</a>
        </div>
    </div><!-- 2018-12-11_v2 수정 : 텍스트 추가 -->
</div></div><div class="NoRouteView HIDDEN"><div class="NoRouteContentView">
    <div class="wrap" data-id="content">
        <h3 class="noKeyword" data-id="titleInfo">길찾기에 실패했습니다.</h3>
        <div class="noRouteDesc" data-id="noRouteDesc" style="display: block;">다시 시도해주세요</div>
        <a href="http://kakaomap.tistory.com/210" target="_blank" class="link_suggest HIDDEN" data-id="link">도보 길찾기 제공지역 안내</a>
        <div class="intercityBox HIDDEN" data-id="intercityBox"></div>
    </div>
    <div class="info_fixroute">
        <div data-id="fiyContent" class="HIDDEN">
            길찾기 정보가 잘못되었나요?<br>정보 수정 제안은 지도 품질 향상에 큰 도움이 됩니다.
            <a href="#" class="ico_place link_fixroute" data-id="fiyBtn">틀린정보 신고</a>
        </div>
    </div><!-- 2018-12-11_v2 수정 : 텍스트 추가 -->
</div></div></div>
					<div id="info.bikeRoute" class="bikeroute HIDDEN"><div class="BikeRouteResultView">
	<ul data-id="list" class="list"></ul>
	<div class="notice">
		<span class="first">소요시간은 자전거 평속 20km/h 내외로 환산하여 제공됩니다.</span>
		<!--
		<a href="#" class="second" data-id="openDetail">정보 제공의 한계와 책임</a>

		<div class="notice_detail HIDDEN" data-id="detailBox">
			<h2>정보 제공의 한계와 책임 안내</h2>
			<p>(주)카카오에서 제공하는 자전거 길찾기는 자전거 전용 도로를 우선으로 안내하며, 자전거 전용 도로가 없을 경우에는 자동차 경로 정보(자동차 전용 도로는 제외)로 안내합니다.</p>
			<p>도로 정보가 수집되지 않거나 최신 정보로 갱신되지 않은 일부 지역의 경우 잘못된 경로로 안내될 수 있으니 <strong>본 서비스 정보는 반드시 참고 자료로만 활용하시길 바랍니다. 본 서비스에서 제공한 정보를 이용하여 자전거 주행시 발생하는 사고 등에 대해서 당사는 법적 책임을 지지 않습니다.</strong></p>
			<p>자전거 주행 시 관계 법령을 준수하고 현장 상황에 맞게 안전 운행 하시기 바랍니다.</p>
			<img class="close" data-id="closeDetail" src="//t1.daumcdn.net/localimg/localimages/07/2017/pc/ico_noti_x.png" width="16" height="16" alt="닫기"/>
		</div>
		-->
	</div>
	<div class="info_top">
		<a href="#none" class="link_top HIDDEN" data-id="goToTop">위로 가기</a>
	</div>
    <div class="info_fixroute">
        길찾기 정보가 잘못되었나요?<br>정보 수정 제안은 지도 품질 향상에 큰 도움이 됩니다.
        <a href="#none" class="link_fixroute" data-id="fixRoute">
            틀린정보 신고
        </a>
    </div>
</div><div class="NoRouteView HIDDEN"><div class="NoRouteContentView">
    <div class="wrap" data-id="content">
        <h3 class="noKeyword" data-id="titleInfo">길찾기 검색 결과가 없어요.</h3>
        <div class="noRouteDesc" data-id="noRouteDesc"></div>
        <a href="http://kakaomap.tistory.com/210" target="_blank" class="link_suggest HIDDEN" data-id="link">도보 길찾기 제공지역 안내</a>
        <div class="intercityBox HIDDEN" data-id="intercityBox"></div>
    </div>
    <div class="info_fixroute">
        <div data-id="fiyContent">
            길찾기 정보가 잘못되었나요?<br>정보 수정 제안은 지도 품질 향상에 큰 도움이 됩니다.
            <a href="#" class="ico_place link_fixroute" data-id="fiyBtn">틀린정보 신고</a>
        </div>
    </div><!-- 2018-12-11_v2 수정 : 텍스트 추가 -->
</div></div><div class="NoRouteView HIDDEN"><div class="NoRouteContentView">
    <div class="wrap" data-id="content">
        <h3 class="noKeyword" data-id="titleInfo">길찾기에 실패했습니다.</h3>
        <div class="noRouteDesc" data-id="noRouteDesc" style="display: block;">다시 시도해주세요</div>
        <a href="http://kakaomap.tistory.com/210" target="_blank" class="link_suggest HIDDEN" data-id="link">도보 길찾기 제공지역 안내</a>
        <div class="intercityBox HIDDEN" data-id="intercityBox"></div>
    </div>
    <div class="info_fixroute">
        <div data-id="fiyContent" class="HIDDEN">
            길찾기 정보가 잘못되었나요?<br>정보 수정 제안은 지도 품질 향상에 큰 도움이 됩니다.
            <a href="#" class="ico_place link_fixroute" data-id="fiyBtn">틀린정보 신고</a>
        </div>
    </div><!-- 2018-12-11_v2 수정 : 텍스트 추가 -->
</div></div></div>
				<div class="TransitRouteResultView HIDDEN"></div><div class="CarRouteResultView HIDDEN"><div class="info_pathfind"> <!-- 요금설정 선택시 paysetting_on 클래스 추가  -->
	<div class="menu_pathfind" data-id="menu">
		<div data-id="option" class="opt_pathfind"> <!-- 옵션 선택시 opt_open 클래스 추가 -->
			<div class="screen_out">길찾기 종류 선택상자</div>
			<span class="screen_out">선택내용 : </span>
			<a href="#" data-id="optionText" class="img_pathfind link_selected">최적경로</a>
			<div class="screen_out">선택옵션</div>
			<ul class="list_opt">
				<li><a href="#" data-id="recomm" class="link_option">최적경로</a></li>
				<li><a href="#" data-id="freeway" class="link_option">무료경로</a></li>
				<li><a href="#" data-id="shortest" class="link_option">최단거리</a></li>
				<li><a href="#" data-id="bike" class="link_option">자동차전용제외</a></li>
			</ul>
		</div>
		<div class="inner_pathfind">
			<div data-id="realtime" class="check_live">
				<input type="checkbox" data-id="realCheckBox" id="checkLive" class="inp_live">
				<label for="checkLive" class="lab_live">실시간</label>
			</div>
			<span class="txt_bar" data-id="realtimeBar">|</span>
			<a href="#none" data-id="payset" class="link_payset link_payon">요금설정</a>
		</div>
	</div>
</div><ul class="list"></ul><p class="daumNotice HIDDEN"><span class="notice_icon">아이콘</span><span class="notice_text"></span></p><div class="info_top"><a href="#" class="link_top HIDDEN">위로 가기</a></div><div class="info_fixroute"><strong class="tit_carsource">경로 정보 제공 : 카카오내비</strong><span>길찾기 정보가 잘못되었나요?<br>정보 수정 제안은 지도 품질 향상에 큰 도움이 됩니다.</span><a href="#" class="link_fixroute"></a></div></div></div>
			</div>

			<div id="info.bus" class="BusSearch WHITEOUT HIDDEN">
				<a href="#none" id="info.bus.removeAll" class="removeAll" title="모두 지우기">모두 지우기</a>
				<ul id="search.busMethodtype" class="BusMethodType">
					<li id="search.busMethodtype.number" class="busNum NUMBER-ACTIVE">
						<a href="#none">번호</a>
					</li>
					<li id="search.busMethodtype.stop" class="busStop BUSSTOP-INACTIVE">
						<a href="#none">정류장</a>
					</li>
					<li id="search.busMethodtype.region" class="busRegion REGION-INACTIVE"><a href="#none">지역</a></li>
				</ul>

				<div id="info.bus.searchBox.number" class="number">
					<form id="info.bus.searchBoxNumber" class="BusSearchBox WHITEOUT">
						<div class="box_search">
							<h3 class="screen_out">
								<label for="info.route.searchBox.number.name">버스번호</label>
							</h3>
							<input id="info.route.searchBox.number.name" class="q" type="text" autocomplete="off" placeholder="버스번호를 입력하세요">
							<button id="info.bus.searchBox.number.submit" class="go" type="submit"></button>
							<blockquote id="info.route.searchBox.number.nameSuggest"><div class="suggestBox box_sub"><div class="baseBox bg"><div class="list"><ul class="suggest_list_target"></ul></div></div><div class="favorite_find HIDDEN"><ul class="list_find"></ul></div><div class="search_recent recent_none">
    <em class="tit_recent">히스토리가 없어요.</em>
    <ul data-id="wrap" class="list_recent"></ul>
    <div class="favorite_recent">
        <button data-id="disabled" type="button" class="btn_recentoff">히스토리 끄기</button>
        <button data-id="clear" type="button" class="btn_deleteall HIDDEN">전체삭제</button>
    </div>
</div></div></blockquote>
						</div>
					</form>
				</div>
				<div id="info.bus.searchBox.stop" class="stop HIDDEN">
					<form id="info.bus.searchBoxStop" class="BusSearchBox WHITEOUT">
						<div class="box_search">
							<h3 class="screen_out">
								<label for="info.route.searchBox.stop.name">버스정류장</label>
							</h3>
							<input id="info.route.searchBox.stop.name" class="q" type="text" autocomplete="off" placeholder="버스정류장을 입력하세요">
							<button id="info.bus.searchBox.stop.submit" class="go" type="submit"></button>
							<blockquote id="info.route.searchBox.stop.nameSuggest"><div class="suggestBox box_sub"><div class="baseBox bg"><div class="list"><ul class="suggest_list_target"></ul></div></div><div class="favorite_find HIDDEN"><ul class="list_find"></ul></div><div class="search_recent recent_none">
    <em class="tit_recent">히스토리가 없어요.</em>
    <ul data-id="wrap" class="list_recent"></ul>
    <div class="favorite_recent">
        <button data-id="disabled" type="button" class="btn_recentoff">히스토리 끄기</button>
        <button data-id="clear" type="button" class="btn_deleteall HIDDEN">전체삭제</button>
    </div>
</div></div></blockquote>
						</div>
					</form>
				</div>

				<div id="info.bus.region" class="region BusSearchBox HIDDEN">
					<div class="hb">
						<div id="info.bus.region.local.button" class="rb">
							<h3 class="screen_out">지역</h3>
							<span class="screen_out">선택상자</span> <em class="screen_out">선택내용
								:</em> <span id="info.bus.region.local" class="method melt">경기</span>
							<em class="screen_out">선택옵션</em>
							<ul id="search.busLocal" class="BusLocal HIDDEN"><li id="search.busLocal.seoul" class="INACTIVE">서울</li><li id="search.busLocal.pusan" class="INACTIVE">부산</li><li id="search.busLocal.daegu" class="INACTIVE">대구</li><li id="search.busLocal.incheon" class="INACTIVE">인천</li><li id="search.busLocal.kwangju" class="INACTIVE">광주</li><li id="search.busLocal.daejeon" class="INACTIVE">대전</li><li id="search.busLocal.ulsan" class="INACTIVE">울산</li><li id="search.busLocal.sejong" class="INACTIVE">세종</li><li id="search.busLocal.kyonggi" class="INACTIVE">경기</li><li id="search.busLocal.kangwon" class="INACTIVE">강원</li><li id="search.busLocal.chungbook" class="INACTIVE">충북</li><li id="search.busLocal.chungnam" class="INACTIVE">충남</li><li id="search.busLocal.jeonbuk" class="INACTIVE">전북</li><li id="search.busLocal.jeonnam" class="INACTIVE">전남</li><li id="search.busLocal.kyungbook" class="INACTIVE">경북</li><li id="search.busLocal.kyungnam" class="INACTIVE">경남</li><li id="search.busLocal.jeju" class="INACTIVE">제주</li></ul>
						</div>
					</div>
					<div class="hb sub">
						<div id="info.bus.region.subLocal.button" class="rb">
							<strong class="screen_out">세부지역 선택상자</strong> <em class="screen_out">선택내용 :</em> <span id="info.bus.region.subLocal" class="method method-INACTIVE">가평군</span>
							<em class="screen_out">선택옵션</em>
						<ul id="search.seoulLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.11680" class="INACTIVE">강남구</li><li id="search.busLocal.11740" class="INACTIVE">강동구</li><li id="search.busLocal.11305" class="INACTIVE">강북구</li><li id="search.busLocal.11500" class="INACTIVE">강서구</li><li id="search.busLocal.11620" class="INACTIVE">관악구</li><li id="search.busLocal.11215" class="INACTIVE">광진구</li><li id="search.busLocal.11530" class="INACTIVE">구로구</li><li id="search.busLocal.11545" class="INACTIVE">금천구</li><li id="search.busLocal.11350" class="INACTIVE">노원구</li><li id="search.busLocal.11320" class="INACTIVE">도봉구</li><li id="search.busLocal.11230" class="INACTIVE">동대문구</li><li id="search.busLocal.11590" class="INACTIVE">동작구</li><li id="search.busLocal.11440" class="INACTIVE">마포구</li><li id="search.busLocal.11410" class="INACTIVE">서대문구</li><li id="search.busLocal.11650" class="INACTIVE">서초구</li><li id="search.busLocal.11200" class="INACTIVE">성동구</li><li id="search.busLocal.11290" class="INACTIVE">성북구</li><li id="search.busLocal.11710" class="INACTIVE">송파구</li><li id="search.busLocal.11470" class="INACTIVE">양천구</li><li id="search.busLocal.11560" class="INACTIVE">영등포구</li><li id="search.busLocal.11170" class="INACTIVE">용산구</li><li id="search.busLocal.11380" class="INACTIVE">은평구</li><li id="search.busLocal.11110" class="INACTIVE">종로구</li><li id="search.busLocal.11140" class="INACTIVE">중구</li><li id="search.busLocal.11260" class="INACTIVE">중랑구</li></ul><ul id="search.pusanLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.26440" class="INACTIVE">강서구</li><li id="search.busLocal.26410" class="INACTIVE">금정구</li><li id="search.busLocal.26710" class="INACTIVE">기장군</li><li id="search.busLocal.26290" class="INACTIVE">남구</li><li id="search.busLocal.26170" class="INACTIVE">동구</li><li id="search.busLocal.26260" class="INACTIVE">동래구</li><li id="search.busLocal.26230" class="INACTIVE">부산진구</li><li id="search.busLocal.26320" class="INACTIVE">북구</li><li id="search.busLocal.26530" class="INACTIVE">사상구</li><li id="search.busLocal.26380" class="INACTIVE">사하구</li><li id="search.busLocal.26140" class="INACTIVE">서구</li><li id="search.busLocal.26500" class="INACTIVE">수영구</li><li id="search.busLocal.26470" class="INACTIVE">연제구</li><li id="search.busLocal.26200" class="INACTIVE">영도구</li><li id="search.busLocal.26110" class="INACTIVE">중구</li><li id="search.busLocal.26350" class="INACTIVE">해운대구</li></ul><ul id="search.daeguLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.27720" class="INACTIVE">군위군</li><li id="search.busLocal.27200" class="INACTIVE">남구</li><li id="search.busLocal.27290" class="INACTIVE">달서구</li><li id="search.busLocal.27710" class="INACTIVE">달성군</li><li id="search.busLocal.27140" class="INACTIVE">동구</li><li id="search.busLocal.27230" class="INACTIVE">북구</li><li id="search.busLocal.27170" class="INACTIVE">서구</li><li id="search.busLocal.27260" class="INACTIVE">수성구</li><li id="search.busLocal.27110" class="INACTIVE">중구</li></ul><ul id="search.incheonLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.28710" class="INACTIVE">강화군</li><li id="search.busLocal.28245" class="INACTIVE">계양구</li><li id="search.busLocal.28200" class="INACTIVE">남동구</li><li id="search.busLocal.28140" class="INACTIVE">동구</li><li id="search.busLocal.28177" class="INACTIVE">미추홀구</li><li id="search.busLocal.28237" class="INACTIVE">부평구</li><li id="search.busLocal.28260" class="INACTIVE">서구</li><li id="search.busLocal.28185" class="INACTIVE">연수구</li><li id="search.busLocal.28720" class="INACTIVE">옹진군</li><li id="search.busLocal.28110" class="INACTIVE">중구</li></ul><ul id="search.kwangjuLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.29200" class="INACTIVE">광산구</li><li id="search.busLocal.29155" class="INACTIVE">남구</li><li id="search.busLocal.29110" class="INACTIVE">동구</li><li id="search.busLocal.29170" class="INACTIVE">북구</li><li id="search.busLocal.29140" class="INACTIVE">서구</li></ul><ul id="search.daejeonLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.30230" class="INACTIVE">대덕구</li><li id="search.busLocal.30110" class="INACTIVE">동구</li><li id="search.busLocal.30170" class="INACTIVE">서구</li><li id="search.busLocal.30200" class="INACTIVE">유성구</li><li id="search.busLocal.30140" class="INACTIVE">중구</li></ul><ul id="search.ulsanLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.31140" class="INACTIVE">남구</li><li id="search.busLocal.31170" class="INACTIVE">동구</li><li id="search.busLocal.31200" class="INACTIVE">북구</li><li id="search.busLocal.31710" class="INACTIVE">울주군</li><li id="search.busLocal.31110" class="INACTIVE">중구</li></ul><ul id="search.sejongLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.36110" class="INACTIVE"></li></ul><ul id="search.kyonggiLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.41820" class="INACTIVE">가평군</li><li id="search.busLocal.41280" class="INACTIVE">고양시</li><li id="search.busLocal.41281" class="INACTIVE">고양시 덕양구</li><li id="search.busLocal.41285" class="INACTIVE">고양시 일산동구</li><li id="search.busLocal.41287" class="INACTIVE">고양시 일산서구</li><li id="search.busLocal.41290" class="INACTIVE">과천시</li><li id="search.busLocal.41210" class="INACTIVE">광명시</li><li id="search.busLocal.41610" class="INACTIVE">광주시</li><li id="search.busLocal.41310" class="INACTIVE">구리시</li><li id="search.busLocal.41410" class="INACTIVE">군포시</li><li id="search.busLocal.41570" class="INACTIVE">김포시</li><li id="search.busLocal.41360" class="INACTIVE">남양주시</li><li id="search.busLocal.41250" class="INACTIVE">동두천시</li><li id="search.busLocal.41190" class="INACTIVE">부천시</li><li id="search.busLocal.41194" class="INACTIVE">부천시 소사구</li><li id="search.busLocal.41196" class="INACTIVE">부천시 오정구</li><li id="search.busLocal.41192" class="INACTIVE">부천시 원미구</li><li id="search.busLocal.41130" class="INACTIVE">성남시</li><li id="search.busLocal.41135" class="INACTIVE">성남시 분당구</li><li id="search.busLocal.41131" class="INACTIVE">성남시 수정구</li><li id="search.busLocal.41133" class="INACTIVE">성남시 중원구</li><li id="search.busLocal.41110" class="INACTIVE">수원시</li><li id="search.busLocal.41113" class="INACTIVE">수원시 권선구</li><li id="search.busLocal.41117" class="INACTIVE">수원시 영통구</li><li id="search.busLocal.41111" class="INACTIVE">수원시 장안구</li><li id="search.busLocal.41115" class="INACTIVE">수원시 팔달구</li><li id="search.busLocal.41390" class="INACTIVE">시흥시</li><li id="search.busLocal.41270" class="INACTIVE">안산시</li><li id="search.busLocal.41273" class="INACTIVE">안산시 단원구</li><li id="search.busLocal.41271" class="INACTIVE">안산시 상록구</li><li id="search.busLocal.41550" class="INACTIVE">안성시</li><li id="search.busLocal.41170" class="INACTIVE">안양시</li><li id="search.busLocal.41173" class="INACTIVE">안양시 동안구</li><li id="search.busLocal.41171" class="INACTIVE">안양시 만안구</li><li id="search.busLocal.41630" class="INACTIVE">양주시</li><li id="search.busLocal.41830" class="INACTIVE">양평군</li><li id="search.busLocal.41670" class="INACTIVE">여주시</li><li id="search.busLocal.41800" class="INACTIVE">연천군</li><li id="search.busLocal.41370" class="INACTIVE">오산시</li><li id="search.busLocal.41460" class="INACTIVE">용인시</li><li id="search.busLocal.41463" class="INACTIVE">용인시 기흥구</li><li id="search.busLocal.41465" class="INACTIVE">용인시 수지구</li><li id="search.busLocal.41461" class="INACTIVE">용인시 처인구</li><li id="search.busLocal.41430" class="INACTIVE">의왕시</li><li id="search.busLocal.41150" class="INACTIVE">의정부시</li><li id="search.busLocal.41500" class="INACTIVE">이천시</li><li id="search.busLocal.41480" class="INACTIVE">파주시</li><li id="search.busLocal.41220" class="INACTIVE">평택시</li><li id="search.busLocal.41650" class="INACTIVE">포천시</li><li id="search.busLocal.41450" class="INACTIVE">하남시</li><li id="search.busLocal.41590" class="INACTIVE">화성시</li></ul><ul id="search.kangwonLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.51150" class="INACTIVE">강릉시</li><li id="search.busLocal.51820" class="INACTIVE">고성군</li><li id="search.busLocal.51170" class="INACTIVE">동해시</li><li id="search.busLocal.51230" class="INACTIVE">삼척시</li><li id="search.busLocal.51210" class="INACTIVE">속초시</li><li id="search.busLocal.51800" class="INACTIVE">양구군</li><li id="search.busLocal.51830" class="INACTIVE">양양군</li><li id="search.busLocal.51750" class="INACTIVE">영월군</li><li id="search.busLocal.51130" class="INACTIVE">원주시</li><li id="search.busLocal.51810" class="INACTIVE">인제군</li><li id="search.busLocal.51770" class="INACTIVE">정선군</li><li id="search.busLocal.51780" class="INACTIVE">철원군</li><li id="search.busLocal.51110" class="INACTIVE">춘천시</li><li id="search.busLocal.51190" class="INACTIVE">태백시</li><li id="search.busLocal.51760" class="INACTIVE">평창군</li><li id="search.busLocal.51720" class="INACTIVE">홍천군</li><li id="search.busLocal.51790" class="INACTIVE">화천군</li><li id="search.busLocal.51730" class="INACTIVE">횡성군</li></ul><ul id="search.chungbookLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.43760" class="INACTIVE">괴산군</li><li id="search.busLocal.43800" class="INACTIVE">단양군</li><li id="search.busLocal.43720" class="INACTIVE">보은군</li><li id="search.busLocal.43740" class="INACTIVE">영동군</li><li id="search.busLocal.43730" class="INACTIVE">옥천군</li><li id="search.busLocal.43770" class="INACTIVE">음성군</li><li id="search.busLocal.43150" class="INACTIVE">제천시</li><li id="search.busLocal.43745" class="INACTIVE">증평군</li><li id="search.busLocal.43750" class="INACTIVE">진천군</li><li id="search.busLocal.43110" class="INACTIVE">청주시</li><li id="search.busLocal.43111" class="INACTIVE">청주시 상당구</li><li id="search.busLocal.43112" class="INACTIVE">청주시 서원구</li><li id="search.busLocal.43114" class="INACTIVE">청주시 청원구</li><li id="search.busLocal.43113" class="INACTIVE">청주시 흥덕구</li><li id="search.busLocal.43130" class="INACTIVE">충주시</li></ul><ul id="search.chungnamLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.44250" class="INACTIVE">계룡시</li><li id="search.busLocal.44150" class="INACTIVE">공주시</li><li id="search.busLocal.44710" class="INACTIVE">금산군</li><li id="search.busLocal.44230" class="INACTIVE">논산시</li><li id="search.busLocal.44270" class="INACTIVE">당진시</li><li id="search.busLocal.44180" class="INACTIVE">보령시</li><li id="search.busLocal.44760" class="INACTIVE">부여군</li><li id="search.busLocal.44210" class="INACTIVE">서산시</li><li id="search.busLocal.44770" class="INACTIVE">서천군</li><li id="search.busLocal.44200" class="INACTIVE">아산시</li><li id="search.busLocal.44810" class="INACTIVE">예산군</li><li id="search.busLocal.44130" class="INACTIVE">천안시</li><li id="search.busLocal.44131" class="INACTIVE">천안시 동남구</li><li id="search.busLocal.44133" class="INACTIVE">천안시 서북구</li><li id="search.busLocal.44790" class="INACTIVE">청양군</li><li id="search.busLocal.44825" class="INACTIVE">태안군</li><li id="search.busLocal.44800" class="INACTIVE">홍성군</li></ul><ul id="search.jeonbukLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.52790" class="INACTIVE">고창군</li><li id="search.busLocal.52130" class="INACTIVE">군산시</li><li id="search.busLocal.52210" class="INACTIVE">김제시</li><li id="search.busLocal.52190" class="INACTIVE">남원시</li><li id="search.busLocal.52730" class="INACTIVE">무주군</li><li id="search.busLocal.52800" class="INACTIVE">부안군</li><li id="search.busLocal.52770" class="INACTIVE">순창군</li><li id="search.busLocal.52710" class="INACTIVE">완주군</li><li id="search.busLocal.52140" class="INACTIVE">익산시</li><li id="search.busLocal.52750" class="INACTIVE">임실군</li><li id="search.busLocal.52740" class="INACTIVE">장수군</li><li id="search.busLocal.52110" class="INACTIVE">전주시</li><li id="search.busLocal.52113" class="INACTIVE">전주시 덕진구</li><li id="search.busLocal.52111" class="INACTIVE">전주시 완산구</li><li id="search.busLocal.52180" class="INACTIVE">정읍시</li><li id="search.busLocal.52720" class="INACTIVE">진안군</li></ul><ul id="search.jeonnamLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.46810" class="INACTIVE">강진군</li><li id="search.busLocal.46770" class="INACTIVE">고흥군</li><li id="search.busLocal.46720" class="INACTIVE">곡성군</li><li id="search.busLocal.46230" class="INACTIVE">광양시</li><li id="search.busLocal.46730" class="INACTIVE">구례군</li><li id="search.busLocal.46170" class="INACTIVE">나주시</li><li id="search.busLocal.46710" class="INACTIVE">담양군</li><li id="search.busLocal.46110" class="INACTIVE">목포시</li><li id="search.busLocal.46840" class="INACTIVE">무안군</li><li id="search.busLocal.46780" class="INACTIVE">보성군</li><li id="search.busLocal.46150" class="INACTIVE">순천시</li><li id="search.busLocal.46910" class="INACTIVE">신안군</li><li id="search.busLocal.46130" class="INACTIVE">여수시</li><li id="search.busLocal.46870" class="INACTIVE">영광군</li><li id="search.busLocal.46830" class="INACTIVE">영암군</li><li id="search.busLocal.46890" class="INACTIVE">완도군</li><li id="search.busLocal.46880" class="INACTIVE">장성군</li><li id="search.busLocal.46800" class="INACTIVE">장흥군</li><li id="search.busLocal.46900" class="INACTIVE">진도군</li><li id="search.busLocal.46860" class="INACTIVE">함평군</li><li id="search.busLocal.46820" class="INACTIVE">해남군</li><li id="search.busLocal.46790" class="INACTIVE">화순군</li></ul><ul id="search.kyungbookLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.47290" class="INACTIVE">경산시</li><li id="search.busLocal.47130" class="INACTIVE">경주시</li><li id="search.busLocal.47830" class="INACTIVE">고령군</li><li id="search.busLocal.47190" class="INACTIVE">구미시</li><li id="search.busLocal.47150" class="INACTIVE">김천시</li><li id="search.busLocal.47280" class="INACTIVE">문경시</li><li id="search.busLocal.47920" class="INACTIVE">봉화군</li><li id="search.busLocal.47250" class="INACTIVE">상주시</li><li id="search.busLocal.47840" class="INACTIVE">성주군</li><li id="search.busLocal.47170" class="INACTIVE">안동시</li><li id="search.busLocal.47770" class="INACTIVE">영덕군</li><li id="search.busLocal.47760" class="INACTIVE">영양군</li><li id="search.busLocal.47210" class="INACTIVE">영주시</li><li id="search.busLocal.47230" class="INACTIVE">영천시</li><li id="search.busLocal.47900" class="INACTIVE">예천군</li><li id="search.busLocal.47940" class="INACTIVE">울릉군</li><li id="search.busLocal.47930" class="INACTIVE">울진군</li><li id="search.busLocal.47730" class="INACTIVE">의성군</li><li id="search.busLocal.47820" class="INACTIVE">청도군</li><li id="search.busLocal.47750" class="INACTIVE">청송군</li><li id="search.busLocal.47850" class="INACTIVE">칠곡군</li><li id="search.busLocal.47110" class="INACTIVE">포항시</li><li id="search.busLocal.47111" class="INACTIVE">포항시 남구</li><li id="search.busLocal.47113" class="INACTIVE">포항시 북구</li></ul><ul id="search.kyungnamLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.48310" class="INACTIVE">거제시</li><li id="search.busLocal.48880" class="INACTIVE">거창군</li><li id="search.busLocal.48820" class="INACTIVE">고성군</li><li id="search.busLocal.48250" class="INACTIVE">김해시</li><li id="search.busLocal.48840" class="INACTIVE">남해군</li><li id="search.busLocal.48270" class="INACTIVE">밀양시</li><li id="search.busLocal.48240" class="INACTIVE">사천시</li><li id="search.busLocal.48860" class="INACTIVE">산청군</li><li id="search.busLocal.48330" class="INACTIVE">양산시</li><li id="search.busLocal.48720" class="INACTIVE">의령군</li><li id="search.busLocal.48170" class="INACTIVE">진주시</li><li id="search.busLocal.48740" class="INACTIVE">창녕군</li><li id="search.busLocal.48120" class="INACTIVE">창원시</li><li id="search.busLocal.48125" class="INACTIVE">창원시 마산합포구</li><li id="search.busLocal.48127" class="INACTIVE">창원시 마산회원구</li><li id="search.busLocal.48123" class="INACTIVE">창원시 성산구</li><li id="search.busLocal.48121" class="INACTIVE">창원시 의창구</li><li id="search.busLocal.48129" class="INACTIVE">창원시 진해구</li><li id="search.busLocal.48220" class="INACTIVE">통영시</li><li id="search.busLocal.48850" class="INACTIVE">하동군</li><li id="search.busLocal.48730" class="INACTIVE">함안군</li><li id="search.busLocal.48870" class="INACTIVE">함양군</li><li id="search.busLocal.48890" class="INACTIVE">합천군</li></ul><ul id="search.jejuLocal" class="BusSubLocal HIDDEN"><li id="search.busLocal.50130" class="INACTIVE">서귀포시</li><li id="search.busLocal.50110" class="INACTIVE">제주시</li></ul></div>
					</div>
				</div>

				<div id="info.busIntro" class="Howto">
					<strong class="tit_intro">지금, 딱!<br>내가 탈 버스가 어디있는지
					</strong>
					<p class="desc_intro">
						노선 정보는 물론, 실시간으로<br>버스 도착정보와 위치를 확인하세요.
					</p>
					<a href="http://kakaomap.tistory.com/219" class="link_intro" target="_blank">서비스 제공지역 안내</a>
				</div>

				<div id="info.bus.search" class="BusResult HIDDEN">
					<div id="info.bus.message" class="busMessage">
						<div id="info.bus.guide" class="guide"><div class="BusMessageView">
	<div data-id="current" class="line">
		<p data-id="currenttext" class="desc_search"></p>
		<div data-id="currentupperparagraph" class="paragraph ">
            <div data-id="currentupperwrap" class="wrap">
                <strong class="screen_out">동명지역 선택상자</strong>
                <em class="screen_out">선택내용 :</em>
                <a data-id="currentupperlabel" class="label"></a>
                <em class="screen_out">선택옵션</em>
            </div>
			<p data-id="currentuppertext" class="desc_search text"></p>
		</div>
		<div data-id="currentlowerparagraph" class="paragraph ">
			<div data-id="currentlowerwrap">
				<a data-id="currentlowerlabel" class="label"></a>
			</div>
			<p data-id="currentlowertext" class="desc_search text"></p>
		</div>
	</div>
	<div data-id="next" class="line">
		<a href="#none" data-id="nexttext" class="link_search"></a>
		<div data-id="nextupperparagraph" class="paragraph ">
            <div data-id="nextupperwrap">
                <strong class="screen_out">동명지역 선택상자</strong>
                <em class="screen_out">선택내용 :</em>
                <a data-id="nextupperlabel" class="label"></a>
                <em class="screen_out">선택옵션</em>
            </div>
			<p data-id="nextuppertext" class="desc_search text"></p>
		</div>
		<div data-id="nextlowerparagraph" class="paragraph ">
			<div data-id="nextlowerwrap">
				<a data-id="nextlowerlabel" class="label"></a>
			</div>
			<p data-id="nextlowertext" class="desc_search text"></p>
		</div>
	</div>
</div></div>
					</div>
					<div id="info.bus.title" class="busTitle">
						<h3 class="title">검색결과</h3>
						<span id="info.bus.count" class="cntwrap"></span>
						<div id="info.bus.filter" class="filter"></div>
					</div>
					<ul id="info.bus.list" class="list"></ul>
					<div id="info.bus.page" class="pages HIDDEN">
						<div class="pageWrap">
							<button type="button" id="info.bus.page.prev" class="prev disabled">이전</button>
							<a id="info.bus.page.no1" class="INACTIVE" href="#">1</a> <a id="info.bus.page.no2" class="INACTIVE" href="#">2</a> <a id="info.bus.page.no3" class="INACTIVE" href="#">3</a> <a id="info.bus.page.no4" class="INACTIVE" href="#">4</a> <a id="info.bus.page.no5" class="INACTIVE" href="#">5</a>
							<button type="button" id="info.bus.page.next" class="next">다음</button>
						</div>
					</div>
					<div id="info.noBus" class="info_nobus HIDDEN"><div class="NoBusView">
    <h4 class="noKeyword">
        <!-- <img src="//t1.daumcdn.net/localimg/localimages/07/2013/img/new_nodata_icon.png" width="14" height="14"> 2018-12-11_v2 삭제 -->
        <!-- <span data-id="titleInfo"> 해당 버스번호의 검색결과가 없습니다. </span> --> 검색 결과가 없어요.
    </h4><!-- 2018-12-11_v2 수정 : 1. 불필요한 요소(span.textColor, span[data-id=titleInfo]) 제거 2. 텍스트 수정 3. 클래스 추가(.noKeyword)--><!-- 2018-12-18 수정 : 태그변경(h5~>h4) -->
    <div class="noRouteDesc" data-id="noRouteDesc"></div>
</div><div class="NoBusView">
    <h4 class="noKeyword">
        <!-- <img src="//t1.daumcdn.net/localimg/localimages/07/2013/img/new_nodata_icon.png" width="14" height="14"> 2018-12-11_v2 삭제 -->
        <!-- <span data-id="titleInfo"> 해당 버스번호의 검색결과가 없습니다. </span> --> 검색 결과가 없어요.
    </h4><!-- 2018-12-11_v2 수정 : 1. 불필요한 요소(span.textColor, span[data-id=titleInfo]) 제거 2. 텍스트 수정 3. 클래스 추가(.noKeyword)--><!-- 2018-12-18 수정 : 태그변경(h5~>h4) -->
    <div class="noRouteDesc" data-id="noRouteDesc"></div>
</div></div>
				</div>

			</div>
			<div id="info.subway" class="SubwayRouteSearch HIDDEN WHITEOUT">
				<h2 class="screen_out">지하철 검색</h2>
				<div class="SubwayRegion WHITEOUT">
					<ul id="info.subway.region">
					<li class="seoul seoul-INACTIVE seoul-ACTIVE"><a href="#">수도권</a></li><li class="busan busan-INACTIVE"><a href="#">부산</a></li><li class="daegu daegu-INACTIVE"><a href="#">대구</a></li><li class="gwangju gwangju-INACTIVE"><a href="#">광주</a></li><li class="daejeon daejeon-INACTIVE"><a href="#">대전</a></li></ul>
					<a href="#none" id="info.subway.remove" class="remove" title="모두 지우기">모두 지우기</a>
				</div>

				<div id="info.subway.searchBox" class="SubwayRouteSearchBox HIDDEN WHITEOUT">
					<div class="origindestBox">
						<div id="info.subway.searchBox.originBox" class="box">
							<form id="info.subway.searchBox.originForm" class="form">
								<input id="info.subway.searchBox.origin" class="q" type="text" value=""> <label for="info.subway.searchBox.origin"><span class="holderText op">출발역</span></label> <input class="submit" type="submit" value=""> <a href="#" id="info.subway.searchBox.originDelete" class="delete dl HIDDEN" title="출발역지우기">출발역지우기</a>
							</form>
							<blockquote id="info.subway.searchBox.originSuggest" class="SubwayOriginSuggest"><div class="suggestBox box_sub"><div class="baseBox bg"><div class="list"><ul class="suggest_list_target"></ul></div></div><div class="favorite_find HIDDEN"><ul class="list_find"></ul></div><div class="search_recent recent_none">
    <em class="tit_recent">히스토리가 없어요.</em>
    <ul data-id="wrap" class="list_recent"></ul>
    <div class="favorite_recent">
        <button data-id="disabled" type="button" class="btn_recentoff">히스토리 끄기</button>
        <button data-id="clear" type="button" class="btn_deleteall HIDDEN">전체삭제</button>
    </div>
</div></div></blockquote>
						</div>
						<a href="#" class="to" id="info.subway.searchBox.to" title="출발/도착 순서 바꾸기">출발/도착 순서 바꾸기</a>
						<div id="info.subway.searchBox.destBox" class="box dest">
							<form id="info.subway.searchBox.destForm" class="form">
								<input id="info.subway.searchBox.dest" class="q" type="text" value=""> <label for="info.subway.searchBox.dest"><span class="holderText dp">도착역</span></label> <input class="submit" type="submit" value=""> <a href="#" id="info.subway.searchBox.destDelete" class="delete dr HIDDEN" title="도착역지우기">도착역지우기</a>
							</form>
							<blockquote id="info.subway.searchBox.destSuggest" class="SubwayDestSuggest"><div class="suggestBox box_sub"><div class="baseBox bg"><div class="list"><ul class="suggest_list_target"></ul></div></div><div class="favorite_find HIDDEN"><ul class="list_find"></ul></div><div class="search_recent recent_none">
    <em class="tit_recent">히스토리가 없어요.</em>
    <ul data-id="wrap" class="list_recent"></ul>
    <div class="favorite_recent">
        <button data-id="disabled" type="button" class="btn_recentoff">히스토리 끄기</button>
        <button data-id="clear" type="button" class="btn_deleteall HIDDEN">전체삭제</button>
    </div>
</div></div></blockquote>
						</div>
					</div>
					<div class="options">
						<a href="#" id="info.subway.searchBox.optionBox" class="optionBox" title="옵션설정"> <span class="text">출발시간</span> <span class="arrow"></span>
						</a> <a href="#" id="info.subway.searchBox.dayBox" class="optionBox day" title="요일설정"> <span class="text">평일</span>
							<span class="arrow"></span>
						</a> <a href="#" id="info.subway.searchBox.hourBox" class="optionBox hour" title="시간설정"> <span class="text">시</span>
							<span class="arrow"></span>
						</a> <a href="#" id="info.subway.searchBox.minuteBox" class="optionBox minute" title="시간설정"> <span class="text">분</span>
							<span class="arrow"></span>
						</a>
						<ul id="info.subway.searchBox.listBox" class="listBox HIDDEN"></ul>
					</div>
					<div class="submitBox">
						<span id="info.subway.searchBox.submit" class="go">검색</span>
					</div>
					<div class="resultBox HIDDEN" id="info.subway.searchBox.resultBox">
						<strong class="tit_result">총 2건의 검색결과</strong> <a href="#none" class="endCheck"><span class="icon"></span>막차보기</a>
					</div>
				</div>
				<div id="info.subway.history"></div>
				<div id="info.subway.intro" class="Howto"><strong class="tit_intro">호선도 중요하지만,<br>시간이 더 중요하니까</strong><p class="desc_intro">언제 출발해야 하는지부터<br>몇분에 도착할지까지, 한 눈에 확인하세요.</p></div>
				<div id="info.subwayInfo" class="subwayInfo HIDDEN">
					<div class="SubwayRouteResultView">
						<h3 class="screen_out">지하철 경로</h3>
						<p class="firstTrainInfo HIDDEN"></p>
						<ul class="list"></ul>
					</div>
				</div>
			</div>
			<div id="info.my" class="FavoriteListView HIDDEN">
				<h2 class="screen_out">MY</h2>
				<div data-id="tab" class="FavoriteMethodType HIDDEN">
					<ul>
						<li id="my.subtab.favorite" class="ACTIVE"><a href="#none">즐겨찾기</a></li>
						<li id="my.subtab.static" class="INACTIVE"><a href="#none">내
								장소</a></li>
						<li id="my.subtab.review" class="INACTIVE"><a href="#none">후기</a></li>
					</ul>
				</div>

				<div class="favorite_interlock HIDDEN">
					<div id="my.favorite" class="favorite_result">
						<h3 class="screen_out">즐겨찾기</h3>
						<div class="favorite_directory">
							<div data-id="header"></div>
							<div data-id="list" class="FavoriteBodyList">
								<div data-id="banner" class="FavoriteBookmarkLink HIDDEN">
									<a href="#none" class="link_bookmark" data-id="bannerContent"></a>
									<button data-id="bannerClose" type="button" class="ico_mypage bt_close">닫기</button>
								</div>
								<div class="box_notice HIDDEN" data-id="boxNotice">
									<span class="ico_mypage ico_noti"></span>즐겨찾기는 500개까지 추가할 수
									있습니다.
								</div>
								<ul class="list_detail"></ul>
								<div id="info.my.favorite.page" data-id="pagination" class="pages HIDDEN">
									<div class="pageWrap">
										<button type="button" id="info.my.favorite.page.prev" class="prev disabled">이전</button>
										<a id="info.my.favorite.page.no1" class="INACTIVE" href="#">1</a>
										<a id="info.my.favorite.page.no2" class="INACTIVE" href="#">2</a>
										<a id="info.my.favorite.page.no3" class="INACTIVE" href="#">3</a>
										<a id="info.my.favorite.page.no4" class="INACTIVE" href="#">4</a>
										<a id="info.my.favorite.page.no5" class="INACTIVE" href="#">5</a>
										<button type="button" id="info.my.favorite.page.next" class="next">다음</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div id="my.static" class="favorite_homecorp HIDDEN">
						<h3 class="screen_out">집회사</h3>
						<ul data-id="staticList"><li class="FavoriteDirectoryItem">
    <div class="FavoriteInformationBundle">
        <span data-id="icon" class="ico_homecorp home"></span><!-- 아이콘 모양 변경시 클래스 추가 요청 -->
        <div class="info_directory">
            <div class="tit_directory">
                <strong data-id="link" class="txt_directory"><a href="#none" class="link_txt">집</a></strong>
            </div>
            <div class="desc_directory">
                <p data-id="name">주소를 등록하면 길찾기가 쉬워집니다.</p>
            </div>
        </div>
        <div data-id="options" class="group_btn HIDDEN">
            <a href="#" data-id="update" class="link_btn">
                <span class="ico_mypage ico_modify">수정</span>
            </a>
            <a href="#" data-id="remove" class="link_btn">
                <span class="ico_mypage ico_delete">삭제</span>
            </a>
        </div>
    </div>
</li><li class="FavoriteDirectoryItem">
    <div class="FavoriteInformationBundle">
        <span data-id="icon" class="ico_homecorp company"></span><!-- 아이콘 모양 변경시 클래스 추가 요청 -->
        <div class="info_directory">
            <div class="tit_directory">
                <strong data-id="link" class="txt_directory"><a href="#none" class="link_txt">회사/학교</a></strong>
            </div>
            <div class="desc_directory">
                <p data-id="name">주소를 등록하면 길찾기가 쉬워집니다.</p>
            </div>
        </div>
        <div data-id="options" class="group_btn HIDDEN">
            <a href="#" data-id="update" class="link_btn">
                <span class="ico_mypage ico_modify">수정</span>
            </a>
            <a href="#" data-id="remove" class="link_btn">
                <span class="ico_mypage ico_delete">삭제</span>
            </a>
        </div>
    </div>
</li></ul>
						<div class="group_tit">
							<h3 class="tit_myplace">자주 가는 장소</h3>
							<span class="info_count"> ( <span class="num_count" data-id="spotTotalCount"></span> / <span class="num_total">5</span>
								)
							</span>
						</div>
						<ul data-id="spotList"></ul>
					</div>

					<div id="my.review" class="favorite_evaluation HIDDEN">
						<h3 class="screen_out">후기</h3>
						<div data-id="reviewHeader">
							<div data-id="reviewEmptyPage" class="FavoriteEmptyPage HIDDEN">
								<p class="desc_empty">후기가 없습니다.</p>
							</div>
							<div data-id="filteredReviewEmptyPage" class="FavoriteEmptyPage empty_type2 HIDDEN">
								<p class="desc_empty">후기가 없습니다.</p>
								<p class="desc_sub">
									적용한 필터에 해당하는 후기가 없습니다.<br>필터 조건을 변경해 주세요.
								</p>
							</div>
							<div data-id="reviewFilters" class="info_result"></div>
						</div>
						<div data-id="reviewList" class="FavoriteBodyList">
							<ul></ul>
						</div>
						<div id="my.review.page" class="pages HIDDEN">
							<div class="pageWrap">
								<button type="button" id="my.review.page.prev" class="prev disabled">이전</button>
								<a id="my.review.page.no1" class="ACTIVE" href="#">1</a> <a id="my.review.page.no2" class="INACTIVE" href="#">2</a> <a id="my.review.page.no3" class="INACTIVE" href="#">3</a> <a id="my.review.page.no4" class="INACTIVE" href="#">4</a> <a id="my.review.page.no5" class="INACTIVE" href="#">5</a>
								<button type="button" id="my.review.page.next" class="next">다음</button>
							</div>
						</div>
					</div>
				</div>
				<div id="info.my.intro" class="Howto JOIN HIDDEN">
					<strong class="tit_intro">자주 가는 장소는<br>등록해서 사용해요
					</strong>
					<p class="desc_intro">
						집이나 회사 등 자주 가는 장소는 즐겨찾기로 등록하여<br>언제 어디서나 쉽고 빠르게 확인하세요.
					</p>
					<a href="#none" class="link_my"> 로그인</a>
				</div>
			</div>

			<div id="info.issue" class="section" style="display: none">
				<div id="info.issue.place">
					<h5>
						폭우 피해지도 <span id="info.issue.place.issueCnt"></span>건
					</h5>
					<ul id="info.issue.place.list"></ul>
					<a id="info.issue.place.more" class="more" href="#">장소 더보기(<strong id="info.issue.place.more.count">0</strong>)
					</a>
				</div>
			</div>
		</div>
		<div id="info.nativeAds" class="HIDDEN"><div class="AdItem"><a data-id="ad_wrap" href="https://tr.ad.daum.net/clk?wa=QC487cafPU_23m98lVUEawYJIXIorRP539F6sK6ODY0&amp;enc=6bmzMIq-3gWwcd5kvroLf0T9sz6MFiiuODlyUt8SGopNhFG9vwsunLyQebmDyAykmwr-cGysx1-z60bJtuDvxILZFCy6PdVHOjR59eCdinAUv6DqQGVNkyr49LIe8ASz4osrFbRVQLejsPv5g9lGxnHVPkZQnjBKMfk-sEwQqDxWZwnYKOp3dTnIYnVVw9YS3lYod71pYqHR9qjca1QWT_yuGh2wZbvR-_SYGLVhzgC_yASs42aEDruEO5uFBjuyg2XSj9afixLYh64CncI_aNRLG2FVXsrEIBO-M8tO_9czNo6RZCgPrK5wXRjJjU0qJ0Petuc37cUPy72ds3HXXEgDBXRvdnssHt4OMkP36iYegeu_SrEwDK_2IKFN5tpc3ceB-KW4S_Q0CWTWIxK3Zcr6ssw-ifysXHzO5a0LT4_d50_eGedII9XPb0dMxoSnOQE2eu6NKuxlVsHyqHZAaq7XvdE-kqgYsbTBvl_cfBwh3wYuORWzxVlQBS6g0GvFr9XvjRtUc_ZFzwnVm_qvTazxC1AJ07aq6GS6qlfJHS6-OaK49AGlaqLITwLYkQ5uKDwuZtMzXcUDI2T76RTvoChq3SjqBYgvxahYPLRwskQv77eIMOKk9iaxHyM4ZnCEvRrdMelV6d0iX7NHDpeISDoxGWPvD0IFn4S8e2Pfe7G8prXhKEwmq1QWzfCtnKodEIIlhJr6LpLg_tCbsZL1xxKVPnrJ9jYi6oKauPifiHA&amp;signature=a3b613b6dc0e128a2dd2824b0d3fd801&amp;lc=1" class="link_ad" adfit-unit-id="DAN-PPw9l53WnAgA0rNK" adfit-landing-url="" id="kakao_ad_WV74p2" target="_blank">   <div class="wrap_thumb">       <img data-id="image" adfit-profile-img-url="" adfit-icon-width="70" adfit-icon-height="70" class="thumb_ad" width="70" src="https://t1.daumcdn.net/b2/creative/369063/b6327caa58e15901fa11d44faae0fba0.png" alt="광고 포토샵 하나만 구매해도 수백 개 무료 폰트가">       <span class="frame_thumb"></span>   </div>   <div class="info_ad">      <strong data-id="title" class="tit_ad"><span adfit-profile-name="" style="pointer-events: auto; cursor: pointer;">Adobe</span><span class="ico_ad" adfit-ad-info="">AD</span></strong>      <p data-id="description" class="desc_ad" adfit-title="" style="pointer-events: auto; cursor: pointer;">포토샵 하나만 구매해도 수백 개 무료 폰트가!</p>   </div></a></div></div>

		<div id="info.notice" class="notice HIDDEN">
			<h2 class="screen_out">공지사항</h2>
			<div class="noticeList">
				<ul>
					<li id="info.main.notice.text1"><span class="ico_notice">공지</span>
						<a href="https://kakaomap.tistory.com/399" target="_blank">카카오맵
							PC 지하철 노선도가 개선되었어요.</a></li>
				</ul>
				<a id="info.main.notice.more" href="http://kakaomap.tistory.com" target="_blank" class="link_more">더보기</a>
			</div>
		</div>
		<div id="info.my.footer" class="FavoriteFunctionToolBar HIDDEN"></div>

		<div id="info.footer" class="footer"><div class="WalkFunctionToolBarView HIDDEN">
	<a href="#none" data-id="print" class="print">경로인쇄</a>
	<a href="#none" data-id="alook" class="alook">경로 한눈에</a>
	<a href="#none" data-id="favorite" class="favorite">
        <span class="ico_fav">
            <span class="num">0</span>
        </span>
        즐겨찾기
    </a>
</div><div class="BikeFunctionToolBarView HIDDEN">
	<a href="#none" data-id="print" class="print">경로인쇄</a>
	<a href="#none" data-id="alook" class="alook">경로 한눈에</a>
    <a href="#none" data-id="favorite" class="favorite">
        <span class="ico_fav">
            <span class="num">0</span>
        </span>
        즐겨찾기
    </a>
</div></div>
		<div id="footer" class="Footer">
			<a class="xa" target="_blank" href="https://cs.kakao.com/helps?locale=ko&amp;service=101">고객센터</a> <a class="xc" href="#none" data-pos="footer" data-channel="SEARCH_BOTTOM_NEWPLACE">신규 장소 등록</a> <a target="_blank" href="https://www.kakao.com/policy/privacy?type=p&amp;lang=ko"><strong>개인정보처리방침</strong></a>
		</div>
	</div>