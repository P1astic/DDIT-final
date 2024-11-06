<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css"
	rel="stylesheet" media="screen" />
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>

<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/cusForm.css">
<script
	src="/resources/adminlte3/docs/assets/plugins/jquery/jquery.min.js"></script>
<script
	src="/resources/adminlte3/plugins/codemirror/addon/comment/comment.js"></script>
 
 
<script type="text/javascript">
let fileInput = document.getElementById("uploadFile");
let files = [];
const maxFiles = 10;

function handleFile(e) {
    let newFiles = e.target.files;
    if (files.length + newFiles.length > maxFiles) {
        $("#fileModal").modal('show');
        return;
    }
    for (let i = 0; i < newFiles.length; i++) {
        files.push(newFiles[i]);
    }
    updateFileList();
}

$(function() {
    $("input:radio[name=custBrdAnsYn]").click(function() {
        if ($(this).val() === "Y") {
            $("#custBrdAnsty").prop("disabled", false);
        } else {
            $("#custBrdAnsty").prop("disabled", true).val(""); // Reset selection when disabled
        }
    });

    $("#registBtn").on("click", function(e) {
        e.preventDefault();

        if (!inputCheck()) {
            return;
        }

        var formData = new FormData($('#registForm')[0]);

        if ($('input:radio[name=agree01]:checked').val() !== 'Y') {
            alert("<개인정보 수집이용 동의(필수)> 미동의 시, VOC 등록이 불가합니다.");
            $("#agree01").focus();
            return;
        }

        if ($('input:radio[name=agree02]:checked').val() !== 'Y') {
            alert("<개인정보의 제3자 제공동의(선택)> 미동의 시, VOC 등록이 불가합니다.");
            $("#agree02").focus();
            return;
        }

        if ($('input:radio[name=agreeYn]:checked').val() !== 'Y') {
            if (!confirm("<이벤트(포상) 활용 동의서(선택)> 미동의 시, 이벤트(포상) 참여가 불가합니다. 이대로 진행하시겠습니까?")) {
                $("#agree03").focus();
                return;
            }
        }

        if (!confirm("등록하시겠습니까?")) {
            return;
        }

        $.ajax({
            url: '/cust/cus/registPost',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(data) {
            	
				$("#successModal").modal('show');
				setTimeout(() => window.location.href="/cust/cus/cusList?name="+$("#custBrdNm").val() + "&phone=" + $("#custBrdMbiph").val(), 1000);
            },
            error: function(xhr, status, error) {
                alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                console.log(xhr);
            }
        });
    });
});

function inputCheck() {
    if ($("#custBrdTtl").val().trim() == "") {
        alert("제목을 입력해주세요.");
        $("#custBrdTtl").focus();
        return false;
    }

    if ($("#custBrdCn").val().trim() == "") {
        alert("내용을 입력해주세요.");
        $("#custBrdCn").focus();
        return false;
    }

    if (!$("input:radio[name=custBrdAnsYn]").is(":checked")) {
        alert("답변필요여부를 선택해주세요.");
        return false;
    }

    if (!$("input:radio[id=YN3]").is(":checked") && !$("input:radio[id=YN4]").is(":checked")) {
        alert("공개여부를 선택해주세요.");
        return false;
    }

    if ($("input:radio[name=custBrdAnsYn][value='Y']").is(":checked") && $("#custBrdAnsty").val() == "") {
        alert("답변방법을 선택해주세요.");
        $("#custBrdAnsty").focus();
        return false;
    }

    return true;
}
</script>


<body class="typeSub typeHeanBnr">
	<div class="container">
		<div id="contents">
			<article>
				<form id="registForm" name="registForm" method="post"
					enctype="multipart/form-data">
					<div class="voc-wrap Noto">
						<div class="board_area">
							<p class="write_guide">
								<span class="mark_need" style="color:red;">*</span> 표시가 있는 항목은 필수로 입력하셔야 합니다.
							</p>
							<div class="lineList_tbW">
								<table>
									<caption>
										나의 고객의 소리 입력표
										<p>성명, 휴대폰번호, 이메일, 종류, 제목, 내용, 답변필요여부, 답변방법, 공개여부, 첨부파일을
											입력 할 수 있는 표</p>
									</caption>
									<colgroup>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">성명</th>
											<td><input type="text" name="custBrdNm" readonly id="custBrdNm"
												value="${custInfoVO.name}" /></td>
											<th scope="row">휴대폰번호</th>
											<td><input type="text" name="custBrdMbiph" readonly id="custBrdMbiph"
												value="${custInfoVO.phone}" /></td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td><input type="text" name="custBrdEmi" value="" /></td>
											<th scope="row">종류<span class="mark_need" style="color:red;">*</span></th>
											<td><select class="inp_s" name="cusType" id="cusType"
												title="민원 종류">
													<option value="A1100"
														<c:if test="${selType=='A1100'}">selected</c:if>>주차장</option>
													<option value="A1102"
														<c:if test="${selType=='A1102'}">selected</c:if>>체크인카운터</option>
													<option value="A1103"
														<c:if test="${selType=='A1103'}">selected</c:if>>신분확인</option>
													<option value="A1106"
														<c:if test="${selType=='A1106'}">selected</c:if>>보안검색</option>
													<option value="A1104"
														<c:if test="${selType=='A1104'}">selected</c:if>>출국심사</option>
													<option value="A1107"
														<c:if test="${selType=='A1107'}">selected</c:if>>기내탑승</option>
													<option value="A1111"
														<c:if test="${selType=='A1111'}">selected</c:if>>수하물찾기</option>
													<option value="A1108"
														<c:if test="${selType=='A1108'}">selected</c:if>>세관심사</option>
													<option value="A1105"
														<c:if test="${selType=='A1105'}">selected</c:if>>기타사항</option>
											</select></td>
										</tr>
										<tr class="w_tit">
											<th scope="row">제목<span class="mark_need" style="color:red;">*</span></th>
											<td colspan="3"><input type="text" class="inp_t"
												name="custBrdTtl" title="제목을 입력" id="custBrdTtl" value=""></td>
										</tr>
										<tr class="w_txt">
											<th scope="row">내용<span class="mark_need" style="color:red;">*</span></th>
											<td colspan="3"><textarea class="inp_area" rows="10"
													name="custBrdCn" title="내용입력" id="custBrdCn"></textarea></td>
										</tr>
										<tr>
											<th scope="row">답변필요여부<span class="mark_need" style="color:red;">*</span></th>
											<td><span class="inp_r"> <input type="radio"
													title="답변필요여부 예" name="custBrdAnsYn" id="custBrdAnsYn"
													value="Y"> <label for="Y">예</label></span> <span
												class="inp_r"> <input type="radio" title="답변필요여부 아니오"
													name="custBrdAnsYn" id="custBrdAnsYn" value="N"><label
													for="N">아니오</label></span></td>
											<th scope="row">답변방법</th>
											<td><select class="inp_s" name="custBrdAnsty"
												id="custBrdAnsty" title="답변방법" disabled="">
													<option value="">선택</option>
													<option value="E">이메일</option>
													<option value="M">전화</option>
											</select></td>
										</tr>

										<tr style="display: none">
											<th scope="row"><span class="mark_need">[필수]</span>공개여부</th>
											<td colspan="3"><span class="inp_r"><input
													type="radio" title="공개" name="openYn" id="YN3" value="Y"><label
													for="YN3">공개</label></span> <span class="inp_r"><input
													type="radio" title="비공개" name="openYn" id="YN4" value="N"
													checked=""><label for="YN4">비공개</label></span> <span
												class="subTxt4">비공개 선택 시 나의 고객의 소리에서만 확인 가능합니다.</span></td>
										</tr>

										<tr class="w_addFile_s">
											<th scope="row">첨부파일</th>
											<td colspan="3" class="fileArea"><input type="file"
												id="uploadFile" name="uploadFile" multiple
												style="display: none;" /> <script>
		                    	$(function(){
		                    		$("input#btn_fileFind1").on("focusin", function(event){
		                    			$("label.btn_fileFind").css("border","2px solid #000");
		                    		});
		                    		$("input#btn_fileFind1").on("focusout", function(event){
		                    			$("label.btn_fileFind").css("border","1px solid #8f8f92");
		                    		});
		                    	})
	                    		
		                    </script>
												<div id="find_file">
													<input type="text" class="inp_t" id="fileName"
														readonly="readonly" title="첨부파일"> <input
														type="file" id="btn_fileFind1" class="btn_fileFind"
														name="ufiles" title="파일찾기"
														onchange="javascript:var arrNm = this.value.split('\\'); document.getElementById('fileName').value = arrNm[arrNm.length - 1];">
													<label for="btn_fileFind1" class="btn_fileFind" onclick="">파일찾기</label>
												</div> <em class="subTxt4 sBullet2" data-cont="-">첨부가능 파일 목록
													: hwp, doc, docx, txt, rtf, pdf, ppt, pptx, xls, xlsx, gif,
													jpg, png, bmp, zip<br>
											</em> <em class="subTxt4 sBullet2" data-cont="-">첨부가능 용량 :
													10MB</em></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div style="margin-top: 20px">

								<p class="subTxt1 lv3 tit">개인정보 수집이용 동의(필수) 주요 내용</p>
								<div class="txt-scroll mB10">
									<div>
										<strong style="font-weight: 700; font-size: 18px">개인정보
											수집항목</strong>
										<div class="lineTop_tbArea mT10" style="min-width: 500px">

											<tobdy> </tobdy>
											<table class="lineTop_tb2 ">
												<caption>수집 목적, 수집 항목, 보유기간으로 이루어진 표</caption>
												<colgroup>
													<col style="width: 33.33%">
													<col style="width: 33.33%">
													<col style="width: 33.33%">
												</colgroup>
												<thead>
													<tr>
														<th scope="col">수집 목적</th>
														<th scope="col">수집 항목</th>
														<th scope="col">보유기간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td style="background-color: #fff">고객의 소리(VOC) 민원 처리
															및 처리결과 전달</td>
														<td style="background-color: #fff">ID, 성명, 이메일,
															휴대전화번호, 상담내용</td>
														<td style="background-color: #fff">5년</td>
													</tr>

												</tbody>
											</table>
										</div>
										<p class="subTxt1 lv3 mT20">※ 위의 개인정보 수집·이용에 대한 동의를 거부할
											권리가 있습니다. 그러나 동의를 거부할 경우 고객의 소리 등록 및 답변 제공에 제한을 받을 수 있습니다.</p>
									</div>
								</div>
								<div style="text-align: right">
									<div>위와 같이 개인정보를 수집·이용하는데 동의하십니까?</div>
									<input type="radio" name="agree01" id="agree01" value="Y"
										title="예"> <label for="agree01" class="mR5">예</label>
									<input type="radio" name="agree01" id="disagree01" value="N"
										title="아니오"> <label for="disagree01">아니오</label>
								</div>
							</div>
							<div style="margin-top: 20px">

								<p class="subTxt1 lv3 tit">개인정보 3자 제동공동의(선택) 주요 내용</p>
								<div class="txt-scroll mB10">
									<div>
										<strong style="font-weight: 700; font-size: 18px">개인정보
											3자 제공 내역</strong>
										<div class="lineTop_tbArea mT10" style="min-width: 500px">
											<tobdy> </tobdy>
											<table class="lineTop_tb2">
												<caption>제공받는자, 제공 목적, 제공 항목, 보유기간으로 이루어진 표</caption>
												<colgroup>
													<col style="width: 40%">
													<col style="width: 25%">
													<col style="width: 25%">
													<col style="width: 10%">
												</colgroup>
												<thead>
													<tr>
														<th scope="col">제공받는자</th>
														<th scope="col">제공 목적</th>
														<th scope="col">제공 항목</th>
														<th scope="col">보유기간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td style="background-color: #fff">한국철도공사, 인천공항공사</td>
														<td rowspan="3" style="background-color: #fff">고객의
															소리(VOC) 민원처리</td>
														<td rowspan="3" style="background-color: #fff">성명,
															이메일, 휴대전화 번호, 상담내용</td>
														<td rowspan="3" style="background-color: #fff">5년</td>
													</tr>
													<tr>
														<td
															style="background-color: #fff; border-right: 1px solid #dadee1">
															항공사(대한항공, 아시아나항공, 에어부산, 에어서울, 에어로케이, 이스타항공, 제주항공, 진에어,
															티웨이항공)</td>
													</tr>
													<tr>
														<td
															style="background-color: #fff; border-right: 1px solid #dadee1">
															남부공항서비스, 항공보안파트너스</td>
													</tr>

												</tbody>
											</table>
										</div>
										<p class="subTxt1 lv3 mT20">※ 위의 개인정보 수집·이용에 대한 동의를 거부할
											권리가 있습니다. 그러나 동의를 거부할 경우 고객의 소리 등록 및 답변 제공에 제한을 받을 수 있습니다.</p>
									</div>
								</div>

								<div style="text-align: right">
									<div>위와 같이 개인정보를 수집·이용하는데 동의하십니까?</div>
									<input type="radio" name="agree02" id="agree02" value="Y"
										title="예"><label for="agree02" class="mR5">예</label> <input
										type="radio" name="agree02" id="disagree02" value="N"
										title="아니오"><label for="disagree02">아니오</label>
								</div>
							</div>
							<div style="margin-top: 20px">

								<p class="subTxt1 lv3 tit">이벤트(포상) 활용 동의서(선택) 주요 내용</p>
								<div class="txt-scroll mB10">
									<div>
										<strong style="font-weight: 700; font-size: 18px">개인정보
											수집항목</strong>
										<div class="lineTop_tbArea mT10" style="min-width: 500px">
											<table class="lineTop_tb2">
												<caption>수집 목적, 수집 항목, 보유기간으로 이루어진 표</caption>
												<colgroup>
													<col style="width: 33.33%">
													<col style="width: 33.33%">
													<col style="width: 33.33%">
												</colgroup>
												<thead>
													<tr>
														<th scope="col">수집 목적</th>
														<th scope="col">수집 항목</th>
														<th scope="col">보유기간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td style="background-color: #fff">고객이 등록한 고객의
															소리(VOC) 내용에 대한 포상</td>
														<td style="background-color: #fff">성명, 휴대전화번호</td>
														<td style="background-color: #fff">VOC 포상 후, 상품권 발송
															완료시까지</td>
													</tr>

												</tbody>
											</table>
										</div>
										<p class="subTxt1 lv3 mT20">※ 귀하는 위의 개인정보에 대한 수집·이용에 대한
											동의를 거부할 권리가 있으며, 이벤트(포상) 동의 여부와 관계없이 고객의 소리(VOC)를 작성할 수 있습니다.
											그러나 위 이벤트(포상) 활용 거부 시, 상기 목적에 명시된 서비스를 받으실 수 없음을 알려드립니다.</p>
									</div>
								</div>
								<div style="text-align: right">
									<div>위와 같이 개인정보를 수집·이용하는데 동의하십니까?</div>
									<input type="radio" name="agreeYn" id="agree03" value="Y"
										title="예"><label for="agree03" class="mR5">예</label> <input
										type="radio" name="agreeYn" id="disagree03" value=""
										title="아니오"><label for="disagree03">아니오</label>
								</div>
							</div>
							<!-- //쓰기 -->
							<!-- 버튼영역 -->
							<div class="tbArea_btn">
								<!-- href="javascript:regist()" -->
								<button type="button" id="registBtn" class="btnC">
									<span>등록하기</span>
								</button>
								<a href="javascript:history.back()" class="btnC btnGray"><span>취소하기</span></a>
							</div>
							<!-- //버튼영역 -->
						</div>
					</div>
				</form>
			</article>
			<!--          전체 -->
		</div>
		<!-- google -->

	</div>
</body>

<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>글 등록에 성공했습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
