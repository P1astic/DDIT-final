<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/cusForm.css">
<link href="/resources/css/datepicker/datepicker.min.css"
	rel="stylesheet" type="text/css" media="all">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="/resources/adminlte3/docs/assets/plugins/jquery/jquery.min.js"></script>
<script
	src="/resources/adminlte3/plugins/codemirror/addon/comment/comment.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/datepicker/datepicker.min.css">
<link rel="stylesheet"
	href="http://code.jqeury.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- datepicker -->
<script type="text/javascript"
	src="/resources/adminlte3/build/js/datepicker.js"></script>

<link rel="stylesheet"
	href="/resources/css/timepicker/jquery.timepicker.min.css ">
<!-- timepicker -->
<script
	src="/resources/adminlte3/build/js/jquery-timepicker-1.3.5/jquery.timepicker.min.js"></script>

<script type="text/javascript">

let files = []; // 현재 선택된 파일 저장 배열
let fileInput = document.getElementById("uploadFile"); // 파일 입력 필드
const maxFiles = 10; // 최대 파일 개수

// 추가된 파일명 미리보기
function handleFile(e){
	let newFiles = e.target.files; // 선택한 파일들
	
	// 선택한 파일 개수가 최대 개수를 초과하는지 확인
	if(files.length + newFiles.length > maxFiles) {
		$("#fileModal").modal('show');
		return;
	}
	
	// 새 파일들만 배열에 추가
	for (let i = 0; i < newFiles.length; i++) {
		files.push(newFiles[i]);
	}
	
	updateFileList(); // 파일 목록 업데이트
    
}

$(function(){
	$("input:radio[name=alertYn]").click(function() {
		switch ($(this)[0].id) {
		case "YN1": $("#alertCds").prop("disabled", false); break;
		case "YN2": $("#alertCds option:eq(0)").prop("selected", true);$("#alertCds").prop("disabled", true); break;
		}
	});
	
});



function inputCheck() {

	if ($("#title").val().trim() == "") {
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return false;
	}
	
	if ($("#question").val().trim() == "") {
		alert("내용을 입력해주세요.");
		$("#question").focus();
		return false;
	}
	
	if (!$("input:radio[id=YN1]").is(":checked") && !$("input:radio[id=YN2]").is(":checked")) {
		alert("답변필요여부를 선택해주세요.");
		return false;
	}
	
	if (!$("input:radio[id=YN3]").is(":checked") && !$("input:radio[id=YN4]").is(":checked")) {
		alert("공개여부를 선택해주세요.");
		return false;
	}
	
	if ($("input:radio[id=YN1]").is(":checked") && $("#alertCds").val() == "") {
		alert("답변방법을 선택해주세요.");
		$("#alertCds").focus();
		return false;
	}
	
	if ("1" == "2") {
		if ($("#alertCds").val() == "E" && $("#userEncEmail").val() == "") {
			alert("답변을 위해서 이메일을 입력하셔야합니다.");
			$("#userEncEmail").focus();
			return false;
		}
		if (($("#alertCds").val() == "M" || $("#alertCds").val() == "S") && $("#userEncMobile").val() == "") {
			alert("답변을 위해서 휴대폰 번호를 입력하셔야합니다.");
			$("#userEncMobile").focus();
			return false;
		}
	}
	return true;
}

$("#registBtn").on("click",function(e) {
	// AJAX 요청으로 폼 제출
    var formData = new FormData($('#dataForm')[0]);
	
	if (!inputCheck()) {
		return;
	}
	
	if ($('input:radio[name=agree01]:checked').val() != 'Y') {
		alert("<개인정보 수집이용 동의(필수)> 미동의 시, VOC 등록이 불가합니다.");
		$("#agree01").focus();
		return;
	}
	
	if ($('input:radio[name=agree02]:checked').val() != 'Y') {
		alert("<개인정보의 제3자 제공동의(선택)> 미동의 시, VOC 등록이 불가합니다.");
		$("#agree02").focus();
		return;
	}
	
	if ($('input:radio[name=agreeYn]:checked').val() != 'Y') {
		if(!confirm("<이벤트(포상) 활용 동의서(선택)> 미동의 시, 이벤트(포상) 참여가 불가합니다. 이대로 진행하시겠습니까?")) {
			$("#agree03").focus();
	        return;
		}
    } else if(!confirm("등록하시겠습니까?")) {
    	return;
    }
	
	//ajax 요청
	$.ajax({
        url : '/cust/cus/registPost',
        type: 'POST',
        data : dataForm,
        processData: false, // FormData 객체를 사용하므로 false
        contentType: false, // FormData 객체를 사용하므로 false
        success : function(data) {
	    	
	    	alert(data.MSG);
	    	
        	if(data.RESULT == '1'){
		    	
        		location.href = "/cust/cus/cusList";
        	}
	    	
        }
    });
};


// function initOccDt() {
// 	if ($("#occDtYn").is(':checked')) {


// 	}

</script>
<body class="typeSub typeHeanBnr">
	<div class="container">


		<div id="contents">





			<article>






				<form id="dataForm" name="dataForm" method="post"
					enctype="multipart/form-data">
					<!-- 파람 받아서 진행 -->
					<input type="hidden" name="userBean.userId" value="dpdud1419">
					<input type="hidden" name="userBean.userNm" value="김예영"> <input
						type="hidden" name="userBean.userEncEmail"
						value="eoiind14@gmail.com"> <input type="hidden"
						name="userBean.userEncMobile" value="010-3362-3297"> <input
						type="hidden" name="vocCd" value="1"> <input type="hidden"
						name="vocSeq" value="">
					<div class="voc-wrap Noto">
						<div class="board_area">
							<p class="write_guide">
								<span class="mark_need">[필수]</span> 표시가 있는 항목은 필수로 입력하셔야 합니다.
							</p>
							<div class="lineList_tbW">
								<table>
									<!-- 용도에 맞게 caption 적용 -->
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
											<td><input type="text" name="custBrdNm"
												value="${custBoardVO.custBrdNm}" /></td>
											<th scope="row">휴대폰 번호</th>
											<td><input type="text" name="custBrdPswd"
												value="${custBoardVO.custBrdPswd}" /></td>
										</tr>

										<tr>
											<th scope="row">이메일</th>
											<td><input type="text" name="custBrdEml"
												value="${custBoardVO.custBrdEml}" /></td>
											<th scope="row"><span class="mark_need">[필수]</span>종류</th>
											<td>
												<!-- model.addAttribute("selType", selType); --> <select
												class="inp_s" name="airportCd" id="airportCd" title="민원 종류">
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
														<c:if test="${selType=='A111'}">selected</c:if>>수하물찾기</option>
													<option value="A1108"
														<c:if test="${selType=='A1108'}">selected</c:if>>세관심사</option>
													<option value="A1105"
														<c:if test="${selType=='A1105'}">selected</c:if>>기타사항</option>
											</select>
											</td>
										</tr>


										<tr class="w_tit">
											<th scope="row"><span class="mark_need">[필수]</span>제목</th>
											<td colspan="3"><input type="text" class="inp_t"
												name="title" title="제목을 입력" id="title" value=""></td>
										</tr>


										<tr class="w_txt">
											<th scope="row"><span class="mark_need">[필수]</span>내용</th>
											<td colspan="3"><textarea class="inp_area" rows="10"
													name="question" title="내용입력" id="question"></textarea></td>
										</tr>


										<tr>
											<th scope="row"><span class="mark_need">[필수]</span>답변필요여부
											</th>
											<td><span class="inp_r"><input type="radio"
													title="답변필요여부 예" name="alertYn" id="YN1" value="Y"><label
													for="YN1">예</label></span> <span class="inp_r"><input
													type="radio" title="답변필요여부 아니오" name="alertYn" id="YN2"
													value="N"><label for="YN2">아니오</label></span></td>
											<th scope="row">답변방법</th>
											<td><select class="inp_s" name="alertCds" id="alertCds"
												title="답변방법" disabled="">
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
											<td colspan="3" class="fileArea">
												<style>
@media all and (-ms-high-contrast: none) , ( -ms-high-contrast : active)
	{
	/* IE10+ CSS styles goes underneath */
	#find_file {
		margin-bottom: 40px;
	}
	#find_file input.inp_t {
		display: none;
	}
	#find_file label.btn_fileFind {
		display: none;
	}
	#find_file input#btn_fileFind1 {
		width: 100%
	}
}
</style> <script>
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
													10MB</em>
											</td>
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
											<tobdy> </tobdy>
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
		<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-74304977-1', 'auto');
  ga('send', 'pageview');
</script>


		<!-- 					</tbody> -->
		<!-- 				</table> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
	</div>
</body>
