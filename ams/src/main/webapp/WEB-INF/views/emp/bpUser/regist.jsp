<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/bp/regist.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(function(){
	//입력버튼
	$("#selectt").on("click",function(){
		console.log("입력!!");
		           
		let bpRprsvNm ='박대표'; 
		let bpNm = '화평본가';      
		let empId = 'a001';      
		let authCode  ='ROLE_FRN'; 
	
		
		let deptCd ='C6';   
		let frnSeCd ='M6';  
		let ctrtYmd  ='2024-10-21';
		let ctrtEndYmd ='2026-10-21';
		
		let bpEml  ='food123@naver.com';   
		let bpTelno ='0425269256';  
		let bpBrno ='12345678';   
		
		$("#bpRprsvNm").val(bpRprsvNm);
		$("#bpNm").val(bpNm);
		$("#empId").val(empId);
		$("#authCode").val(authCode);

		$("#deptCd").val(deptCd);
		
	    var frnn = $('#frnSeCdSection');
				    
	    if (deptCd === 'C6') {
	        // 'ROLE_FRN'일 경우 업체구분을 표시
	        frnn.show();
	    } else {
	        // 그 외의 경우 업체구분을 숨김
	        frnn.hide();
	    }
			
		$("#frnSeCd").val(frnSeCd);
		
		
		$("#ctrtYmd").val(ctrtYmd);
		$("#ctrtEndYmd").val(ctrtEndYmd);
		
		$("#bpEml").val(bpEml);
		$("#bpTelno").val(bpTelno);
		$("#bpBrno").val(bpBrno);
		
		// 유효성 검사를 위한 blur 이벤트 트리거
	    $("#bpRprsvNm, #bpNm, #empId, #authCode, #deptCd, #frnSeCd, #ctrtYmd, #ctrtEndYmd, #bpEml, #bpTelno, #bpBrno").trigger("blur");
	});

	
	$('#deleteImageBtn').on('click', function() {
        // 프로필 이미지를 기본 이미지로 변경
        $('#profileImg').attr('src', '/resources/images/profile.jpg');
        
        // 서버로 전송되는 이미지 경로(hidden input)도 초기화
        $('#empImgUrl').val('');
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
   
   
   //저장버튼 클릭   
   $("#edit").on("click", function(){
	
	
	  var bpRprsvNm  =  $("#bpRprsvNm ").val();
	  var bpNm       =  $("#bpNm      ").val();
	  var empId      =  $("#empId     ").val();
	  var authCode   =  $("#authCode  ").val();
	  var deptCd     =  $("#deptCd    ").val();
	  var frnSeCd    =  $("#frnSeCd   ").val();
	  var ctrtYmd    =  $("#ctrtYmd   ").val();
	  var ctrtEndYmd =  $("#ctrtEndYmd").val();
	  var bpEml      =  $("#bpEml     ").val();
	  var bpTelno    =  $("#bpTelno   ").val();
	  var bpBrno     =  $("#bpBrno    ").val();
      var profileImg     =  $("#profileImg").attr("src");
		console.log("profileImg :" ,profileImg);
		
		if(profileImg.match('data:image')){
			//있는거
			$("#hi").text("");
		}else{
			//넚는거
			$("#hi").css("color", "red").text("사진을 등록해주세요");

		}

	if (!bpRprsvNm || !bpNm || !empId || !authCode || !deptCd || !frnSeCd || 
           !ctrtYmd || !ctrtEndYmd || !bpEml || !bpTelno || !bpBrno) {
    
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
		
			}else{
				
      //form Data 객체 생성
      var formData = new FormData();
      
//       <input type="file" name="uploadFile"...
      let files = $("input[name='uploadFile']")[0].files;
      
      for(let i=0;i<files.length;i++){
         formData.append("uploadFile",files[i]);
      }
      
       formData.append("memId", $("#memId").val()); //아이디 
       formData.append("bpImgUrl", $("#bpImgUrl").val()); //이미지경로
       
       formData.append("bpRprsvNm", $("#bpRprsvNm").val()); //대표자명
       formData.append("empId", $("#empId").val()); // 담당자명 

       formData.append("bpNm", $("#bpNm").val()); // 협력업체명
       formData.append("deptCd", $("#deptCd").val()); // 업체 분류
       formData.append("authCd", $("#authCode").val()); // 권한
       
       formData.append("frnSeCd", $("#frnSeCd").val()); // 권한 private String frnSeCd;	
       
       
       formData.append("ctrtYmd", $("#ctrtYmd").val().replace(/-/g, ''));  // 계약 시작일자
       formData.append("ctrtEndYmd", $("#ctrtEndYmd").val().replace(/-/g, '')); // 계약 종료일자

       formData.append("bpBrno", $("#bpBrno").val().replace(/-/g, '')); // 사업자 등록번호
       formData.append("bpTelno", $("#bpTelno").val().replace(/-/g, ''));  // 유선번호
       formData.append("bpEml", $("#bpEml").val()); // 이메일
       
       
      $.ajax({
         url : "/emp/bpUser/registPost",
         type:"POST",
         data:formData,
         processData:false,
         contentType:false,
         dataType:"json",
         beforeSend:function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
         },
         success:function(response){
        	 /*
        	 response.put("result", "success");
				response.put("memId", bpVO.getMemId());
				
				response{"result":"success","memId":"bp24C6009"}
        	 */
            console.log("response : ", response);
//             setTimeout(() => window.location.href="/emp/bpUser/detail?memId=" + response.memId, 1000);
             window.location.href="/emp/bpUser/detail?memId=" + response.memId
         },
         error:function(xhr, status, error){
            console.log(error);
         }
      })//ajax
      
   }
   });
   
   
});

function checkAuthCode() {
    var deptCd = $('#deptCd').val();
    var frnSeCdSection = $('#frnSeCdSection');
    
    if (deptCd === 'C6') {
        // 'ROLE_FRN'일 경우 업체구분을 표시
        frnSeCdSection.show();
    } else {
        // 그 외의 경우 업체구분을 숨김
        frnSeCdSection.hide();
    }
}
$(function(){
	  $("#empId").on("change",function(){
	    	let empId2 = $("#empId").val();
	    	console.log("너는 누구? : "+empId2);
	    });
});

// 페이지 로딩 시 현재 선택된 authCode에 따라 동작
$(document).ready(function() {
    checkAuthCode();

    // authCode 변경 시 checkAuthCode 함수 호출
    $('#deptCd').on('change', function() {
        checkAuthCode();
    });
});

// 유효성 검사
$(function validateInputs(){
	// 이름
	$("#bpRprsvNm").on("blur", function() {
	    let bpRprsvNm = $(this).val().trim();
	
	    if (bpRprsvNm === "") {
	        $(this).css("border", "1px solid red");
	
	        if (!$("#bpbp").text().includes("이름")) {  // 기존 메시지에 이름 관련 메시지가 없으면 추가
	            $("#bpbp").append("<br>• 이름: 필수 정보입니다. ex)홍길동");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");
	
	        // "이름: 필수 정보입니다." 메시지를 제거
	        let currentText = $("#bpbp").html();
	        let updatedText = currentText.replace(/<br>• 이름: 필수 정보입니다\. ex\)홍길동/, "");
	        $("#bpbp").html(updatedText);
	    }
	});
	// 협력업체명
	$("#bpNm").on("blur", function() {
	    let bpNm = $(this).val().trim();
	
	    if (bpNm === "") {
	        $(this).css("border", "1px solid red");
	
	        if (!$("#bpbp").text().includes("협력업체명")) {  // 기존 메시지에 이름 관련 메시지가 없으면 추가
	            $("#bpbp").append("<br>• 협력업체명: 필수 정보입니다. ex)김포공항");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");
	
	        // "이름: 필수 정보입니다." 메시지를 제거
	        let currentText = $("#bpbp").html();
	        let updatedText = currentText.replace(/<br>• 협력업체명: 필수 정보입니다.\ ex\)김포공항/, "");
	        $("#bpbp").html(updatedText);
	    }
	});
	
	
	// 담당자 선택 유효성 검사
	$("#empId").on("blur change", function() {
	    let empId = $(this).val().trim();

	    if (empId === "") {
	        $(this).css("border", "1px solid red");  // 선택 안 했을 때 테두리를 빨간색으로 변경
	        if (!$("#bpbp").text().includes("담당자")) {  // 기존 메시지에 부서 관련 메시지가 없으면 추가
	            $("#bpbp").append("<br>• 담당자: 필수 정보입니다. 담당자를 선택해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");  // 선택한 경우 테두리를 파란색으로 변경

	        // 부서 필수 정보 메시지 제거
	        $("#bpbp").html(function(index, currentText) {
	            return currentText.replace(/<br>• 담당자: 필수 정보입니다. 담당자를 선택해 주세요./, "");
	        });
	    }
	});
	
	
	// 권한 선택 유효성 검사
	$("#authCode").on("blur change", function() {
	    let authCode = $(this).val().trim();

	    if (authCode === "") {
	        $(this).css("border", "1px solid red");  // 선택 안 했을 때 테두리를 빨간색으로 변경
	        if (!$("#bpbp").text().includes("권한")) {  // 기존 메시지에 부서 관련 메시지가 없으면 추가
	            $("#bpbp").append("<br>• 권한: 필수 정보입니다. 권한을 선택해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");  // 선택한 경우 테두리를 파란색으로 변경

	        // 부서 필수 정보 메시지 제거
	        $("#bpbp").html(function(index, currentText) {
	            return currentText.replace(/<br>• 권한: 필수 정보입니다. 권한을 선택해 주세요./, "");
	        });
	    }
	});
	// 업체분류 선택 유효성 검사
	$("#deptCd").on("blur change", function() {
	    let deptCd = $(this).val().trim();

	    if (deptCd === "") {
	        $(this).css("border", "1px solid red");  // 선택 안 했을 때 테두리를 빨간색으로 변경
	        if (!$("#bpbp").text().includes("업체분류")) {  // 기존 메시지에 부서 관련 메시지가 없으면 추가
	            $("#bpbp").append("<br>• 업체분류: 필수 정보입니다. 업체분류를 선택해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");  // 선택한 경우 테두리를 파란색으로 변경

	        // 부서 필수 정보 메시지 제거
	        $("#bpbp").html(function(index, currentText) {
	            return currentText.replace(/<br>• 업체분류: 필수 정보입니다. 업체분류를 선택해 주세요./, "");
	        });
	    }
	});
	// 업체구분 선택 유효성 검사
	$("#frnSeCd").on("blur change", function() {
	    let frnSeCd = $(this).val().trim();
	    const errorMessage = "• 업체구분: 필수 정보입니다. 업체구분을 선택해 주세요.";

	    if (frnSeCd === "") {
	        $(this).css("border", "1px solid red");  // 선택 안 했을 때 테두리를 빨간색으로 변경
	        
	        // 기존 메시지에 업체구분 관련 메시지가 없으면 추가
	        if (!$("#bpbp").html().includes(errorMessage)) {
	            $("#bpbp").append("<br>" + errorMessage);
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");  // 선택한 경우 테두리를 파란색으로 변경
	        
	        // 업체구분 관련 메시지 제거
	        $("#bpbp").html(function(index, currentText) {
	            return currentText.replace(/<br>\s*• 업체구분: 필수 정보입니다. 업체구분을 선택해 주세요./, "");
	        });
	    }
	});
	
	// 계약시작일자 유효성 검사
	$("#ctrtYmd").on("blur", function() {
	    let ctrtYmd = $(this).val().trim();

	    if (ctrtYmd === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#bpbp2").text().includes("계약시작일자")) {
	            $("#bpbp2").append("<br>• 계약시작일자: 필수 정보입니다. ex) YYYY-MM-DD");
	        }
	    } else {
	        let pattern = /^\d{4}-\d{2}-\d{2}$/;  // YYYY-MM-DD 형식 체크
	        
	        if (!pattern.test(ctrtYmd)) {
	            $(this).css("border", "1px solid red");
	            if (!$("#bpbp2").text().includes("계약시작일자 형식")) {
	                $("#bpbp2").append("<br>• 계약시작일자: 올바른 형식으로 입력해 주세요. ex) YYYY-MM-DD");
	            }
	        } else {
	            $(this).css("border", "1px solid #1890FF");

	            // 형식 오류 메시지 제거
	            $("#bpbp2").html(function(index, currentText) {
	                return currentText.replace(/<br>• 계약시작일자: 올바른 형식으로 입력해 주세요. ex\) YYYY-MM-DD/, "");
	            });
	        }

	        // 필수 정보 메시지 제거
	        $("#bpbp2").html(function(index, currentText) {
	            return currentText.replace(/<br>• 계약시작일자: 필수 정보입니다. ex\) YYYY-MM-DD/, "");
	        });
	    }
	});
	// 계약종료일자 유효성 검사
	$("#ctrtEndYmd").on("blur", function() {
	    let ctrtEndYmd = $(this).val().trim();

	    if (ctrtEndYmd === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#bpbp2").text().includes("계약종료일자")) {
	            $("#bpbp2").append("<br>• 계약종료일자: 필수 정보입니다. ex) YYYY-MM-DD");
	        }
	    } else {
	        let pattern = /^\d{4}-\d{2}-\d{2}$/;  // YYYY-MM-DD 형식 체크
	        
	        if (!pattern.test(ctrtEndYmd)) {
	            $(this).css("border", "1px solid red");
	            if (!$("#bpbp2").text().includes("계약종료일자 형식")) {
	                $("#bpbp2").append("<br>• 계약종료일자: 올바른 형식으로 입력해 주세요. ex) YYYY-MM-DD");
	            }
	        } else {
	            $(this).css("border", "1px solid #1890FF");

	            // 형식 오류 메시지 제거
	            $("#bpbp2").html(function(index, currentText) {
	                return currentText.replace(/<br>• 계약종료일자: 올바른 형식으로 입력해 주세요. ex\) YYYY-MM-DD/, "");
	            });
	        }

	        // 필수 정보 메시지 제거
	        $("#bpbp2").html(function(index, currentText) {
	            return currentText.replace(/<br>• 계약종료일자: 필수 정보입니다. ex\) YYYY-MM-DD/, "");
	        });
	    }
	});
	
	
	  // 이메일
	$("#bpEml").on("blur", function() {
	    let bpEml = $(this).val().trim();

	    if (bpEml === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#bpbp2").text().includes("이메일")) {
	            $("#bpbp2").append("<br>• 이메일: 필수 정보입니다. ex) abc123@naver.com");
	        }
	    } else {
	    	let pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.([a-zA-Z]{2,3})$/;


	        if (!pattern.test(bpEml)) {
	            $(this).css("border", "1px solid red");
	            if (!$("#bpbp2").text().includes("이메일 주소가 정확한지 확인")) {
	                $("#bpbp2").append("<br>• 이메일: 이메일 주소가 정확한지 확인해 주세요. ex) abc123@naver.com");
	            }
	        } else {
	            // 이메일 형식이 맞으면 메시지 제거
	            $("#bpbp2").html(function(index, currentText) {
	                return currentText.replace(/<br>• 이메일: 이메일 주소가 정확한지 확인해 주세요. ex\) abc123@naver.com/, "");
	            });
	            $(this).css("border", "1px solid #1890FF");
	        }

	        // 필수 정보 메시지 제거
	        $("#bpbp2").html(function(index, currentText) {
	            return currentText.replace(/<br>• 이메일: 필수 정보입니다. ex\) abc123@naver.com/, "");
	        });
	    }
	});
	
	
	// 유선번호 유효성 검사
	$("#bpTelno").on("blur", function() {
	    let bpTelno = $(this).val().trim();

	    // 필수 입력값 체크
	    if (bpTelno === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#bpbp2").text().includes("유선번호")) {
	            $("#bpbp2").append("<br>• 유선번호: 필수 정보입니다. ex)04212341234");
	        }
	    } else {
	        // 유효성 체크를 위한 정규 표현식
	        let pattern = /^\d{10}$/; // 10자리 숫자만 허용

	        // 10자리 검사
	        if (bpTelno.length !== 10) {
	            $(this).css("border", "1px solid red");
	            if (!$("#bpbp2").text().includes("유선번호: 10자리 입력")) {
	                $("#bpbp2").append("<br>• 유선번호: 10자리 입력 ex)0421234123");
	            }
	        } else if (/\D/.test(bpTelno)) { // 비숫자가 포함된 경우
	            $(this).css("border", "1px solid red");
	            if (!$("#bpbp2").text().includes("유선번호: '-' 없이 입력해 주세요.")) {
	                $("#bpbp2").append("<br>• 유선번호: '-' 없이 입력해 주세요.");
	            }
	        } else if (!pattern.test(bpTelno)) { // 10자리 숫자가 아니면
	            $(this).css("border", "1px solid red");
	            if (!$("#bpbp2").text().includes("유선번호: 10자리 숫자여야 합니다.")) {
	                $("#bpbp2").append("<br>• 유선번호: 10자리 숫자여야 합니다.");
	            }
	        } else {
	            $(this).css("border", "1px solid #1890FF");
	            // 성공적으로 입력된 경우
	            $("#bpbp2").html(function(index, currentText) {
	                return currentText.replace(/<br>• 유선번호: 10자리 입력 ex\)04212341234/, "")
	                                  .replace(/<br>• 유선번호: '-' 없이 입력해 주세요./, "")
	                                  .replace(/<br>• 유선번호: 10자리 숫자여야 합니다./, ""); // 추가된 부분
	            });
	        }
	    }
	});
	
	// 사업자등록번호 유효성 검사
	$("#bpBrno").on("blur", function() {
	    let bpBrno = $(this).val().trim();

	    // 필수 입력값 체크
	    if (bpBrno === "") {
	        $(this).css("border", "1px solid red");
	        if (!$("#bpbp2").text().includes("사업자등록번호")) {
	            $("#bpbp2").append("<br>• 사업자등록번호: 필수 정보입니다. 8자리 숫자로 입력해 주세요.");
	        }
	    } else if (bpBrno.length !== 8 || /\D/.test(bpBrno) || bpBrno.includes('-')) {
	        $(this).css("border", "1px solid red");
	        if (!$("#bpbp2").text().includes("사업자등록번호")) {
	            $("#bpbp2").append("<br>• 사업자등록번호: 8자리 숫자여야 하며 '-' 없이 입력해 주세요.");
	        }
	    } else {
	        $(this).css("border", "1px solid #1890FF");
	        // 성공적으로 입력된 경우
	        $("#bpbp2").html(function(index, currentText) {
	            return currentText.replace(/<br>• 사업자등록번호: 필수 정보입니다. 8자리 숫자로 입력해 주세요./, "")
	                              .replace(/<br>• 사업자등록번호: 8자리 숫자여야 하며 '-' 없이 입력해 주세요./, "");
	        });
	    }
	});





})
$(document).ready(function() {
    // 휴대폰번호 길이 카운트
    $("#bpTelno").on("input", function() {
        let length = $(this).val().replace(/-/g, "").length; // '-' 문자를 제거한 후 길이를 계산합니다.
        $("#phonecnt").text(length); // length 값을 phonecnt에 표시합니다.
    });
    // 사업자등록번호 길이 카운트
    $("#bpBrno").on("input", function() {
        let length = $(this).val().replace(/-/g, "").length; // '-' 문자를 제거한 후 길이를 계산합니다.
        $("#phonecnt2").text(length); // length 값을 phonecnt에 표시합니다.
    });
});
</script>
<style>
.custom-popup {
    font-size: 12px;  /* 원하는 폰트 크기로 조정 */
    font-weight: 400;
}
</style>
<div id="container" >

   <!-- 헤더 -->
   <div id="tbox">
      <div id="title-box">
         <div class="title-txt">인사</div>
         <div class="title-txt">-</div>
         <div class="title-txt">협력업체</div>
         <div class="title-txt">-</div>
         <div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">협력업체 등록</div>
      </div>
      <div id="btnBox"> 
         <div id="selectt">입력</div>
         <div id="edit" class="btnEdit">등록</div>
         <div class="btnEdit" id="canBtn" onclick="window.location.href='/emp/bpUser/bpList'">취소</div>   
      </div>
   </div> 
   <!-- form -->
   <form id="content"  action="/bp/bpUser/editPost" method="post">
      <div class="a1">인사정보</div>
      
<!--       프로필박스 -->
      <div class="a2">
         <div class="a2-1">
          <!-- 프로필 이미지가 없으면 기본 이미지 --> 
				<c:if test="${empty bpVO.bpImgUrl}">
					<img id="profileImg" name="profileImg"
						src="/resources/images/profile.jpg" id="profileImage">
				</c:if>
				<!--추가할 프로필 이미지가 있으면 추가한 이미지  -->
              <c:if test="${!empty bpVO.bpImgUrl}" >
            <img id="profileImg"  name="profileImg" src="/download?filePath=/${bpVO.bpImgUrl}&fileOrgnlFileNm=${bpVO.bpImgNm}" />
           </c:if>
           
<%--             <input type="hidden" id="bpImgNm" name="bpImgNm" value="${bpVO.bpImgNm}"> --%>
         </div>
         
         <div class="a2-2">
			<!--이미지 파일 선택 -->
            <label for="uploadFile" id="lalala">사진 변경</label>
            <input type="file" class="btnEdit" name="uploadFile"
               style="font-size: 14px; display:none;" id="uploadFile"/>
            <div class="delBtn" id="deleteImageBtn">삭제</div>   
         </div>
         
         
         <div style="font-size: 14px;">*프로필 사진 권장 최대 사이즈는 330x330px(10MB미만)입니다.</div>
         <div id="hi"></div>
      </div>
      
      <hr class="hr1">
      
      <!-- 데이터박스 -->
      <div class="a3">
         <!--  왼쪽-->
         <div class="a3-1">
            
            <div class="a3-1-1" >
               <div class="a3-1-1-1">대표자명<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="text" class="input1" placeholder="이름 입력"
               			 id="bpRprsvNm" name="bpRprsvNm" value="${bpVO.bpRprsvNm}" />
               </div>
            </div>

            <div class="a3-1-1" >
               <div class="a3-1-1-1">담당자<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <select class="input1" id="empId" name="empId">
                  <option value="" selected="selected">선택</option>
                  <c:forEach var="empVO" items="${empVOList}" varStatus="stat">
                      <option value="${empVO.memId}" ${bpVO.empId == empVO.memId ? 'selected' : ''}>${empVO.empNm}</option>
                  </c:forEach>
                </select>
               </div>
            </div>
            
             <div class="a3-1-1">
                <div class="a3-1-1-1">권한<span style="color:red"> *</span></div>
                <div class="a3-1-1-2">
                  <select class="input1" id="authCode" name="authCd">
                      <option value="" selected>선택</option>
                      <c:forEach var="authVO" items="${authList}" varStatus="stat">
                          <option value="${authVO.authCode}" ${bpVO.authCode == authVO.authCode ? 'selected' : ''}>
                          	${authVO.authNm}&nbsp;(${authVO.authCode})
                          </option>
                      </c:forEach>
                  </select>
                </div>
            </div>
            	<div id="bpbp" style="color:red;"></div>
			
         </div>
       
         
         <!-- 오른쪽 -->
         <div class="a3-1">
         
            <div class="a3-1-1" >
               <div class="a3-1-1-1">협력업체명<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="text" class="input1" placeholder="업체명 입력" 
               				id="bpNm" name="bpNm" value="${bpVO.bpNm}"/>
               </div>
            </div>
            
            <div class="a3-1-1">
               <div class="a3-1-1-1">업체분류<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
                  <select class="input1" id="deptCd" name="deptCd" >
                      <option value="" selected="selected">선택</option>
                      <c:forEach var="deptVO" items="${deptList}" varStatus="stat">
                      <c:if test="${deptVO.deptCd == 'C5' || deptVO.deptCd == 'C6' || deptVO.deptCd == 'C7' }">
                          <option value="${deptVO.deptCd}" ${bpVO.deptCd == deptVO.deptCd ? 'selected' : ''}>${deptVO.deptNm}</option>
                      </c:if>
                      </c:forEach>
                  </select>
               </div>
            </div>
            
           	<div class="a3-1-1"  id="frnSeCdSection" style="display: none;">
				<div class="a3-1-1-1">업체구분</div>
				<div class="a3-1-1-2">
				
				 <select class="input1" id="frnSeCd" name="frnSeCd">
           			<option value="" selected="selected">선택</option>
               		<c:forEach var="frnSeCdVO" items="${selFrnSeCd}" varStatus="stat">
	                    <option value="${frnSeCdVO.comDetCd}">${frnSeCdVO.comDetCdCn}</option>
	                </c:forEach>
	              </select>
				</div>
			</div>
            
         </div> <!-- 오른쪽 -->
         
      </div><!-- a3 끝 -->

      <hr class="hr1">

      <div class="a3">
         <!--  왼쪽-->
         <div class="a3-1">
            <div class="a3-1-1" >
               <div class="a3-1-1-1">계약시작일자<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="date" class="input1" value="${bpVO.ctrtYmd}" id="ctrtYmd" name="ctrtYmd" />
               </div>
            </div>
            <div class="a3-1-1" >
               <div class="a3-1-1-1">계약종료일자<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="date" class="input1" id="ctrtEndYmd" name="ctrtEndYmd" value="${bpVO.ctrtEndYmd}" />
               </div>
            </div>
             <div id="bpbp2" style="color:red;"></div>
         </div>
         
         <!-- 오른쪽 -->
         <div class="a3-1">
            <div class="a3-1-1" >
               <div class="a3-1-1-1" >사업자등록번호<span style="color:red"> *</span></div>
               <div class="a3-1-1-2 cnt22">
               <input type="text" class="input1" id="bpBrno" name="bpBrno"
               				 placeholder="숫자 8자리 입력" value="${bpVO.bpBrno}" maxlength="8" />
               </div>
            </div>
            <div class="a3-1-1" >
               <div class="a3-1-1-1">유선번호<span style="color:red"> *</span></div>
               <div class="a3-1-1-2 cnt22">
               <input type="text" class="input1" placeholder="전화번호 10자리 입력"
               			 id="bpTelno" name="bpTelno" value="${bpVO.bpTelno}"  maxlength="10"/>
               </div>
            </div>
            <div class="a3-1-1" >
               <div class="a3-1-1-1">이메일<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="email" class="input1" placeholder="이메일 입력"
               			 id="bpEml" name="bpEml" value="${bpVO.bpEml}" />
               </div>
            </div>
         </div>
      </div><!-- a3 끝 -->
   </form>
   
</div>
