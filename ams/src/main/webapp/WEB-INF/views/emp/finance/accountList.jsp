<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<style>
	.btn-primary {
	    background-color: #6badf4;
	    border-color: white;
	}
	
	.btn-secondary{
	    background-color: #D9D9D9;
	    border-color: #D9D9D9;
	    color:black;
	}
	
	.btn-secondary:hover{
		background-color: #BDBDBD;
		border-color: #BDBDBD;
	}	
	
	.btn-warning {
	    color: #212529;
	    background-color: #FFD512;
	    border-color: #FFD512;
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
	      width : 80px;
	      border : 0.5px solid #908d8d;
	      height : 20px;
	      border-radius : 5px;
	   }
	   
	   input {
	      margin-top : 5px;
	      border : 0.5px solid #908d8d;
	      border-radius : 5px;
	   }
	}	
</style>

<div class="content-header">
	<h3>
		<span style="color:#B7B7B7;">예산 - 재무관리 - </span>
		<span>계정리스트</span>
	</h3>
</div>
<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header d-flex justify-content-between align-items-center">
				<div class="ml-auto d-flex align-items-center">
					<form>
						<div class="input-group input-group-sm">
							<p class="mb-0 d-flex align-items-center" style="margin-right:20px;">
								<select id="bdgItemYr" class="form-control" name="bdgItemYr">
									<option value="2024" selected>2024년</option>
									<option value="2023">2023년</option>
									<option value="2022">2022년</option>
								</select>
							</p>
							<p class="mb-0 d-flex align-items-center">
								<input type="text" id="searchBoxKeyword" class="form-control" name="searchBoxKeyword" placeholder="예산항목 또는 코드를 입력하세요" size="30">
								<button type="submit" class="btn btn-primary" style="width:100px; margin-left:10px;">검색</button>
							</p>
						</div>	
					</form>
				</div>
			</div>
			<!-- 검색창 영역 끝 -->
			<div class="d-flex justify-content-between">
				<!-- 예산항목 추가 / 수정 / 삭제 영역 -->
				<div class="p-2 d-flex flex-row">
					<input type="button" class="btn btn-primary" id="registBudgetItem" name="registBudgetItem" value="예산항목 추가">
					<input type="button" class="btn btn-secondary" id="editBudgetItem" name="editBudgetItem" value="예산항목 수정">
					<input type="button" class="btn btn-warning" id="deleteBudgetItem" name="deleteBudgetItem" value="예산항목 삭제">
				</div>
				<!-- 계정과목 추가 / 수정 / 삭제 영역 -->
				<div class="p-2 d-flex flex-row">
					<input type="button" class="btn btn-primary" id="registAccountItem" name="registAccountItem" value="계정과목 추가">
					<input type="button" class="btn btn-secondary" id="editAccountItem" name="editAccountItem" value="계정과목 수정">
					<input type="button" class="btn btn-warning" id="deleteAccountItem" name="deleteAccountItem" value="계정과목 삭제">	
				</div>
			</div>		
		
			<div class="card-body">
				<div class="d-flex flex-row">
					<!-- 예상항목 목록 영역 -->
					<div class="border d-flex flex-column" style="flex-grow:3;">
					    <div class="d-flex flex-row">
					        <div class="d-flex flex-column" style="flex-grow:5;">
					        	<!-- 예산항목코드 헤더 -->
					           	<div class="form-check">
					           		<p class="form-check">
							            <input type="checkbox" class="form-check-input" id="budget-items">
							            <label class="form-check-label" for="budget-items">예산항목 코드</label>	           	
					           		</p>
					           	</div>
					           	<!-- 예산항목코드 데이터 -->
								<div class="mt-2 border d-flex flex-column form-check">
									<c:forEach var="bdgItem" items="${bdgItemVOList}">
							        	<div class="m-2 d-flex">
							        		<input type="checkbox" class="form-check-input" id="${bdgItem.bdgItemCd}" name="budget-item">
						        			<label class="form-check-label" for="budget-item">${bdgItem.bdgItemCd}</label>
						        		</div>	
									</c:forEach>
								</div>
					        </div>
					        <div class="d-flex flex-column" style="flex-grow:5;">
					        	<!-- 예상항목 명 헤더 -->
					            <div>
						            <p>예산항목</p>
					            </div>
					            <!-- 예상항목명 데이터 -->
					            <div class="mt-2 border d-flex flex-column">
									<c:forEach var="bdgItem" items="${bdgItemVOList}">
							        	<div class="m-2 d-flex">
						        			<label class="form-check-label" for="budget-item" id="${bdgItem.bdgItemNm}">${bdgItem.bdgItemNm}</label>
						        		</div>	
									</c:forEach>            
					            </div>
					        </div>
					    </div>
					</div>
					<!-- 계정과목 목록 영역 -->
					<div class="border d-flex flex-column" style="flex-grow: 7;">
						<!-- 계정과목코드 헤더 부분 -->
						<div class="d-flex flex-row">
					        <div class="d-flex flex-column" style="flex:1;">
					        	<!-- 계정과목 코드 헤더 -->
					        	<div class="form-check">
					        		<p class="form-check">
						        		<input type="checkbox" class="form-check-input" id="account-items">
						        		<label class="form-check-label" for="account-items">계정과목 코드</label>
					        		</p>
					        	</div>
					        	<!-- 계정과목 코드 데이터 -->
						        <div class="mt-2 border d-flex flex-column form-check">
						        	<c:forEach var="accItem" items="${accItemVOList}">
						        		<div class="m-2 d-flex">
						        			<input type="checkbox" class="form-check-input" id="${accItem.accItemCd }" name="account-item">
						        			<label class="form-check-label" for="account-item">${accItem.accItemCd}</label>
						        		</div>
						        	</c:forEach>
						        </div>
					        </div>
					        <div class="d-flex flex-column" style="flex:1;">
					        	<!-- 계정과목 헤더 부분 -->
					        	<div>
						            <p>계정과목</p>
					        	</div>
					        	<!-- 계정과목 데이터 -->
					        	<div class="mt-2 border d-flex flex-column">
						        	<c:forEach var="accItem" items="${accItemVOList}">
						        		<div class="m-2 d-flex">
						        			<label class="form-check-label" for="account-item" id="${accItem.accItemNm}"> ${accItem.accItemNm }</label>
						        		</div>
						        	</c:forEach>
					        	</div>
					        </div>
					        <div class="d-flex flex-column" style="flex:1;">
					        	<!-- 사용여부 헤더 부분 -->
					        	<div>
						            <p>사용여부</p>
					        	</div>
					        	<!-- 사용여부 데이터 부분 -->
					        	<div class="mt-2 border d-flex flex-column">
						        	<c:forEach var="accItem" items="${accItemVOList}">
						        		<div class="m-2 d-flex">
						        			<label class="form-check-label" for="account-item" id="${accItem.useYn}">${accItem.useYn}</label>
						        		</div>
						        	</c:forEach>
					        	</div>
					        </div>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<!-- 예산항목등록 모달 -->
<div class="modal fade" id="registBudgetItemModal" tabindex="-1" role="dialog" aria-labelledby="registBudgetItemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    	<form action="/emp/finance/registBudgetItem" method="post">
			<div class="_modalBody">
			  <p>
			  	<label for="bdgItemCd">예산항목코드</label>
			  	<input type="text" id="bdgItemCd" name="bdgItemCd" placeholder="0001" maxlength="4" required>
			  	<input type="button" value="중복검사" name="registBudgetItemCheck">
			  </p>
			  <br>
			  <p>
			  	<label for="bdgItemNm">예산항목명</label>
			  	<input type="text" id="bdgItemNm" name="bdgItemNm" placeholder="예산항목 명을 입력해주세요" required>
			  </p>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			  <button type="submit" name="btnRegistBdgItemCd" class="btn btn-primary">등록</button>
			</div>
			<sec:csrfInput/>
    	</form>
    </div>
  </div>
</div>
<!-- 예산항목등록 모달 끝-->

<!-- 예산항목수정 모달 -->
<div class="modal fade" id="editBudgetItemModal" tabindex="-1" role="dialog" aria-labelledby="editBudgetItemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
			<div class="_modalBody ">
			  <p>
			  	<label for="ModalbdgItemCd">예산항목코드</label>
			  	<input type="text" id="ModalbdgItemCd" name="ModalbdgItemCd" readonly required>
			  </p>
			  <br>
			  <p>
			  	<label for="ModalbdgItemNm">예산항목명</label>
			  	<input type="text" id="ModalbdgItemNm" name="ModalbdgItemNm" placeholder="예산항목 명을 입력해주세요" required>
			  </p>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			  <button type="button" name="btnEditBdgItemCd" class="btn btn-primary">저장</button>
			</div>
    </div>
  </div>
</div>
<!-- 예산항목수정 모달 끝-->

<!-- 예산항목삭제 모달 -->
<div class="modal fade" id="deleteBudgetItemModal" tabindex="-1" role="dialog" aria-labelledby="deleteBudgetItemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>정말로 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="submit" id="btnDeleteBdgItemCd" name="btnDeleteBdgItemCd" class="btn btn-warning">삭제</button>
      </div>
    </div>
  </div>
</div>
<!-- 예산항목삭제 모달 끝-->

<!-- 계정과목등록 모달 -->
<div class="modal fade" id="registAccountItemModal" tabindex="-1" role="dialog" aria-labelledby="registAccountItemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    	<form action="/emp/finance/registAccountItem" method="post">
			<div class="_modalBody">
			  <p>
			  	<label for="accItemCd">계정과목코드</label>
			  	<input type="text" id="accItemCd" name="accItemCd" placeholder="85001" maxlength="6" required>
			  	<input type="button" value="중복검사" name="registAccountItemCheck">
			  </p>
			  <br>
			  <p>
			  	<label for="accItemNm">계정과목명</label>
			  	<input type="text" id="accItemNm" name="accItemNm" placeholder="권한명을 입력해주세요" required>
			  </p>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			  <button type="submit" name="btnRegistaccItemCd" class="btn btn-primary">등록</button>
			</div>
			<sec:csrfInput/>
    	</form>
    </div>
  </div>
</div>
<!-- 계정과목등록 모달  끝-->

<!-- 계정과목수정 모달 -->
<div class="modal fade" id="editAccountItemModal" tabindex="-1" role="dialog" aria-labelledby="editAccountItemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
			<div class="_modalBody">
			  <p>
			  	<label for="ModalaccItemCd">계정과목코드</label>
			  	<input type="text" id="ModalaccItemCd" name="ModalaccItemCd" readonly required>
			  </p>
			  <br>
			  <p>
			  	<label for="ModalaccItemNm">계정과목명</label>
			  	<input type="text" id="ModalaccItemNm" name="ModalaccItemNm" placeholder="권한명을 입력해주세요" required>
			  </p>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			  <button type="button" name="btnEditaccItemCd" class="btn btn-primary">등록</button>
			</div>
    </div>
  </div>
</div>
<!-- 계정과목수정 모달 끝  -->

<!-- 계정과목삭제 모달 -->
<div class="modal fade" id="deleteAccountItemModal" tabindex="-1" role="dialog" aria-labelledby="deleteAccountItemModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>정말로 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" name="btnDeleteBdgItemCd" class="btn btn-warning">삭제</button>
      </div>
    </div>
  </div>
</div>
<!-- 계정과목삭제 모달 끝-->

<!-- 계정과목 또는 예산항목 선택 안했을때 모달 -->
<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModallLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>한개 이상의 체크 박스를 선택해주세요</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 계정과목 또는 예산항목 선택 안했을때 모달 끝 -->

<!-- 계정과목 한개 이상 선택하고 수정눌렀을때 모달 -->
<div class="modal fade" id="errorModal2" tabindex="-1" role="dialog" aria-labelledby="errorModal2lLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>한개의 체크 박스만 선택해주세요</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 계정과목 한개 이상 선택하고 수정눌렀을때 모달 끝 -->

<!-- 성공 모달 -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModallLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>성공했습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 성공 모달 끝 -->

<script>

	$(function(){
		let registBudgetItemCheckFlag = 0;
		let registAccountItemCheckFlag = 0;
		
		$("button[name='btnRegistBdgItemCd']").prop("disabled", true);
		$("button[name='btnRegistaccItemCd']").prop("disabled", true);
		
		
		$("input[name='registBudgetItem']").on("click", function(){
			$("#registBudgetItemModal").modal('show');
		})
		
		$("input[name='registAccountItem']").on("click", function(){
			$("#registAccountItemModal").modal('show');
		})
		
		$("input[name='registBudgetItemCheck']").on("click", function(){
			var bdgItemCd = $("#bdgItemCd").val();
			var self = this;
			$.ajax({
				url:"/emp/finance/registBudgetItemCheck",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify({bdgItemCd : bdgItemCd}),
				type:"POST",
				dataType:"text",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(result){
					if(result === "0"){
			 		    $("p#registBudgetItemCheckMessage").remove();  // 기존 문구 삭제
			 		    $(self).closest("p").append('<p id="registBudgetItemCheckMessage" style="color: blue;">사용가능한 예산항목 코드입니다.</p>');
			 		    registBudgetItemCheckFlag = 1;
			 		    $("button[name='btnRegistBdgItemCd']").prop("disabled", false);

					}else{
			 		    $("p#registBudgetItemCheckMessage").remove();  // 기존 문구 삭제
			 		    $(self).closest("p").append('<p id="registBudgetItemCheckMessage" style="color: red;">이미 있는 예산항목 코드입니다.</p>');
			 		   registBudgetItemCheckFlag = 0;
	                    $("button[name='btnRegistBdgItemCd']").prop("disabled", true);  // submit 버튼 활성화
					}
				},
				error:function(xhr,status,error){
					console.log("ajax error", error);
				}
			})
		})
		
		$("input[name='registAccountItemCheck']").on("click", function(){
			var accItemCd = $("#accItemCd").val();
			var self = this;
			$.ajax({
				url:"/emp/finance/registAccountItemCheck",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify({accItemCd : accItemCd}),
				type:"POST",
				dataType:"text",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(result){
					if(result === "0"){
			 		    $("p#registAccountItemCheckMessage").remove();  // 기존 문구 삭제
			 		    $(self).closest("p").append('<p id="registAccountItemCheckMessage" style="color: blue;">사용가능한 계정과목 코드입니다.</p>');
			 		   	registBudgetItemCheckFlag = 1;
			 		  	$("button[name='btnRegistaccItemCd']").prop("disabled", false);  // submit 버튼 활성화

					}else{
			 		    $("p#registAccountItemCheckMessage").remove();  // 기존 문구 삭제
			 		    $(self).closest("p").append('<p id="registAccountItemCheckMessage" style="color: red;">이미 있는 계정과목 코드입니다.</p>');
			 		   	registBudgetItemCheckFlag = 0;
			 		  	$("button[name='btnRegistaccItemCd']").prop("disabled", true);
					}
				},
				error:function(xhr,status,error){
					console.log("ajax error", error);
				}
			})		
		})
		
		$("form[action='/emp/finance/registBudgetItem']").on("submit", function(e){
			e.preventDefault();
			
			var budgetItemData = {
				bdgItemCd : $("#bdgItemCd").val(),
				bdgItemNm : $("#bdgItemNm").val()
			};
			
			$.ajax({
				url:"/emp/finance/registBudgetItem",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify(budgetItemData),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
			           if (response.result === "success") {
			                alert(response.message);
			                window.location.reload();
			            } else {
			                alert(response.message);
			                window.location.reload();
			            }
				},
		       error: function(xhr, status, error) {
		            alert("예산항목 등록 중 오류가 발생했습니다. 다시 시도해 주세요.");
		            window.location.reload();
		        }
			})
		})
		
		$("form[action='/emp/finance/registAccountItem']").on("submit", function(e){
			e.preventDefault();
			
			var accountitemData = {
					accItemCd : $("#accItemCd").val(), 
					accItemNm : $("#accItemNm").val()
			};

			$.ajax({
				url:"/emp/finance/registAccountItem",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify(accountitemData),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
			           if (response.result === "success") {
			                alert(response.message);
			                window.location.reload();
			            } else {
			                alert(response.message);
			                window.location.reload();
			            }
				},
		       error: function(xhr, status, error) {
		            alert("계정과목 등록 중 오류가 발생했습니다. 다시 시도해 주세요.");
		            window.location.reload();
		        }
			})
		})
		
		
		//예산항목 수정 버튼 로직
		$("input[name='editBudgetItem']").on("click", function(){
			let checkedBdgItemCd = [];
			
			$("input[name='budget-item']").each(function(){
				const bdgItemCd = $(this).attr("id");
				
				if($(this).is(":checked")){
					checkedBdgItemCd.push(bdgItemCd);
				}
			})
			
			if(checkedBdgItemCd.length > 1){
				$("#errorModal2").modal('show');
				
			}else{
				$("#ModalbdgItemCd").val(checkedBdgItemCd[0]);
				$("#editBudgetItemModal").modal('show');
			}
		})
		
		//예산항목 수정 모달창 안 수정버튼 로직
		$("button[name='btnEditBdgItemCd']").on("click",function(){
			
			var editBdgData = {
					bdgItemCd : $("#ModalbdgItemCd").val(),
					bdgItemNm : $("#ModalbdgItemNm").val()
			}
			
			$.ajax({
				url:"/emp/finance/editBudgetItem",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify(editBdgData),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
			           if (response.result === "success") {
			                alert(response.message);
			                window.location.reload();
			            } else {
			                alert(response.message);
			                window.location.reload();
			            }
				},
		       error: function(xhr, status, error) {
		            alert("예산항목 수정 중 오류가 발생했습니다. 다시 시도해 주세요.");
		            window.location.reload();
		        }
			})
		})
		
		//계정과목 수정 버튼		
		$("input[name='editAccountItem']").on("click", function(){
			let checkedAccItemCd = [];
			
			$("input[name='account-item']").each(function(){
				const accItemCd = $(this).attr("id");
				
				if($(this).is(":checked")){
					checkedAccItemCd.push(accItemCd);
				}
			})
			
			console.log(checkedAccItemCd[0]);
			
			if(checkedAccItemCd.length > 1){
				$("#errorModal2").modal('show');
			}else{
				$("#ModalaccItemCd").val(checkedAccItemCd[0]);
				$("#editAccountItemModal").modal('show');
			}
		})
		
		//계정과목 수정 모달창 안 수정버튼 로직
		$("button[name='btnEditaccItemCd']").on("click", function(){
			console.log("asdasd")
			var editAccData = {
					accItemCd : $("#ModalaccItemCd").val(),
					accItemNm : $("#ModalaccItemNm").val()
			}
			$.ajax({
				url:"/emp/finance/editAccountItem",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify(editAccData),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
			           if (response.result === "success") {
			                alert(response.message);
			                window.location.reload();
			            } else {
			                alert(response.message);
			                window.location.reload();
			            }
				},
		       error: function(xhr, status, error) {
		            alert("계정과목 수정 중 오류가 발생했습니다. 다시 시도해 주세요.");
		            window.location.reload();
		        }
			})
			
		})
		
		//예산항목 삭제 버튼 로직
		$("input[name='deleteBudgetItem']").on("click", function(){
			let checkedBdgItemCd = [];
			
			$("input[name='budget-item']").each(function(){
				const bdgItemCd = $(this).attr("id");
				
				if($(this).is(":checked")){
					checkedBdgItemCd.push(bdgItemCd);
				}
			})
			
			if(checkedBdgItemCd.length > 0){
				$("#deleteBudgetItemModal").modal('show')
			}else{
				
				$("#errorModal").modal('show');
			}
		})
		
		// 예산항목 삭제확인창 모달 안에 삭제버튼 로직
		$("#btnDeleteBdgItemCd").on("click", function(){
			
			let checkedBdgItemCd = [];
			
			$("input[name='budget-item']").each(function(){
				const bdgItemCd = $(this).attr("id");
				if($(this).is(":checked")){
					checkedBdgItemCd.push(bdgItemCd);
				}
			})
			
			var deleteBdgData = {
				"budgetItemVOList" : checkedBdgItemCd.map(function(bdgItemCd){
					return{
						bdgItemCd : bdgItemCd
					};
				})
			};
			
			$.ajax({
				url:"/emp/finance/deleteBudgetItem",
				contentType:"application/json; charset=utf-8",
				data:JSON.stringify(deleteBdgData),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
					$("#deleteBudgetItemModal").modal('hide');
					$("#successModal").modal('show');
					window.location.reload();
				},
				error:function(xhr, status, error){
					$("#deleteBudgetItemModal").modal('hide');
					$("#errorModal").modal('show');
				}
			})
		})

		//계정과목 삭제 버튼
		$("input[name='deleteAccountItem']").on("click", function(){
			let checkedAccItemCd = [];
			
			$("input[name='account-item']").each(function(){
				const accItemCd = $(this).attr("id");
				
				if($(this).is(":checked")){
					checkedAccItemCd.push(accItemCd);
				}
			})
			
			if(checkedAccItemCd.length > 0){
				$("#deleteAccountItemModal").modal('show')
			}else{
				$("#errorModal").modal('show');
			}			
		})
		
		//계정과목 삭제 확인 모달의 확인버튼
		$("button[name='btnDeleteBdgItemCd']").on("click", function(){

			let checkedAccItemCd = [];
			
			$("input[name='account-item']").each(function(){
				const accItemCd = $(this).attr("id");
				
				if($(this).is(":checked")){
					checkedAccItemCd.push(accItemCd);
				}
			})
			
			var deleteAccData = {
				"accountItemVOList" : checkedAccItemCd.map(function(accItemCd){
					return{
						accItemCd : accItemCd
					}
				})
			};
			
			$.ajax({
				url:"/emp/finance/deleteAccountItem",
				contentType:"application/json; charset=utf-8",
				data:JSON.stringify(deleteAccData),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
					$("#deleteAccountItemModal").modal('hide');
					$("#successModal").modal('show');
					window.location.reload();
				},
				error:function(xhr, status, error){
					$("#deleteAccountItemModal").modal('hide');
					$("#errorModal").modal('show');
				}
			})
		})
		
        $('#budget-items').change(function() {
            // Set the checked property for all checkboxes with the name 'budget-item'
            $('input[name="budget-item"]').prop('checked', this.checked);
        });
		
		$("#account-items").change(function(){
			$("input[name='account-item']").prop('checked', this.checked);
		})
	})
</script>