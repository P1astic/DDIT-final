<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/bp/list.css">
<style>
.card-footer{
background-color: rgba(0, 0, 0, 0.0);
}
</style>
<div id="container">
		<div id="title-box">
			<div class="title-txt" style="width: 50px;">인사</div>
			<div>-</div>
			<div class="title-txt" style="color: rgba(0, 0, 0, 0.88); width: 100px;">협력업체</div>
			<div class="search1">
				<div class="btnPlus"  onclick="window.location.href='/emp/bpUser/regist'">업체등록</div>
			</div>
		</div>
<div id="content">
	<form class="search">
		<div class="search2">
	         <div id="">분류</div>
	         <select id="selGubun" name="gubun" class="input1">
	            <option value="all" selected>전체선택</option>
	            <option value="deptNm"
	               <c:if test="${param.gubun=='deptNm'}">selected</c:if>>업체분류</option>
	            <option value="bpNm"
	               <c:if test="${param.gubun=='bpNm'}">selected</c:if>>협력업체명</option>
	            <option value="bpRprsvNm"
	               <c:if test="${param.gubun=='bpRprsvNm'}">selected</c:if>>대표자명</option>
	            <option value="bpTelno"
	               <c:if test="${param.gubun=='bpTelno'}">selected</c:if>>유선번호</option>
	            <option value="bpEml"
	               <c:if test="${param.gubun=='bpEml'}">selected</c:if>>이메일</option>
	            <option value="comDetCdCn"
	               <c:if test="${param.gubun=='comDetCdCn'}">selected</c:if>>계약상태</option>
	            <option value="empNm"
	               <c:if test="${param.gubun=='empNm'}">selected</c:if>>담당자</option>
	         </select>
	         <div id="sss">
			     <input type="text" id="keyword" name="keyword"
			            placeholder="검색어 입력" value="${param.keyword}"
			            class="input1" />
		     	 <button type="submit" class="btnSearch">
					<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#666666"><path d="M380-320q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l224 224q11 11 11 28t-11 28q-11 11-28 11t-28-11L532-372q-30 24-69 38t-83 14Zm0-80q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/></svg>
				</button>
	         </div>
		</div>
	</form>
		
	<div class="tablee">
		<div class="thread" >
			<div class="tr" id="tr1">
					<div style="width:2%;"></div>
					<div class="t1" style="font-weight: bold;">No</div>
					<div class="t2">업체분류</div>
					<div class="t3">협력업체명</div>
					<div class="t4">대표자명</div>
					<div class="t5">유선번호</div>
					<div class="t6">이메일</div>
					<div class="t7">계약상태</div>
					<div class="t8" >담당자</div>
					<div style="width:2%;"></div>
			</div>
		</div>
		
		<div class="tbody">
			<c:forEach var="bpVOList" items="${articlePage.content}" varStatus="stat">
						
				<div class="tr"  id="tr2"  style="cursor: pointer; " 
					onclick="redirectToDetail(event, '${bpVOList.memId}')">
						<div style="width:2%;"></div>
						<div class="t1">${bpVOList.rnum}</div>
						<div class="t2">${bpVOList.deptNm}</div>
						<div class="t3" id="tt3">${bpVOList.bpNm}</div>
						<div class="t4" id="tt4">${bpVOList.bpRprsvNm}</div>
						<div class="t5">${bpVOList.bpTelno}</div>
						<div class="t6">    
							<c:choose>
							<c:when test="${bpVOList.bpEml == null}">-</c:when>
		        			<c:otherwise>${bpVOList.bpEml}</c:otherwise>
							</c:choose>
						</div>
						<div class="t7" style="color: <c:choose>
						    <c:when test='${bpVOList.comDetCdCn == "미등록"}'>#1890FF</c:when>
						    <c:when test='${bpVOList.comDetCdCn == "만료"}'>#A4A4A4</c:when>
						    <c:otherwise>#000000</c:otherwise>
							</c:choose>;">${bpVOList.comDetCdCn}
						</div>
						<div class="t8">${bpVOList.empNm}</div>
						<div style="width:2%;"></div>
				</div>
			</c:forEach>
		 </div>
	 </div>	<!-- table 끝 -->
	 <div class="card-footer clearfix" style="border-top: none;">
                    ${articlePage.pagingArea}
     </div>
</div>
     
</div>
<script>
function redirectToDetail(event, memId) {
    window.location.href = '/emp/bpUser/detail?memId=' + memId;
    console.log("memId : " + memId);
}  
</script>