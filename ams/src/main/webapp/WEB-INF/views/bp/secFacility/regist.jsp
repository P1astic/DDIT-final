<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>




<style>
    /* 전체 폰트 크기 증가 */
    body {
        font-size: 18px;
    }

    /* 카드 크기 증가 */
    .card {
        max-width: 900px;
        margin: 0 auto;
    }

    /* 제목 크기 증가 */
    .card-header h4 {
        font-size: 28px;
    }

    /* 라벨 크기 증가 */
    .col-form-label {
        font-size: 20px;
    }

    /* 입력 필드 크기 증가 */
    .form-control {
        font-size: 18px;
        height: 50px;
    }

    /* 버튼 크기 증가 */
    .btn {
       
        border-radius : 5px;
		 width: 60px;
		 height : 32.5px;

    }

    /* 우편번호 찾기 버튼 크기 조정 */
    input[type="button"] {
        height: 50px;
        font-size: 18px;
    }



    /* 전화번호 입력 필드 너비 조정 */
    #empTel1, #empTel2, #empTel3 {
        width: 120px !important;
    }

    /* 하단 버튼 간격 조정 */
    .card-footer {
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .card-footer .btn {
        margin-left: 15px;
        margin-right: 15px;
    }
</style>	


<script>

//주소api 카카오
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 도로명 주소
                    addr = data.roadAddress;
                } else { // 지번 주소
                    addr = data.jibunAddress;
                }

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

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }


    $(document).ready(function() {
        // 비밀번호 정규식: 소문자, 숫자, 특수문자를 포함, 최소 8자 이상
        var passwordRegex = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\-=/])[a-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\-=/]{8,}$/;

        // 비밀번호 확인 버튼 클릭 시 유효성 검사
        $('#checkPasswordBtn').on('click', function() {
            var password = $('#empPass').val();
            if (passwordRegex.test(password)) {
                alert('사용가능한 비밀번호입니다!');
            } else {
                alert('비밀번호는 8자 이상이어야 하며, 소문자, 숫자, 특수문자를 포함해야 합니다.');
                // 입력값 초기화
                $('#empPass').val('');
            }
        });

        // 폼 제출 시 유효성 검사
        $('form').on('submit', function(event) {
            var password = $('#empPass').val();
            if (!passwordRegex.test(password)) {
                alert('사용할수없는 비밀번호입니다 다시 입력하세요!');
                event.preventDefault();  // 폼 제출을 막음
            }
        });
    });


</script>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script type="text/javascript">
$(function() {
    var memId = "${memVO.memId}";
    console.log("로그인된 사용자 ID: ", memId);
});


</script>



<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm" style="border: 1px solid; ">
                <div class="card-header bg-white text-dark text-center">
				    <h4>업체 등록</h4>
				</div>

                <div class="card-body">
                    <!-- 보안 회사 등록 폼 -->
                   <form action="/bp/secFacility/facilityRegistFrom" method="POST">
                        <!-- 숨겨진 필드: userId를 폼에 추가 -->
                        <input type="hidden" name="userId" value="${memVO.memId}" />

                        <!-- 회사/기관명과 대표자 한 줄에 배치 -->
                        <div class="form-group row mt-3">
                            <label for="empNm" class="col-sm-3 col-form-label">회사/기관명</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="empName" name="empName" value="${SecurityCompanyVO.empName}">
                            </div>
                        </div>
						<div class="form-group row mt-3">
							<label for="deptNm" class="col-sm-3 col-form-label">대표자</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="expName"
									name="expName" value="${SecurityCompanyVO.expName}">
							</div>
						</div>

						<!-- 회사 전화번호 -->
		<div class="form-group row mt-3">	
		    <label for="empTel1" class="col-sm-3 col-form-label">회사 전화번호</label>
		    <div class="col-sm-9">
		        <div class="d-flex">
<select class="form-control" id="empTel1" name="empTel1" style="width: 100px; margin-right: 5px;">
    <option value="02" ${SecurityCompanyVO.empTel1 == '02' ? 'selected' : ''}>02 (서울)</option>
    <option value="031" ${SecurityCompanyVO.empTel1 == '031' ? 'selected' : ''}>031 (경기)</option>
    <option value="032" ${SecurityCompanyVO.empTel1 == '032' ? 'selected' : ''}>032 (인천)</option>
    <option value="033" ${SecurityCompanyVO.empTel1 == '033' ? 'selected' : ''}>033 (강원)</option>
    <option value="041" ${SecurityCompanyVO.empTel1 == '041' ? 'selected' : ''}>041 (충남)</option>
    <option value="042" ${SecurityCompanyVO.empTel1 == '042' ? 'selected' : ''}>042 (대전)</option>
    <option value="043" ${SecurityCompanyVO.empTel1 == '043' ? 'selected' : ''}>043 (충북)</option>
    <option value="044" ${SecurityCompanyVO.empTel1 == '044' ? 'selected' : ''}>044 (세종)</option>
    <option value="051" ${SecurityCompanyVO.empTel1 == '051' ? 'selected' : ''}>051 (부산)</option>
    <option value="052" ${SecurityCompanyVO.empTel1 == '052' ? 'selected' : ''}>052 (울산)</option>
    <option value="053" ${SecurityCompanyVO.empTel1 == '053' ? 'selected' : ''}>053 (대구)</option>
    <option value="054" ${SecurityCompanyVO.empTel1 == '054' ? 'selected' : ''}>054 (경북)</option>
    <option value="055" ${SecurityCompanyVO.empTel1 == '055' ? 'selected' : ''}>055 (경남)</option>
    <option value="061" ${SecurityCompanyVO.empTel1 == '061' ? 'selected' : ''}>061 (전남)</option>
    <option value="062" ${SecurityCompanyVO.empTel1 == '062' ? 'selected' : ''}>062 (광주)</option>
    <option value="063" ${SecurityCompanyVO.empTel1 == '063' ? 'selected' : ''}>063 (전북)</option>
    <option value="064" ${SecurityCompanyVO.empTel1 == '064' ? 'selected' : ''}>064 (제주)</option>
</select>
		            <input type="text" class="form-control" id="empTel2" name="empTel2" maxlength="4" placeholder="0000" style="width: 100px; margin-right: 5px;" value="${SecurityCompanyVO.empTel2}">
		            <input type="text" class="form-control" id="empTel3" name="empTel3" maxlength="4" placeholder="0000" style="width: 100px;" value="${SecurityCompanyVO.empTel3}">
		        </div>
		    </div>
		</div>

                        <!-- 주소 입력 -->
                        <div class="form-group row mt-4">
                            <label style="" for="sample6_postcode" class="col-sm-3 col-form-label">우편번호</label>
                            <div class="col-sm-9">
                                <div class="d-flex mb-2">
                                    <input type="text" id="sample6_postcode" name="empZip" placeholder="우편번호" class="form-control" readonly>
                                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" 
                                    style="width: 120px; background-color: #1890FF; font-size: 13px; border: none;  text-align: center;"
                                    class="btn btn-secondary ml-2">
                                </div>
                                <input type="text" id="sample6_address" name="empAdd1" placeholder="기본 주소" class="form-control mt-2" readonly>
                                <input type="text" id="sample6_detailAddress" name="empAdd2" placeholder="상세 주소" class="form-control mt-2">
                                <input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control mt-2" readonly>
                            </div>
                        </div>

                        <!-- 비밀번호 입력 및 유효성 검사 버튼 -->
<div class="form-group row mt-4">
    <label for="empPass" class="col-sm-3 col-form-label">비밀번호</label>
    <div style="display: flex; align-items: center;"> <!-- 수평 정렬을 위한 div 추가 -->
    <input type="password" class="form-control" id="empPass" name="empPass" placeholder="비밀번호 입력" required style="width: 90%; height: 38px; "> <!-- 높이 조정 -->
    <button type="button" style="background-color: #1890FF;  font-size:13px; width:150px; height: 40px; display: flex; align-items: center;  border: none;" class="btn btn-secondary ml-2" id="checkPasswordBtn">비밀번호 확인</button>
</div>
</div>
  	
                        <!-- 하단 버튼 -->
			<div class="card-footer text-center mt-4">
			    <a href="/bp/secFacility/list" class="btn" style="background-color: #6c757d; float:left; font-size:15px;  border: none; color: white;">목록</a>
			    <button type="submit" class="btn" style="background-color: #1890FF; border: none; float:right; font-size:15px; color: white; margin-left: 10px; ">저장</button>
			</div>
                        
                    	<sec:csrfInput/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>