<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="/resources/css/airplane/serviceList.css">

<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<div class="container">
	<p id="header">취항 항공사 안내</p>
	<div class="tableDiv">
		<table>
			<thead>
				<tr>
					<th style="width:30%; text-align:left;'">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;항공사</th>
					<th style="width:10%">국적</th>
					<th style="width:10%">IATA</th>
					<th style="width:20%">ICAO</th>
					<th style="width:10%">사이트주소</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach var="airLineVO" items="${airlineList}">
					<tr>
						<td><img src="${airLineVO.airImg}" alt='${airLine.airNm}'
						style='width:60px; margin-left:-25px; margin-right:25px;'>${airLineVO.airNm}</td>
						<td>${airLineVO.airNtnltyNm }</td>
						<td>${airLineVO.airIata }</td>
						<td>${airLineVO.airIcao }</td>
						<td><a href="${airLineVO.airUrl}" target="_blank">${airLineVO.airUrl}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>