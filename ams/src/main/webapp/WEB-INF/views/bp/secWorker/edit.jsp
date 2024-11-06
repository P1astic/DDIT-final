<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/secWorker/detail.css">

<script>
//주소 API 카카오
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            // 도로명 주소 선택 시
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { // 지번 주소 선택 시
                addr = data.jibunAddress;
            }

            // 추가 주소 정보가 있는 경우
            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample6_extraAddress").value = extraAddr;
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보 입력
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_detailAddress").focus();  // 상세 주소 입력으로 포커스 이동
        }
    }).open();
}

// 페이지 로드 시 CKEditor 초기화
document.addEventListener('DOMContentLoaded', function() {
    initCKEditor();
});

// 프로필 사진 변경을 위한 함수
function changeProfilePicture(filePath) {
    document.getElementById('profilePicture').click();
}

// 선택한 파일 미리보기
function previewProfilePicture(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const img = document.createElement('img');
            img.src = e.target.result;
            img.style.width = '150px';
            img.style.height = '150px';
            img.style.borderRadius = '15px';
            img.style.border = '2px solid #ddd';

            // 기존의 이미지 요소를 업데이트
            const fileListDiv = document.querySelector('.fileList');
            fileListDiv.innerHTML = ''; // 기존 이미지를 지움
            fileListDiv.appendChild(img); // 새로운 이미지를 추가

            // 파일 입력 필드를 리셋하여 클릭 가능하도록 설정
            document.getElementById('profilePicture').value = ''; // Reset the file input
            // Re-add click event
            document.getElementById('profilePicture').onclick = function() {
                this.value = ''; // Reset to allow for re-upload
                this.click();
            };
        };
        reader.readAsDataURL(file);
    }
}

// CKEditor5 적용
let editorInstance;

function initCKEditor() {
    ClassicEditor.create(document.querySelector('#memo'), {
        ckfinder: {
            uploadUrl: '/image/upload?${_csrf.parameterName}=${_csrf.token}'
        }
    })
    .then(editor => {
        editorInstance = editor;

        // CKEditor의 데이터가 변경될 때마다 textarea 업데이트
        editor.model.document.on('change:data', () => {
            const data = editor.getData();
            document.querySelector('#memo').value = data; 
        });

        // 페이지 로드 시 기존 데이터 세팅
        editor.setData(document.querySelector('#memo').value); // 기존 데이터 로드
    })
    .catch(err => {
        console.error(err.stack);
    });
}

$(function() {	
	$("#btnDel").on("click", function() {
		let memSeq = $("#memSeq").val();
		console.log("선택한 게시물 번호 : " + memSeq);
		
		if(confirm("해당 게시물을 삭제하시겠습니까?")) {
			// 선택한 게시물 삭제 처리	
			$.ajax({
				url: "/bp/secWorker/delete",
				type: "post",
				data: { "memSeq": memSeq },
				beforeSend: function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(result) {
					console.log("result : " + result);
					window.location.href = "/bp/secWorker/list"; 
				},
				error: function(xhr, status, error) {
					console.error("에러 발생: ", error);
					alert("삭제 중 오류가 발생했습니다.");
				}
			});
		} else {
			alert("삭제 취소되었습니다.");
			return false;
		}
	});
});
</script>

<style>
.ck-editor__editable {
  min-height: 330px;
  max-height : auto;
  min-width : 100px;
  max-width : auto;
}
.btn{
 border-radius : 5px;
 width: 60px;
 height : 32.5px;


}
</style>


<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12"> 
            <div class="card shadow-sm">
				<div class="card-header bg-white text-black text-center py-4">
				    <h3 style="font-size: 1.8rem;">작업자 수정 </h3>
				</div>

                <div class="card-body p-5">
                    <form action="/bp/secWorker/editFrom" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="memSeq" name="memSeq" value="${securityWorkerVO.memSeq}" />

                        <div class="form-group row mt-4">
                            <label for="workerName" class="col-sm-2 col-form-label d-flex align-items-center" style="font-size: 1.2rem;">이름</label>
                            <div class="col-sm-7 d-flex align-items-center">
                                <input type="text" class="form-control" id="workerName" name="workerName" value="${securityWorkerVO.workerName}" style="height: 55px;  width: 470px; font-size: 1.2rem;">
                                <c:if test="${securityWorkerVO.fileGroupNo > 0}">
                                    <div class="file-info">
                                        <div class="fileList">
                                            <input type="hidden" name="fileGroupNo" id="fileGroupNo" value="${securityWorkerVO.fileGroupNo}">
                                            <c:forEach var="fileDetailVO" items="${fileDetailVOList}" varStatus="status">
                                                <div id="fileNum${status.index}" class="d-flex">
                                                    <button type="button" style="background:none; border:none; padding: 0;" onclick="changeProfilePicture('${fileDetailVO.fileFilePathNm}');">
                                                       
                                                    </button>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                                <input type="file" id="profilePicture" name="profilePicture" accept="image/*" style="display: none;" onchange="previewProfilePicture(event);" />
                            </div>
                        </div>

                        <!-- 회사 전화번호 -->
                        <div class="form-group row mt-4">
                            <label for="empTel1" class="col-sm-2 col-form-label d-flex align-items-center" style="font-size: 1.2rem;">전화번호</label>
                            <div class="col-sm-9 d-flex">
                                <input type="text" class="form-control" id="memTel1" name="memTel1" value="${securityWorkerVO.memTel1}" style="width: 150px; height: 50px; margin-right: 10px; font-size: 1.1rem;">
                                <input type="text" class="form-control" id="memTel2" name="memTel2" maxlength="4" value="${securityWorkerVO.memTel2}" style="width: 150px; height: 50px; margin-right: 10px; font-size: 1.1rem;">
                                <input type="text" class="form-control" id="memTel3" name="memTel3" maxlength="4" value="${securityWorkerVO.memTel3}" style="width: 150px; height: 50px; font-size: 1.1rem;">
                            </div>
                        </div>

                        <div class="form-group row mt-4">
                            <label for="sample6_postcode" class="col-sm-2 col-form-label">우편번호</label>
                            <div class="col-sm-9">
                                <div class="d-flex mb-2">
                                    <input type="text" id="sample6_postcode" name="postcode" class="form-control" readonly>
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary ml-2" style="height:41px;border:none; width: 142px; background-color:#1890FF ">
                                </div>
                                <input type="text" id="sample6_address" name="memAdd1" class="form-control mt-2" value="${securityWorkerVO.memAdd1}" required>
                                <input type="text" id="sample6_detailAddress" name="memAdd2" class="form-control mt-2" value="${securityWorkerVO.memAdd2}" required placeholder="상세주소">
                                <input type="text" id="sample6_extraAddress" class="form-control mt-2" placeholder="참고항목">
                            </div>
                        </div>

                        <!-- 이메일 입력 -->
<!-- 이메일 입력 -->
<div class="form-group row mt-4">
    <label for="emailId" class="col-sm-2 col-form-label">이메일</label>
    <div class="col-sm-3 d-flex align-items-center">
        <input type="text" class="form-control" id="emailId" name="emailId" placeholder="이메일 아이디" value="${securityWorkerVO.mail.split('@')[0]}">
    </div>
    <span >@</span>
    <div class="col-sm-3 d-flex align-items-center">
        <input type="text" class="form-control" id="emailDomain" name="emailDomain" placeholder="이메일 주소" value="${securityWorkerVO.mail.split('@')[1]}" readonly>
    </div>
    <div class="col-sm-2">
        <select id="emailSelect" class="form-control" onchange="updateEmailDomain()">
            <option value="">선택</option>
            <option value="gmail.com">gmail.com</option>
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="custom">직접 입력</option>
        </select>
    </div>
</div>
                        <input type="hidden" id="mail" name="mail" value="${securityWorkerVO.mail}">
                        <div id="emailError" class="text-danger text-center" style="display:none;"></div>

                        <script>
                        function updateEmailDomain() {
                            const select = document.getElementById("emailSelect");
                            const domainInput = document.getElementById("emailDomain");
                            
                            if (select.value === "custom") {
                                domainInput.readOnly = false; // 직접 입력 가능
                                domainInput.placeholder = "직접 입력하세요"; // Placeholder 변경
                            } else {
                                domainInput.value = select.value; // 선택한 도메인으로 업데이트
                                domainInput.readOnly = true; // 읽기 전용으로 설정
                            }
                        }

                        // 페이지 로드 시 초기 도메인 값 설정
                        document.addEventListener('DOMContentLoaded', function() {
                            const emailDomain = document.getElementById("emailDomain");
                            const emailSelect = document.getElementById("emailSelect");
                            const currentDomain = emailDomain.value;

                            // 현재 도메인으로 선택된 옵션 설정
                            if (currentDomain) {
                                const option = Array.from(emailSelect.options).find(opt => opt.value === currentDomain);
                                if (option) {
                                    option.selected = true; // 해당 옵션 선택
                                    emailSelect.dispatchEvent(new Event('change')); // 변경 이벤트 트리거
                                }
                            }
                        });
                        </script>

                        <!-- 메모 입력 -->
                        <div class="form-group row mt-4">
                            <label for="memo" class="col-sm-2 col-form-label">메모</label>
                            <div class="col-sm-9">
                                <textarea name="memo" id="memo" rows="10" class="form-control">${securityWorkerVO.memo}</textarea>
                            </div>
                        </div>

						<div class="text-center mt-4">
						    <a href="/bp/secWorker/list" class="btn btn-secondary btn-lg" style=" float: left; background-color:#6c757d; font-size: 10px; border: none;  margin-left: 151Fpx;">목록</a>
						    <button type="submit" class="btn btn-primary btn-lg" style="float: right; font-size: 10px;  background-color:#1890FF; border: none; margin-right: 75px;">수정</button>
						    <button type="button" name="btnDel" class="btn btn-danger btn-lg" style="float: right; background-color:rgba(255, 0, 0,1); margin-right:10px; font-size: 10px; border: none;" id="btnDel">삭제</button>
						</div>
                        <sec:csrfInput/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>