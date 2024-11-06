<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/emp/regist.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.btn{
background-color: white;
} 
</style>
<script>
$(function(){
		//입력버튼
		$("#selectt").on("click",function(){
			
			var  empNm         =  '양사원';
			var  empEml        =  'yy1234@naver.com';
			var  empZip        =  '12345';
			var  empRoadNmAddr  =  '서울 중구 다동길 5';
			var  empDaddr      =  '광일빌딩';
			var  empRrno       =  '1990-08-05';
			var  empMoblphon   =  '01012341234';
			var  empJncmpYmd   =  '2024-10-17';
			var  empGender     =  'V1';
			var  deptCd        =  'C1';
			var  jbgdCd        =  'B7';
			var  authCd        =  'ROLE_FA_STF';
			var profileImg     =  $("#profileImg").attr("src");
			
			$("#empNm ").val(empNm );
			$("#empEml").val(empEml);
			$("#empZip").val(empZip);
			$("#empRoadNmAddr").val(empRoadNmAddr);
			$("#empDaddr").val(empDaddr);
			$("#empRrno ").val(empRrno );
			$("#empMoblphon").val(empMoblphon);
			$("#empJncmpYmd").val(empJncmpYmd);
			$("#empGender").val(empGender);
			$("#deptCd ").val(deptCd);
			$("#jbgdCd ").val(jbgdCd);
			$("#authCd ").val(authCd);
		
	
			// 유효성 검사를 위한 blur 이벤트 트리거
		    $("#empNm, #empNm,#empEml, #empZip, #empRoadNmAddr, #empDaddr, #empRrno, #empMoblphon, #empJncmpYmd, #empGender, #deptCd, #jbgdCd ,#authCd").trigger("blur");
		});
		
		
		$('#deleteImageBtn').on('click', function() {
	        // 프로필 이미지를 기본 이미지로 변경
	        $('#profileImg').attr('src', '/resources/images/profile.jpg');
	        
	        // 서버로 전송되는 이미지 경로(hidden input)도 초기화
	        $('#bpImgUrl').val('');
	    });
		
		//파일명 미리 보기 호출
		$('#uploadFile').on('change', function(event) {
		    var file = event.target.files[0];
		    if (file) {
		        var reader = new FileReader();
		        reader.onload = function(e) {
		            // 새롭게 선택한 이미지를 미리보기로 보여줌
		            $('#profileImg').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(file);
		    }
		});
		
		  $('#uploadFile').on('change', function(event) {
			    var file = event.target.files[0];
			    var validTypes = ['image/jpeg', 'image/png', 'image/gif']; // 허용되는 파일 타입
			    var maxSize = 2 * 1024 * 1024; // 최대 2MB

			    if (file) {
			        // 파일 타입 검사
			        if (!validTypes.includes(file.type)) {
			            alert('이미지 파일만 업로드할 수 있습니다. (JPEG, PNG, GIF)');
			            return;
			        }

			        // 파일 크기 검사
			        if (file.size > maxSize) {
			            alert('파일 크기가 2MB를 초과할 수 없습니다.');
			            return;
			        }

			        // 유효성 검사 통과 후 파일 미리보기
			        var reader = new FileReader();
			        reader.onload = function(e) {
			            $('#profileImg').attr('src', e.target.result);
			        }
			        reader.readAsDataURL(file);
			    }
			});
		
		//저장 버튼 클릭 시 데이터가 폼으로 전송됨
		$("#edit").on("click", function(){
			
			var  empNm         = $("#empNm").val();
			var  empEml        = $("#empEml").val();
			var  empZip        = $("#empZip").val();
			var  empRoadNmAddr = $("#empRoadNmAddr").val();
			var  empDaddr      = $("#empDaddr").val();

			var  empRrno       = $("#empRrno").val();
			var  empMoblphon   = $("#empMoblphon").val();
			var  empJncmpYmd   = $("#empJncmpYmd").val();
			var  empGender     = $("#empGender").val();
			var  deptCd        = $("#deptCd").val();
			var  jbgdCd        = $("#jbgdCd").val();
			var  authCd        = $("#authCd").val();
			var profileImg     =  $("#profileImg").attr("src");
			console.log("profileImg :" ,profileImg);

			if(profileImg.match('data:image')){
				//있는거
				$("#hi").text("");
			}else{
				//넚는거
				$("#hi").css("color", "red").text("사진을 등록해주세요");

			} 
			
			if(!empNm || !empEml || !empZip || !empRoadNmAddr || !empDaddr || !empRrno || !empMoblphon
					|| !empJncmpYmd || !empGender || !deptCd || !jbgdCd || !authCd ){
					
				
				if(profileImg.match('data:image')){
					//있는거
					$("#hi").text("");
					
				}else{
					//없는거
					Swal.fire({
						  position: "top-end",
						  icon: "warning",
						  title: "입력 형식이 올바르지 않습니다. <br>형식에 맞게 다시 입력해 주세요.",
						  showConfirmButton: false,
						  timer: 2000,
						  customClass: {
						        popup: 'custom-popup'  // 사용자 정의 클래스 추가
						    }
						});

					$("#hi").css("color", "red").text("사진을 등록해주세요");
				} 
					
					
			}else{
			
			
//	 		$("#confirmModal").modal('show');
		
			//form Data 객체 생성
			var formData = new FormData();
			
			//<input type="file" name="uploadFile"...
			let files = $("input[name='uploadFile']")[0].files;
			
			//1회 반복하겠지만..
			for(let i=0;i<files.length;i++){
				// 파일 추가 (키를 "uploadFile"로 가정)
				//<input type="file" name="uploadFile"...을 가상으로 만들어줌
				//<form><input type="file" name="uploadFile"... /></form>
				//가상의 <form 태그의 마지막 자식 요소로 파일객체를 넣어줌
				formData.append("uploadFile",files[i]);
			}
			
			//$("#memId").val() : 아이디 속성의 값이 medId인 요소의 값(emp24C1012)
			formData.append("memId",$("#memId").val()); //아이디
			formData.append("empNm",$("#empNm").val()); //사원이름
			formData.append("empEml",$("#empEml").val()); //이메일
			formData.append("empZip",$("#empZip").val()); //우편번호
			formData.append("empRoadNmAddr",$("#empRoadNmAddr").val()); //주소 
			formData.append("empDaddr",$("#empDaddr").val()); //상세주소
			
			formData.append("empImgUrl",$("#empImgUrl").val()); //이미지경로
			
			//formData : <form><input type="text" name="empRrno" value="20240912" /></form>
			formData.append("empRrno",$("#empRrno").val().replace(/-/g, '')); //생년월일 
			formData.append("empMoblphon",$("#empMoblphon").val().replace(/-/g, '')); //휴대전화
			formData.append("empJncmpYmd",$("#empJncmpYmd").val().replace(/-/g, '')); //입사일자
			
			formData.append("empGender",$("#empGender").val()); //성별
			formData.append("deptCd ",$("#deptCd").val()); //부서
			formData.append("jbgdCd  ",$("#jbgdCd").val()); //직급
			
			formData.append("authCd",$("#authCd").val());
			
			$.ajax({
				url : "/emp/employee/registPost",
				type:"POST",
				data:formData,
				processData:false,
				contentType:false,
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
					//response[{result:"error"},{"memId":"a011"}]
					console.log("response : ", response);
					$("#ajaxSuccessModal").modal('show');
					//employeeVO is not defined
					setTimeout(() => window.location.href="/emp/employee/detail?memId=" + response.memId, 1000);
				},
				error:function(xhr, status, error){
					console.log(error);
				}
			 });//ajax
			}
		});
});



$(document).ready(function() {

    // 취소 버튼 클릭 시 모달 표시
    $("#cancel").on("click", function(){
        $("#canModal").modal('show');
    });

    // 확인 버튼 클릭 시 URL 이동
    $("#canBtn").on("click", function(){
        window.location.href = "/emp/employee/list";  // 페이지 이동
    });
    
	   // 주소 api
	   $("#btnPost").on("click",function(){
	      console.log("우편번호 검색!")
	       new daum.Postcode({
	          //다음 창에서 검색이 완료되어 클릭하면 콜백함수에 의해
	          // 결과 데이터(JSON string)가 data 객체로 들어옴
	           oncomplete: function(data) {
	              //data{"zonecode":"12345","address":"대전 중구","buildingName":"123-67"}
	            $("#empZip").val(data.zonecode);
	            $("#empRoadNmAddr").val(data.address);
	            $("#empDaddr").val(data.buildingName);
	            $("#addrDet").focus();
	           }
	       }).open();
	   });
	
	// 목록가기 버튼 클릭
	$("#list").on("click",function(){
		//목록페이지 이동
		  window.location.href = '/emp/employee/list';
	});
	
});

//유효성 검사
$(function validateInputs(){
	// 이름
	$("#empNm").on("blur", function() {
	    let empNm = $(this).val().trim();
	
	    if (empNm === "") {
	        $(this).css("border", "1px solid red");
	
	        if (!$("#empNmCheck").text().includes("이름")) {  // 기존 메시지에 이름 관련 메시지가 없으면 추가
	            $("#empNmCheck").append("<br>• 이름: 필수 정보입니다. ex)홍길동");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");
	
	        // "이름: 필수 정보입니다." 메시지를 제거
	        let currentText = $("#empNmCheck").html();
	        let updatedText = currentText.replace(/<br>• 이름: 필수 정보입니다\. ex\)홍길동/, "");
	        $("#empNmCheck").html(updatedText);
	    }
	});

    // 이메일
	$("#empEml").on("blur", function() {
	    let empEml = $(this).val().trim();

	    if (empEml === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#empNmCheck").text().includes("이메일")) {
	            $("#empNmCheck").append("<br>• 이메일: 필수 정보입니다. ex) abc123@naver.com");
	        }
	    } else {
	    	let pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.([a-zA-Z]{2,3})$/;


	        if (!pattern.test(empEml)) {
	            $(this).css("border", "1px solid red");
	            if (!$("#empNmCheck").text().includes("이메일 주소가 정확한지 확인")) {
	                $("#empNmCheck").append("<br>• 이메일: 이메일 주소가 정확한지 확인해 주세요. ex) abc123@naver.com");
	            }
	        } else {
	            // 이메일 형식이 맞으면 메시지 제거
	            $("#empNmCheck").html(function(index, currentText) {
	                return currentText.replace(/<br>• 이메일: 이메일 주소가 정확한지 확인해 주세요. ex\) abc123@naver.com/, "");
	            });
	            $(this).css("border", "1px solid #1890FF");
	        }

	        // 필수 정보 메시지 제거
	        $("#empNmCheck").html(function(index, currentText) {
	            return currentText.replace(/<br>• 이메일: 필수 정보입니다. ex\) abc123@naver.com/, "");
	        });
	    }
	});

	// 휴대폰번호 유효성 검사
	$("#empMoblphon").on("blur", function() {
	    let empMoblphon = $(this).val().trim();

	    // 필수 입력값 체크
	    if (empMoblphon === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#empNmCheck").text().includes("휴대전화")) {
	            $("#empNmCheck").append("<br>• 휴대전화: 필수 정보입니다. ex)01012341234");
	        }
	    } else {
	        // 유효성 체크를 위한 정규 표현식
	        let pattern = /^010\d{8}$/; // 하이픈 없이 11자리 숫자만 허용

	        // 11자리 검사
	        if (empMoblphon.length !== 11) {
	            $(this).css("border", "1px solid red");
	            if (!$("#empNmCheck").text().includes("휴대전화: 11자리 입력")) {
	                $("#empNmCheck").append("<br>• 휴대전화: 11자리 입력 ex)01012341234");
	            }
	        } else if (/\D/.test(empMoblphon)) { // 하이픈이나 비숫자가 포함된 경우
	            $(this).css("border", "1px solid red");
	            if (!$("#empNmCheck").text().includes("휴대전화: '-' 없이 입력해 주세요.")) {
	                $("#empNmCheck").append("<br>• 휴대전화: '-' 없이 입력해 주세요.");
	            }
	        } else if (!pattern.test(empMoblphon)) { // 010으로 시작하지 않으면
	            $(this).css("border", "1px solid red");
	            if (!$("#empNmCheck").text().includes("휴대전화: 010으로 시작하는 11자리 숫자여야 합니다.")) {
	                $("#empNmCheck").append("<br>• 휴대전화: 010으로 시작하는 11자리 숫자여야 합니다.");
	            }
	        } else {
	            $(this).css("border", "1px solid #1890FF");
	            // 성공적으로 입력된 경우
	            $("#empNmCheck").html(function(index, currentText) {
	                return currentText.replace(/<br>• 휴대전화: 11자리 입력 ex\)01012341234/, "")
	                                  .replace(/<br>• 휴대전화: '-' 없이 입력해 주세요./, "")
	                                  .replace(/<br>• 휴대전화: 010으로 시작하는 11자리 숫자여야 합니다./, ""); // 추가된 부분
	            });
	        }
	    }
	});


	
	
	// 부서 선택 유효성 검사
	$("#deptCd").on("blur change", function() {
	    let deptCd = $(this).val().trim();

	    if (deptCd === "") {
	        $(this).css("border", "1px solid red");  // 선택 안 했을 때 테두리를 빨간색으로 변경
	        if (!$("#empNmCheck").text().includes("부서")) {  // 기존 메시지에 부서 관련 메시지가 없으면 추가
	            $("#empNmCheck").append("<br>• 부서: 필수 정보입니다. 부서를 선택해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");  // 선택한 경우 테두리를 파란색으로 변경

	        // 부서 필수 정보 메시지 제거
	        $("#empNmCheck").html(function(index, currentText) {
	            return currentText.replace(/<br>• 부서: 필수 정보입니다. 부서를 선택해 주세요./, "");
	        });
	    }
	});
	// 직급 선택 유효성 검사
	$("#jbgdCd").on("blur change", function() {
	    let jbgdCd = $(this).val().trim();

	    if (jbgdCd === "") {
	        $(this).css("border", "1px solid red");  // 선택 안 했을 때 테두리를 빨간색으로 변경
	        if (!$("#empNmCheck").text().includes("직급")) {  // 기존 메시지에 부서 관련 메시지가 없으면 추가
	            $("#empNmCheck").append("<br>• 직급: 필수 정보입니다. 직급을 선택해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");  // 선택한 경우 테두리를 파란색으로 변경

	        // 부서 필수 정보 메시지 제거
	        $("#empNmCheck").html(function(index, currentText) {
	            return currentText.replace(/<br>• 직급: 필수 정보입니다. 직급을 선택해 주세요./, "");
	        });
	    }
	});
	// 성별 선택 유효성 검사
	$("#empGender").on("blur change", function() {
	    let empGender = $(this).val().trim();

	    if (empGender === "") {
	        $(this).css("border", "1px solid red");  // 선택 안 했을 때 테두리를 빨간색으로 변경
	        if (!$("#empNmCheck").text().includes("성별")) {  // 기존 메시지에 부서 관련 메시지가 없으면 추가
	            $("#empNmCheck").append("<br>• 성별: 필수 정보입니다. 성별을 선택해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");  // 선택한 경우 테두리를 파란색으로 변경

	        // 부서 필수 정보 메시지 제거
	        $("#empNmCheck").html(function(index, currentText) {
	            return currentText.replace(/<br>• 성별: 필수 정보입니다. 성별을 선택해 주세요./, "");
	        });
	    }
	});
	// 권한 선택 유효성 검사
	$("#authCd").on("blur change", function() {
	    let authCd = $(this).val();  // trim() 호출 전에 값이 있는지 확인

	    if (!authCd || authCd.trim() === "") {  // authCd 값이 null 또는 빈 문자열인지 확인
	        $(this).css("border", "1px solid red");  // 선택 안 했을 때 테두리를 빨간색으로 변경
	        if (!$("#empNmCheck").text().includes("권한")) {  // 기존 메시지에 권한 관련 메시지가 없으면 추가
	            $("#empNmCheck").append("<br>• 권한: 필수 정보입니다. 권한을 선택해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");  // 선택한 경우 테두리를 파란색으로 변경

	        // 권한 필수 정보 메시지 제거
	        $("#empNmCheck").html(function(index, currentText) {
	            return currentText.replace(/<br>• 권한: 필수 정보입니다. 권한을 선택해 주세요./, "");
	        });
	    }
	});
	
	// 생년월일 유효성 검사
	$("#empRrno").on("blur", function() {
	    let empRrno = $(this).val().trim();

	    if (empRrno === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#empNmCheck").text().includes("생년월일")) {
	            $("#empNmCheck").append("<br>• 생년월일: 필수 정보입니다. ex) YYYY-MM-DD");
	        }
	    } else {
	        let pattern = /^\d{4}-\d{2}-\d{2}$/;  // YYYY-MM-DD 형식 체크
	        
	        if (!pattern.test(empRrno)) {
	            $(this).css("border", "1px solid red");
	            if (!$("#empNmCheck").text().includes("생년월일 형식")) {
	                $("#empNmCheck").append("<br>• 생년월일: 올바른 형식으로 입력해 주세요. ex) 1990-01-01");
	            }
	        } else {
	            $(this).css("border", "1px solid #1890FF");

	            // 형식 오류 메시지 제거
	            $("#empNmCheck").html(function(index, currentText) {
	                return currentText.replace(/<br>• 생년월일: 올바른 형식으로 입력해 주세요. ex\) 1990-01-01/, "");
	            });
	        }

	        // 필수 정보 메시지 제거
	        $("#empNmCheck").html(function(index, currentText) {
	            return currentText.replace(/<br>• 생년월일: 필수 정보입니다. ex\) YYYY-MM-DD/, "");
	        });
	    }
	});
	// 입사일자 유효성 검사
	$("#empJncmpYmd").on("blur", function() {
	    let empJncmpYmd = $(this).val().trim();

	    if (empJncmpYmd === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#empNmCheck2").text().includes("입사일자")) {
	            $("#empNmCheck2").append("<br>• 입사일자: 필수 정보입니다. ex) YYYY-MM-DD");
	        }
	    } else {
	        let pattern = /^\d{4}-\d{2}-\d{2}$/;  // YYYY-MM-DD 형식 체크
	        
	        if (!pattern.test(empJncmpYmd)) {
	            $(this).css("border", "1px solid red");
	            if (!$("#empNmCheck2").text().includes("입사일자 형식")) {
	                $("#empNmCheck2").append("<br>• 입사일자: 올바른 형식으로 입력해 주세요. ex) 1990-01-01");
	            }
	        } else {
	            $(this).css("border", "1px solid #1890FF");

	            // 형식 오류 메시지 제거
	            $("#empNmCheck2").html(function(index, currentText) {
	                return currentText.replace(/<br>• 입사일자: 올바른 형식으로 입력해 주세요. ex\) 1990-01-01/, "");
	            });
	        }

	        // 필수 정보 메시지 제거
	        $("#empNmCheck2").html(function(index, currentText) {
	            return currentText.replace(/<br>• 입사일자: 필수 정보입니다. ex\) YYYY-MM-DD/, "");
	        });
	    }
	});

	// 우편번호 유효성 검사
	$("#empZip").on("blur", function() {
	    let empZip = $(this).val().trim();

	    if (empZip === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#empNmCheck2").text().includes("우편번호")) {
	            $("#empNmCheck2").append("<br>• 우편번호: 필수 정보입니다. ex) 12345");
	        }
	    } else {
	        let pattern = /^\d{5}$/;  // 5자리 숫자만 허용

	        if (!pattern.test(empZip)) {
	            $(this).css("border", "1px solid red");
	            if (!$("#empNmCheck2").text().includes("우편번호 형식")) {
	                $("#empNmCheck2").append("<br>• 우편번호: ex) 12345");
	            }
	        } else {
	            $(this).css("border", "1px solid #1890FF");

	            // 형식 오류 메시지 제거
	            $("#empNmCheck2").html(function(index, currentText) {
	                return currentText.replace(/<br>• 우편번호: ex\) 12345/, "");
	            });
	        }

	        // 필수 정보 메시지 제거
	        $("#empNmCheck2").html(function(index, currentText) {
	            return currentText.replace(/<br>• 우편번호: 필수 정보입니다. ex\) 12345/, "");
	        });
	    }
	});
	
	// 주소 유효성 검사
	$("#empRoadNmAddr").on("blur", function() {
	    let empRoadNmAddr = $(this).val().trim();

	    // 필수 입력값 체크
	    if (empRoadNmAddr === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#empNmCheck2").text().includes("주소")) {
	            $("#empNmCheck2").append("<br>• 주소: 필수 정보입니다.");
	        }
	    } else if (empRoadNmAddr.length < 5) { // 최소 길이 검사
	        $(this).css("border", "1px solid red");
	        if (!$("#empNmCheck2").text().includes("주소 길이")) {
	            $("#empNmCheck2").append("<br>• 주소: 5자리 이상 입력해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");
	        
	        // 성공적으로 입력된 경우
	        $("#empNmCheck2").html(function(index, currentText) {
	            return currentText.replace(/<br>• 주소: 필수 정보입니다./, "")
	                              .replace(/<br>• 주소: 5자리 이상 입력해 주세요./, "");
	        });
	    }
	});

	// 상세주소 유효성 검사
	$("#empDaddr").on("blur", function() {
	    let empDaddr = $(this).val().trim();

	    // 필수 입력값 체크
	    if (empDaddr === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#empNmCheck2").text().includes("상세주소")) {
	            $("#empNmCheck2").append("<br>• 상세주소: 필수 정보입니다.");
	        }
	    } else if (empDaddr.length < 2) { // 최소 길이 검사 (예: 2자리 이상)
	        $(this).css("border", "1px solid red");
	        if (!$("#empNmCheck2").text().includes("상세주소 길이")) {
	            $("#empNmCheck2").append("<br>• 상세주소: 2자리 이상 입력해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");
	        
	        // 성공적으로 입력된 경우
	        $("#empNmCheck2").html(function(index, currentText) {
	            return currentText.replace(/<br>• 상세주소: 필수 정보입니다./, "")
	                              .replace(/<br>• 상세주소: 2자리 이상 입력해 주세요./, "");
	        });
	    }
	});

});
$(document).ready(function() {
    // 휴대폰번호 길이 카운트
    $("#empMoblphon").on("input", function() {
        let length = $(this).val().replace(/-/g, "").length; // '-' 문자를 제거한 후 길이를 계산합니다.
        $("#phonecnt").text(length); // length 값을 phonecnt에 표시합니다.
    });
});
</script>

<div id="container" >

	<!-- 헤더 -->
	<div id="tbox">
		<div id="title-box">
			<div class="title-txt">인사</div>
			<div class="title-txt">-</div>
			<div class="title-txt">사원</div>
			<div class="title-txt">-</div>
			<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">인사기록카드</div>
		</div>
	</div> 
	<!-- 사원 저장 취소 -->
	<div id="btn-box1">
		<button type="button" id="list" class="btn btn-outline-primary" style=" width: 80px;">목록</button>
		<div id="sesese">
		 <div id="selectt">입력</div>
		<button type="button" id="edit" class="yes"	style=" width: 60px;">등록</button>
		<button type="button" id="cancel" class="nonono" onclick="window.location='/emp/employee/list';">취소</button>
		</div>
	</div>

<!-- 폼 박스 -->
<form id="content" action="/emp/employee/registPost" method="post">
	<div class="a">
	<div class="t1">인사정보 등록</div>
	
		<!-- 프로필 사진 박스 -->
		<div class="a1-1">
			<div class="a1-1-1" > <!-- 이미지박스 -->
              <!-- 프로필 이미지가 없으면 기본 이미지 --> 
              <c:if test="${empty employeeVO.empImgUrl}" >
                  <img  id="profileImg" name="profileImg" src="/resources/images/profile.jpg" id="profileImage">
              </c:if>

              <!-- 프로필 이미지가 있으면 있는 이미지 --> 
              <c:if test="${!empty employeeVO.empImgUrl}" >
              	<img id="profileImg" name="profileImg" src="/download?filePath=${employeeVO.empImgUrl}&fileOrgnlFileNm=${employeeVO.empImgNm}" />
              </c:if>
			</div>
			<div class="a1-1-2" > <!-- 등록 삭제박스 -->
				<!-- 이미지 파일 선택 -->
				<label for="uploadFile" style="font-size: 14px;" id="lalala">사진 변경</label>
				<input type="file" class="btn btn-outline-primary btn2-1" name="uploadFile"
					style="font-size: 14px; display:none;"  id="uploadFile"/> 
				<div class="delBtn" id="deleteImageBtn">삭제</div>
			</div>
			<div class="text2" style="font-size: 14px;">*프로필 사진 권장 최대 사이즈는 330x330px(10MB미만)입니다.</div>
			 <div id="hi"></div>
		</div>
		<hr class="hr1">
		
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">이름<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="empNm" name="empNm"
					placeholder="이름입력"
					 value="${employeeVO.empNm}"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">부서<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
					<select name="deptCd" class="input1" id="deptCd">
				        <option value="" ${employeeVO.deptCd == '' ? 'selected' : ''}>부서선택</option>
				        <option value="C1" ${employeeVO.deptCd == 'C1' ? 'selected' : ''}>회계부</option>
				        <option value="C2" ${employeeVO.deptCd == 'C2' ? 'selected' : ''}>인사부</option>
				        <option value="C3" ${employeeVO.deptCd == 'C3' ? 'selected' : ''}>물류부</option>
				        <option value="C4" ${employeeVO.deptCd == 'C4' ? 'selected' : ''}>시설부</option>
				    </select>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">직급<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
  					<select name="jbgdCd" class="input1" id="jbgdCd">
					        <option value="" ${employeeVO.jbgdCd == '' ? 'selected' : ''}>직급선택</option>
					        <option value="B1" ${employeeVO.jbgdCd == 'B1' ? 'selected' : ''}>사장</option>
					        <option value="B2" ${employeeVO.jbgdCd == 'B2' ? 'selected' : ''}>부사장</option>
					        <option value="B3" ${employeeVO.jbgdCd == 'B3' ? 'selected' : ''}>부장</option>
					        <option value="B4" ${employeeVO.jbgdCd == 'B4' ? 'selected' : ''}>차장</option>
					        <option value="B5" ${employeeVO.jbgdCd == 'B5' ? 'selected' : ''}>과장</option>
					        <option value="B6" ${employeeVO.jbgdCd == 'B6' ? 'selected' : ''}>대리</option>
					        <option value="B7" ${employeeVO.jbgdCd == 'B7' ? 'selected' : ''}>사원</option>
					    </select>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">권한<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
					<select name="authCd" class="input1" id="authCd">
						<option value="" selected disabled>권한선택</option>
						<c:forEach var="authVO" items="${authVOList}">
							<c:if test="${authVO.authCode != 'ROLE_MEMBER'}">
								<option value="${authVO.authCode}">${authVO.authNm}(${authVO.authCode})</option>
							</c:if>
						</c:forEach>
					</select>
					</div>
				</div>
				 <div id="empNmCheck" style="color:red;"></div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">성별<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
				      <select name="empGender" class="input1" id="empGender">
				        <option value="" ${employeeVO.empGender == '' ? 'selected' : ''}>선택</option>
				        <option value="V2" ${employeeVO.empGender == 'V2' ? 'selected' : ''}>남성</option>
				        <option value="V1" ${employeeVO.empGender == 'V1' ? 'selected' : ''}>여성</option>
				     </select>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">생년월일<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
					<input type="date" class="input1" id="empRrno" name="empRrno" placeholder="YYYYMMDD"
					 value="${employeeVO.empRrno}"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">이메일<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
					<input type="email" class="input1"
						placeholder="이메일 입력" name="empEml" id="empEml"
					 value="${employeeVO.empEml}"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">휴대전화<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1"
					placeholder="'-' 없이 입력해주세요" name="empMoblphon" id="empMoblphon" 
					value="${employeeVO.empMoblphon}" maxlength="11"/>
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
		
		<hr class="hr1">
		
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">재직상태</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="재직" 
							disabled="disabled" style="background-color: #F0F0F0; color: #A4A4A4;"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">입사일자<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
					<input type="date" class="input1" id="empJncmpYmd" name="empJncmpYmd"
					 value="${employeeVO.empJncmpYmd}"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">퇴사일자</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="-" disabled="disabled" style="background-color: #F0F0F0; color: #A4A4A4;"/>
					</div>
				</div>
				<div id="empNmCheck2" style="color:red;"></div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">우편번호<span style="color:red"> *</span></div>
					<div class="a1-2-td2" id="a1-2-td2-box">
						<input type="text" name="empZip" id="empZip"
						 value="${employeeVO.empZip}" placeholder="우편번호 5자리"/>
						<button type="button" id="btnPost"  
						style="flex: 3; font-size: 14px;" 
						> 주소 검색</button>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">주소<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" name="empRoadNmAddr" id="empRoadNmAddr"
					 value="${employeeVO.empRoadNmAddr}"
					 placeholder="주소 입력"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">상세주소<span style="color:red"> *</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" name="empDaddr" id="empDaddr"
					 value="${employeeVO.empDaddr}"
					 placeholder="상세주소 입력"
					/>
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
	</div>
	
	<sec:csrfInput />
</form>
</div> <!-- container -->

<!-- 수정 컨펌 모달 -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <div>사원등록</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                등록하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="yes" id="confirmSubmitBtn">확인</button>
                <button type="button" class="nonono" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<!-- 수정 컨펌 모달 -->

<!-- 취소 컨펌 모달 -->
<div class="modal fade" id="canModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <div>사원등록</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                취소하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="yes" id="canBtn">확인</button>
                <button type="button" class="nonono" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<!-- 취소 컨펌 모달 -->