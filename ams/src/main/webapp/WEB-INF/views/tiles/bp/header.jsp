<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<style>

	.main-header{
		background-color :#F8F9FA;
		position:fixed;
		width:1274px;
		z-index:1000;
	}
	
	.fa-bars:before {
		color:#6c757d;
		margin-left : auto;
	}
	
	.profileImg{
		width: 40px;
		height: 40px;
		border-radius: 9999px;
		box-shadow: 0 0 0 2px #c3c3c3; 
		box-sizing: border-box;	
	}

</style>

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<nav class="main-header navbar navbar-expand" style="font-family: Pretendard;">
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
			href="#" role="button"><i class="fas fa-bars"></i></a></li>
	</ul>
	<ul class="navbar-nav ml-auto align-items-center" style="padding-right:250px;">
		<li class="nav-item">
			<c:if test="${empty memVO.bpVO.bpImgUrl }">
				<img class="profileImg" src="/resources/images/profile.jpg">
			</c:if>
			<c:if test="${!empty memVO.bpVO.bpImgUrl }">
				<img class="profileImg" src="/donwload?filePath=${memVO.bpVO.bpImgUrl}&fileOrgnlFileNm=${memVO.bpVO.bpImgUrl}">
			</c:if>
		</li>
		<li class="nav-item ml-3">
			${memVO.bpVO.bpNm} 님
		</li>
		<!-- Navbar Search -->
		<li class="nav-item ml-3">
			<form id="logoutForm" action="/logout" method="post">
		        <input type="submit" id="logout" style="display: none;" />
		        <button type="button" class="btn" onclick="document.getElementById('logoutForm').submit();" style="background-color:white">
		            <i class="fa fa-sign-out-alt" style="color:#6c757d"></i>
		        </button>
		        <sec:csrfInput/>
			</form>
		</li>
	</ul>
</nav>

<script>
$(function(){
    let pushMenuButton = document.querySelector('[data-widget="pushmenu"]');
    let navBar = document.querySelector('.navbar-nav.ml-auto');
    
    pushMenuButton.addEventListener('click', function() {
        // 사이드바가 접히면 padding-right를 제거하고, 다시 펼치면 추가하는 로직
        if (navBar.style.paddingRight === '70px') {
            navBar.style.paddingRight = '250px';  // 사이드바가 펼쳐질 때
        } else {
            navBar.style.paddingRight = '70px';    // 사이드바가 접힐 때
        }
    });
	
})
</script>