<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css" href="/resources/css/bpPass/requestManage.css">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>


<div class="row">
	<div class="col-12">
		<div class="container">
			<div class="titleHeader">
				<h4>
					<span style="color:#A4A4A4; font-size:20px; font-weight: 600; word-wrap: break-word;">출입증관리  - </span>
					<span style="font-size:20px; font-weight: 600; word-wrap: break-word;">출입증신청관리</span>
				</h4>
			</div>
			<div class="card-body table-responsive p-0">
				<div class="searchHeader">
					<div class="ml-auto d-flex align-items-center" style="border-bottom:none;">
						<form class="d-flex align-items-center" style="margin-bottom:0;">
							<div class="ml-auto d-flex flex-column">
								<div class="d-flex flex-row align-items-centerm mt2">
									<select id="searchFilter" name="searchFilter" class="form-control">
										<option value="ALL" selected>전체</option>
										<option value="PASS_REGIST_TITLE" <c:if test="${param.searchFilter=='PASS_REGIST_TITLE'}">selected</c:if>>신청제목</option>
										<option value="PASS_REGIST_YMD" <c:if test="${param.searchFilter=='PASS_REGIST_YMD'}">selected</c:if>>신청일</option>
										<option value="PASS_REGIST_YN" <c:if test="${param.searchFilter=='PASS_REGIST_YN'}">selected</c:if>>승인여부</option>
									</select>
							        <input type="text" name="tableSearch" class="form-control mr-2" placeholder="검색어 입력" value="${param.table_search}" style="width: 200px;">
							        <div class="input-group-append">
										<button type="submit" style="background:none; height:37px; border:1px solid #ced4da; border-radius: 0 .2rem .2rem 0;">
											<img src="/resources/images/icon/searchBtn.png" style="height: 25px; width: 25px; line-height:1.5; margin-bottom:3px;">
										</button>
							        </div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="tableDiv">
					<table style="width:100%; border:0.5px solid #e4e4e4; border-top:none; border-left:none; border-right:none;">
						<thead style="background:#e4e4e463; height:35px;">
							<tr style="text-align:center;">
								<th style="width:5%;">번호</th>
								<th style="width:50%;">신청제목</th> 
								<th style="width:15%;">신청자명</th>
								<th style="width:15%;">신청일</th>
								<th style="width:10%">승인여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="passRegistVO" items="${passRegistVOList}" >
								<tr class="boardTR _passRegistDetail" id="${passRegistVO.fileGroupNo}" data-no="${passRegistVO.passAppNo}" data-yn="${passRegistVO.passRegistYn}">
									<td style="width:5%; text-align:center;">${passRegistVO.rnum}</td>
									<td style="width:50%; text-align:left; padding-left:30px;">${passRegistVO.passRegistTitle}</td>
									<td style="width:15%; text-align:center;">${passRegistVO.bpNm}(${passRegistVO.bpRprsvNm})</td>
									<td style="width:15%; text-align:center;">${passRegistVO.passRegistAplyYmd}</td>
									<td style="width:10%; text-align:center;">
										<c:if test="${passRegistVO.passRegistYn =='P' }">
											처리중
										</c:if>
										<c:if test="${passRegistVO.passRegistYn =='N' }">
											반려
										</c:if>
										<c:if test="${passRegistVO.passRegistYn =='Y' }">
											승인
										</c:if>									
									</td>
								</tr>
							</c:forEach>						
						</tbody>
					</table>
					<div>
						${pagination.pagingArea}
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="detailPassRequestModal" tabindex="-1" role="dialog" aria-labelledby="detailPassRequestModalLabel" aria-hidden="true" style="font-family:Pretendard;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    	<div class="d-flex flex-row ml-auto">
	    	<div class="d-flex flex-column align-items-center ml-auto">
	    		<i data-dismiss="modal" class="bi bi-x" style="font-size:35px; -webkit-text-stroke: 2px; float:right;"></i>
	    		<img class="_download" alt="" src="/resources/images/icon/download.png" style="width:35px; height:35px; float:right;">
	    	</div>
    	</div>
    	<div class="modal-body">
    		<img id="pdfBox" src="" alt="PDF IMAGE" style="max-width: 100%; height: auto;">
    	</div>
    	<div class="d-flex flex-row ml-auto">
    		<button type="button" class="btn btn-primary _accept" style="display:none;">승인</button>
    		<button type="button" class="btn btn-primary _decline" style="display:none;">반려</button>
    	</div>
    </div>
  </div>
</div>
<div class="modal fade" id="requestAcceptModal" tabindex="-1" role="dialog" aria-labelledby="requestAcceptModalLabel" aria-hidden="true" style="font-family:Pretendard;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>신청이 승인되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="requestDeclineModal" tabindex="-1" role="dialog" aria-labelledby="requestDeclineModalLabel" aria-hidden="true" style="font-family:Pretendard;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>신청이 반려되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<script>
$(function(){
	let selectedPassAppNo;
	let fileGroupNo;
	let passRegistYn;
	$("tr._passRegistDetail").on("click", function(){
		console.log($(this).attr("id"));
		fileGroupNo = $(this).attr("id");
		selectedPassAppNo = $(this).data("no");
		passRegistYn = $(this).data("yn");
		var passRegistVO = {
				fileGroupNo : fileGroupNo
		};
		
		$.ajax({
			url:"/bp/bpPass/passRequestImage",
			contentType:"application/json; charset=utf-8",
			data: JSON.stringify(passRegistVO),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				console.log(response);
				var imageSrc = "data:image/png;base64," + response.image;
				
				$("#pdfBox").attr("src", imageSrc);
				$("#detailPassRequestModal ._download").data("file-path", response.filePath);
				$("#detailPassRequestModal ._download").data("file-original-name", response.fileOriginalName);
				if(passRegistYn == 'P'){
					$("#detailPassRequestModal ._accept").show();
					$("#detailPassRequestModal ._decline").show();
				}
				$("#detailPassRequestModal").modal('show');
			},
			error:function(xhr, status, error){
				console.log(error);
			}
		})
	})
	
    $(".modal").on("click", "._download", function() {
        let filePath = $(this).data("file-path");
        let fileOrgnlFileNm = $(this).data("file-original-name");

        if (filePath) {
          window.location.href = "/bp/bpPass/download?filePath=" + encodeURIComponent(filePath) + "&fileOrgnlFileNm=" + encodeURIComponent(fileOrgnlFileNm);
        } else {
          alert("파일 경로를 찾을 수 없습니다.");
        }
      });
	
	$(".modal").on("click", "._accept", function(){
	    if (selectedPassAppNo) {
	    	
	    	var passRegistVO = {
	    		passAppNo : selectedPassAppNo
	    	}
	    	
	    	$.ajax({
				url:"/emp/bpPass/requestAccept",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify(passRegistVO),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
					$("#detailPassRequestModal").modal('hide');
					$("#requestAcceptModal").modal('show');
					setTimeout(() => window.location.href="/emp/bpPass/requestManage", 1000);
				},
				error:function(xhr, status, error){
					console.log(error);
				}
	    	})
	    }
	})
	
	$(".modal").on("click", "._decline", function(){
	    if (selectedPassAppNo) {
	    	
	    	var passRegistVO = {
	    		passAppNo : selectedPassAppNo
	    	};
	    	
	    	$.ajax({
				url:"/emp/bpPass/requestDecline",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify(passRegistVO),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
					$("#detailPassRequestModal").modal('hide');
					$("#requestDeclineModal").modal('show');
					setTimeout(() => window.location.href="/emp/bpPass/requestManage", 1000);
				},
				error:function(xhr, status, error){
					console.log(error);
				}
	    	});
	    }
	})
})

</script>