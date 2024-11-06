<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css" href="/resources/css/role/roleList.css">
<div class="row" style="font-family:Pretendard;">
	<div class="col-12">
		<div class="container">
			<div class="titleHeader">
				<h4>
					<span style="color:#A4A4A4; font-size:20px; font-weight: 600; word-wrap: break-word;">권한관리 - </span>
					<span style="font-size:20px; font-weight: 600; word-wrap: break-word;">권한 사용자 목록</span>
				</h4>
			</div>
			<div class="card-body table-responsive p-0">
				<div class="searchHeader">
					<div class="ml-auto d-flex align-items-center" style="border-bottom:none;">
						<form class="d-flex align-items-center" style="margin-bottom:0;">
							<div style="margin-right: 10px;">
								<select name="authCode" id="authCode" class="form-control mr-4">
									<option value="" selected>권한전체</option>
									<c:forEach var="authVO" items="${authVOList}">
										<option value="${authVO.authCode }"
											<c:if test="${param.authCode == authVO.authCode }">selected</c:if>> ${authVO.authNm }
										</option>
									</c:forEach>
								</select>
							</div>
							<div>
								<select name="deptCd" id="deptCd" class="form-control mr-2">
									<option value="" selected>부서전체</option>
									<c:forEach var="deptVO" items="${deptVOList}">
										<option value="${deptVO.deptCd }"<c:if test="${param.deptCd == deptVO.deptCd }">selected</c:if>>
											${deptVO.deptNm }</option>
									</c:forEach>
								</select>
							</div>
							<button type="submit" style="background:none; height:37px; border:1px solid #ced4da; border-radius: 0 .2rem .2rem 0;">
								<img src="/resources/images/icon/searchBtn.png" style="height: 25px; width: 25px; line-height:1.5; margin-bottom:3px;">
							</button>
						</form>
					</div>
				</div>
				<div style="padding-left:20px; padding-right:20px; border:0.5px solid #e4e4e4; border-top:none; margin-bottom:20px; border-radius:0 0 10px 10px;"> 
					<table style="width:100%; border:0.5px solid #e4e4e4; border-top:none; border-left:none; border-right:none;">
						<thead style="background:#e4e4e463; height:35px;">
							<tr>
								<th style="text-align:center;">번호</th>
								<th style="text-align:center;">아이디</th>
								<th style="text-align:center;">직원명</th>
								<th style="text-align:center;">부서명</th>
								<th style="text-align:center;">직급</th>
								<th style="text-align:center;">권한</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="listSize" value="${fn:length(authEmpList)}"/>
							<c:forEach var="empList" items="${authEmpList}" varStatus="status">
							    <tr class='boardTR' style="height:45px; border:0.5px solid #e4e4e4; border-top:none; border-left:none; border-right:none; cursor:pointer;">
							        <td style="text-align:center;" >${empList.rnum}</td>
							        <td style="text-align:center;">${empList.memId}</td>
							        <td style="text-align:center;">${empList.empNm}</td>
							        <td style="text-align:center;">${empList.department.deptNm}</td>
							        <td style="text-align:center;">${empList.jobGrade.jbgdNm}</td>
							        <td style="padding-left:20px;">${empList.auth.authNm}</td>
							    </tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="card-footer clearfix" style="margin-bottom:20px;  margin-top:10px; border:none; background:white;  border-radius: 0 0 5px 5px;">
						${articlePage.pagingArea }
					</div>
				</div>
			</div>
		</div>
	</div>
</div>