<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/board/list.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/cusList.css">








<body class="typeSub">
	<script>
		$(function() {
			$(".btn_print").bind("click", function() {
				window.print();
			});
		});
	</script>


	<section class="content">



		<div class="container-fluid">
			<!-- -------------------- body 시작 -------------------- -->





			<div class="row" style="font-family: Pretendard;">
				<div class="col-12">
					<div class="container">
						<div class="titleHeader">
							<span class="pageTitle"
								style="font-size: 20px; font-weight: 600; word-wrap: break-word;">고객
								문의</span>
							<div class="ml-auto d-flex align-items-center"></div>
						</div>
						<!-- card-header 끝 -->
						<div class="card-body table-responsive p-0">
							<div class="searchHeader">
								<div class="ml-auto d-flex align-items-center">
									<form id="searchForm" class="d-flex align-items-center">
										<div class="searchDiv">
											<select id="selStatus" name="custBrdAnsty" class="selBox _input">
												<option value="all" selected="">전체</option>
												<!-- 												<option value="N">접수 대기</option> -->
												<!-- 												<option value="Y">답변 완료</option> -->
												<option value="N"
													<c:if test="${param.custBrdAnsty == 'N'}">selected</c:if>>접수
													대기</option>
												<option value="Y"
													<c:if test="${param.custBrdAnsty =='Y'}">selected</c:if>>답변
													완료</option>
											</select>
										</div>

										<div>
											<input type="text" id="keyword" name="keyword"
												placeholder="검색어 입력" value="${param.keyword}"
												class="searchBox" />
										</div>

										<button id="searchSubmitBtn" type="submit">
											<img src="/resources/images/icon/searchBtn.png">
										</button>
									</form>

								</div>
							</div>
							<div class="tableDiv">
								<table>
									<thead>
										<tr>
											<th style="width: 4%; text-align: center;">No</th>
											<th style="width: 60%; text-align: center;">제목</th>
											<th style="width: 15%; text-align: center;">등록일</th>
											<th style="width: 15%; text-align: center;">처리상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="custBoardVO" items="${custBoardVOList}"
											varStatus="status">
											<tr class='boardTR'
												onclick="location.href='/emp/vos/Answer?custBrdNo=${custBoardVO.custBrdNo}'"
												style="height: 45px; border: 0.5px solid #e4e4e4; border-top: none; border-left: none; border-right: none; cursor: pointer;">
												<td style="width: 4%; padding-left: 20px;">${status.index + 1}</td>
												<td
													style="width: 30%; text-align: left; padding-left: 30px;">${custBoardVO.custBrdTtl}</td>
												<td style="width: 10%; text-align: center;"><fmt:formatDate
														value="${custBoardVO.custBrdRegYmd}" pattern="yyyy-MM-dd" />
												</td>

												<td style="padding-left: 35px;"><c:choose>
														<c:when test="${custBoardVO.custBrdAnsYmd == NULL}">
															<span style="color: red;">접수 대기</span>
															<!-- 접수 대기 상태를 빨간색으로 표시 -->
														</c:when>
														<c:when test="${custBoardVO.custBrdAnsYmd != NULL}">
            답변 완료
        </c:when>
													</c:choose></td>
										</c:forEach>
										<c:if test="${empty custBoardVOList}">
											<tr class="typeNoArticle">
												<td colspan="6">
													<p class="no_article">등록된 게시물이 없습니다.</p>
												</td>
											</tr>
										</c:if>
									</tbody>

								</table>
								<div class="board-footer">${articlePage.pagingArea}</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- -------------------- body 끝 -------------------- -->
		</div>
	</section>
</body>
