<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/finance/accountList.css">
<style>
	.btn-primary {
	    background-color: #6badf4;
	    border-color: white;
	}
	
	._modalBody{
	   padding : 20px;
	   padding-left : 30px;
	   
	   label {
	      width : 100px;
	      height : 20px;
	      line-height : 2;
	      margin-top : 5px;
	      
	   }
	   
	   select {
	      width : auto;
	      border : 0.5px solid #908d8d;
	      height : 40px;
	      border-radius : 5px;
	   }
	   
	   input {
	      margin-top : 5px;
	      border : 0.5px solid #908d8d;
	      border-radius : 5px;
	   }
	   
	   textarea{
	      border : 0.5px solid #908d8d;
	      border-radius : 5px;
	   }
	}		
</style>
<div class="content-header">
	<h3>
		<span style="color:#B7B7B7;">예산 - 재무관리 - </span>
		<span>거래내역</span>
	</h3>
</div>
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header d-flex flex-column">
				<div class="d-flex justify-content-between align-items-center">
					<form class="d-flex ml-auto flex-row">
						<div class="pt-3 mr-3 ml-3">
							<p>
								<input type="date" class="form-control" id="start" name="date-start" value="${startDate }"
								min="2022-01-01" max="2024-12-31">
							</p>
						</div>
						<div class="pt-3">
							<p>~</p>
						</div>
						<div class="pt-3 mr-3 ml-3">
							<p>
								<input type="date" class="form-control" id="end" name="date-end" value="${endDate }"
								min="2022-01-01" max="2024-12-31">
							</p>
						</div>
						<div class="pt-3">
							<p>
								<button type="submit" class="btn btn-primary">검색</button>
							</p>
						</div>
					</form>
				</div>
				<div class="ml-auto d-flex flex-row">
					<button type="button" id="registTransHistory" name="registTransHistory" class="btn btn-primary">등록</button>
					<button type="button" id="editTransHistory" name="editTransHistory" class="btn btn-primary">수정</button>
					<button type="button" id="deleteTransHistory" name="deleteTransHistory" class="btn btn-primary">삭제</button>
				</div>
			</div>
			<div class="card-body">
				<!-- 거래내역 테이블 영역 -->
				<div>
					<table class="table table-hover text-nowrap">
						<thead>
							<tr>
								<th style="text-align:center">
									<input type="checkbox" id="transHistories" name="transHistories">
								</th>
								<th style="text-align:center">거래날짜</th>
								<th style="text-align:center">거래처명</th>
								<th style="text-align:center">적요</th>
								<th style="text-align:center">거래금액</th>
								<th style="text-align:center">거래구분</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="transHistoryVO" items="${transHistoryVOList }">
								<tr>
									<td>
										<p class="form-check">
											<input type="checkbox" class="form-check-input" id="${transHistoryVO.transHistoryNo}" name="transHistory"
							                       data-vendor="${transHistoryVO.vendorCd}"
							                       data-reason="${transHistoryVO.transReason}"
							                       data-amount="${transHistoryVO.transAmt}"
							                       data-payment="${transHistoryVO.transType}">
										</p>
									</td>
									<td>${transHistoryVO.transDate }</td>
									<td id="${transHistoryVO.vendorCd }">${transHistoryVO.vendorVO.vdrNm}</td>
									<td>${transHistoryVO.transReason }</td>
									<td><fmt:formatNumber value="${transHistoryVO.transAmt }" pattern="#,###"/></td>
									<td>${transHistoryVO.transType }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div >
						${financePage.pagingArea}
					</div>
				</div>
				<!-- 거래내역 테이블 영역 끝 -->	
			</div>
		</div>	
	</div>
</div>

<!-- 거래내역 등록 모달 -->
<div class="modal fade" id="registTransHistoryModal" tabindex="-1" role="dialog" aria-labelledby="registTransHistoryModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
			<div class="modal-header">
				<h2>거래내역 등록</h2>
			</div>
			<div class="_modalBody">
			  <p>
				<select name="selectVendor" id="selectVendor" class="form-control">
					<option value="" selected disabled>거래처선택</option>
					<c:forEach var="vendorVO" items="${vendorVOList}">
						<option value="${vendorVO.vendorCd }">${vendorVO.vdrNm }</option>
					</c:forEach>
				</select>
			  </p>
			  <br>
			  <p>
			  	<textarea rows="4" cols="30" id="transReasonValue" name="transReasonValue" placeholder="적요를 입력하세요"></textarea>
			  </p>
			  <p>
			  	<input type="text" id="transAmtValue" name="transAmtValue" oninput="this.value = this.value.replace(/[^0-9]/g, '')" placeholder="금액을 입력하세요">
			  </p>
			  <p>
			  	<input type="radio" id="card" name="payment" value="카드" checked/>
		  		<label for="card">카드</label>
			  	<input type="radio" id="account" name="payment" value="계좌"/>
		  		<label for="account">계좌</label>
			  </p>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			  <button type="button" name="btnregistTransHistory" class="btn btn-secondary">등록</button>
			</div>
    </div>
  </div>
</div>
<!--  -->

<!-- 거래내역 수정 모달 -->
<div class="modal fade" id="editTransHistoryModal" tabindex="-1" role="dialog" aria-labelledby="editTransHistoryModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
		<div class="modal-header">
			<h2>거래내역 수정</h2>
		</div>
		<div class="_modalBody">
		  <p>
			<select name="selectVendor" id="editSelectVendor" class="form-control">
				<option value="" selected disabled>거래처선택</option>
				<c:forEach var="vendorVO" items="${vendorVOList}">
					<option value="${vendorVO.vendorCd }">${vendorVO.vdrNm }</option>
				</c:forEach>
			</select>
		  </p>
		  <br>
		  <p>
		  	<textarea rows="4" cols="30" id="editTransReasonValue" name="transReasonValue" placeholder="적요를 입력하세요"></textarea>
		  </p>
		  <p>
		  	<input type="text" id="editTransAmtValue" name="editTransAmtValue" oninput="this.value = this.value.replace(/[^0-9]/g, '')" placeholder="금액을 입력하세요">
		  </p>
		  <p>
		  	<input type="radio" id="editCard" name="editPayment" value="카드" checked/>
	  		<label for="card">카드</label>
		  	<input type="radio" id="editAccount" name="editPayment" value="계좌"/>
	  		<label for="account">계좌</label>
		  </p>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		  <button type="button" name="btneditTransHistory" class="btn btn-secondary">저장</button>
		</div>    	
    </div>
  </div>
</div>
<!--  -->

<!-- 거래내역 삭제 모달 -->
<div class="modal fade" id="deleteTransHistoryModal" tabindex="-1" role="dialog" aria-labelledby="deleteTransHistoryModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="_modalBody">
        <p>정말로 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" name="btndeleteTransHistory" class="btn btn-danger">삭제</button>
      </div>
    </div>
  </div>
</div>
<!--  -->

<!-- AJAX 성공 모달 -->
<div class="modal fade" id="ajaxSuccessModal" tabindex="-1" role="dialog" aria-labelledby="successModallabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="_modalBody">
        <p>처리에 성공하였습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- AJAX 성공 모달 끝 -->

<!-- AJAX 실패 모달 -->
<div class="modal fade" id="ajaxErrorModal" tabindex="-1" role="dialog" aria-labelledby="ajaxErrorModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="_modalBody">
        <p>처리에 문제가 발생하였습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- AJAX 실패 모달 끝 -->

<!-- 체크박스 2개이상 체크 후 수정을 누를때 -->
<div class="modal fade" id="checkboxErrorModal" tabindex="-1" role="dialog" aria-labelledby="checkboxErrorModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="_modalBody">
        <p>체크박스를 한개만 선택하세요.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 체크박스 2개이상 체크 후 수정을 누를때 -->

<!-- 체크박스 0개 선택했을때  -->
<div class="modal fade" id="checkboxErrorModal2" tabindex="-1" role="dialog" aria-labelledby="checkboxErrorModal2Label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="_modalBody">
        <p>체크박스를 선택하세요.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 체크박스 0개 선택했을때  -->

<script>
var checkedTrans = [];
$(function(){
	//거래내역 등록 모달
	$("#registTransHistory").on("click", function(){
		$("#registTransHistoryModal").modal('show');
	})
	//거래내역 수정 모달
	$("#editTransHistory").on("click", function(){
		checkedTrans = [];
		
		$("input[name='transHistory']").each(function(){
			if($(this).is(":checked")){
				checkedTrans.push($(this));
			}
		})
		
		if(checkedTrans.length > 1){
			$("#checkboxErrorModal").modal('show');
		}else if(checkedTrans.length == 0){
			$("#checkboxErrorModal2").modal('show');
		}else{
			let selectedTrans = checkedTrans[0];
			
	        let vendor = selectedTrans.data('vendor');
	        let reason = selectedTrans.data('reason');
	        let amount = selectedTrans.data('amount');
	        let payment = selectedTrans.data('payment');

	        $("#editSelectVendor").val(vendor);
	        $("#editTransReasonValue").val(reason);
	        $("#editTransAmtValue").val(amount);

	        if (payment === "카드") {
	            $("#editCard").prop("checked", true);
	        } else {
	            $("#editAccount").prop("checked", true);
	        }
	        
			$("#editTransHistoryModal").modal('show');
		}
	})
	//거래내역 삭제 모달
	$("#deleteTransHistory").on("click", function(){
		checkedTrans = [];
		
		$("input[name='transHistory']").each(function(){
			if($(this).is(":checked")){
				checkedTrans.push($(this));
			}
		})
		
		if(checkedTrans.length == 0){
			$("checkboxErrorModal2").modal('show');
		}else{
			$("#deleteTransHistoryModal").modal('show');
		}
		
	})
	
	//거래내역 등록 모달 내 등록버튼
	$("button[name='btnregistTransHistory']").on("click", function(){
		
		var registTransData = {
				transHistoryNo : null,
				transDate : null,
				vendorCd : $("#selectVendor").val(),
				transReason : $("#transReasonValue").val(),
				transAmt : $("#transAmtValue").val(),
				transType : $("input[name='payment']:checked").val()
		}
		
		$.ajax({
			url:"/emp/finance/registTransHistory",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(registTransData),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				$("#registTransHistoryModal").modal('hide');
				$("#ajaxSuccessModal").modal('show');
				window.location.reload();
			},
			error:function(xhr, status, error){
				$("#registTransHistoryModal").modal('hide');
				$("#ajaxErrorModal").modal('show');
				window.location.reload();				
			}
		})
	})
	//거래내역 수정 모달 내 등록버튼
	$("button[name='btneditTransHistory']").on("click", function(){
		var editTransData = {
				transHistoryNo : checkedTrans[0].attr("id"),
				transDate : null,
				vendorCd : $("#editSelectVendor").val(),
				transReason : $("#editTransReasonValue").val(),
				transAmt : $("#editTransAmtValue").val(),
				transType : $("input[name='editPayment']:checked").val()				
		}
		
		$.ajax({
			url:"/emp/finance/editTransHistory",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(editTransData),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				$("#editTransHistoryModal").modal('hide');
				$("#ajaxSuccessModal").modal('show');
				window.location.reload();
			},
			error:function(xhr, status, error){
				$("#editTransHistoryModal").modal('hide');
				$("#ajaxErrorModal").modal('show');
				window.location.reload();				
			}			
		})
	})
	
	
	//거래내역 삭제 모달 내 등록버튼
	$("button[name='btndeleteTransHistory']").on("click", function(){
		
		let checkedTransHistoryNo = [];
		
		$("input[name='transHistory']").each(function(){
			const transHistoryNo = $(this).attr("id");
			
			if($(this).is(":checked")){
				checkedTransHistoryNo.push(transHistoryNo);
			}
		})
		
		var deleteTransHistoryData = {
			"transHistoryVOList" : checkedTransHistoryNo.map(function(transHistoryNo){
				return{
					transHistoryNo : transHistoryNo
				}
			})
		}
		
		$.ajax({
			url:"/emp/finance/deleteTransHistory",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(deleteTransHistoryData),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				$("#deleteTransHistoryModal").modal('hide');
				$("#ajaxSuccessModal").modal('show');
				window.location.reload();
			},
			error:function(xhr, status, error){
				$("#deleteTransHistoryModal").modal('hide');
				$("#ajaxErrorModal").modal('show');
				window.location.reload();
			}
		})
		
	})

	//선택 체크박스
    $("#transHistories").change(function() {
        $('input[name="transHistory"]').prop('checked', this.checked);
    });
	
})
</script>