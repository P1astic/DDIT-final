
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/airport.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/board.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/common.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/jquery-ui.theme.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac_n.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/slick.css">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//휴대폰 번호 인증var code2 = "";
		$("#phoneChk").click(
				function() {
					alert('답변이 발송되었습니다.\n처리 완료');
					var phone = $("#phoneNumber").val();
					// 					var name = $("#name").val();
					var context = $("#context").val();
					console.log("phone : ", phone);
					// 					console.log("name : ", name);
					console.log("context : ", context);
					$.ajax({
						type : "POST", // post 형식으로 발송
						url : "/emp/vos/sendAnswer", // controller 위치
						data : {
							"phone" : phone,
							"context" : context
						}, // 전송할 ㅔ이터값
						cache : false,
						dataType : "text",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(data) {
							console.log("phoneChk->data : ", data);

							if (data == "error") { //실패시 
								alert("답변 전송에 오류가 있습니다.")
							} else { //성공시        
								alert("답변이 전송 되었습니다.")
								code2 = data; // 성공하면 데이터저장
							}
						},
						error : function(error) {
							console.error("에러 :" + error);
						}

					});
				});

		//페이지 이동

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
	<div class="login-wrap Noto">
		<div class="left">

			<!-- 			<fieldset> -->
			<!-- 				<legend>본인인증</legend> -->
			<!-- 				<div class="sint"> -->
			<!-- 					<input type="text" id="name" name="name" placeholder="이름" -->
			<!-- 						title="이름을 입력해주세요." autocomplete="new-password"> -->
			<!-- 				</div> -->
			<!-- 				<div class="sint"> -->
			<!-- 					<input type="text" id="phoneNumber" name="phoneNumber" -->
			<!-- 						placeholder="전화번호" title="전화번호 입력해주세요"> -->

			<!-- 				</div> -->
			<!-- 				<button type="button" class="sbtn red" id="phoneChk" title="인증번호 받기" -->
			<!-- 					onclick="showDiv('passkey')"> -->
			<!-- 					<span>인증번호 받기</span> -->
			<!-- 				</button> -->
			<!-- 			</fieldset> -->
		</div>
	</div>
</div>
<!-- 문자보내기 -->

<!-- 답변창 콘솔 보고 수정 필요 -->


<div class="board_area">
	<p class="subTit2">${custBoardVO.custBrdNm}님의고객의소리입니다.</p>
	<div class="lineList_tbW">
		<table>
			<caption>제목, 발생지(공항), 등록일, 처리상태, 답변필요여부, 내용, 첨부파일이 표기된
				표입니다.</caption>
			<colgroup>
				<col>
				<col>
				<col>
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${custBoardVO.custBrdTtl}</td>
				</tr>

				<tr>
					<th scope="row">답변방법</th>
					<c:if test="${custBoardVO.custBrdAnsty == 'E'}">
						<td>메일</td>
					</c:if>
					<c:if test="${(custBoardVO.custBrdAnsty == 'M')}">
						<td>문자</td>
					</c:if>
					<c:if test="${(custBoardVO.custBrdAnsty == NULL)}">
						<td>답변 받지 않음</td>
					</c:if>

					<th scope="row">등록일</th>
					<td class="Roboto">${custBoardVO.custBrdRegYmd}</td>
				</tr>

				<tr>
					<th scope="row">처리상태</th>
					<c:if test="${(custBoardVO.custBrdAnsYmd == NULL)}">
						<td>접수 대기</td>
					</c:if>
					<c:if test="${(custBoardVO.custBrdAnsYmd != NULL)}">
						<td>답변 완료</td>
					</c:if>
					<th scope="row">답변일</th>
					<td>${custBoardVO.custBrdAnsYmd}</td>

				</tr>

				<tr>
					<th scope="row">내용</th>
					<td colspan="3">
						<p class="tabTxt1">${custBoardVO.custBrdCn}</p>
					</td>
				</tr>

				<tr class="w_txt">
					<th scope="row">첨부파일</th>
					<c:if test="${custBoardVO.fileGroupNo == 0}">
						<td colspan="3"><a> </a>
					</c:if>


					<c:if test="${custBoardVO.fileGroupNo > 0}">
						<div class="file-info">
							<div class="fileList">
								<input type="hidden" name="fileGroupNo" id="fileGroupNo"
									value="${custBoardVO.fileGroupNo}">
								<c:forEach var="fileDetailVO" items="${fileDetailVOList}"
									varStatus="status">
									<div id="fileNum${status.index}" style="display: flex;">
										<input style="border: none; width: 300px;" type='text'
											name='fileOrgnlFileNm' id="fileOrgnlFileNm"
											value="${fileDetailVO.fileOrgnlFileNm}">
										<button id="fileDown"
											data-file-path="${fileDetailVO.fileFilePathNm}" type="button"
											style="background: none; border: none;">
											<img src="/resources/images/icon/download.png"
												style="width: 15px; height: 15px;">
										</button>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:if>
				</tr>




			</tbody>
		</table>
	</div>





	<!-- 답변 영역 -->


	<div class="board_area">
		<table>
		<tbody>
			<tr>
				<input type="hidden" id="phoneNumber" name="phoneNumber"
					value="${custBoardVO.custBrdCn}" placeholder="전화번호" title="전화번호">
			</tr>
		</tbody>
		<tbody>
			<tr>
				<input type="text" id="context" name="context" value=""
					placeholder="답변" title="답변">

			</tr>
		</tbody>
		</table>
	</div>
	<button type="button" class="sbtn red" id="phoneChk" title="답변전송"
		onclick="showDiv('passkey')">
		<span>답변전송</span>
	</button>


	<!-- 버튼영역 -->
	<div class="tbArea_btn iTem3">
		<a href="/cust/cus/delete" class="btnC"><span>삭제하기</span></a>
		<!-- 		<a -->
		<!-- 			href="/gimpo/cms/frVocCon/vocWrite.do?MENU_ID=1800&vocSeq=12250&vocCd=1&searchKey=&searchVal=&currentPage=1" -->
		<!-- 			class="btnC"><span>답변하기</span></a>  -->
		<a
			href="/cust/cus/cusList?phone=${custBoardVO.custBrdMbiph}&name=${custBoardVO.name}"
			class="btnC btnGray"><span>목록으로</span></a>
	</div>
	<!-- //버튼영역 -->


</div>


<script>
	$(function() {

		// 파일 다운로드 버튼 처리
		$(".fileList")
				.on(
						"click",
						"#fileDown",
						function() {
							let filePath = $(this).data("file-path");
							let fileOrgnlFileNm = $(this).siblings(
									"#fileOrgnlFileNm").val();

							console.log(fileOrgnlFileNm);

							if (filePath) {
								window.location.href = "/cus/cusBoard/download?filePath="
										+ encodeURIComponent(filePath)
										+ "&fileOrgnlFileNm="
										+ encodeURIComponent(fileOrgnlFileNm);
							} else {
								alert("파일 경로를 찾을 수 없습니다.");
							}
						});
	})
</script>
