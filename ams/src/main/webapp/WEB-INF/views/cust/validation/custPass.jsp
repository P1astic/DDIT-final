
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/airport.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/board.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/kac_n.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/kac.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/layout.css">
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/slick.css">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//휴대폰 번호 인증var code2 = "";

		var code2 = "";
		var parking = "${link}"; // 또는 실제 값으로 대체
		var cus = "${link}"; // 또는 실제 값으로 대체
		
		   // 휴대폰 번호 인증
        $("#phoneChk").click(function() {
            var phone = $("#phoneNumber").val();
            var name = $("#name").val();

            // 유효성 검사
            if (!phone || !name) {
                alert("전화번호와 이름을 입력해주세요.");
                return;
            }

            alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');

            $.ajax({
                type: "POST",
                url: "/cust/validation/sendSMS",
                data: {
                    "phone": phone,
                    "name": name
                },
                cache: false,
                dataType: "text",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function(data) {
                    console.log("phoneChk->data : ", data);

                    if (data.trim() === "error") {
                        alert("휴대폰 번호가 올바르지 않습니다.");
                    } else {
                        alert("휴대폰 인증번호가 발송되었습니다.");
                        code2 = data; // 성공하면 데이터 저장
                    }
                },
                error: function(error) {
                    console.error("에러 :", error);
                    alert("서버와의 통신에 문제가 발생했습니다.");
                }
            });
        });

        // 휴대폰 인증번호 대조
        $("#phoneChk2").click(function() {
            var phone = $("#phoneNumber").val();
            var name = $("#name").val();
            var validation = $("#validation").val();

            // 유효성 검사
            if (!validation) {
                alert("인증번호를 입력해주세요.");
                return;
            }

            $.ajax({
                url: "/cust/validation/validationCode",
                type: "POST",
                data: {
                    "validation": validation
                },
                dataType: "text",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function(data) {
                    console.log("data : ", data);

                    if (data.trim() === "error") {
                        alert("인증번호가 일치하지 않습니다.");
                    } else if (data.trim() === "success") {
                        alert("인증되었습니다.");
                        code2 = data; // 성공하면 데이터 저장

                        if ("parking" === "${link}") {
                            window.location.href = "/cust/parking/reservation?phone=" + phone;
                        }
                        if ("cus" === "${link}") {
                        	window.location.href = "/cust/cus/cusForm?name=" + name + "&phone=" + phone;
                        }
                        if("cusList" === "${link}"){
                        	window.location.href = "/cust/cus/cusList?name=" + name + "&phone=" + phone;
                        }
                    } else {
                        alert("알 수 없는 응답입니다: " + data);
                    }
                },
                error: function(error) {
                    console.log("에러 : " + error);
                    alert("서버와의 통신에 문제가 발생했습니다.");
                }
            });
        });
    });
</script>


<!-- 
ss.setAttribute("ran_str", ran_str);
ss.setAttribute("message_id", response.getMessageId());
 -->
<!-- 확인할 때는 문자 확인 후 새 탭을 열어서 동일한 URL을 확인함
ran_str : 764265
message_id : M4V20241009112448LRIIB8XG2ZM7YUQ
 -->
<%-- <p>ran_str : ${sessionScope.ran_str}</p> --%>
<%-- <p>message_id : ${sessionScope.message_id}</p> --%>
<script type="text/javascript">
	var showDiv = function(type) {
		console.log("type : ", type);

		$("#passkeyDiv").css("display", "none"); // Hide by default

		switch (type) {
		case "passkey":
			$("#phoneChk").addClass("active");
			$("#passkeyDiv").css("display", ""); // Show the div
			break;
		}
	};
</script>


<!-- </head> -->
<div id="contents">
<div class="d-flex flex-column align-items-center justify-content-center">
    <div class="left" style="width:50%; padding-left:50px;">
        <fieldset class="justify-content-center" style="width:70%;">
            <legend>본인인증</legend>
            <div class="sint">
                <input type="text" id="name" name="name" placeholder="이름" title="이름을 입력해주세요." autocomplete="new-password">
            </div>
            <div class="sint">
                <input type="text" id="phoneNumber" name="phoneNumber" placeholder="전화번호" title="전화번호 입력해주세요">
            </div>
            <!-- 버튼을 Flexbox로 가운데 정렬 -->
            <div class="d-flex justify-content-center">
                <button type="button" class="sbtn red" id="phoneChk" title="인증번호 받기" onclick="showDiv('passkey')" style="width:100%; height:40px; margin-top:20px;">
                    <span style="height: 40px; text-align: center; line-height: 0;">인증번호 받기</span>
                </button>
            </div>
        </fieldset>
    </div>
    
    <div class="right2" style="width:50%;">
        <div class="right" id="passkeyDiv" style="margin-top:15px; display:none; padding-left:50px;">
            <fieldset class="justify-content-center" style="width:70%;">
                <legend>인증번호</legend>
                <div class="sint">
                    <input type="text" id="validation" name="validation" placeholder="인증번호" title="인증번호를 입력해주세요." autocomplete="new-password">
                </div>
                <!-- 버튼을 Flexbox로 가운데 정렬 -->
                <div class="d-flex justify-content-center">
                    <button type="button" class="sbtn red" id="phoneChk2" title="확인" style="width:100%; height:40px; margin-top:20px;">
                        <span style="height: 40px; text-align: center; line-height: 0;">확인</span>
                    </button>
                </div>
            </fieldset>
        </div>
    </div>
</div>

</div>

<!-- 비밀번호 조건 코드 <!-- 					onkeypress="if(event.keyCode == 13){goLogin();return false;}" -->
<!-- 					autocomplete="new-password"> -->