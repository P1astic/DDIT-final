<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <link rel="stylesheet" href="/resources/css/inventory/list.css"> -->
<link rel="stylesheet" href="/resources/css/emp/list.css">
<sec:authorize access="isAuthenticated()">
	<%-- 		<sec:authentication property="principal.memberVO" /> --%>
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<script>
function clickEvent(itemCd){
	
	$("#papTr").empty();
	
	$.ajax({
		url:"/emp/inventory/papDetail",
		data:{
			"itemCd" : itemCd
		},
		type:"get",
		dataType:"json",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success:function(result){
			console.log("result : ", result);
			if(result==null || result==""){
				$("#papTr").append("<td></td>");
				$("#papTr").append("<td>수불 기록이 없습니다.<td>");
				$("#papTr").append("<td></td>");
			}
			result.forEach(res => {
					
				let papStatText = res.papStat === "IN" ? "입고" :
				 				  res.papStat === "OUT" ? "출고" : res.papStat;
				
				$("#papTr").append("<tr>");
				$("#papTr").append("<td>"+res.papQty+"EA</td>");
				$("#papTr").append("<td>"+papStatText+"</td>");
				$("#papTr").append("<td>"+res.papSpmtYmd+"</td>");
				$("#papTr").append("</tr>");
					   
			});
			
			$("#myModal").show(); 
		},
		error: function(xhr, status, error) {
            console.error("AJAX Error: ", error);
            alert("오류 발생 비상!!!");
        }
	});
	

	
};


$(document).ready(function(){
	
	
	
	
	$("#updateBtn").on("click", function(){
		
		$("#itemUntprcSp").hide(); 
		$("#itemUntprc").removeAttr("hidden"); 
		
		$("#close").hide();
		$("#noBtn").show();
		$("#checkBtn").show();
		$("#updateBtn").hide();
	});
	
	
	
	$("#checkBtn").on("click", function() {
		
	    var data = {
	        "itemCd": $("#itemCd").val(),
	        "itemUntprc": $("#itemUntprc").val()
	    };

	    $.ajax({
	        url: "/emp/inventory/itemUpdate",  
	        contentType: "application/json;charset=utf-8", 
	        data: JSON.stringify(data),  
	        type: "post",
	        dataType: "json",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        success: function(res) {
	            alert("수정 완료");
	            
	            $("#itemUntprcSp").show();
	    		$("#itemUntprc").attr("hidden","hidden");
	            $("#updateBtn").show();
	    		$("#close").show();
	    		$("#checkBtn").hide();
	    		$("#noBtn").hide();
	    		$("#itemUntprcSp").text($("#itemUntprc").val());
	    		
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX Error: ", error);
	            alert("수정 실패.. ㅜ.ㅜ");
	        }
	    });
	});
	
	
	
	$("#noBtn").on("click",function(){
		$("#itemUntprcSp").show();
		$("#itemUntprc").attr("hidden","hidden");
		
		
		
		$("#updateBtn").show();
		$("#close").show();
		$("#checkBtn").hide();
		$("#noBtn").hide();
		});
	$("#close").on("click",function(){
		$("#itemUntprcSp").show();
		$("#itemUntprc").attr("hidden","hidden");

		$("#close").show();
		$("#checkBtn").hide();
		$("#updateBtn").show();
		$("#myModal").hide();
	});
	
	
});

</script>

<style>
  /* 모달의 전체 화면을 덮는 스타일 */
  .modal {
    display: none; /* 기본적으로 모달은 숨겨진 상태 */
    position: fixed; /* 스크롤해도 고정된 위치에 모달이 표시됨 */
    /*z-index: 1;  다른 요소들보다 위에 표시 */
    left: 0;
    top: 0;
    width: 100%; /* 전체 너비 */
    height: 100%; /* 전체 높이 */
    background-color: rgba(0, 0, 0, 0.5); /* 배경 반투명 효과 */
  }

  /* 모달 컨텐츠를 화면 중앙에 위치시키는 스타일 */
  .modal-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-32%, -83%); /* 중앙 정렬 */
    background-color: white;
    padding: 20px;
    border: 1px solid #888;
    width: 400px; /* 모달 창의 너비 설정 (필요에 따라 조정 가능) */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
  }

  /* 버튼 스타일 등 추가적인 스타일 필요 시 여기에 추가 */
  
.a1-2{
	display: flex;
/*     flex-direction: row; */
    width: 100%;
/*     gap: 70px; */
    padding: 0 60px;
    align-items: center;
    justify-content: center;
}
.a1-2-tbody{
	width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 25px;
}
.a1-2-tr{
	display: flex;
    width: 100%;
	padding: 4px 14px;
    flex-direction: row;
    height: 35px;
    align-items: center;
}
.a1-2-td{
	color: #1890FF;
	font-size: 16px;
	font-family: Pretendard;
	font-weight: 400; 
	flex: 4;
	width: 160px;
}
.a1-2-td2{
	flex: 6;
	font-size: 16px;
	font-family: Pretendard;
	font-weight: 400; 
	width: 100px;
	
}
</style>

<div id="container">
<div id="title-box">
   <div style="display: flex;">
   <div class="title-txt">자재관리</div>
   <div class="title-txt">-</div>
   <div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">재고 현황</div>
   </div>
   <div><a href="/emp/inventory/itemOrder"><button class="btn btn-outline-secondary" style="border: 1px solid #3498db; color: #3498db;">발주등록</button></a></div>
</div>
<div class="card">
	<div class="card-header" style="background-color: white">
            <form id="searchForm" style="margin-left: auto; flex-direction: row; justify-content: flex-end;">
                <div class="input-group input-group-sm" style="margin-right: 10px; width: 150px;">
                    <select id="selGubun" name="gubun" class="form-control" style="height: 37px">
                        <option value="all" selected>전체</option>
                        <option value="title" <c:if test="${param.gubun=='title'}">selected</c:if>>품목명</option>
                    </select>
                </div>
                <div  style="display: flex; width: 250px;">
                    <input type="text" id="keyword" name="keyword" placeholder="검색어 입력" value="${param.keyword}" class="form-control" style="height: 37px;"/>
	                <button type="submit" class="btn btn-default" style="width: 41px; font-size: 12px; border: 0.8px solid #e4e4e4; color : #e4e4e4;">
	                <img src="/resources/images/icon/searchBtn.png" style="height: 20px; width: 20px; line-height:1.5; margin-bottom:3px;">
	                </button>
                </div>
            </form>
<div style="flex: 8;"></div>
<!-- 	<button type="button" id="insertBtn" >자재등록</button> -->
	</div>

	<div class="card-body table-responsive p-0">
		<table class="table table-hover text-nowrap">
			<thead>
				<tr>
					<th>NO</th>
					<th>품목명</th>
					<th>현재고</th>
					<th>안전재고</th>
					<th>발주계획수량</th>
					
				</tr>
			</thead>
			<tbody>
			 <c:forEach var="itemVO" items="${itemVOList}" varStatus="stat">
				<tr onclick="clickEvent('${itemVO.itemCd}')">
					<td>${stat.index+1}</td>
					<td>${itemVO.itemNm}</td>
					<td>${itemVO.inventoryVO.invenCurrent}EA</td>
					<td>${itemVO.inventoryVO.invenSfinvc}EA</td>
					<td>
						<c:choose>
							<c:when test="${itemVO.inventoryVO.invenCurrent < itemVO.inventoryVO.invenSfinvc}"><span style="color:red;">${itemVO.inventoryVO.invenSfinvc - itemVO.inventoryVO.invenCurrent}</span>EA</c:when>
							<c:when test="${itemVO.inventoryVO.invenCurrent >= itemVO.inventoryVO.invenSfinvc}">${itemVO.inventoryVO.invenPlanQty}EA</c:when>
						</c:choose>
					</td>
				</tr>
  			</c:forEach>
			</tbody>
		</table>
		<div class="card-footer clearfix" style="background-color: white">
       		${articlePage.pagingArea}
        </div>
	</div>
</div>
</div>
<div id="myModal" class="modal">
	<div class="modal-content" style="width: 550px;">
	<div style="border: 1px solid #cdc5c5; border-radius: 5px; display: flex; flex-direction: column; padding: 5px; padding-left: 22px;">
		<div style="display: flex; align-items: center; justify-content: space-evenly; padding: 5px;">
			<h1>재고수불현황</h1>
			<svg id="close" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#5f6368"><path d="m336-280 144-144 144 144 56-56-144-144 144-144-56-56-144 144-144-144-56 56 144 144-144 144 56 56ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/></svg>
			<hr>
		</div>
		<div class="a1-2">
			<div class="a1-2-tbody" >
				<table class="table table-hover text-nowrap">
			<thead>
				<tr>
					<th>수량</th>
					<th>수불상태</th>
					<th>수불일자</th>
					
				</tr>
			</thead>
			<tbody id="papTr">
<%-- 			 <c:forEach var="itemVO" items="${itemVOList}" varStatus="stat"> --%>
<!-- 				<tr > -->
<%-- 					<td>${itemVO.itemNm}</td> --%>
<%-- 					<td>${itemVO.inventoryVO.invenCurrent}EA</td> --%>
<%-- 					<td>${itemVO.inventoryVO.invenSfinvc}EA</td> --%>
<%-- 					<td>${itemVO.inventoryVO.invenPlanQty}EA</td> --%>
<!-- 				</tr> -->
<%--   			</c:forEach> --%>
			</tbody>
		</table>
			</div>
			<div style="display: flex; justify-content: space-between; margin-top: 10px;">
				<button type="button" id="checkBtn" style="display: none; border: 1px solid #3498db; background-color: white; color: #007bff; border-radius: 5px;">확인</button>
				<button type="button" id="noBtn" style="display: none; border: 1px solid #585b5d; background-color: white; color: #585b5d; border-radius: 5px;">취소</button>
				
				
			</div>
		</div>
	</div>
	</div>
</div>
	