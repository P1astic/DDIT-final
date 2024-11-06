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


<!-- <script> -->

<!-- </script> -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지 - 내 정보</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
}

.container {
	width: 80%;
	margin: 0 auto;
	background-color: white;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.section-header {
	font-size: 18px;
	margin-bottom: 10px;
}

.profile-info {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.profile-info img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background-color: #ddd;
}

.profile-details {
	margin-left: 20px;
}

.profile-details table {
	width: 100%;
	border-collapse: collapse;
}

.profile-details table td {
	padding: 5px 0;
}

.profile-details table td:first-child {
	font-weight: bold;
}

.input-section {
	margin-top: 20px;
}

.input-section table {
	width: 100%;
	border-collapse: collapse;
}

.input-section table td {
	padding: 10px 0;
}

.input-section table td:first-child {
	font-weight: bold;
	width: 150px;
}

.input-section input[type="text"], .input-section input[type="password"]
	{
	width: calc(100% - 20px);
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.button-section {
	text-align: right;
	margin-top: 20px;
}

.button-section button {
	padding: 10px 20px;
	background-color: #5cb85c;
	border: none;
	color: white;
	border-radius: 4px;
	cursor: pointer;
}

.button-section button.cancel {
	background-color: #d9534f;
}
</style>
</head>
<body>
	<div class="container">
		<div class="section-header">마이페이지 - 내 정보</div>

		<div class="profile-info">
			<img src="profile_placeholder.png" alt="Profile Image">
			<div class="profile-details">
				<table>
					<tr>
						<td>사원명:</td>
						<td>김인호</td>
					</tr>
					<tr>
						<td>직책구분:</td>
						<td>정규</td>
					</tr>
					<tr>
						<td>부서:</td>
						<td>경영본부</td>
					</tr>
					<tr>
						<td>직위:</td>
						<td>과장</td>
					</tr>
					<tr>
						<td>입사일자:</td>
						<td>2023-03-06</td>
					</tr>
					<tr>
						<td>사번:</td>
						<td>a002</td>
					</tr>
					<tr>
						<td>이메일:</td>
						<td>lake@ams.or.kr</td>
					</tr>
					<tr>
						<td>휴대전화:</td>
						<td>010-1234-1234</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="input-section">
			<table>
				<tr>
					<td>비밀번호:</td>
					<td><input type="password" id="password" value="java123"></td>
				</tr>
				<tr>
					<td>비밀번호 확인:</td>
					<td><input type="password" id="password_confirm"
						value="java123"></td>
				</tr>
				<tr>
					<td>성별:</td>
					<td>남자</td>
				</tr>
				<tr>
					<td>생년월일:</td>
					<td><input type="text" value="1993.12.19"></td>
				</tr>
				<tr>
					<td>이메일:</td>
					<td><input type="text" value="lake123@gmail.com"></td>
				</tr>
				<tr>
					<td>주민번호:</td>
					<td><input type="text" value="931219-1******"></td>
				</tr>
			</table>
		</div>

		<div class="button-section">
			<button type="submit">저장</button>
			<button type="button" class="cancel">취소</button>
		</div>
	</div>
</body>
</html>



<!-- <div class="form-group"> -->
<!-- 	<label for="carNum">자동차</label> <select name="carNum" id="carNum" -->
<!-- 		class="form-control" required> -->
<%-- 		<option value="${perSerVO.carNum}">${perSerVO.carNum}</option> --%>
<!-- 	</select> -->
<!-- </div> -->

<!-- <div class="form-group"> -->
<!-- 	<label for="amt">수리비</label> <input type="number" class="form-control" -->
<%-- 		name="amt" id="amt" placeholder="수리비" value="${perSerVO.amt}" readonly /> --%>
<!-- </div> -->