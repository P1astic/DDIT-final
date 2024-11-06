<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css" href="/resources/css/salary/paystubList.css">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<div class="row" style="font-family:Pretendard;">
	<div class="col-12">
		<div class="container">
			<div class="titleHeader d-flex align-items-center">
				<div>
					<span style="color:#A4A4A4; font-size:20px; font-weight: 600; word-wrap: break-word;">인사  - 급여 - </span>
					<span style="font-size:20px; font-weight: 600; word-wrap: break-word;">급여명세서 목록</span>
				</div>
				<div class="d-flex ml-auto align-items-center">
					<input type="button" id="registPayStub" name="registPayStub" onclick="location.href='paystubRegist'" value="급여명세서생성" class="btn btn-primary mr-2">
					<input type="button" id="payCalc" name="payCalc" value="예상퇴직금계산" class="btn btn-secondary" onclick="location.href='/emp/salary/calcRetirement'">
				</div>
			</div>
			<div class='card-body table-responsive p-0'>
				<div class="searchHeader">
					<div class="ml-auto d-flex align-items-center" style="border-bottom:none;">
						<form class="d-flex align-items-center" style="margin-bottom:0;">
							<div class="ml-auto d-flex flex-column">
								<div class="d-flex flex-row align-items-center">
							        <select id="searchFilter" name="searchFilter" class="_input">
							            <option value="ALL" selected>전체</option>
							            <option value="EMP_NM" <c:if test="${param.searchFilter=='EMP_NM'}">selected</c:if>>사원명</option>
							            <option value="DEPT_NM" <c:if test="${param.searchFilter=='DEPT_NM'}">selected</c:if>>부서</option>
							            <option value="JBGD_NM" <c:if test="${param.searchFilter=='JBGD_NM'}">selected</c:if>>직급</option>
							            <option value="SALARY_DATE" <c:if test="${param.searchFilter=='SALARY_DATE'}">selected</c:if>>급여지급일</option>
							        </select>
							        <input type="text" name="table_search" class="form-control" placeholder="검색어 입력" value="${param.table_search}" style="width: 200px;">
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
								<th>사원명</th>
								<th>부서</th>
								<th>직급</th>
								<th>이메일</th>
								<th>급여지급일</th>
								<th>지급액(원)</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="salaryVO" items="${salaryVOList}">
								<tr class="_salaryDetail boardTR" id="${salaryVO.fileGroupNo}" style="height:45px; border:0.5px solid #e4e4e4; border-top:none; border-left:none; border-right:none; cursor:pointer;">
									<td style="text-align:center;">${salaryVO.employeeVO.empNm }</td>
									<td style="text-align:center;">${salaryVO.deptVO.deptNm}</td>
									<td style="text-align:center;">${salaryVO.jobGradeVO.jbgdNm}</td>
									<td style="padding-left:30px;">${salaryVO.employeeVO.empEml}</td>
									<td style="text-align:center;">${salaryVO.salaryDate}</td>
									<td style="text-align:right; padding-right:30px;"><fmt:formatNumber value="${salaryVO.salaryBslry - salaryVO.salaryTax}" pattern="#,###"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="board-footer">
						${paystubPage.pagingArea}
					</div>
				</div>
			</div>		
		</div>
	</div>
</div>

<div class="modal fade" id="detailPaystubModal" tabindex="-1" role="dialog" aria-labelledby="detailPaystubModalLabel" aria-hidden="true" style="font-family:Pretendard;">
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
    </div>
  </div>
</div>
<script>
$(function(){
	let fileGroupNo;
	$("tr._salaryDetail").on("click", function(){
		console.log($(this).attr("id"));
		fileGroupNo = $(this).attr("id");
		var salaryVO = {
			fileGroupNo : fileGroupNo
		}
		
		$.ajax({
			url:"/emp/salary/paystubImage",
			contentType:"application/json; charset=utf-8",
			data: JSON.stringify(salaryVO),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				console.log(response);
				var imageSrc = "data:image/png;base64," + response.image;
				
				$("#pdfBox").attr("src", imageSrc);
				$("#detailPaystubModal ._download").data("file-path", response.filePath);
				$("#detailPaystubModal ._download").data("file-original-name", response.fileOriginalName);
				$("#detailPaystubModal").modal('show');
			},
			error:function(xhr, status, error){
				console.log(error);
			}
		})
		
	    $(".modal").on("click", "._download", function() {
	        let filePath = $(this).data("file-path");
	        let fileOrgnlFileNm = $(this).data("file-original-name");

	        if (filePath) {
	          window.location.href = "/emp/salary/download?filePath=" + encodeURIComponent(filePath) + "&fileOrgnlFileNm=" + encodeURIComponent(fileOrgnlFileNm);
	        } else {
	          alert("파일 경로를 찾을 수 없습니다.");
	        }
	      });
	})
})
</script>