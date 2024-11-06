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
let orderStatus = "${itemOrderVO.orderStatus}";
$(document).ready(function() {
	
	
	if(orderStatus === 'Y'){
		$("#submitBtn").hide();
// 		$("#title").text("입고완료");
		
	}
	  
});
</script>
<%-- <p>${memVO}</p> --%>
<div id="container" >

<!-- 헤더 -->
<div id="tbox">
	<div id="title-box">
		<div class="title-txt">자재관리</div>
		<div class="title-txt">-</div>
		<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">발주상세</div>
	</div>
</div> 

<!-- 폼 박스 -->
<%-- <p>${itemOrderVO}<p> --%>
<form id="content" action="/emp/inventory/itemOderUpdate" method="post">
	<div class="a">
	<div class="t1" id="title"></div>
		<hr class="hr1">
		
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					
					<input type="text" name="orderStatus" value="${itemOrderVO.orderStatus}" hidden=""/>
					<input type="text" name="itemCd" value="${itemOrderVO.itemCd}" hidden=""/>
					<input type="number" name="orderNo" value="${itemOrderVO.orderNo}" hidden=""/>
					<div class="a1-2-td">담당자명</div>
					<div class="a1-2-td2">
					<input type="text"  id="empNm" name="empNm" value="${itemOrderVO.employeeVO.empNm}" readonly="readonly" class="input1"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">품목명</div>
					<div class="a1-2-td2">
					<input type="text"  id="itemNm" name="itemNm" value="${itemOrderVO.itemVO.itemNm}" readonly="readonly" class="input1"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">발주 수량</div>
					<div class="a1-2-td2">
					<input type="number" id="orderQty" name="orderQty" value="${itemOrderVO.orderQty}" class="input1" readonly="readonly"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">단가</div>
					<div class="a1-2-td2">
					<input type="number" id="itemUntprc" name="itemUntprc" value="${itemOrderVO.itemVO.itemUntprc}" class="input1" style="width: 90%" hidden=""/><div class="input1" style="border: 1px solid #D9D9D9;"><fmt:formatNumber value="${itemOrderVO.itemVO.itemUntprc}" pattern="#,###"></fmt:formatNumber><span>&nbsp;원</span></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">발주금액</div>
					<div class="a1-2-td2">
					<input type="number" id="orderAmt" name="orderAmt" value="${itemOrderVO.orderAmt}" hidden="" class="input1"/><div class="input1" style="border: 1px solid #D9D9D9;"><fmt:formatNumber value="${itemOrderVO.orderAmt}" pattern="#,###"></fmt:formatNumber><span>&nbsp;원</span></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">납기일자</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="orderDueYmd" name="orderDueYmd" value="${itemOrderVO.orderDueYmd}" readonly="readonly"/>
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">거래처명</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="vdrNm" name="vdrNm" value="${itemOrderVO.vendorVO.vdrNm}" readonly="readonly"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">대표자명</div>
					<div class="a1-2-td2">
					<input type="text" id="vdrOwnerNm" name="vdrOwnerNm" value="${itemOrderVO.vendorVO.vdrOwnerNm}" readonly="readonly" class="form-control" style="background-color: white;"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">업종</div>
					<div class="a1-2-td2">
					<input type="text" id="vdrType" name="vdrType" value="${itemOrderVO.vendorVO.vdrType}" readonly="readonly" class="form-control" style="background-color: white;"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">전화번호</div>
					<div class="a1-2-td2">
					<input type="text" id="vdrTel" name="vdrTel" value="${itemOrderVO.vendorVO.vdrTel}" readonly="readonly" class="form-control" style="background-color: white;"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">주소</div>
					<div class="a1-2-td2">
					<input type="text" id="vdrAddr" name="vdrAddr" value="${itemOrderVO.vendorVO.vdrAddr}" readonly="readonly" class="form-control" style="background-color: white;"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">상세주소</div>
					<div class="a1-2-td2">
					<input type="text" id="vdrAddrDet" name="vdrAddrDet" value="${itemOrderVO.vendorVO.vdrAddrDet}" readonly="readonly" class="form-control" style="background-color: white;"/>
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
		
		<hr class="hr1">
		<div id="btn-box1" style="justify-content: flex-end; margin-right: 140px;">
			<button type="submit" id="submitBtn" class="btn btn-outline-primary btn2-1" 
						style=" width: 60px; font-size: 14px;">입고확인</button>
			<a href="/emp/inventory/totalOrderList">
			<button type="button" id="cancel" class="btn btn-outline-secondary "
				style="font-size: 14px;">목록</button>
			</a>
		</div>
		
	</div>
	<!-- 사원 저장 취소 -->
	<sec:csrfInput />
</form>
</div> <!-- container -->

