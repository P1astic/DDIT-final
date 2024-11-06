<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/approv/paymentForm.css">

<sec:authorize access="isAuthenticated()">
	<%-- 		<sec:authentication property="principal.memberVO" /> --%>
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<script>
var elecApvNo = "${elecApvVOList[0].elecApvNo}";
var memId = "${memVO.memId}";
var apvLineFinYn = "";
var apvYn = "";
var tempSeCd = "${elecApvVOList[0].tempSeCd}";
var elecApvStat1 = "${elecApvVOList[0].elecApvStat}";

$(document).ready(function() {
	var number = -1;
// 	console.log("tempSeCd : "+tempSeCd);
	console.log("elecApvNo : " + elecApvNo);
	console.log("elecApvStat1 : " + elecApvStat1);
	
	
	$("#approveBtn").hide();
	$("#companionBtn").hide();
	$("#companionBtn1").hide();
    $("#elecApvCn1").show();
    
	if(tempSeCd === "I3"){
		$("#lvBgngYmd1").show();
		$("#lvEndYmd1").show();
		$("#lvDetType1").show();
		$("#lvUseDay1").show();
		$(".lvDetRsn1").show();
		$("#elecApvCn1").show();
	}
	if(elecApvStat1 === "H4"){
		$("#companionBtn1").show();
	}
	$("#companionBtn1").on("click",function(){
		
		$("#myModal2").show();
	});
	$("#checkBtn").on("click",function(){
		$("#myModal2").hide();
	});
	
	
	var data = {
		"elecApvNo" : elecApvNo,
		"memId" : memId
	}

	$.ajax({
		url : "/elecApv/getApvLineFinYn",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		type : "post",
		dataType : "json",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res) {
			console.log("res : ", res);
			apvLineFinYn = res.apvLineFinYn;
			apvYn = res.apvYn;
			console.log("apvLineFinYn: " + apvLineFinYn);
			console.log("apvYn : " + apvYn);
		}
	});
	var apvYn = [ 
		"${elecApvVOList[0].apvDetailVO.apvYn}"
	   ,"${elecApvVOList[1].apvDetailVO.apvYn}"
	   ,"${elecApvVOList[2].apvDetailVO.apvYn}"
	   ,"${elecApvVOList[3].apvDetailVO.apvYn}" 
		];
	var elecApvStat = [ 
		"${elecApvVOList[0].elecApvStat}"
	   ,"${elecApvVOList[1].elecApvStat}"
	   ,"${elecApvVOList[2].elecApvStat}"
	   ,"${elecApvVOList[3].elecApvStat}" 
		];

	console.log("apvYn : " + apvYn);
	var approvLine = [ 
		"${elecApvVOList[0].apvId}"
	   ,"${elecApvVOList[1].apvId}" 
	   ,"${elecApvVOList[2].apvId}"
	   ,"${elecApvVOList[3].apvId}"
	   ];
	console.log("elecApvStat : " + elecApvStat);
	console.log("접속 아이디 : " + memId);
	
	
	for (var i = 0; i < approvLine.length; i++) {
		if (approvLine[i] === memId && apvYn[i] !== 'Y' && apvYn[3] !== 'Y' && elecApvStat[i] !== 'H4' && apvYn[i-1] === 'Y') {
			console.log("memId : " + memId);
			console.log("apvYn : " + apvYn);

			$("#approveBtn").show();
			$("#companionBtn").show();
			break;
		}
	}
	$("#approveBtn").on("click", function() {

		console.log("click -> elecApvNo : " + apvLineFinYn);
		var data = {
			"memId" : memId,
			"elecApvNo" : elecApvNo,
			"apvLineFinYn" : apvLineFinYn
		};

		$.ajax({
			url : "/elecApv/apvDetailUpdate",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",	"${_csrf.token}");
			},
			success : function(result) {
				console.log("result : ", result);

				location.href = "/elecApv/paymentDetail?elecApvNo="	+ elecApvNo;
			}
		});

	});

	$("#companionBtn").on("click", function() {
		var apvDecReason = "";
		$("#myModal").show();

		$("#close").on("click", function() {
			$("#myModal").hide();
		});

		$("#getBtn").on("click", function() {
			console.log("vla : ", $("#textBox").val());
			apvDecReason = $("#textBox").val();
			var data = {
				"memId" : memId,
				"elecApvNo" : elecApvNo,
				"apvLineFinYn" : apvLineFinYn,
				"apvDecReason" : apvDecReason
			};
			console.log("data", data);
			$.ajax({
				url : "/elecApv/prDetailUpdate",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				type : "post",
				dataType : "json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(result) {
					console.log("result : ", result);

					location.href = "/elecApv/paymentDetail?elecApvNo="	+ elecApvNo;
				}
			});
			//     		$("#myModal").hide();

		});

		console.log("click -> elecApvNo : " + apvLineFinYn);
	});
});
</script>

<style>
.input1 {
    width: 100%;
    flex: 1 1 0;
    height: 35px;
    padding-left: 12.73px;
    padding-right: 12.73px;
    padding-top: 5.30px;
    padding-bottom: 5.30px;
    background: white;
    border-radius: 3px;
    border: 1px #D9D9D9 solid;
}

</style>
<!-- 
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 40%;
	display: flex;
	flex-direction: column;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.modal-inner {
	display: flex;
	justify-content: center;
	padding-bottom: 15px;
}

#textBox {
	text-align: left;
	vertical-align: top;
	padding: 0;
	margin: 0;
	line-height: normal;
}
-->
<div id="container">
	<form id="fmId" action="/elecApv/paymentInsert" enctype="multipart/form-data" method="post">
		<div id="title-box">
			<div class="title-txt">전자결재</div>
			<div class="title-txt">-</div>
			<div class="title-txt">결재상세</div>
			<div class="title-txt">-</div>
			<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">기안서 상세</div>
		</div>

		<div class="a1-box">
			<div class="a2">
				<div class="a2-1">부서</div>
				<div class="a2-2">
					<input type="text" id="deptNm" name="deptCd"
						value="${elecApvVOList[0].deptVO.deptCd}" hidden="" />${elecApvVOList[0].deptVO.deptNm}
				</div>
				<div class="a2-1">직급</div>
				<div class="a2-2">
					<input type="text" id="jbgdNm" name="jbgdCd"
						value="${elecApvVOList[0].jobGradeVO.jbgdCd}" hidden="" />${elecApvVOList[0].jobGradeVO.jbgdNm}
				</div>
			</div>
			<div class="a2">
				<div class="a2-1">성명</div>
				<div class="a2-2">
					<input type="text" id="apvLine1" name="empNm"
						value="${elecApvVOList[0].employeeVO.empNm}" hidden="" required />${elecApvVOList[0].employeeVO.empNm}
				</div>
				<div class="a2-1">사번</div>
				<div class="a2-2">
					<input type="text" id="memId" name="memId" value="${elecApvVOList[0].apvId}"
						hidden="" />${elecApvVOList[0].apvId}
				</div>
			</div>
		</div>
		<hr>
		<div class="f1">
			<div class="f1-1">

				<div class="f1-1-1">
					<div class="f1-1-1-1">
						<div class="Title">결 재</div>
					</div>
				</div>

				<!-- 1차 결재자 -->
				<div class="f1-1-2">
					<div class="f1-1-2-1">
						<div class="f1-1-2-1-1">
							<div class="jName">기안자</div>
						</div>
					</div>

					<!-- 승인/반려 이미지 박스 -->
					<div class="f1-1-2-2">
						<div class="f1-1-2-2-1"></div>
						<img id="empAtrzSgn" alt="" src="${elecApvVOList[0].employeeVO.empAtrzSgn}">
						<div class="f1-1-2-2-2">
							<div class="Title">
							<input type="text" id="" name="" value="${elecApvVOList[0].apvDetailVO.apvLineDetAtrzYmd}" hidden="" />
							${elecApvVOList[0].apvDetailVO.apvLineDetAtrzYmd}
							</div>
						</div>
					</div>
					<!-- f1-1-2-2 -->

					<!-- 결재자 이름박스 -->
					<div class="f1-1-2-3">
						<div class="f1-1-2-3-1">
							<div class="empName" id="listDiv1">
								<input type="text" id="apvLine1" name="apvId"
									value="${elecApvVOList[0].apvId}" hidden="" />${elecApvVOList[0].employeeVO.empNm}
							</div>
						</div>
					</div>
				</div>
				<!-- 1차 결재자 끝 -->

				<!-- 2차 결재자  -->
				<div class="f1-1-2">
					<div class="f1-1-2-1">
						<div class="f1-1-2-1-1">
							<div class="jName">${elecApvVOList[1].jobGradeVO.jbgdNm}</div>
						</div>
					</div>

					<!-- 승인/반려 이미지 박스 -->
					<div class="f1-1-2-2">
						<div class="f1-1-2-2-1"></div>
						<img id="empAtrzSgn" alt="" src="${elecApvVOList[1].apvDetailVO.apvAtrzSgn}">
						<%-- <img src="${memVO.employeeVO.empAtrzSgn}" > --%>
						<div class="f1-1-2-2-2">
							<div class="Title">
							<input type="text" id="" name="" value="${elecApvVOList[1].apvDetailVO.apvLineDetAtrzYmd}" hidden="" />
							${elecApvVOList[1].apvDetailVO.apvLineDetAtrzYmd}
								<!-- 2024-09-04 -->
							</div>
						</div>
					</div>
					<!-- f1-1-2-2 -->

					<!-- 결재자 이름박스 -->
					<div class="f1-1-2-3">
						<div class="f1-1-2-3-1">
							<div class="empName" id="listDiv2">
								<input type="text" id="apvLine2" name="apvId" value="${elecApvVOList[1].apvId}" hidden="" />
								${elecApvVOList[1].employeeVO.empNm}
							</div>
						</div>
					</div>
				</div>
				<!--2차 결재자 끝  -->

				<!-- 3차 결재자  -->
				<div class="f1-1-2">
					<div class="f1-1-2-1">
						<div class="f1-1-2-1-1">
							<div class="jName">${elecApvVOList[2].jobGradeVO.jbgdNm}</div>
						</div>
					</div>

					<!-- 승인/반려 이미지 박스 -->
					<div class="f1-1-2-2">
						<div class="f1-1-2-2-1"></div>
						<img id="empAtrzSgn" alt="" src="${elecApvVOList[2].apvDetailVO.apvAtrzSgn}">
						<%-- <img src="${memVO.employeeVO.empAtrzSgn}" > --%>
						<div class="f1-1-2-2-2">
							<div class="Title">
							<input type="text" id="" name="" value="${elecApvVOList[2].apvDetailVO.apvLineDetAtrzYmd}" hidden="" />
							${elecApvVOList[2].apvDetailVO.apvLineDetAtrzYmd}
								<!-- 2024-09-04 -->
							</div>
						</div>
					</div>
					<!-- f1-1-2-2 -->

					<!-- 결재자 이름박스 -->
					<div class="f1-1-2-3">
						<div class="f1-1-2-3-1">
							<div class="empName" id="listDiv3">
								<input type="text" id="apvLine3" name="apvId" value="${elecApvVOList[2].apvId}" hidden="" />
								${elecApvVOList[2].employeeVO.empNm}
							</div>
						</div>
					</div>
				</div>
				<!--3차 결재자 끝  -->

				<!-- 4차 결재자  -->
				<div class="f1-1-2">
					<div class="f1-1-2-1">
						<div class="f1-1-2-1-1">
							<div class="jName">${elecApvVOList[3].jobGradeVO.jbgdNm}</div>
						</div>
					</div>

					<!-- 승인/반려 이미지 박스 -->
					<div class="f1-1-2-2">
						<div class="f1-1-2-2-1"></div>
						<img id="empAtrzSgn" alt="" src="${elecApvVOList[3].apvDetailVO.apvAtrzSgn}">
						<%-- <img src="${memVO.employeeVO.empAtrzSgn}" > --%>
						<div class="f1-1-2-2-2">
							<div class="Title">
							<input type="text" id="" name="" value="${elecApvVOList[3].apvDetailVO.apvLineDetAtrzYmd}" hidden="" />
							${elecApvVOList[3].apvDetailVO.apvLineDetAtrzYmd}
								<!-- 2024-09-04 -->
							</div>
						</div>
					</div>
					<!-- f1-1-2-2 -->

					<!-- 결재자 이름박스 -->
					<div class="f1-1-2-3">
						<div class="f1-1-2-3-1">
							<div class="empName" id="listDiv4">
								<input type="text" id="apvLine4" name="apvId" value="${elecApvVOList[3].apvId}" hidden="" />
								${elecApvVOList[3].employeeVO.empNm}
							</div>
						</div>
					</div>
				</div>
				<!-- 참조 시작  -->

<!-- 				<div class="f1-1-1" style="border-left: 0.5px solid #A4A4A4;"> -->
<!-- 					<div class="f1-1-1-1"> -->
<!-- 						<div class="Title">참조</div> -->
<!-- 					</div> -->
<!-- 				</div> -->


				<!-- 1차 참조자  -->
				<!-- <div class="f1-1-2">
					<div class="f1-1-2-1">
						<div class="f1-1-2-1-1">
							<div class="jName"></div>
						</div>
					</div>

					<div class="f1-1-2-2">
						<div class="f1-1-2-2-1"></div>
						<%-- <img src="${memVO.employeeVO.empAtrzSgn}" > --%>
						<div class="f1-1-2-2-2">
							<div class="Title">
							</div>
						</div>
					</div>

					<div class="f1-1-2-3">
						<div class="f1-1-2-3-1">
							<div class="empName" id="">
								<input type="text" id="" name="" value="" hidden="" />
							</div>
						</div>
					</div>
				</div>
				<div class="f1-1-2">
					<div class="f1-1-2-1">
						<div class="f1-1-2-1-1">
							<div class="jName"></div>
						</div>
					</div>

					<div class="f1-1-2-2">
						<div class="f1-1-2-2-1"></div>
						<%-- <img src="${memVO.employeeVO.empAtrzSgn}" > --%>
						<div class="f1-1-2-2-2">
							<div class="Title">
							</div>
						</div>
					</div>
					<div class="f1-1-2-3">
						<div class="f1-1-2-3-1">
							<div class="empName" id="">
								<input type="text" id="" name="" value="" hidden="" />
							</div>
						</div>
					</div>
				</div> -->
				<!--2차 참조자 끝  -->
			</div>
			<!-- f1-1 -->
		</div>
		<hr>
		<!-- 양식 들어갈 공간 시작-->
		 <div class="a1-box">
			<div class="a1">상세 내역</div>
			<div id="temp">
				<div class="a1-box">
					<div class="a2">
						<div class="a2-1">제목</div>
						<div class="a2-2">
							<input type="text" id="elecApvTitle" name="elecApvTitle" value="${elecApvVOList[0].elecApvTitle}" hidden=""/>${elecApvVOList[0].elecApvTitle}
						</div>
					</div>
					<div class="a2">
						<div class="a2-1">휴가 시작일자</div>
						<div class="a2-2">
							<input type="text" id="lvBgngYmd" name="lvBgngYmd" hidden="" value="${leaveDetailVO.lvBgngYmd}"/>${leaveDetailVO.lvBgngYmd}
						</div>
					</div>
					<div class="a2">
						<div class="a2-1">휴가 종료일자</div>
						<div class="a2-2">
							<input type="text" id="lvEndYmd" name="lvEndYmd" hidden="" value="${leaveDetailVO.lvEndYmd}"/>${leaveDetailVO.lvEndYmd}
						</div>
					</div>
					<div class="a2">
						<div class="a2-1">휴가유형</div>
						<div class="a2-2">
							<input type="text" id="lvDetType" name="lvDetType" hidden="" value="${leaveDetailVO.lvDetType}"/>${leaveDetailVO.lvDetType}
						</div>
					</div>
					<div class="a2">
						<div class="a2-1">휴가 사용일수</div>
						<div class="a2-2">
							<input type="number" id="lvUseDay" name="lvUseDay" hidden="" value="${leaveDetailVO.lvUseDay}"/>${leaveDetailVO.lvUseDay}
						</div>
					</div>
					<div class="a2">
						<div class="a2-1 full-width" style="width: 100%">휴가 사유</div>
					</div>
					<div class="a2">
						<div class="a2-2 full-width">
							<textarea id="lvDetRsn" name="lvDetRsn" rows="13" cols="117"
								required disabled="disabled">${leaveDetailVO.lvDetRsn}</textarea>
						</div>
					</div>
					<div class="a2">
						<div class="a2-1">파일첨부</div>
						<div class="a2-2">
							<input type="file" id="uploadFile" name="uploadFile" multiple />
							<div class="fileList"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="display: flex; justify-content: space-between;">
			<div>
			<button type="button" id="approveBtn" style="padding: 5px; border: 1px solid #007bff; background-color: white; color: #007bff; border-radius: 5px; font-size: 15px; margin-top: 10px;">
			승인
			</button>
			<button type="button" id="companionBtn" style="padding: 5px; border: 1px solid #dc3545; background-color: white; color: #dc3545; border-radius: 5px; font-size: 15px; margin-top: 10px;">
			반려
			</button>
			<button type="button" id="companionBtn1" style="padding: 5px; border: 1px solid #dc3545; background-color: white; color: #dc3545; border-radius: 5px; font-size: 15px; margin-top: 10px;">
			반려사유
			</button>
			</div>
			<div>
			<button type="button" onclick="location.href='/elecApv/myPaymentList'" style="padding: 5px; border: 1px solid #979393; background-color: white; color: #979393; border-radius: 5px; font-size: 15px; margin-top: 10px;">
			목록으로
			</button>
			</div>
		</div>  
		<!-- 양식 들어갈 공간 끝 -->
		<sec:csrfInput />
	</form>
</div>
<!-- 모달 -->
		<div id="myModal" class="modal">
			<div class="modal-content" style="width: 350px;">
				<div>
					<h1>반려사유</h1>
					<hr>
				</div>
				<div class="modal-inner">
					<textarea id="textBox" rows="5" cols="40%" placeholder="반려 사유를 입력하세요."></textarea>
				</div>
				<div>
					<button type="button" id="getBtn" style="padding: 5px; border: 1px solid #dc3545; background-color: white; color: #dc3545; border-radius: 5px; font-size: 15px; margin-top: 10px;">
					반려
					</button>
					<button type="button" id="close" style="padding: 5px; border: 1px solid #979393; background-color: white; color: #979393; border-radius: 5px; font-size: 15px; margin-top: 10px;">
					취소
					</button>
				</div>
			</div>
		</div>
		<div id="myModal2" class="modal">
			<div class="modal-content" style="width: 350px;">
				<div>
					<h1>반려사유</h1>
					<hr>
				</div>
				<div class="modal-inner">
					<c:forEach var="apvDet" items="${apvDetail}">
					<c:if test="${apvDet.apvDecReason != null}">
					<textarea id="textBox" rows="5" cols="40%">${apvDet.apvDecReason}</textarea>
					</c:if>
					</c:forEach>
				</div>
				<div>
					<button type="button" id="checkBtn" style="padding: 5px; border: 1px solid #979393; background-color: white; color: #979393; border-radius: 5px; font-size: 15px; margin-top: 10px;">
						확인
					</button>
				</div>
			</div>
		</div>