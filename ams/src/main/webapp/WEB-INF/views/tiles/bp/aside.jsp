<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<style>

	.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	    color: #1890FF;
	    font-weight:bold;
	    background-color:transparent;
	    
	}
	.nav-treeview .nav-item .nav-link.active {
	    color: #1890FF;
	    background-color:transparent;
	}
	
	._sidebarHead{
		background-color : #F8F9FA;
	}
	
	._sidebarHeadText{
	    color: #6c757d;
	    font-weight:500;
	}
	
	._sidebarHeadLink{
		text-decoration-line:none;
	}
	
</style>
<script>
var menuReset = "${menuReset}";

$(window).on("load", function(){
	
	if(menuReset === 'true'){
		localStorage.removeItem("openMenu");
	}
	
    $(".nav-link").on("click", function() {
        var href = $(this).attr('href');
        if (href !== "#") {
            window.location.href = href;
        }
    });
    
    // 페이지가 로드될 때 열린 메뉴를 유지
    var openMenu = localStorage.getItem("openMenu");
    if (openMenu) {
        $('#' + openMenu).addClass('menu-open');
        $('#' + openMenu + ' > a').addClass('active');
        $('#' + openMenu).parents('.nav-item').addClass('menu-open');
        $('#' + openMenu).parents('.nav-item').children('a').addClass('active');
    }else{
        $('#menuB020101').addClass('menu-open');
        $('#menuB020101 > a').addClass('active');
    }

    // 메뉴 항목 클릭 시 열림 상태를 localStorage에 저장
    $('.nav-item > a').on('click', function() {
        var menuId = $(this).parent().attr('id');
        localStorage.setItem("openMenu", menuId);
    });
    
    $("#menuC010101").on("click", function(){
    	window.location.href = "/bp/main";
    })    
    
});
</script>

<!-- 
	2024.09.27. 홍정호
	사이드바 메뉴 동적으로 구현 완료
 -->
<aside class="main-sidebar elevation-4" style="font-family: Pretendard;">
	<div class="_sidebarHead">
	    <a href="/bp/board/list" class="brand-link _sidebarHeadLink"> 
	        <img src="/resources/images/favicon/airplane3.png" alt="AMS Logo"
	        	 class="brand-image img-circle">
	        <span class="brand-text _sidebarHeadText">AMS</span>
	    </a>
	</div>
	<div class="sidebar bg-light overflow-auto">
	    <nav class="mt-2">
	        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
	        	<c:forEach var="authMenu" items="${authMenuList}">
	        		<c:choose>
	        			<c:when test="${authMenu.level == 1}">
	        				<li class="nav-item" id="menu${authMenu.mnCd}">
	        					<a href="${authMenu.mnUrl }" class="nav-link">
	        						<c:if test="${authMenu.mnCd =='C010101'}">
	        							<i class="bi bi-house-door-fill"></i><!-- 홈 -->
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'B020101' || authMenu.mnCd =='E020101' }">
				        				<i class="bi bi-megaphone-fill"></i><!-- 공지사항 -->
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'B030101' || authMenu.mnCd =='E030101'}">
	        							<i class="bi bi-file-earmark-person-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E040505'}">
	        							<i class="bi bi-car-front-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E080101' }">
	        							<i class="bi bi-clipboard-check-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E040101' || authMenu.mnCd == 'E070101' }">
	        							<i class="bi bi-people-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E100101' }">
	        							<i class="bi bi-calendar-check-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd== 'E090101' }">
	        							<i class="bi bi-building-fill"></i>
	        						</c:if>
        						    <c:if test="${authMenu.mnCd == 'E120101'}">
	        							<i class="bi bi-wrench"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E140101'}">
	        							<i class="bi bi-box-seam-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E130101'}">
	        							<i class="bi bi-bag-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E150101' || authMenu.mnCd == 'E180101' || authMenu.mnCd == 'E200101'}">
	        							<i class="bi bi-lock-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E160101' || authMenu.mnCd == 'B210101' || authMenu.mnCd == 'B040101' }">
	        							<i class="bi bi-airplane-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E170101'}">
	        							<i class="bi bi-chat-left-text-fill"></i>
	        						</c:if>
	        						<c:if test="${authMenu.mnCd == 'E040501' }">
	        							<i class="bi bi-coin"></i>
	        						</c:if>	        											
			        				<p>${authMenu.mnTitle}
			        				<c:if test="${authMenu.mnUrl eq '#' }">
			        					<i class="fas fa-angle-left right"></i>
			        				</c:if>
			        				</p>
	        					</a>
	        					<ul class="nav nav-treeview">
	        						<c:forEach var="subMenu" items="${authMenuList}">
	        							<!-- 하위 메뉴: Level 2 -->
	        							<c:if test="${subMenu.parentMnCd == authMenu.mnCd && subMenu.level > authMenu.level}">
	        								<li class="nav-item _sub" id="menu${subMenu.mnCd}">
	        									<a href="${subMenu.mnUrl }" class="nav-link" style="padding-left:20px;">
	        										<i class="bi bi-dot"></i>
	        										<p>${subMenu.mnTitle}
		        										<c:if test="${subMenu.mnUrl eq '#' }">
			        										<i class="fas fa-angle-left right"></i>
		        										</c:if>
	        										</p>
	        									</a>
	        									<ul class="nav nav-treeview">
	        										<c:forEach var="subsubMenu" items="${authMenuList}">
	        											<c:if test="${subsubMenu.parentMnCd == subMenu.mnCd && subsubMenu.level >  subMenu.level}">
	        												<li class="nav-item _subsub" id="menu${subsubMenu.mnCd}">
	        													<a href="${subsubMenu.mnUrl }" class="nav-link" style="padding-left:40px;">
	        														${subsubMenu.mnTitle }
	        													</a>
	        												</li>
	        											</c:if>
	        										</c:forEach>
	        									</ul>
	        								</li>
	        							</c:if>
	        						</c:forEach>
	        					</ul>
	        				</li>
	        			</c:when>
	        		</c:choose>
	        	</c:forEach>
	        </ul>
	    </nav>
	</div>
</aside>