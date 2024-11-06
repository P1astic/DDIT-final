<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css"
	rel="stylesheet" media="screen" />

<form action="/userPass/pwUpdate" method="post" id="pwUpdateForm"
	name="pwUpdateForm">
	<input type="hidden" id="memberId" name="memberId"
		value="${login.memberId}">
	<div class="col-sm-8 col-sm-offset-2">
		<div class="panel panel-default panel-margin-10">
			<div class="panel-body panel-body-content text-center">
				<p class="lead">비밀번호 확인</p>
				<div class="form-group">
					<input type="password" name="memberPw" id="memberPw"
						class="form-control form-control-inline text-center"
						placeholder="현재 비밀번호" />
				</div>

				<button type="button" id="pwUpdate"
						name="pwUpdate" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</form>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#pwUpdate").on("click", function() {
			if ($("#memberPw").val == "") {
				alert("현재 비밀번호를 입력해주세요");
				$("#memberPw").focus();
				return false
			}

			$.ajax({
				url : "/userPass/pwCheck",
				type : "POST",
				dataType : "json",
				data : $("#pwUpdateForm").serializeArray(),
				success : function(data) {

					if (data == 0) {
						alert("패스워드가 틀렸습니다.");
						return;
					} else {
						if (confirm("진입")) {
							$("#pwUpdateForm").submit();
						}

					}
				}
			})

		});

	})
</script>
