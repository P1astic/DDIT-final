<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2></h2>


<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<section class="content">
	<div class="error-page">
		<h2 class="headline text-warning">${SPRING_SECURITY_403_EXCEPTION.getMessage()}</h2>
		<div class="error-content">
			<h3>
				<i class="fas fa-exclamation-triangle text-warning"></i> 
				권한이 없는 페이지입니다.
			</h3>
			<p>
				<a href="/">로그인 페이지로 이동</a>
			</p>	
		</div>
	
	</div>
</section>