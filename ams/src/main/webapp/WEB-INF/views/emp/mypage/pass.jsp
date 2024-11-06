<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css"
	rel="stylesheet" media="screen" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

</div>

<div class="form-group">

	<label>비밀번호 재확인</label> <input type="text" class="form-control"
		placeholder="비밀번호 입력 후 정보 확인이 가능합니다">
</div>
<c:if test="${result.password =  pass.password.}">
	<label> <input type="checkbox"><a
		href="emp/mypage/info"></a>
	</label>
</c:if>
