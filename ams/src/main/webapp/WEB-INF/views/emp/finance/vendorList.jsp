<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/finance/vendorList.css">
<div class="row" style="font-family:Pretendard;">
	<div class="col-12">
		<div class="container">
			<div class="titleHeader d-flex align-items-center">
				<div>
					<span style="color:#A4A4A4; font-size:20px; font-weight: 600; word-wrap: break-word;">자재관리 - </span>
					<span style="font-size:20px; font-weight: 600; word-wrap: break-word;">거래처관리</span>
				</div>
				<div class="d-flex flex-row ml-auto">
					<div>
						<button type="button" id="registVendor" name="registVendor" class="btn btn-primary">등록</button>
					</div>
					<div>
						<button type="button" id="editVendor" name="editVendor" class="btn btn-primary">수정</button>
					</div>
					<div>
						<button type="button" id="deleteVendor" name="deleteVendor" class="btn btn-primary">삭제</button>
					</div>
				</div>				
			</div>
			<div class="card-body table-responsive p-0">
				<div class="searchHeader">
					<div class="ml-auto d-flex align-items-center" style="border-bottom:none;">
						<form class="d-flex flex-row justify-content-between">
							<div class="d-flex flex-row">
							    <div class="input-group input-group-sm" style="width: 120px;">
							        <select id="searchFilter" name="searchFilter" class="form-control">
							            <option value="ALL" selected>전체</option>
							            <option value="VDR_NM">거래처명</option>
							            <option value="VDR_TYPE">업태</option>
							            <option value="VDR_OWNER_NM">대표자명</option>
							            <option value="VDR_REGIST_NO">사업자등록번호</option>
							            <option value="VDR_ADDR">주소</option>
							            <option value="VDR_TEL">전화번호</option>
							        </select>
							    </div>
							    <div class="input-group input-group-sm" style="margin-left: 10px;">
							        <input type="text" name="table_search" class="form-control" placeholder="검색어 입력" value="${param.table_search}" style="width: 200px;">
							        <div class="input-group-append">
							            <button type="submit" class="btn btn-default">
							                <i class="fas fa-search"></i>
							            </button>
							        </div>
							    </div>
							</div>

							<sec:csrfInput/>
						</form>
					</div>
				</div>
				<div class="tableDiv">
					<table style="width:100%; border:0.5px solid #e4e4e4; border-top:none; border-left:none; border-right:none;">
						<thead style="background:#e4e4e463; height:35px;">
							<tr style="text-align:center;">
								<th>
									<input type="checkbox" id="vendors" name="vendors">
								</th>
								<th>거래처명</th>
								<th>업태</th>
								<th>대표자명</th>
								<th>사업자등록번호</th>
								<th>주소</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vendorVO" items="${vendorVOList}">
								<tr id="vendorDetail" class="boardTR" style="height:45px; border:0.5px solid #e4e4e4; border-top:none; border-left:none; border-right:none; cursor:pointer;">
									<td style="text-align:center;">
										<p class="form-check">
											<input type="checkbox" class="form-check-input" id="${vendorVO.vendorCd}" name="vendor"
												data-vendorCd="${vendorVO.vendorCd}"
												data-vdrType="${vendorVO.vdrType}"
												data-vdrNm="${vendorVO.vdrNm}"
												data-vdrOwnerNm="${vendorVO.vdrOwnerNm}"
												data-vdrAddr="${vendorVO.vdrAddr}"
												data-vdrAddrDet="${vendorVO.vdrAddrDet}"
												data-vdrTel="${vendorVO.vdrTel}"
												data-vdrRegistNo="${vendorVO.vdrRegistNo}">
										</p>
									</td>
									<td style="text-align:center;">${vendorVO.vdrNm }</td>
									<td style="text-align:center;">${vendorVO.vdrType }</td>
									<td style="text-align:center;">${vendorVO.vdrOwnerNm }</td>
									<td style="text-align:center;">${vendorVO.vdrRegistNo }</td>
									<td style="text-align:center;">${vendorVO.vdrAddr }</td>
									<td style="text-align:center;">${vendorVO.vdrTel }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="board-footer">
						${vendorPage.pagingArea }
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 상세조회 모달 -->
<div class="modal fade" id="detailVendorlModal" tabindex="-1" role="dialog" aria-labelledby="vendorDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
			<div class="modal-header">
				<h2>거래처 상세조회</h2>
			</div>
			<div class="_modalBody">
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vendorCdDetail" name="vendorCdDetail" readonly style="display:none;">
					<input type="text" id="vdrNmDetail" name="vdrNmDetail" class="form-control" readonly>
					<input type="text" id="vdrOwnerNmDetail" name="vdrOwnerNmDetail" class="form-control" readonly>
				</div>
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vdrTypeDetail" name="vdrTypeDetail" class="form-control" readonly>
					<input type="text" id="vdrTelDetail" name="vdrTelDetail" class="form-control" readonly>
				</div>			
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vdrAddrDetail" name="vdrAddrDetail" class="form-control" readonly>
					<input type="text" id="vdrAddrDetDetail" name="vdrAddrDetDetail" class="form-control" readonly>
				</div>
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vdrRegistNoDetail" name="vdrRegistNoDetail" class="form-control" readonly>
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
    </div>
  </div>
</div>
<!-- 상세조회 모달 끝 -->

<!-- 등록 모달 -->
<div class="modal fade" id="registVendorModal" tabindex="-1" role="dialog" aria-labelledby="vendorRegistModalLabel" aria-hidden="true" style="font-family:Pretendard;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
			<div class="modal-header">
				<h2>거래처 등록</h2>
			</div>
			<div class="_modalBody">
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vdrNmRegist" name="vdrNmRegist" class="form-control" placeholder="거래처명">
					<input type="text" id="vdrOwnerNmRegist" name="vdrOwnerNmRegist" class="form-control" placeholder="거래처 대표명">
				</div>
				<div class="d-flex flex-row align-items-center">
					<select id="vdrTypeRegist" name="vdrTypeRegist" class="form-control">
						<option value="">업태 선택</option>
						<option value="농업, 임업 및 어업">농업, 임업 및 어업</option>
						<option value="광업">광업</option>
						<option value="제조업">제조업</option>
						<option value="전기, 가스, 증기  및 공기 조절 공급업">전기, 가스, 증기  및 공기 조절 공급업</option>
						<option value="수도, 하수 및 폐기물 처리, 원료 재생업">수도, 하수 및 폐기물 처리, 원료 재생업</option>
						<option value="건설업">건설업</option>
						<option value="도매 및 소매업">도매 및 소매업</option>
						<option value="운수 및 창고업">운수 및 창고업</option>
						<option value="숙박 및 음식점업">숙박 및 음식점업</option>
						<option value="정보통신업">정보통신업</option>
						<option value="금융 및 보험업">금융 및 보험업</option>
						<option value="부동산업">부동산업</option>
						<option value="전문, 과학 및 기술 서비스업">전문, 과학 및 기술 서비스업</option>
						<option value="공공 행정, 국방 및 사회보장 행정">공공 행정, 국방 및 사회보장 행정</option>
						<option value="교육 서비스업">교육 서비스업</option>
						<option value="보건업 및 사회복지 서비스업">보건업 및 사회복지 서비스업</option>
						<option value="예술, 스포츠 및 여가관련 서비스업">예술, 스포츠 및 여가관련 서비스업</option>
						<option value="협회 및 단체, 수리 및 기타 개인 서비스업">협회 및 단체, 수리 및 기타 개인 서비스업</option>
						<option value="국제 및 외국기관">국제 및 외국기관</option>
					</select>
					<input type="text" id="vdrTelRegist" name="vdrTelRegist" class="form-control" maxlength="13" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}"
					 placeholder="전화번호(000-0000-0000)">
				</div>
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vdrAddrRegist" name="vdrAddrRegist" class="form-control" placeholder="주소" style="width:80%;" readonly>
					<button type="button" id="registAddr" name="registAddr" class="btn btn-primary" style="margin-top:5px;">주소검색</button> 
				</div>
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vdrAddrDetRegist" name="vdrAddrDetRegist" class="form-control" placeholder="상세주소">
				</div>
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vdrRegistNoRegist" name="vdrRegistNoRegist" class="form-control" maxlength="12"
					    pattern="[0-9]{3}-[0-9]{2}-[0-9]{5}" placeholder="사업자등록번호(000-00-00000)">
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			  <button type="button" name="btnregistVendor" class="btn btn-secondary">등록</button>
			</div>
    </div>
  </div>
</div>
<!-- 등록 모달 -->

<!-- 수정 모달 -->
<div class="modal fade" id="editVendorModal" tabindex="-1" role="dialog" aria-labelledby="vendorRegistModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
			<div class="modal-header">
				<h2>거래처 수정</h2>
			</div>
			<div class="_modalBody">
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vendorCdEdit" name="vendorCdEdit" class="form-control" style="display:none;">
					<input type="text" id="vdrNmEdit" name="vdrNmEdit" class="form-control">
					<input type="text" id="vdrOwnerNmEdit" name="vdrOwnerNmEdit" class="form-control">
				</div>
				<div class="d-flex flex-row align-items-center">
					<select id="vdrTypeEdit" name="vdrTypeEdit" class="form-control">
						<option value="">업태 선택</option>
						<option value="농업, 임업 및 어업">농업, 임업 및 어업</option>
						<option value="광업">광업</option>
						<option value="제조업">제조업</option>
						<option value="전기, 가스, 증기  및 공기 조절 공급업">전기, 가스, 증기  및 공기 조절 공급업</option>
						<option value="수도, 하수 및 폐기물 처리, 원료 재생업">수도, 하수 및 폐기물 처리, 원료 재생업</option>
						<option value="건설업">건설업</option>
						<option value="도매 및 소매업">도매 및 소매업</option>
						<option value="운수 및 창고업">운수 및 창고업</option>
						<option value="숙박 및 음식점업">숙박 및 음식점업</option>
						<option value="정보통신업">정보통신업</option>
						<option value="금융 및 보험업">금융 및 보험업</option>
						<option value="부동산업">부동산업</option>
						<option value="전문, 과학 및 기술 서비스업">전문, 과학 및 기술 서비스업</option>
						<option value="공공 행정, 국방 및 사회보장 행정">공공 행정, 국방 및 사회보장 행정</option>
						<option value="교육 서비스업">교육 서비스업</option>
						<option value="보건업 및 사회복지 서비스업">보건업 및 사회복지 서비스업</option>
						<option value="예술, 스포츠 및 여가관련 서비스업">예술, 스포츠 및 여가관련 서비스업</option>
						<option value="협회 및 단체, 수리 및 기타 개인 서비스업">협회 및 단체, 수리 및 기타 개인 서비스업</option>
						<option value="국제 및 외국기관">국제 및 외국기관</option>
						<option value="기타">기타</option>
					</select>
					<input type="text" id="vdrTelEdit" name="vdrTelEdit" class="form-control">
				</div>
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vdrAddrEdit" name="vdrAddrEdit" class="form-control" style="width:80%;">
					<button type="button" id="editAddr" name="editAddr" class="btn btn-primary" style="margin-top:5px;">주소검색</button> 
				</div>
				<div class="d-flex flex-row align-items-center">
					<input type="text" id="vdrAddrDetEdit" name="vdrAddrDetEdit" class="form-control">
					
				</div>
				<div>
					<input type="text" id="vdrRegistNoEdit" name="vdrRegistNoEdit" class="form-control">
				</div>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			   <button type="button" name="btneditVendor" class="btn btn-primary">등록</button>
			</div>
    </div>
  </div>
</div>
<!-- 수정 모달 -->
<div class="modal fade" id="deleteVendorModal" tabindex="-1" role="dialog" aria-labelledby="deleteVendorModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="_modalBody">
        <p>정말로 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" name="btndeleteVendor" class="btn btn-danger">삭제</button>
      </div>
    </div>
  </div>
</div>
<!-- 삭제 모달 -->


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
<script>
var checkedVendor = [];
$(function(){
    $("input[name='vendor']").on("click", function(event) {
        event.stopPropagation();
    });	
	
	$("button[name='registVendor']").on("click", function(){
		$("#registVendorModal").modal('show');
	})
	
	$("button[name='btnregistVendor']").on("click", function(){
		var registVendorData = {
				vdrOwnerNm : $("#vdrOwnerNmRegist").val(),
				vdrType : $("#vdrTypeRegist option:selected").val(),
				vdrTel : $("#vdrTelRegist").val(),
				vdrAddr : $("#vdrAddrRegist").val(),
				vdrAddrDet : $("#vdrAddrDetRegist").val(),
				vdrNm : $("#vdrNmRegist").val(),
				vdrRegistNo : $("#vdrRegistNoRegist").val()
		}
		
		console.log(registVendorData);
		
		$.ajax({
			url:"/emp/inventory/registVendor",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(registVendorData),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				$("#registVendorModal").modal('hide');
				$("#ajaxSuccessModal").modal('show');
				//1초뒤에 리프레시하는 코드가 있음
				window.location.reload();
			},
			error:function(xhr, status, error){
				$("#registVendorModal").modal('hide');
				$("#ajaxErrorModal").modal('show');
				window.location.reload();
			}
		})
	})
	
	$("button[name='editVendor']").on("click", function(){
		
		checkedVendor = [];
		
		$("input[name='vendor']").each(function(){
			if($(this).is(":checked")){
				checkedVendor.push($(this));
			}
		})

		if(checkedVendor.length > 1){
			$("#checkboxErrorModal").modal('show');
		}else if(checkedVendor.length == 0){
			$("#checkboxErrorModal2").modal('show');
		}else{
		
			let selectedVendor = checkedVendor[0]
			
	        var vendorCd = selectedVendor.data("vendorcd");
	        var vdrNm = selectedVendor.data("vdrnm");
	        var vdrOwnerNm = selectedVendor.data("vdrownernm");
	        var vdrType = selectedVendor.data("vdrtype");
	        var vdrAddr = selectedVendor.data("vdraddr");
	        var vdrAddrDet = selectedVendor.data("vdraddrdet");
	        var vdrTel = selectedVendor.data("vdrtel");
	        var vdrRegistNo = selectedVendor.data("vdrregistno");
	
	        // Populate the modal fields with the clicked row's data
	        $("#vendorCdEdit").val(vendorCd);
	        $("#vdrNmEdit").val(vdrNm);
	        $("#vdrOwnerNmEdit").val(vdrOwnerNm);
	        $("#vdrTypeEdit").val(vdrType);
	        $("#vdrAddrEdit").val(vdrAddr);
	        $("#vdrAddrDetEdit").val(vdrAddrDet);
	        $("#vdrTelEdit").val(vdrTel);
	        $("#vdrRegistNoEdit").val(vdrRegistNo);		
			
			
			$("#editVendorModal").modal('show');
		}
	})
	
	$("button[name='btneditVendor']").on("click", function(){
		var editVendorData = {
				vendorCd : $("#vendorCdEdit").val(),
				vdrOwnerNm : $("#vdrOwnerNmEdit").val(),
				vdrType : $("#vdrTypeEdit").val(),
				vdrTel : $("#vdrTelEdit").val(),
				vdrAddr : $("#vdrAddrEdit").val(),
				vdrAddrDet : $("#vdrAddrDetEdit").val(),
				vdrNm : $("#vdrNmEdit").val(),
				vdrRegistNo : $("#vdrRegistNoEdit").val()
		}
		
		$.ajax({
			url:"/emp/inventory/editVendor",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(editVendorData),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				$("#editVendorModal").modal('hide');
				$("#ajaxSuccessModal").modal('show');
				window.location.reload();
			},
			error:function(xhr, status, error){
				$("#editVendorModal").modal('hide');
				$("#ajaxErrorModal").modal('show');
				window.location.reload();
			}
		})		
	})
	
	$("button[name='deleteVendor']").on("click", function(){
		checkedVendor = [];
		
		$("input[name='vendor']").each(function(){
			if($(this).is(":checked")){
				checkedVendor.push($(this));
			}
		})
		
		if(checkedVendor.length == 0){
			$("#checkboxErrorModal2").modal('show');
		}else{
			$("#deleteVendorModal").modal('show');
		}
	})
	
	$("button[name='btndeleteVendor']").on("click", function(){
		
		let checkedVendorCd = [];
		
		$("input[name='vendor']").each(function(){
			const vendorCd = $(this).attr("id");
			
			if($(this).is(":checked")){
				checkedVendorCd.push(vendorCd);
			}
		})
		
		var deleteVendorData = {
			"vendorVOList" : checkedVendorCd.map(function(vendorCd){
				return{
					vendorCd : vendorCd
				}
			})
		}
		
		$.ajax({
			url:"/emp/inventory/deleteVendor",
			contentType:"application/json; charset=utf-8",
			data:JSON.stringify(deleteVendorData),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				$("#deleteVendorModal").modal('hide');
				$("#ajaxSuccessModal").modal('show');
				window.location.reload();
			},
			error:function(xhr, status, error){
				$("#deleteVendorModal").modal('hide');
				$("#ajaxErrorModal").modal('show');
				window.location.reload();
			}
		})
	})
	
	$("#vendors").change(function(){
		$('input[name="vendor"]').prop('checked', this.checked);
	})	

    $("tr#vendorDetail").on("click", function() {
        // Get the data attributes from the clicked row
        var vendorCd = $(this).find("input[name='vendor']").data("vendorcd");
        var vdrNm = $(this).find("input[name='vendor']").data("vdrnm");
        var vdrOwnerNm = $(this).find("input[name='vendor']").data("vdrownernm");
        var vdrType = $(this).find("input[name='vendor']").data("vdrtype");
        var vdrAddr = $(this).find("input[name='vendor']").data("vdraddr");
        var vdrAddrDet = $(this).find("input[name='vendor']").data("vdraddrdet");
        var vdrTel = $(this).find("input[name='vendor']").data("vdrtel");
        var vdrRegistNo = $(this).find("input[name='vendor']").data("vdrregistno");

        // Populate the modal fields with the clicked row's data
        $("#vendorCdDetail").val(vendorCd);
        $("#vdrNmDetail").val(vdrNm);
        $("#vdrOwnerNmDetail").val(vdrOwnerNm);
        $("#vdrTypeDetail").val(vdrType);
        $("#vdrAddrDetail").val(vdrAddr);
        $("#vdrAddrDetDetail").val(vdrAddrDet);
        $("#vdrTelDetail").val(vdrTel);
        $("#vdrRegistNoDetail").val(vdrRegistNo);

        // Show the modal
        $("#detailVendorlModal").modal('show');
    });
	
	$("#registAddr").on("click", function(){
		new daum.Postcode({
			oncomplete: function(data){
				$("input[name='vdrAddrRegist']").val(data.address);
				$("input[name='vdrAddrDetRegist']").focus();
			}
		}).open();
	})
	
	$("#editAddr").on("click", function(){
		new daum.Postcode({
			oncomplete: function(data){
				$("input[name='vdrAddrEdit']").val(data.address);
				$("input[name='vdrAddrDetEdit']").focus();				
			}
		}).open();
	})
	
    function validateInput() {
        var empNm = $('#empNm').val();
        var regex = /^[가-힣]{1,7}$/;

        if (!regex.test(empNm)) {
            $('#empNm').val(empNm.replace(/[^가-힣]/g, '').slice(0, 7));
        }
    }
    
    function inputPhoneNumber(phone) {
        if (event.keyCode != 8) {
            const regExp = /^[0-9]{2,3}-?[0-9]{3,4}-?[0-9]{4}$/;

            if (phone.value.replace(/[^0-9-]/g, "").length != 0) {
                if (checkPhoneNumber(phone.value)) {
                    let number = phone.value.replace(/[^0-9]/g, "");
                    let tel = "";
                    let seoul = 0;

                    if (number.substring(0, 2) === "02") {
                        seoul = 1;
                        phone.setAttribute("maxlength", "12");
                    } else {
                        phone.setAttribute("maxlength", "13");
                    }

                    if (number.length < (4 - seoul)) {
                        return number;
                    } else if (number.length < (7 - seoul)) {
                        tel += number.substr(0, (3 - seoul));
                        tel += "-";
                        tel += number.substr(3 - seoul);
                    } else if (number.length < (11 - seoul)) {
                        tel += number.substr(0, (3 - seoul));
                        tel += "-";
                        tel += number.substr((3 - seoul), 3);
                        tel += "-";
                        tel += number.substr(6 - seoul);
                    } else {
                        tel += number.substr(0, (3 - seoul));
                        tel += "-";
                        tel += number.substr((3 - seoul), 4);
                        tel += "-";
                        tel += number.substr(7 - seoul);
                    }
                    phone.value = tel;
                } else {
                    // 정규 표현식으로 숫자와 하이픈 외의 문자 제거
                    const regExp = /[^0-9-]/g;
                    phone.value = phone.value.replace(regExp, "");
                }
            }
        }
    }

    function checkPhoneNumber(number) {
        const regExp = /^[0-9-]*$/;
        return regExp.test(number);
    }
    
	$("#vdrTelRegist").on("keyup", function(e){
		inputPhoneNumber(e.target);
	})
	
	function inputRegistNumber(number){
	    if (event.keyCode != 8) {
	        const regExp = /^[0-9]{3}-?[0-9]{2}-?[0-9]{5}$/;

	        if (number.value.replace(/[^0-9-]/g, "").length != 0) {
	            if (checkRegistNumber(number.value)) {
	                let registNum = number.value.replace(/[^0-9]/g, "");
	                let formatted = "";

	                if (registNum.length < 4) {
	                    return registNum;
	                } else if (registNum.length < 6) {
	                    formatted += registNum.substr(0, 3);
	                    formatted += "-";
	                    formatted += registNum.substr(3);
	                } else {
	                    formatted += registNum.substr(0, 3);
	                    formatted += "-";
	                    formatted += registNum.substr(3, 2);
	                    formatted += "-";
	                    formatted += registNum.substr(5);
	                }
	                number.value = formatted;
	            } else {
	                const regExp = /[^0-9-]/g;
	                number.value = number.value.replace(regExp, "");
	            }
	        }
	    }
	}
	
	function checkRegistNumber(number){
        const regExp = /^[0-9-]*$/;
        return regExp.test(number);
	}
	
	$("#vdrRegistNoRegist").on("keyup", function(e){
		inputRegistNumber(e.target);
	})

})

</script>