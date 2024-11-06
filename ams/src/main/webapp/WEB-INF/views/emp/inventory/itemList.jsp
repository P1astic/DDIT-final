<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/emp/list.css">
<!-- <link rel="stylesheet" href="/resources/css/approv/myPaymentList.css"> -->
<sec:authorize access="isAuthenticated()">
	<%-- 		<sec:authentication property="principal.memberVO" /> --%>
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script type="text/javascript">
// 텏스트 안박히는거 다시 확인
function clickEvent(itemCd){
	
	$.ajax({
		url:"/emp/inventory/itemDetail",
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
			console.log(res.itemNm);
			$("#itemCd").val(res.itemCd);
			$("#itemNm").val(res.itemNm);
			$("#itemNmSp2").text(res.itemNm);
			$("#itemStndrd").val(res.itemStndrd);
			$("#itemStndrdSp2").text(res.itemStndrd);
			$("#itemUntprc").val(res.itemUntprc);
			$("#itemUntprcSp2").text(res.itemUntprc);
			$("#vdrNm").text(res.vendorVO.vdrNm);
			$("#vdrType").text(res.vendorVO.vdrType);
			$("#vdrOwnerNm").text(res.vendorVO.vdrOwnerNm);
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
		
		$("#itemUntprcSp2").hide(); 
		$("#itemUntprc").removeAttr("hidden"); 
		$("#deleteBtn").hide();
		
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
	            
	            $("#itemUntprcSp2").show();
	    		$("#itemUntprc").attr("hidden","hidden");
	            $("#updateBtn").show();
	    		$("#close").show();
	    		$("#checkBtn").hide();
	    		$("#noBtn").hide();
	    		$("#itemUntprcSp2").text($("#itemUntprc").val());
	    		
// 	            $("#myModal").hide();
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX Error: ", error);
	            alert("수정 실패.. ㅜ.ㅜ");
	        }
	    });
	});
	
	
	
	
$("#insertBtn").on("click",function(){
		
		$("#myModal1").show();
		
	});
	
	$("#insertBtnMd2").on("click",function(){
		
		
	
		
		var data ={
				"itemNm" : $("#itemNm1").val(),
				"itemStndrd" : $("#itemStndrd1").val(),
				"itemUntprc" : $("#itemUntprc1").val(),
				"itemSCd" : $("#itemSCd").val(),
				"vendorCd" : $("#vendorCd").val()
		};
// 		alert(data);
		$.ajax({
			url : "/emp/inventory/itemInsert",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(res){
				location.href ="/emp/inventory/itemList";
				alert("등록완료");
			},
			error : function(res, xhr, status, error) {
	            console.error("AJAX Error: ", error);
	            alert("빈 칸을 채워주세요.");
	        }
				
			
		});
		
	});
	
	$("#closeMd2").on("click",function(){
		
		$("#myModal1").hide();
	});
	
	$("#reset").on("click",function(){
		   window.location.href = "/emp/inventory/itemList";
	});
	
    //부서선택 select box 요소 -> 변화가 있을 때 콜백함수를 실행
    $("#itemS").on("change",function(){
      
       let itemS = $(this).val();
       console.log("itemS : ", itemS);
      
       //searchForm : <form id="searchForm" class....>
       //action이 없음. method가 없음.
       //action은 자동으로 본인 /emp/list
       //method는 자동으로 get
      
       //emp/list?getDepts=C1&gubun=all&keyword=
//        $("#searchForm").submit();
    });
   
	// 소분류 나누기
    $("#itemM").on("change",function(){
       let itemM = $(this).val();
       console.log("itemM : "+itemM);
       
       $("#itemS").empty();
       
       $.ajax({
    	   
    	   url : "/emp/inventory/itemSdetail",
		   data : {itemMCd : itemM},
		   type : "get",
		   dataType : "json",
		   beforeSend : function(xhr){
		    	xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		   },
		   success : function(result){
			   console.log("result : ",result);
			   result.forEach(res => {
				   
				   $("#itemS").append("<option value="+res.itemSCd+">"+res.itemSNm+"</option>");
			   });
		   },
		   error : function(xhr, status, error) {
	            console.error("AJAX Error: ", error);
	            alert("응답 실패!!");
	       }
       });
    });
	
    $("#noBtn").on("click",function(){
		$("#itemUntprcSp2").show();
		$("#itemUntprc").attr("hidden","hidden");
		
		
		$("#deleteBtn").show();
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
	
	$("#deleteBtn").on("click",function(){
		
		let itemCd = $("#itemCd").val();
		
		let data = {
			"itemCd" : itemCd	
		};
		
		console.log("itemCd : "+itemCd);
		$.ajax({
	        url: "/emp/inventory/itemDelete",  
// 	        contentType: "application/json;charset=utf-8", 
	        data: {
	        	"itemCd" : itemCd
	        	},  
	        type: "post",
	        dataType: "json",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        success: function(res) {
	        	console.log("res : "+res)
	            alert("삭제 완료");
	            location.href = "/emp/inventory/itemList";
	            $("#myModal").hide();
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX Error: ", error);
	            alert("수정 실패.. ㅜ.ㅜ");
	        }
	    });
		
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
    transform: translate(-31%, -47%); /* 중앙 정렬 */
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
/*     padding: 0 60px; */
    align-items: center;
    justify-content: center;
}
.a1-2-tbody{
	width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 12px;
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
<div id="container">
   <div id="title-box" style="display: flex; flex-direction: row; gap: 8px; margin: 10px; justify-content: space-between; align-items: center;">
   	  <div style="display: flex;">
      <div class="title-txt">자재관리</div>
      <div class="title-txt">-</div>
      <div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">품목현황</div>
      </div>
      <div>
      <button type="button" id="insertBtn" class="btn btn-default" style="border: 1px solid #3498db; margin-right: auto; width: 95px; color : #3498db; background-color: white;">물품등록</button>
      </div>
   </div>
   
   <div class="a"></div>
   
   
   <div class="card">
   <div class="card-header" style="background-color: white;">
      <div class="card-tools">
      <div class="btn-regist-Delete-box" style="padding : 10px;">
      </div>
      <!-- 검색어 검색 -->
   <form id="searchForm" class="d-flex align-items-center"   style="margin-bottom: 0;">
      <div class="input-group input-group-sm" style="margin-right: 10px;">

         <!-- 
         param : getDepts=C2&gubun=all&keyword=
          -->
          
		<div class="sel-option-box" style="margin-left: 412px; width: 550px; padding-right: 0px;">
	      <label for="itemM" style="width: 50px; margin-top: 7px;">중분류</label>
	      <select id="itemM" name="itemM" class="form-control" style="width: 175px;">
	         <option value="" <c:if test="${empty param.itemM}">selected</c:if>>전체</option>
	         <c:forEach var="itemMidVO" items="${itemMidVOList}">
	            <option value="${itemMidVO.itemMCd}" <c:if test="${param.itemM == itemMidVO.itemMCd}">selected</c:if>>${itemMidVO.itemMNm}</option>
	         </c:forEach>
	      </select>
	
	      <label for="itemS" style="width: 50px; margin-left: 10px; margin-top: 7px;">소분류</label>
	      <select id="itemS" name="itemS" class="form-control" style="width: 175px;">
	         <option id="dd" value=""<c:if test="${empty param.itemS}">selected</c:if>>전체</option>
	         <c:forEach var="itemSamllVO" items="${itemSmallVOList}">
	         <option value="${itemSamllVO.itemSCd}" <c:if test="${param.itemS == itemSamllVO.itemSCd}">selected</c:if>>${itemSamllVO.itemSNm}</option>
	         </c:forEach>
	      </select>
	     </div>
      <!--sel-option-box  -->
      
      <!-- gubun-search-box -->
      <div class="gubun-search-box" style="height: 70px; width: 100%;">
      	 
      	 <div style="padding: 176px;"></div>
         <label for="selGubun" id="" style="width: 40px; text-align: center; margin-top: 7px;">분류</label>
         <select id="selGubun" name="gubun" class="form-control" style="width: 100px;">
            <option value="all" selected>전체</option>
            <option value="itemNm" <c:if test="${param.gubun=='itemNm'}">selected</c:if>>품목명</option>
            <option value="vdrNm" <c:if test="${param.gubun=='vdrNm'}">selected</c:if>>거래처</option>
         </select>
      	 <div class="input-group input-group-sm" style="margin-right: 10px; width: 210px;">
         <input type="text" id="keyword" name="keyword"
            placeholder="검색어 입력" value="${param.keyword}"
            class="form-control" style="width: 1px; height: 37px; font-size: 15px;"/>
      	 <button type="submit" id="searchBtn" class="btn btn-default" 
      	 	style="width: 41px; font-size: 12px; border: 0.8px solid #e4e4e4; color : #e4e4e4;">
      	 	<img src="/resources/images/icon/searchBtn.png" style="height: 20px; width: 20px; line-height:1.5; margin-bottom:3px;">
      	 </button>
      	 
      	 </div>
          	
      </div>
         <!-- gubun-search-box 끝-->
         
      </div>
   </form>
      </div>
   </div>
 
   <div class="card-body table-responsive p-0">
      <table class="table table-hover text-nowrap">
         <thead>
            <tr>
               <th>No</th>
               <th>품목 코드</th>
               <th>품목 명</th>
               <th>품목 규격</th>
               <th>품목 단가</th>
               <th>소분류 명</th>
               <th>거래처 명</th>
<!--                <th>입사일자</th> -->
            </tr>
         </thead>
         <tbody>
          <!-- 
          articlePage.content : List<EmployeeVO>
           -->
          <c:forEach var="itemVO" items="${articlePage.content}" varStatus="stat">
            <tr onclick="clickEvent('${itemVO.itemCd}')">
               <td>${itemVO.rnum}</td>
               <td>${itemVO.itemCd}</td>
               <td>${itemVO.itemNm}</td>
               <td>${itemVO.itemStndrd}</td>
               <td><fmt:formatNumber pattern="#,###">${itemVO.itemUntprc}</fmt:formatNumber><span>원</span></td>
               <td>${itemVO.itemSmallVO.itemSNm}</td>
               <td>${itemVO.vendorVO.vdrNm}</td>
               
            </tr>
           </c:forEach>
         </tbody>
      </table>
        <div class="card-footer clearfix" style="background-color: white;">
                    ${articlePage.pagingArea}
         </div>
   </div>
</div><!-- card 끝 -->
<div id="myModal1" class="modal">
		<div class="modal-content">
			<div>
				<h1>물품 등록</h1>
				<hr>
			</div>
			
			<div class="a1-2">
			<div class="a1-2-tbody" >
				<div class="a1-2-tr">
					<input type="text" id="itemCd" name="itemCd" hidden="">
					<div class="a1-2-td">품목 명</div>
					<div class="a1-2-td2">
					<div id="itemNmSp"><input class="input1" type="text" id="itemNm1" name="itemNm" /></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">규격</div>
					<div class="a1-2-td2">
					<div id="itemStndrdSp"><input class="input1" type="text" id="itemStndrd1" name="itemStndrd" /></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">단가</div>
					<div class="a1-2-td2">
					<div id=""><span id="itemUntprcSp"></span><input class="input1" type="number" id="itemUntprc1" name="itemUntprc"  style="width: 100px;"/><span>원</span></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td2">
					<select id="itemSCd" name="itemSCd" class="input1" >
					<option value="">-상품분류-</option>
					<c:forEach var="itemSmallVO" items="${itemSmallVOList}">
						<option value="${itemSmallVO.itemSCd}">${itemSmallVO.itemSNm}</option>
					</c:forEach>
					</select>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td2">
					<select id="vendorCd" name="vendorCd" class="input1" >
					<option value="">-거래처 선택-</option>
					<c:forEach var="vendorVO" items="${vendorVOList}">
						<option value="${vendorVO.vendorCd}">${vendorVO.vdrNm}</option>
					</c:forEach>
				</select>
					</div>
				</div>
			</div>
		</div>
			
			<div style="margin-top: 30px; display: flex; justify-content: center;">
				<button type="button" id="insertBtnMd2"
				 	style="color: #3498db; border: 1px solid #3498db; background-color: white; border-radius: 5px; font-size: 19px;
    				padding: 5px 10px;">등록</button>&nbsp;&nbsp;&nbsp;
				<button type="button" id="closeMd2" 
					style="color: #676a6d; border: 1px solid #676a6d; background-color: white; border-radius: 5px; font-size: 19px;
    				padding: 5px 10px;">취소</button>
			</div>
		</div>
	</div>
</div>
<div id="myModal" class="modal">
		<div class="modal-content" style="width: 600px;">
			<div style="display: flex; border-bottom: 1px solid gray; align-items: center; justify-content: space-between; padding-bottom: 10px;">
				<div style="font-size: 32px; font-weight: 700; ">품목 상세</div>
					<svg id="close" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#5f6368"><path d="m336-280 144-144 144 144 56-56-144-144 144-144-56-56-144 144-144-144-56 56 144 144-144 144 56 56ZM480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q134 0 227-93t93-227q0-134-93-227t-227-93q-134 0-227 93t-93 227q0 134 93 227t227 93Zm0-320Z"/></svg>
			</div>
			<div class="a1-2">
			<div class="a1-2-tbody" >
				<div class="a1-2-tr">
					<input type="text" id="itemCd" name="itemCd" hidden="">
					<div class="a1-2-td">품목 명</div>
					<div class="a1-2-td2">
					<div id="itemNmSp2"><input type="text" id="itemNm" name="itemNm" hidden=""/></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">규격</div>
					<div class="a1-2-td2">
					<div id="itemStndrdSp2"><input type="text" id="itemStndrd" name="itemStndrd" hidden=""/></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">단가</div>
					<div class="a1-2-td2">
					<div id=""><span id="itemUntprcSp2"></span><input type="text" id="itemUntprc" name="itemUntprc" hidden="" style="width: 100px;"/><span>원</span></div>
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">거래처 명</div>
					<div class="a1-2-td2">
					<div id="vdrNm"></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">업태</div>
					<div class="a1-2-td2">
					<div id="vdrType"></div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">대표자 명</div>
					<div class="a1-2-td2">
					<div id="vdrOwnerNm"></div>
					</div>
				</div>
			</div>
		</div>
			<div style="gap: 15px; display: flex; justify-content: flex-end; margin-top: 10px;">
				<button type="button" id="checkBtn" style="width: 80px; display: none; border: 1px solid #3498db; background-color: white; color: #007bff; border-radius: 5px;">확인</button>
				<button type="button" id="noBtn" style="width: 80px; display: none; border: 1px solid #585b5d; background-color: white; color: #585b5d; border-radius: 5px;">취소</button>
				
				<button type="button" id="deleteBtn" style="width: 80px; border: 1px solid #3498db; background-color: white; color: #007bff; border-radius: 5px;">품목삭제</button>
				<button type="button" id="updateBtn" style="width: 80px; border: 1px solid #3498db; background-color: white; color: #007bff; border-radius: 5px;">단가수정</button>
			</div>
		</div>
	</div>