
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//휴대폰 번호 인증var code2 = "";
		$("#phoneChk").click(
				function() {
					alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
					var phone = $("#phoneNumber").val();
					console.log(phone);
					$.ajax({
						type : "POST", // post 형식으로 발송
						url : "/cust/validation/sendSMS", // controller 위치
						data : {
							phone : phone
						}, // 전송할 ㅔ이터값
						cache : false,
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(data) {
							if (data == "error") { //실패시 
								alert("휴대폰 번호가 올바르지 않습니다.")
							} else { //성공시        
								alert("휴대폰 전송이  됨.")
								code2 = data; // 성공하면 데이터저장
							}
						},
						error : function(error) {
							console.error("에러 :" + error);
						}

					});
				});

		//휴대폰 인증번호 대조
		$("#phoneChk2").click(
				function() {

					var validation = $("#validation").val();
					console.log("입력한 번호 : " + validation);

					$.ajax({
						url : "/cust/validation/validationCode",
						type : "POST",
						data : {
							validation : validation
						},
						cache : false,
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(data) {
							if (data == "error") { //실패시 
								alert("인증번호가 일치하지 않습니다.")
							} else { //성공시        
								alert("인증되었습니다.")
								code2 = data; // 성공하면 데이터저장
							}
						},
						error : function(error) {
							console.log("에러 : " + error);
						}
					})
				});

	});
</script>
<script>
// 인증번호 전송
		$(document).on('click','#goSMS', function () {		// 버튼을 클릭 했을 경우
			let userPhoneNum = $('#userPhoneNum').val();	// 사용자가 입력한 전화번호
			let authCode= $("#authCode");	//휴대폰 인증번호 담을 변수

			// 사용자가 입력한 전화번호가 공백이 아니고, 8자리 이상일 경우
			if (userPhoneNum != '' && userPhoneNum.length > 8) {
				$.ajax({
					url: '/main/execute',	// 요청보낼 url
					method: 'get',
					data: {'userPhoneNum': userPhoneNum},	// 사용자가 입력한 휴대폰번호 전송
					success: function (response) {
						authCode.attr('value', response);	// authCode의 속성 value값을 인증번호로 설정
						console.log("input태그에 담긴 인증번호: " + authCode.val());	// 확인용

						alert('인증 번호가 발송 되었습니다.');
					},
					error: function(response) {
						alert('인증번호 발송에 실패하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.')
					}
				});
			}else{
				alert("휴대폰 번호를 입력 해 주세요");
			}
		});
	});
	
	// 인증번호 확인
	$(document).on('click', '#confirmBnt', function () {
			// 인증번호가 공백이 아니고 0 이상일 경우
			if (authNumber != '' && parseInt(authNumber) > 0) {	// val()로 받으면 문자열이기 때문에 형변환
				if(authNumber == authCode){
					cnfCheck = true;
					alert('휴대폰 번호 인증이 완료되었습니다. 감사합니다.');
				} else {
					alert('인증번호가 일치하지 않습니다.');
				}
				// 인증번호를 입력하지 않았을 경우
			}else{alert("인증번호를 입력 해 주세요"); cnfCheck = false;}
	});

	</script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="line_inp">
	<p class="form_title">휴대폰 번호</p>
	<input type="tel" class="inp" id="userPhoneNum" name="userPhoneNum"
		placeholder="휴대폰 번호를 - 없이 입력해주세요" /> <input type="button"
		class="half_button" id="goSMS" value="SMS 전송" />
</div>
<div class="line_inp confirmDiv" style="display: none">
	<p class="form_title">인증번호</p>
	<input class="inp" id="authNumber" type="tel"
		placeholder="SMS로 수신된 인증번호 5자리를 입력해주세요" /> <input type="hidden"
		id="authCode" /> // 발급된 인증번호를 저장할 hidden <input> 태그 <input
		type="button" class="half_button" id="confirmBnt" value="인증" />
</div>




