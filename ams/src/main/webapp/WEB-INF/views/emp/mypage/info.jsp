<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css"	rel="stylesheet" media="screen" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/assets/vendor/select2/js/select2.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/assets/vendor/jquery-mask-plugin/jquery.mask.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>
<link rel="stylesheet" type="text/css"	href="/resources/css/mypage/info.css">

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script>
let memId = "${memVO.memId}";
let empNm = "${memVO.employeeVO.empNm}"
console.log("memId : " + memId);
console.log("empNm : " + empNm);

let pwRs = true;
let pwChkRs = true;
let telRs = true;
let emlRs = true;
let zipRs = true;
let roadRs = true;
let addrRs = true;

// 초기 값 저장
let oriEml = "${employeeVO.empEml}";
let oriPhone = "${employeeVO.empMoblphon}";
let oriZip = "${employeeVO.empZip}";
let oriRoad = "${employeeVO.empRoadNmAddr}";
let oriAddr = "${employeeVO.empDaddr}";

let files = [];
let fileName = "";

let fileInput = document.getElementById("uploadFile"); // 파일 입력 아이디

	
	$(function() {
		
	    $("#checkPassword").modal('show');

		$("#uploadFile").on("change", handleImg);

		function handleImg(e) {
			let newFiles = e.target.files;
			
			// 새 파일들만 배열에 추가
			for (let i = 0; i < newFiles.length; i++) {
				files.push(newFiles[i]);
			}
			
			fileName = newFiles[0].name;
			
			let reader = new FileReader();
			reader.onload = function(e) {
				$(".profileImgDet").attr("src", e.target.result);
				$(".profileImgDet").css("width", "150px");
				$(".profileImgDet").css("height", "150px");
				$(".profileImgDet").css("display", "block");			
			}
			
			reader.readAsDataURL(newFiles[0]);	
			
			updateFileList();
		}

	// 파일명 미리보기 목록 업데이트 함수
	function updateFileList() {
		console.log("updateFileList 도착");
				
		files.forEach((file, index) => {
			
			console.log("fileName : " + file.name);
			fileName = file.name;		
			
			console.log("updateFileList 끝");
			upload(file); // 파일 업로드 함수 호출
		})

	}

	// 파일 업로드 함수
	function upload(file) {
		
		console.log("upload 도착");
		
		let formData = new FormData();
	    formData.append("file", file); // 파일 추가 *필수
	    formData.append("memId", memId); // employeeVO의 memId 추가 *필수
	    formData.append("empNm", empNm); // employeeVO의 empNm 추가 *필수
		
		$.ajax({
	        url: "/empImgUpload",
	        type: "POST",
	        data: formData,
	        processData: false,
	        contentType : false,
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
	        success: function(result) {
	            console.log("empImgUpload result : ", result);
	        },
	        error: function(xhr, status, error) {
	            console.error("오류 발생:", error);
	        }
	    });
	}
		
		$("#btnChkPassword").on("click", function() {
		    let chkPw = $("#chkPassword").val();
		    
		    console.log("memId : " + memId);
		    console.log("chkPw : " + chkPw);
		    
		    $.ajax({
		        url: "/empPasswordCheckPost",
		        type: "post",
		        data: { password: chkPw, memId: memId },
		        beforeSend: function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
		        success: function(result) {
		            console.log("chkPw result : " + result);
		            let chkResult = result;
		            console.log("chkResult : " + chkResult);
		            
		            if (chkResult === 1) {
		                $(".chkResult").html(""); 
		                let html = "<img src='/resources/images/icon/success.png' style='width:30px; height:30px;'>";
		                $(".chkResult").html(html); // .val() 대신 .html() 사용
		                $("#checkPassword").modal('hide');
		                
		            } else if(chkResult !== 1) {
		                $(".chkResult").html(""); 
		                let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		                $(".chkResult").html(html); // .val() 대신 .html() 사용
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error("AJAX 요청 실패:", error);
		        }
		    });
		});
	
		// 비밀번호 검증
		$('#pass').on('blur', function() {
		    pwvalue = $('#pass').val();
		
		    if (pwvalue === null || pwvalue.trim() === "") {
		        // 비어 있을 경우 pwRs를 true로 설정하고 이미지 제거
		        pwRs = true;
		        $('.passResult').html(""); // 이미지 제거
		        return;
		    }
		
		    pwRs = false;
		
		    let regPw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,12}$/;
		
		    if (regPw.test(pwvalue)) {
		        $('.passResult').html("");
		        let html = "<img src='/resources/images/icon/success.png' style='width:30px; height:30px;'>";
		        $('.passResult').html(html);
		        pwRs = true;
		
		        let chkPass = $("#chkPass").val();
		        if (pwvalue !== chkPass) {
		            $('.chkPassResult').html("");
		            let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		            $(".chkPassResult").html(html);
		            pwChkRs = false;
		        }
		
		    } else {
		        $('.passResult').html("");
		        let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		        $(".passResult").html(html);
		        pwRs = false;
		    }
		});

		
		// 비밀번호 일치 검증
		$('#chkPass').on('keyup', function() {
			pwvalue = $('#pass').val();
			pwvalue2 = $('#chkPass').val();
			
			if (pwvalue2 === null || pwvalue2.trim() === "") {
		        // 비어 있을 경우 pwChkRs를 true로 설정하고 이미지 제거
		        pwChkRs = true;
		        $('.chkPassResult').html(""); // 이미지 제거
		        return;
		    }
			
			pwChkRs = false;
			
			if(pwvalue2 === pwvalue) {
				$('.chkPassResult').html("");
				let html = "<img src='/resources/images/icon/success.png' style='width:30px; height:30px;'>";
				$('.chkPassResult').html(html);
				pwChkRs = true;
			} else {
				$('.chkPassResult').html("");
				let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
                $(".chkPassResult").html(html);
                pwChkRs = false;
            }
		});
		
		// 전화번호 검증
		$('#empMoblphon').on('blur', function() {
			telRs = false;
			telvalue = $('#empMoblphon').val();
			
			let regTel = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			
			if (telvalue == oriPhone) {
		        // 원래의 값과 같을 경우 telRs를 true로 설정하고 이미지 제거
		        telRs = true;
		        $('.telResult').html(""); // 이미지 제거
		        return;
		    }
			
		    // 빈 값일 경우
		    if (telvalue === null || telvalue.trim() === "") {
		        $('.telResult').html("");
		        let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		        $(".telResult").html(html);
		        telRs = false;
		    }
			
			if(regTel.test(telvalue)){
				$('.telResult').html("");
				let html = "<img src='/resources/images/icon/success.png' style='width:30px; height:30px;'>";
				$('.telResult').html(html);
				telRs = true;
			} else {
				$('.telResult').html("");
				let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
                $(".telResult").html(html);
                telRs = false;
			}
		});
		
		// 이메일 검증
		$("#empEml").on("blur", function() {
			emlvalue = $("#empEml").val();
			emlRs = false;			
			let regEml =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if (emlvalue == oriEml) {
		        // 원래의 값과 같을 경우 emlRs를 true로 설정하고 이미지 제거
		        emlRs = true;
		        $('.emlResult').html(""); // 이미지 제거
		        return;
		    }
			
		    // 빈 값일 경우
		    if (emlvalue === null || emlvalue.trim() === "") {
		        $('.emlResult').html("");
		        let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		        $(".emlResult").html(html);
		        emlRs = false;
		    }
			
			if(regEml.test(emlvalue)){
				$('.emlResult').html("");
				let html = "<img src='/resources/images/icon/success.png' style='width:30px; height:30px;'>";
				$('.emlResult').html(html);
				emlRs = true;
			} else {
				$('.emlResult').html("");
				let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
                $(".emlResult").html(html);
                emlRs = false;
			}
			
		});
		
		// 주소가 비었는지 확인
		$("#empZip").on("blur", function() {
		    let zipValue = $("#empZip").val();

		    // 우편번호 정규 표현식
		    let regZip = /^\d{5}$/; // 예: 12345 형식의 5자리 숫자

		    // 빈 값일 경우
		    if (zipValue === null || zipValue.trim() === "") {
		        $('.zipResult').html("");
		        let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		        $(".zipResult").html(html);
		        zipRs = false;    
		    } else if (zipValue === oriZip) {
		        // 원래의 값과 같을 경우 zipRs를 true로 설정하고 이미지 제거
		        $('.zipResult').html(""); // 이미지 제거
		        zipRs = true;
				
		    } else if (regZip.test(zipValue)) {
		        // 빈 값이 아니고 oriZip과 다르며 정규 표현식에 적합한 경우
		        $('.zipResult').html(""); // 이미지 제거
				let html = "<img src='/resources/images/icon/success.png' style='width:30px; height:30px;'>";
				$(".zipResult").html(html);
		        zipRs = true;
		    } else {
		        // 정규 표현식에 맞지 않는 경우
		        $('.zipResult').html("");
		        let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		        $(".zipResult").html(html);
		        zipRs = false;
		    }
		});

		
		$("#empRoadNmAddr").on("blur", function() {
		    let roadValue = $("#empRoadNmAddr").val();

		    // 도로명 주소 정규 표현식 (예: '서울특별시 강남구 테헤란로 123')
		    let regRoad = /^[가-힣\s\d\-]+(로|길)\s\d+$/; // 예시 정규 표현식

		    if (roadValue === null || roadValue.trim() === "") {
		        $('.roadResult').html("");
		        let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		        $(".roadResult").html(html);
		        roadRs = false;					
		    } else if (roadValue === oriRoad) {
		        // 원래의 값과 같을 경우 roadRs를 true로 설정하고 이미지 제거
		        $('.roadResult').html(""); // 이미지 제거
		        roadRs = true;
		    } else if (regRoad.test(roadValue)) {
		        // 빈 값이 아니고 oriRoad와 다르며 정규 표현식에 적합한 경우
		        $('.roadResult').html(""); // 이미지 제거
				let html = "<img src='/resources/images/icon/success.png' style='width:30px; height:30px;'>";
				$(".roadResult").html(html);
		        roadRs = false; // 필요에 따라 roadRs를 false로 설정
		    } else {
		        // 정규 표현식에 맞지 않는 경우
		        roadRs = false;
		        $('.roadResult').html("");
		        let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		        $(".roadResult").html(html);
		    }
		});

		
		$("#empDaddr").on("blur", function() {
		    let addrValue = $("#empDaddr").val();

		    if (addrValue === null || addrValue.trim() === "") {
		        $('.addrResult').html("");
		        let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		        $(".addrResult").html(html);
		        addrRs = false;					
		    } else if (addrValue === oriAddr) {
		        // 원래의 값과 같을 경우 addrRs를 true로 설정하고 이미지 제거
		        addrRs = true;
		        $('.addrResult').html(""); // 이미지 제거
		    } else {
		        // 원래의 값과 다르고 빈 값이 아닐 경우 success.png 추가
		        addrRs = false; // 필요에 따라 addrRs를 false로 설정
		        $('.addrResult').html(""); // 기존 이미지 제거
		        let html = "<img src='/resources/images/icon/success.png' style='width:30px; height:30px;'>";
		        $(".addrResult").html(html);
		    }
		});

		
		// 도로명주소 API
		$('#zipbtn').on('click', function() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            var addr = ''; // 주소 변수
		            var extraAddr = ''; // 참고항목 변수

		            // 사용자가 도로명 주소를 선택했을 경우
		            if (data.userSelectedType === 'R') {
		                addr = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                addr = data.jibunAddress;
		            }

		            // 우편번호와 주소 정보를 필드에 넣기
		            $('#empZip').val(data.zonecode).css('color', 'black');
		            $('#empRoadNmAddr').val(addr).css('color', 'black');
		            $('#empDaddr').val('').css('color', 'black'); // 상세주소는 초기화

		            // blur 이벤트 트리거
		            $('#empZip').trigger('blur');
		            $('#empRoadNmAddr').trigger('blur');
		        }
		    }).open();
		});
	
		// 변경 항목이 없을 시 수정 버튼 비활성화
	    $("#empEml, #empMoblphon, #empZip, #empRoadNmAddr, #empDaddr, #pass, #chkPass").on('blur', function() {
	        let empEml = $("#empEml").val();
	        let empMoblphon = $("#empMoblphon").val();
	        let empZip = $("#empZip").val();
	        let empRoadNmAddr = $("#empRoadNmAddr").val();
	        let empDaddr = $("#empDaddr").val();
	        let pass = $("#pass").val();
	        let chkPass = $("#chkPass").val();
	
	        // 변경된 항목 확인
	        if (empEml !== oriEml || empMoblphon !== oriPhone || empZip !== oriZip || empRoadNmAddr !== oriRoad || empDaddr !== oriAddr || pass !== null || chkPass !== null) {
	            $("#updateBtn").css("border", "0.5px solid #1890FF");
	            $("#updateBtn").attr("disabled", false); // 버튼 활성화
	        } else {
	            $("#updateBtn").css("border", "0.5px solid #e4e4e4");
	            $("#updateBtn").attr("disabled", true); // 버튼 비활성화
	        }
	    });
		
		$("#updateBtn").on("click", function() {
			
		    // 상세주소가 빈 값일 경우
		    if ($("#empDaddr").val() === null || $("#empDaddr").val().trim() === "") {
		        $('.addrResult').html(""); // 이전 결과 제거
		        let html = "<img src='/resources/images/icon/failure.png' style='width:30px; height:30px;'>";
		        $(".addrResult").html(html);
		        addrRs = false;
		    }
		    
			
			if(pwRs !== true || pwChkRs !== true || telRs !== true || emlRs !== true || zipRs !== true || roadRs !== true || addrRs !== true) {
				alert("모든 항목을 올바르게 입력해주세요");
				return;
			};			
			
			let formData = new FormData();
			
			formData.append("memId", memId);
		    // empMoblphon에서 하이픈 제거
		    let empMoblphonValue = $("#empMoblphon").val().replace(/-/g, "");
		    formData.append("empMoblphon", empMoblphonValue);
			formData.append("empEml", $("#empEml").val());
			formData.append("empZip", $("#empZip").val());
			formData.append("empRoadNmAddr", $("#empRoadNmAddr").val());
			formData.append("empDaddr", $("#empDaddr").val());
			
			if($("#pass").val().trim() !== "") {
			    formData.append("password", $("#pass").val());
			}
			
			$.ajax({
				url : "/emp/mypage/update",
				type : "post",
				data : formData,
				contentType : false,
				processData : false,
				beforeSend : function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log("update result : " + result);
					$("#completionModal").modal('show');
					setTimeout(() => location.reload(), 1000);
				}
			})
			
		});
	
});

</script>


<div class="titleHeader">
	<span class="pageTitle" style="font-size:20px; font-weight: 600; word-wrap: break-word;">마이페이지</span>
</div>

<div class="container">

		<div class="proCard" style="border:0.5px solid #e4e4e4; border-radius:5px; padding:20px;">
		
			<div class="imgDiv" style="display:flex; justify-content:center; align-items:center; flex-direction: column;">
				<img class="profileImgDet"
				        src="/download?filePath=${employeeVO.empImgUrl}&fileOrgnlFileNm=${employeeVO.empImgNm}"
				        alt="User profile picture"
				        style="width:150px; height:150px;"
				        onerror="this.onerror=null; this.src='/resources/images/profile.jpg';">
				<label id="uploadFileBtn" for="uploadFile">사진 변경</label>
          		<input type="file" id="uploadFile" name="uploadFile" multiple style="display:none;"/>
			</div>
				
		
		
			<label style="margin-top:20px;">인사정보</label>
			<div class="infoDiv">
			
				<div class="infoDivChild" style="margin-left: -20px;">
					<label for="empNm">이름</label>
					<input type="text" id="empNm" name="empNm" value="${employeeVO.empNm }" style="width:220px;" readonly />
				</div>
				
				<div class="infoDivChild" style="margin-left: -20px;">
					<label for="memId">사번</label>
					<input type="text" id="memId" name="memId" value="${employeeVO.memId }"	style="width:220px;" readonly />
				</div>
				
				<div class="infoDivChild" style="margin-left: -20px;">
					<label for="dept">부서</label>
					<input type="text" id="dept" name="dept" value="${employeeVO.deptNm}" style="width:220px;" readonly />
				</div>
				
				<div class="infoDivChild" style="margin-left: -20px;">
					<label for="jbgdNm">직급</label>
					<input type="text" id="jbgdNm" name="jbgdNm" value="${employeeVO.jbgdNm} (${employeeVO.jbgdEnNm})" style="width:220px;" readonly />
				</div>
				
			</div>
			
			<label style="margin-top:20px;">상세정보</label>
			<div class="detailDiv">
					
				<div class="detailDivChild">
					<label for="pass">비밀번호</label>
					<input type="text" id="pass" name="pass" style="width:220px; border:0.5px solid #1890FF;"/>
					<div class="passResult" style="width:30px; height:30px; margin-left:10px;"></div>
				</div>
				
				<div class="detailDivChild">
					<label for="chkPass">비밀번호 확인</label>
					<input type="text" id="chkPass" name="chkPass" style="width:220px; border:0.5px solid #1890FF;"/>
					<div class="chkPassResult" style="width:30px; height:30px; margin-left:10px;"></div>
				</div>
				
				<div class="detailDivChild" style="margin-left: -30px;">
					<label for="sex">성별</label>
					<input type="text" id="sex" name="sex" value="${employeeVO.empGender }" style="width:220px;" readonly/>
				</div>
				
				<div class="detailDivChild" style="margin-left: -30px;">
					<label for="empRrno">생년월일</label>
					<input type="date" id="empRrno" name="empRrno" value="${employeeVO.empRrno}" style="width:220px;" readonly/>
				</div>
				
				<div class="detailDivChild">
					<label for="empEml">이메일</label>
					<input type="text" id="empEml" name="empEml" value="${employeeVO.empEml}" style="width:220px; border:0.5px solid #1890FF;"/>
					<div class="emlResult" style="width:30px; height:30px; margin-left:10px;"></div>
				</div>
				
				<div class="detailDivChild" >
					<label for="empMoblphon">연락처</label>
					<input type="text" id="empMoblphon" name="empMoblphon" value="${employeeVO.empMoblphon}" style="width:220px; border:0.5px solid #1890FF;"/>
					<div class="telResult" style="width:30px; height:30px; margin-left:10px;"></div>
				</div>
				
				<div class="detailDivChild" >
					<label for="empZip">우편번호</label>
					<input type="text" id="empZip" name="empZip" value="${employeeVO.empZip }" style="width:150px; border:0.5px solid #1890FF;"/>
					<button type="button" id="zipbtn" style="width:50px; margin-left:20px;" >검색</button>
					<div class="zipResult" style="width:30px; height:30px; margin-left:10px;"></div>
				</div>
				
				<div class="detailDivChild" >
					<label for="empRoadNmAddr">도로명주소</label>
					<input type="text" id="empRoadNmAddr" name="empRoadNmAddr" value="${employeeVO.empRoadNmAddr}" style="width:220px; border:0.5px solid #1890FF;"/>
					<div class="roadResult" style="width:30px; height:30px; margin-left:10px;"></div>
				</div>
				
				<div class="detailDivChild" >
					<label for="empDaddr">상세주소</label>
					<input type="text" id="empDaddr" name="empDaddr" value="${employeeVO.empDaddr }" style="width:220px; border:0.5px solid #1890FF;"/>
					<div class="addrResult" style="width:30px; height:30px; margin-left:10px;"></div>
				</div>
				
				<div class="detailDivChild" style="margin-left: -30px;">
					<label for="empJncmpYmd">입사일자</label>
					<input type="date" id="empJncmpYmd" name="empJncmpYmd" value="${employeeVO.empJncmpYmd }" style="width:220px;" readonly/> 
				</div>
			</div> <!-- detailDiv 끝 -->
		
		<div class="footer">
			<button type="button" id="updateBtn" disabled>수정</button>
		</div>

		</div> <!-- proCard 끝 -->
	
</div>


<!-- 진입 시 뜨는 비밀번호 확인 모달창 시작 -->
	<!-- 마이페이지에 들어가기 위한 2차 비밀번호 체킹
1. 확인 클릭
	- submit
	- <form 태그로 감싸져 있어야 해요
2. 비밀번호를 체킹해주는 MypageController가 필요함

3. 성공 후에 Mypage에 접근이 가능하다

3-2. 실패 시 비밀번호 입력 모달을 다시 띄움

 -->
	<div class="modal-fade" id="checkPassword" data-backdrop='static' data-keyboard='false' style="display:none;">
		<div class="modal-dialog">
			<div class="modal__background">
				<div class="modal-content">
					<div class="checkPWHeader">
						<button type="button" class="close" aria-label="Close" onclick="location.href='../main' ">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputPassword1">P/W</label>
							<input type="password" class="form-control" id="chkPassword"
								name="password" placeholder="Password" />
						</div>
						<div class="chkResult" style="width:30px; height:40px; margin-left:10px; margin-top:5px;">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="btnChkPassword">확인</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
	<!-- /.modal -->
<!-- 진입 시 뜨는 비밀번호 확인 모달창 끝 -->



<!-- 수정 완료 모달 -->
<div class="modal fade" id="completionModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="padding:0;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                수정이 완료되었습니다.
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- 수정 완료 모달 -->