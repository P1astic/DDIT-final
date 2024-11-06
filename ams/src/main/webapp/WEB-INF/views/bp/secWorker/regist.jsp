<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<!-- 스타일 추가 -->
<style>
.ck-editor__editable {
  min-height: 330px;
  max-height : auto;
  min-width : 100px;
  max-width : auto;
}
    body {
        background-color: white;
        color: black;
    }
    .form-group label {
        font-size: 14px;
        font-weight: bold;
        color: black;
    }
    .form-control, .form-control-sm {
        font-size: 14px;
        margin-bottom: 5px;
        color: black;
    }
    .form-control-sm {
        height: calc(1.5em + 0.75rem + 2px);
        padding: 0.25rem 0.5rem;
        color: black;
    }
    .btn {
        font-size: 14px;
    }
    .container {
        margin-top: 20px;
    }
    .card {
        background-color: white;
    }
    .card-header {
        background-color: white;
        color: black;
        text-align: center;
        padding: 15px;
        border-bottom: 1px solid #ddd;
    }
    .card-body {
        padding: 30px;
        color: black;
    }
    .row {
        margin-bottom: 10px;
    }
    .input-group-append button {
        height: calc(1.5em + 0.75rem + 2px);
    }
</style>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script type="text/javascript">
    $(function() {
        var memId = "${memVO.memId}";
        console.log("로그인된 사용자 ID: ", memId);
    });
</script>

<script>
    function combineEmailFields() {
        var emailId = $('#emailId').val();
        var emailDomain = $('#emailDomain').val();
        var fullEmail = emailId + '@' + emailDomain;

        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(fullEmail)) {
            $('#emailError').text('유효한 이메일 주소를 입력하세요.').show();
            return false;
        } else {
            $('#emailError').hide();
            $('#mail').val(fullEmail);
            return true;
        }
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    fullAddr = data.roadAddress;
                } else {
                    fullAddr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                }

                document.getElementById('zipCode').value = data.zonecode;
                document.getElementById('memAdd1').value = fullAddr;
                document.getElementById('memAdd2').focus();
            }
        }).open();
    }

    $(document).ready(function() {
        $('#emailSelect').on('change', function() {
            var selectedDomain = $(this).val();
            if (selectedDomain === 'custom') {
                $('#emailDomain').val('').prop('readonly', false).focus();
            } else {
                $('#emailDomain').val(selectedDomain).prop('readonly', true);
            }
        });

        $('form').on('submit', function(event) {
            if (!combineEmailFields()) {
                event.preventDefault();
                alert('유효한 이메일 주소를 입력하세요!');
            }
        });

        $('#imageUpload').on('change', function(event) {
            var reader = new FileReader();
            reader.onload = function() {
                $('#profileImage').attr('src', reader.result).css({
                    'display': 'block',
                    'width': '300px',
                    'height': 'auto'
                });
            };
            reader.readAsDataURL(event.target.files[0]);
        });

        $('#empName').on('change', function() {
            var selectedEmpName = $(this).val();
            // 회사 코드 hidden input에 값 설정
            $('#facId').val(selectedEmpName);
        });
    });
</script>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h4>작업자 등록</h4>
                </div>
                <div class="card-body">
                    <form action="/bp/secWorker/secWorkerRegistFrom" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="userId" value="${memVO.memId}" />

                       <!-- 근무자, 회사명 -->
<div class="form-group row">
    <label for="workerName" class="col-sm-2 col-form-label">근무자</label>
    <div class="col-sm-3">
        <input type="text" class="form-control" id="workerName" name="workerName" value="${SecurityWorkerVO.workerName}">
    </div>
</div>

<div class="form-group row">
    <label for="empName" class="col-sm-2 col-form-label">회사명</label>
    <div class="col-sm-3">
        <select class="form-control" id="empName" name="empName" required>
            <option value="">선택하세요</option>
            <c:forEach items="${securityCompanyVOList}" var="company">
                <option value="${company.facId}">${company.empName}</option>
            </c:forEach>
        </select>
    </div>
    <!-- 회사 코드 hidden input -->
    <input type="hidden" id="facId" name="facId" required />
</div>
				
                        <!-- 이메일 입력 -->
                        <div class="form-group row">
                            <label for="emailId" class="col-sm-2 col-form-label">이메일</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="emailId" name="emailId" placeholder="이메일 아이디">
                            </div>
                            <div>
                                <span>@</span>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="emailDomain" name="emailDomain" placeholder="이메일 주소" readonly>
                            </div>
                            <div class="col-sm-3">
                                <select id="emailSelect" class="form-control">
                                    <option value="">선택</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="custom">직접 입력</option>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" id="mail" name="mail" value="${SecurityWorkerVO.mail}">
                        <div id="emailError" class="text-danger text-center" style="display:none;"></div>

                        <!-- 주소 입력 -->
                        <div class="form-group row">
						    <label for="zipCode" class="col-sm-2 col-form-label">우편번호</label>
						    <div class="col-sm-6">
						        <div class="input-group">
						            <input type="text" class="form-control" id="zipCode" name="zipCode" placeholder="우편번호" readonly>
						            <div class="input-group-append">
						                <button type="button" class="btn btn-outline-primary" style="margin-left: 10px;" onclick="execDaumPostcode()">우편번호 검색</button>
						            </div>
						        </div>
						    </div>
						</div>

                        <div class="form-group row">
                            <label for="memAdd1" class="col-sm-2 col-form-label">주소</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="memAdd1" name="memAdd1" placeholder="주소" readonly>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="memAdd2" class="col-sm-2 col-form-label">상세주소</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="memAdd2" name="memAdd2" placeholder="상세주소">
                            </div>
                        </div>

                        <!-- 전화번호 입력 -->
							<div class="form-group row">
							    <label class="col-sm-2 col-form-label">전화번호</label>
							    <div class="col-sm-3">
							        <input type="text" class="form-control" id=" memTel1" name="memTel1" placeholder="000">
							    </div>
							    <div class="col-sm-3">
							        <input type="text" class="form-control" id=" memTel2" name="memTel2" placeholder="000">
							    </div>
							    <div class="col-sm-3">
							        <input type="text" class="form-control" id=" memTel3" name="memTel3" placeholder="0000">
							    </div>
							</div>

        
				
				<div class="form-group row" style="display: none;">
    <label for="uploadFile" class="col-sm-2 col-form-label">프로필 이미지</label>
    <div class="col-sm-10">
        
        <div class="input-group">
            <div class="custom-file">
                
                <label id="uploadFileBtn" class="custom-file-label" for="uploadFile">파일 선택</label>
                <input type="file" id="uploadFile" name="uploadFile" class="form-control-file" style="display:none;" onchange="showPreview(event);">
            </div>
        </div>
        
        
        <img id="filePreview" src="" alt="프로필 이미지" style="display:none; margin-top: 10px; width: 100px; height: auto;">
    </div>
</div> 

                        <!-- 제출 버튼 -->
 <!-- 내용 (CKEditor 적용) -->
                        <div class="form-group mt-4">
                            <label for="particulars">근무자 특이사항</label>
                            <textarea class="form-control" name="memo" id="memo" placeholder="내용을 입력하세요" required>${SecurityFacilityVO.memo}</textarea>
                        </div>

						<div class="card-footer text-center mt-4">
						    <a style="background-color: #6c757d; border:none; margin-right: 10px; float: left;" href="/bp/secWorker/list" class="btn btn-secondary">목록</a>
						    <button type="submit" class="btn btn-primary" style="float: right; border:none; background-color: #1890FF;">저장</button>
						</div>
                        <sec:csrfInput/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
                  <script>
// CKEditor5 적용
ClassicEditor.create(document.querySelector('#memo'), {
    ckfinder: {
        uploadUrl: '/image/upload?${_csrf.parameterName}=${_csrf.token}'
    }
}).then(editor => {
    window.editor = editor;

    // CKEditor가 변경될 때마다 textarea의 값을 업데이트
    editor.model.document.on('change:data', () => {
        const data = editor.getData();
        document.querySelector('#memo').value = data; // 수정된 부분
    });
}).catch(err => {
    console.error(err.stack);
});
</script>