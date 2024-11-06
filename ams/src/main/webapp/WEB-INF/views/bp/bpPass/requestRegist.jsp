<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css" href="/resources/css/bpPass/requestRegist.css">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<div class="row" style="margin-bottom : 50px;">
	<div class="col-12">
		<div class="container">
			<!-- PDF 생성을 위한 급여명세서 테이블 HTML -->
			<div class="flex-column" style="font-family:NanumGothic;">
			    <p style="font-size : 35px; margin-bottom:0px; text-align:center; font-weight:600">출입증 발급신청서</p>
			    
			    <table class="_upperTable" style="width: 100%; height: 100%; text-align: center; vertical-align: middle; border-collapse: collapse; margin-top:40px;">
			        <!-- 상단 테이블 -->
			        <thead class="_upperTableHead">
			        	<!-- 자동작성구역, 출입증 발급 신청자 영역 -->
			        	<tr>
			        		<th style="background-color:white; text-align:left">
			        			출입증 발급 신청자
			        		</th>
			        	</tr>
			            <tr style="height:30px;">
			                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">상호</td>
			                <td colspan="2" class="_bpNm" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">${memVO.bpVO.bpNm}</td>
			                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">소속</td>
			                <td colspan="2" class="_bpDeptNm" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
							    <c:forEach var="authLinkVO" items="${memVO.authLinkVOList}">
							        <c:if test="${authLinkVO.authCode == 'ROLE_AIR'}">
							           	항공사
							        </c:if>
				                	<c:if test="${authLinkVO.authCode == 'ROLE_FRN' }">
				                		입점업체
				                	</c:if>
				                	<c:if test="${authLinkVO.authCode == 'ROLE_SBCTR' }">
				                		외주업체
				                	</c:if>
							    </c:forEach>
		                	</td>
			            </tr>
			            <tr style="height:30px;">
			                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">성명</td>
			                <td colspan="2" class="_bpRprsvNm" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">${memVO.bpVO.bpRprsvNm}</td>
			                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">유선번호</td>
			                <td colspan="2" class="_bpTelNo" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">${memVO.bpVO.bpTelno}</td>
			            </tr>
			        </thead>
			    </table>
			    
			    <!-- 직접 입력, 출입증 발급 대상자 영역 -->
			    <table class="_middleTable" style="width: 100%; height:100%; text-align: center; vertical-align: middle; border-collapse: collapse; margin-top:20px;">
			        <thead class="_middleTableHead">
			            <tr>
			        		<td class="align-items-center" colspan="8" style="background-color:white; text-align:left; font-weight:bold;">
			        			출입증 발급 대상자
			        		</td>
			            </tr>
			        </thead>
			        <tbody id="_middleTableBody">
						<tr style="height:30px;" class="_addDiv" data-index="0">
			                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:130px;">이름</td>
			                <td colspan="2" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
			                	<input type="text" class="form-control _requestNm">
			                </td>
			                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:130px;">희망구역</td>
			                <td colspan="2" class="_requestArea" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
			                	<select name="_requestAreaSelect" class="form-control _requestAreaSelect">
			                		<option value="A" selected>A - 관제시설지역</option>
			                		<option value="B">B - 항공기탑승지역</option>
			                		<option value="C">C - 수하물수취지역</option>
			                		<option value="D">D - 부대건물지역</option>
			                		<option value="E">E - 항공기이동지역</option>
			                		<option value="F">F - 화물터미널지역</option>
			                	</select>
			                </td>
			                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:130px;">출입증유형</td>
			                <td colspan="2" class="_requestCategory" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
			                	<select name="_requestCategorySelect" class="form-control _requestCategorySelect">
			                		<option value="Temp" selected>임시</option>
			                		<option value="Regular">정규</option>
			                		<option value="Short">단기</option>
			                	</select>
			                </td>
			                <td>
			                	<button type="button" class="btn btn-primary ml-auto _addBtn" style="float:right; width:35px;">+</button>
			                </td>
						</tr>
			        </tbody>
			    </table>
			    <table class="_bottomTable" style="width: 100%; height:100%; text-align: center; vertical-align: middle; border-collapse: collapse; margin-top:20px;">
			    	<tbody>
			    		<tr style="height:300px;">
			                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">신청사유</td>
			                <td colspan="7" class="_requestReason" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
			                	<div id="requestReasonTemp"></div>
			                	<textarea style="display:none;" class="form-control" id="requestReason" name="requestReason"></textarea>
			                </td>
			    		</tr>
			    	</tbody>
			    </table>
			    
			    <div>
			    	<h4 style="text-align:center; margin-top:40px;">출입증의 발급을 신청합니다.</h4>
			    	<h4 style="text-align:center; margin-top:40px;" id="_nowYMD"></h4>
			    	<h4 style="text-align:center; margin-top:40px; float:right;">
			    		<span>신 청 인 : </span>
			    		<span style="text-decoration:underline;">${memVO.bpVO.bpRprsvNm}</span>
			    	</h4>
			    </div>
			</div>
		</div>
	</div>
</div>
   	<button style="width:100%;" type="button" class="ml-auto btn btn-primary" id="submitBtn">제출</button>

<div class="flex-column _requestRegistPdf" style="display:none; font-family:NanumGothic;">
    <p style="font-size : 35px; margin-bottom:0px; text-align:center; font-weight:600">출입증 발급신청서</p>
    
    <table class="_upperTable" style="width: 100%; height: 100%; text-align: center; vertical-align: middle; border-collapse: collapse; margin-top:40px;">
        <!-- 상단 테이블 -->
        <thead class="_upperTableHead">
        	<!-- 자동작성구역, 출입증 발급 신청자 영역 -->
        	<tr>
        		<td class="align-items-center" colspan="8" style="background-color:white; text-align:left; font-weight:bold;">
        			출입증 발급 신청자
        		</td>
        	</tr>
            <tr style="height:30px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">상호</td>
                <td colspan="2" class="_bpNmPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">소속</td>
                <td colspan="2" class="_bpDeptNmPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
               	</td>
            </tr>
            <tr style="height:30px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">성명</td>
                <td colspan="2" class="_bpRprsvNmPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">유선번호</td>
                <td colspan="2" class="_bpTelNoPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;"></td>
            </tr>
        </thead>
    </table>
    
    <!-- 직접 입력, 출입증 발급 대상자 영역 -->
    <table class="_middleTable" style="width: 100%; height:100%; text-align: center; vertical-align: middle; border-collapse: collapse; margin-top:20px;">
        <thead class="_middleTableHead">
            <tr>
        		<td class="align-items-center" colspan="8" style="background-color:white; text-align:left; font-weight:bold;">
        			출입증 발급 대상자
        		</td>
            </tr>
        </thead>
        <tbody id="_middleTableBodyPdf">
			<tr style="height:30px;" class="_addDiv">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:150px;">이름</td>
                <td colspan="2" class="_requestNmPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:250px;">
                </td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:200px;">희망 구역</td>
                <td colspan="2" class="_requestAreaPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:350px;">
                </td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:150px;">출입증 유형</td>
                <td colspan="2" class="_requestCategoryPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:250px;">
                </td>
			</tr>
        </tbody>
    </table>
    <table class="_bottomTablePdf" style="width: 100%; height:100%; text-align: center; vertical-align: middle; border-collapse: collapse; margin-top:20px;">
    	<tbody>
    		<tr style="height:300px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:100px;">신청사유</td>
                <td colspan="7" class="_requestReasonPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
                	<div id="requestReasonTempPdf">
                	</div>
                </td>
    		</tr>
    	</tbody>
    </table>
    
    <div>
    	<h4 style="text-align:center; margin-top:40px;">출입증의 발급을 신청합니다.</h4>
    	<h4 style="text-align:center; margin-top:40px;"></h4>
    	<h4 style="text-align:center; margin-top:40px; float:right;">
    		<span style="float:right;">신 청 인 :
	    		<span style="text-decoration:underline; float:right;">${memVO.bpVO.bpRprsvNm}</span>
    		</span>
    	</h4>
    </div>
</div>

<!-- 생성 성공 모달 -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>출입증 신청에 성공했습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script>
$(function(){
	let now = new Date();
	let year = now.getFullYear();
	let month = now.getMonth() + 1;
	let day = now.getDay();
	let formattedDate = year + "" + (month < 10 ? "0" + month : month) +"" + (day < 10 ? "0" + day : day);
	
	$("#_nowYMD").text(year +"년 " + month + "월 " + day +"일");
	
	
	let telNo = $("._bpTelNo").text();
	
	let formattedTelNo = telNo.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
	$("._bpTelNo").text(formattedTelNo);
	
	let trIndex = 1;
	
	$("._addBtn").on("click", function(){
		var addStr = `
			<tr style="height:30px;" class="_addDiv" data-index="\${trIndex}">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:130px;">이름</td>
                <td colspan="2" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
                	<input type="text" class="form-control _requestNm">
                </td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:130px;">희망 구역</td>
                <td colspan="2" class="_requestArea" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
                	<select name="_requestAreaSelect" class="form-control _requestAreaSelect">
                		<option value="A" selected>A - 관제시설지역</option>
                		<option value="B">B - 항공기탑승지역</option>
                		<option value="C">C - 수하물수취지역</option>
                		<option value="D">D - 부대건물지역</option>
                		<option value="E">E - 항공기이동지역</option>
                		<option value="F">F - 화물터미널지역</option>
                	</select>
                </td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:130px;">출입증 유형</td>
                <td colspan="2" class="_requestCategory" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
                	<select name="_requestCategorySelect" class="form-control _requestCategorySelect">
                		<option value="Temp" selected>임시</option>
                		<option value="Regular">정규</option>
                		<option value="Short">단기(24시간)</option>
                	</select>
                </td>
                <td>
            		<button type="button" class="btn btn-primary ml-auto _delBtn" style="float:right; width:35px;">-</button>
           		</td>
			</tr>`;
		

		
		var addStrPdf =`
			<tr style="height:30px;" class="_addDiv" data-index="\${trIndex}">
            <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:150px;">이름</td>
            <td colspan="2" class="_requestNmPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
            </td>
            <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:150px;">희망구역</td>
            <td colspan="2" class="_requestAreaPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
            </td>
            <td style="border: 1px solid black; background-color:#F2F2F2; font-size:20px; width:150px;">출입증유형</td>
            <td colspan="2" class="_requestCategoryPdf" style="border: 1px solid black; background-color:white; font-size:20px; width:300px;">
            </td>
		</tr>`;
		
		$("#_middleTableBody").append(addStr);
		$("#_middleTableBodyPdf").append(addStrPdf);
		
		trIndex++;
		
	})
	
	$(document).on("click", "._delBtn", function(){
		var trIndexToDelete = $(this).closest('tr').data('index');
		console.log("trIndexToDelete : " + trIndexToDelete);
	    $("#_middleTableBody").find(`tr[data-index="\${trIndexToDelete}"]`).remove();
	    $("#_middleTableBodyPdf").find(`tr[data-index="\${trIndexToDelete}"]`).remove();
		
	})
	
	$("#submitBtn").on("click", function(){
		
		//DB로 보낼 데이터
		let registData = {
				MEM_ID : "${memVO.memId}",
				PASS_REGIST_APLY_YMD : formattedDate,
				PASS_REGIST_TITLE : "${memVO.bpVO.bpNm}" + "_" + formattedDate + "_" + "출입증_발급신청",
				PASS_REGIST_YN : 'P'
		}
		
		//TABLE에 값 넣기
		$("._bpNmPdf").text($("._bpNm").text());
		$("._bpDeptNmPdf").text($("._bpDeptNm").text());
		$("._bpRprsvNmPdf").text($("._bpRprsvNm").text());
		$("._bpTelNoPdf").text($("._bpTelNo").text());
		
		$("._requestNm").each(function(index){
		    $("._requestNmPdf").eq(index).text($(this).val());
		});

		$("._requestAreaSelect").each(function(index){
		    $("._requestAreaPdf").eq(index).text($(this).find("option:selected").text());
		});

		$("._requestCategorySelect").each(function(index){
		    $("._requestCategoryPdf").eq(index).text($(this).find("option:selected").text());
		});
		
		$("#requestReasonTempPdf").html($("#requestReason").val()); 
		
		var prevPdf = '<html><body>';
		var mainPdf = $("._requestRegistPdf").prop('outerHTML');
		var nextPdf = '</body></html>';
		
		var completePdf = prevPdf + mainPdf + nextPdf;
		
		var sendData = {
				passRegistVO : registData,
				requestRegistPdf : completePdf,
				fileNm : "${memVO.bpVO.bpNm}" + "_" + formattedDate + "_" + "신청"
		}
		console.log(sendData);
		
		$.ajax({
			url:"/bp/bpPass/requestRegistPdf",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(sendData),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				$("#successModal").modal('show');
				setTimeout(() => window.location.href="/bp/bpPass/requestList", 1000);
			},
			error:function(xhr, status, error){
				console.log(error);
			}
		})
	})
	
	// CKEditor의 데이터가 textarea에 반영되도록 처리
	$(".ck-blurred").keydown(function(){
        //window.editor :CKEditor 객체 
        $("#requestReason").val(window.editor.getData());
     });
	
     //CKEditor로부터 커서 이동 또는 마우스 이동 시 실행
     $(".ck-blurred").on("focusout", function(){
        $("#requestReason").val(window.editor.getData());
     });		
	
	
	ClassicEditor.create(document.querySelector('#requestReasonTemp'), {
	    ckfinder: {
	        uploadUrl: '/image/upload?${_csrf.parameterName}=${_csrf.token}'
	    }
	})
	 .then(editor=>{
		 window.editor=editor;
		
		// CKEditor의 데이터가 변경될 때마다 textarea에 반영
	    editor.model.document.on('change:data', () => {
	        $("#requestReason").val(editor.getData()); // textarea에 반영
// 	        $("#requestReasonPdf").val(editor.getData());
	    });		 
	 })
	 .catch(err=>{console.error(err.stack);});
	
})
</script>