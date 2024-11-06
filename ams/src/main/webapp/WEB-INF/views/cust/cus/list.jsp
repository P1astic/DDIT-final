<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="row">
	<div class="col-12">
		<div class="page-title-box">
			<h4 class="page-title">나의 민원</h4>
		</div>

	</div>
</div>

<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="row mb-2">
					<div class="col-sm-8">
						<div class="text-sm-start">
							<a href="/cus/insert" class="btn btn-info mb-2"> 등록 </a>
						</div>
					</div>
					<div class="col-sm-4 pe-0">
						<form class="input-group input-group-sm row" id="userPassForm">
							<div class="col-8 d-flex pe-0">
								<input type="text" name="custBrdNm" value="${custBrdNm }"
									class="form-control float-right" placeholder="이름"> 
									 <input
									type="text" name="phnum" value="${phnum }"
									class="form-control float-right" placeholder="휴대폰 뒷자리">
								<button type="submit" class="btn btn-primary text-nowrap">
									조회</button>
							</div>
							<sec:csrfInput />
						</form>
					</div>
				</div>
				<div class="table-responsive">
					<table id="alternative-page-datatable"
						class="table table-hover nowrap text-center">
						<thead class="table-apex">
							<tr>
								<th>No</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>답변여부</th>
							</tr>
						</thead>
						<tbody>

							<c:choose>
								<c:when test="${empty custBoardList }">
									<tr>
										<td colspan="5">등록된 게시글이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="custBoardVO" items="${custBoardList}" varStatus="stat">
										<tr>
											<td>${custBoard.rnum}</td>
											<td class="text-start"><a
												href="/cus/detail?custBoard=${custBoard.custBoard}">${custBoard.custBrdTtl}</a></td>
											<td>${custBoard.custBrdNm}</td>
											<td><fmt:formatDate value="${custBoard.custBrdRegYmd}"
													pattern="yyyy-MM-dd" /></td>
											<td>${custBoard.custBrdAnsYn}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div class="d-flex justify-content-end">
						<div class="card-footer clearfix">${articlePage.pagingArea}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- Datatable js -->
<script
	src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/vendor/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/vendor/jquery-datatables-checkboxes/js/dataTables.checkboxes.min.js"></script>

<!-- Product Demo App js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.products.js"></script> --%>

<!-- App js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script> --%>

<script type="text/javascript">
	$(function() {
		var pagingArea = $("#pagingArea");
		var userPassForm = $("#userPassForm");

		// 페이징 버튼
		pagingArea.on('click', 'a', function(event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			// 검색 시 사용할 form태그안에 넣어준다.
			// 검색 시 사용할 fomr태그를 활용해서 검색도 하고 페이징 처리도 같이 함
			userPassForm.find("#page").val(pageNo);
			userPassForm.submit();
		});
	});
</script>
