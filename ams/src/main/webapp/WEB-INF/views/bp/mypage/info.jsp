<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css"	rel="stylesheet" media="screen" />
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/mypage/info.css">

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memberVO" />
</sec:authorize>

<script>
let memId = "${memberVO.memId}";
let bpNm = "${memberVO.bpVO.bpNm}"
console.log("memId : " + memId);
console.log("bpNm : " + bpNm);

let pwRs = true;
let pwChkRs = true;
let telRs = true;
let emlRs = true;

//초기 값 저장
let oriEml = "${bpVO.bpEml}";
let oriTel = "${bpVO.bpTelno}";


	$(function() {
		
		$("#checkPassword").modal('show');
		
		$("#btnChkPassword").on("click", function() {
		    let chkPw = $("#chkPassword").val();
		    
		    console.log("memId : " + memId);
		    console.log("chkPw : " + chkPw);
		    
		    $.ajax({
		        url: "/bpPasswordCheckPost",
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
		$('#bpTelno').on('blur', function() {
			telRs = false;
			telvalue = $('#bpTelno').val();
			
			let regTel = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			
			if (telvalue == oriTel) {
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
		$("#bpEml").on("blur", function() {
			emlvalue = $("#bpEml").val();
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
		
	
		// 변경 항목이 없을 시 수정 버튼 비활성화
	    $("#bpEml, #bpTelno, #pass, #chkPass").on('blur', function() {
	        let bpEml = $("#bpEml").val();
	        let bpTelno = $("#bpTelno").val();
	        let pass = $("#pass").val();
	        let chkPass = $("#chkPass").val();
	
	        // 변경된 항목 확인
	        if (bpEml !== oriEml || bpTelno !== oriTel || pass !== null || chkPass !== null) {
	            $("#updateBtn").css("border", "0.5px solid #1890FF");
	            $("#updateBtn").attr("disabled", false); // 버튼 활성화
	        } else {
	            $("#updateBtn").css("border", "0.5px solid #e4e4e4");
	            $("#updateBtn").attr("disabled", true); // 버튼 비활성화
	        }
	    });
		
		$("#updateBtn").on("click", function() {
			
			if(pwRs !== true || pwChkRs !== true || telRs !== true || emlRs !== true) {
				alert("모든 항목을 올바르게 입력해주세요");
				return;
			};			
			
			let formData = new FormData();
			
			formData.append("memId", memId);
		    // empMoblphon에서 하이픈 제거
		    let bpTelValue = $("#bpTelno").val().replace(/-/g, "");
		    formData.append("bpTelno", bpTelValue);
			formData.append("bpEml", $("#bpEml").val());
			
			if($("#pass").val().trim() !== "") {
			    formData.append("password", $("#pass").val());
			}
			
			$.ajax({
				url : "/bp/mypage/updateBp",
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

			<div class="imgDiv" style="display:flex; justify-content:center; align-items:center; flex-direction: column;">
				<img class="profileImgBp"
				        src="/download?filePath=${bpVO.bpImgUrl}&fileOrgnlFileNm=${bpVO.bpImgNm}"
				        alt="User profile picture"
				        style="width:150px; height:150px;"
				        onerror="this.onerror=null; this.src='/resources/images/profile.jpg';">
				
			</div>
		
		
			<label style="margin-top:20px;">업체정보</label>
			<div class="detailDiv">
			
				<div class="detailDivChild" style="margin-left:-30px;">
					<label for="bpNm">업체 명</label>
					<input type="text" id="bpNm" name="bpNm" value="${bpVO.bpNm }" style="width:220px;" readonly />
				</div>
					
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

				<div class="detailDivChild">
					<label for="bpEml">이메일</label>
					<input type="text" id="bpEml" name="bpEml" value="${bpVO.bpEml}" style="width:220px; border:0.5px solid #1890FF;"/>		
					<div class="emlResult" style="width:30px; height:30px; margin-left:10px;"></div>
				</div>

				<div class="detailDivChild">
					<label for="bpTelno">연락처</label>
					<input type="text" id="bpTelno" name="bpTelno" value="${bpVO.bpTelno}" style="width:220px; border:0.5px solid #1890FF;"/>		
					<div class="telResult" style="width:30px; height:30px; margin-left:10px;"></div>
				</div>
				
				<div class="detailDivChild">
					<label for="deptNm">업체 분류</label>
					<input type="text" id="deptNm" name="deptNm" value="${bpVO.deptNm}" style="width:220px;" readonly/>
				</div>
				
				<c:if test="${bpVO.deptCd == 'C6' }">
					<div class="detailDivChild" >
						<label for="frnSeCdNm">상세 분류</label>
						<input type="text" id="frnSeCdNm" name="frnSeCdNm" value="${bpVO.frnSeCdNm}" style="width:220px;" readonly/>
					</div>
				</c:if>
				
				<div class="detailDivChild">
					<label for="ctrtYmd">계약일</label>
					<input type="text" id="ctrtYmd" name="ctrtYmd" value="${bpVO.ctrtYmd}" style="width:220px;" readonly/>				
				</div>

				<div class="detailDivChild">
					<label for="ctrtEndYmd">계약 종료일</label>
					<input type="text" id="ctrtEndYmd" name="ctrtEndYmd" value="${bpVO.ctrtEndYmd}" style="width:220px;" readonly/>				
				</div>

				<div class="detailDivChild">
					<label for="bpRprsvNm">담당직원</label>
					<input type="text" id="bpRprsvNm" name="bpRprsvNm" value="${bpVO.bpRprsvNm}" style="width:220px;" readonly/>		
				</div>
				
				
			</div> <!-- detailDiv 끝 -->
		
		<div class="footer">
			<button type="button" id="updateBtn" disabled>수정</button>
		</div>

	
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