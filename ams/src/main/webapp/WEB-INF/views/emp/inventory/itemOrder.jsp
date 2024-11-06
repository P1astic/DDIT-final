<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/emp/regist.css">

<sec:authorize access="isAuthenticated()">
	<%-- 		<sec:authentication property="principal.memberVO" /> --%>
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<style>
.btn{
background-color: white;
} 
</style>
<script>
$(document).ready(function() {

	$("#vendorCd").on("change",function(){
		
		let vendorCd = $(this).val();
// 		console.log("vendorCd : "+vendorCd);
		
		$("#vdrOwnerNm1").empty();
		$("#vdrType1").empty();
		$("#vdrTel1").empty();
		$("#vdrAddr1").empty();
		$("#vdrAddrDet1").empty();
		$("#itemCd").empty();
		$("#itemUntprcc").val("");
		$("#orderQty").val("");
		$("#orderAmtt").val("");
		$("#orderDueYmd").val("");
		
		$.ajax({
			url:"/emp/inventory/vendorDetail",
			data:{
				"vendorCd" : vendorCd
			},
			type:"get",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(res){
				console.log("res : ", res);
				$("#vdrOwnerNm1").append("<input id='vdrOwnerNm' name='vdrOwnerNm' readonly='' class='form-control' style='background-color: white;' value="+res.vdrOwnerNm+">");
				$("#vdrType1").append("<input id='vdrType' name='vdrType' readonly='' class='form-control' style='background-color: white;' value="+res.vdrType+">");
				$("#vdrTel1").append("<input id='vdrTel' name='vdrTel' readonly='' class='form-control' style='background-color: white;' value="+res.vdrTel+">");
				$("#vdrAddr1").append("<input id='vdrAddr' name='vdrAddr' readonly='' class='form-control' style='background-color: white;' value="+res.vdrAddr+">");
				$("#vdrAddrDet1").append("<input id='vdrAddrDet' name='vdrAddrDet' readonly='' class='form-control' style='background-color: white;' value="+res.vdrAddrDet+">");
				
			},
			error: function(xhr, status, error) {
	            console.error("AJAX Error: ", error);
	            alert("요청 실패");
	        }
		});

		$.ajax({
			url:"/emp/inventory/itemDetail2",
			data:{
				"vendorCd" : vendorCd
			},
			type:"get",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(result){
				console.log("result : ", result);
				 $("#itemCd").append("<option value=''>-선택하시오-</option>");
				result.forEach(res => {
					   $("#itemCd").append("<option value="+res.itemCd+">"+res.itemNm+"</option>");
				   });
				
			},
			error: function(xhr, status, error) {
	            console.error("AJAX Error: ", error);
	            alert("요청 실패");
	        }
		});
		
		
	});
	
	
	$("#itemCd").on("change",function(){
		
		let itemCd = $(this).val();
		console.log("itemCd : "+itemCd);
		$("#itemUntprc1").empty();
		
		
		$.ajax({
			url:"/emp/inventory/itemCdDetail",
			data:{
				"itemCd" : itemCd
			},
			type:"get",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(res){
				console.log("res : ", res);
				$("#itemUntprc1").append("<input type='number' id='itemUntprc' name='itemUntprc' hidden='' class='input1' style='background-color: white; width:90%;' value="+res.itemUntprc+">");
				$("#itemUntprc1").append("<input type='text' id='itemUntprcc' name='itemUntprcc' readonly='' class='input1' style='background-color: white; width:90%;'>원");
				let formatted = Number($("#itemUntprc").val()).toLocaleString('en-US');
				console.log("formatted : "+formatted);
				$("#itemUntprcc").val(formatted);
				
			},
			error: function(xhr, status, error) {
	            console.error("AJAX Error: ", error);
	            alert("요청 실패");
	        }
		});
		
	});
	
	$("#orderQty").on("blur",function(){
		
		let orderQty = Number($(this).val());
		let itemUntprc = Number($("#itemUntprc").val());
		console.log("orderQty : "+orderQty);
		console.log("itemUntprc : "+itemUntprc);
		
		total = orderQty * itemUntprc;
		console.log("total : "+total);
		let formattedTotal = total.toLocaleString('en-US');
		$("#orderAmt").val(total);
		$("#orderAmtt").val(formattedTotal);
		
	});
	
	
	  
});
</script>
<%-- <p>${memVO}</p> --%>
<div id="container" >

<!-- 헤더 -->
<div id="tbox">
	<div id="title-box">
		<div class="title-txt">자재관리</div>
		<div class="title-txt">-</div>
		<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">발주</div>
	</div>
</div> 

<!-- 폼 박스 -->
<form id="content" action="/emp/inventory/orderInsert" method="post">
	<div class="a">
	<div class="t1"></div>
		<hr class="hr1">
		
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
				
					<div class="a1-2-td">담당자명</div>
					<div class="a1-2-td2">
					<input type="text"  id="memId" name="memId" value="${memVO.memId}" hidden="" />
					<div class="input1">${memVO.employeeVO.empNm}</div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">품목명</div>
					<div class="a1-2-td2">
					<select id=itemCd name="itemCd" class="form-control" required="required">
						
					</select>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">발주 수량</div>
					<div class="a1-2-td2">
					<input type="number" id="orderQty" name="orderQty" value="" class="input1" required="required"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">단가</div>
					<div class="a1-2-td2">
					<div id="itemUntprc1"><input type="number" class="input1" style="width: 90%" disabled="disabled" />원</div>
					
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">발주금액</div>
					<div class="a1-2-td2">
					<input type="number" id="orderAmt" name="orderAmt" hidden="" class="input1"/>
					<input type="text" id="orderAmtt" name="orderAmtt" readonly="readonly" class="input1" style="width: 90%"/>원
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">납기일자</div>
					<div class="a1-2-td2">
					<input type="date" class="input1" id="orderDueYmd" name="orderDueYmd" required='required'/>
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">거래처명</div>
					<div class="a1-2-td2">
					<select id="vendorCd" name="vendorCd" class="form-control" required='required'>
						<option value="">-선택하세요-</option>
						<c:forEach var="vendorVO" items="${vendorVOList}">
							<option value="${vendorVO.vendorCd}">${vendorVO.vdrNm}</option>
						</c:forEach>
					</select>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">대표자명</div>
					<div class="a1-2-td2">
					<div id="vdrOwnerNm1"><input type="text" disabled="disabled" class="form-control" style="background-color: white;"/></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">업종</div>
					<div class="a1-2-td2">
					<div id="vdrType1"><input type="text" disabled="disabled" class="form-control" style="background-color: white;"/></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">전화번호</div>
					<div class="a1-2-td2">
					<div id="vdrTel1"><input type="text" disabled="disabled" class="form-control" style="background-color: white;"/></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">주소</div>
					<div class="a1-2-td2">
					<div id="vdrAddr1"><input type="text" disabled="disabled" class="form-control" style="background-color: white;"/></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">상세주소</div>
					<div class="a1-2-td2">
					<div id="vdrAddrDet1"><input type="text" disabled="disabled" class="form-control" style="background-color: white;"/></div>
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
		
		<hr class="hr1">
		<div id="btn-box1" style="justify-content: flex-end; margin-right: 140px;">
			<button type="submit" class="btn btn-outline-primary btn2-1" 
						style=" width: 60px; font-size: 14px;">저장</button>
			<a href="/emp/inventory/list">
			<button type="button" id="cancel" class="btn btn-outline-secondary "
				style="font-size: 14px;">취소</button>
			</a>
		</div>
		
	</div>
	<!-- 사원 저장 취소 -->
	<sec:csrfInput />
</form>
</div> <!-- container -->

