<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/bp/detail.css">

<div id="container" >
	<!-- 헤더 -->
	<div id="tbox">
		<div id="title-box">
			<div class="title-txt">인사</div>
			<div class="title-txt">-</div>
			<div class="title-txt">협력업체</div>
			<div class="title-txt">-</div>
			<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">인사기록카드</div>
		</div>
		<div id="btnBox"> 
			<div class="btnEdit" onclick="window.location.href='/emp/bpUser/bpList'">목록</div>	
			<div class="btnEdit" onclick="window.location.href='/emp/bpUser/edit?memId=${bpVO.memId}'">수정</div>	
		</div>
	</div> 
	
	<!-- form -->
	<form id="content">
		<div class="a1">인사정보</div>
		
		<!-- 프로필박스 -->
		<div class="a2">
			<div class="a2-1">
				<!-- 
				<resources mapping="/upload/**" location="file:///C:/upload/profile/" />
				 -->
				 <c:if test="${empty bpVO.bpImgUrl}">
						<img id="profileImg" name="profileImg" src="/resources/images/profile.jpg" id="profileImage">
					</c:if>
					<c:choose>
					    <c:when test="${!empty bpVO.bpImgUrl}">
							<img id="profileImg" src="/download?filePath=${bpVO.bpImgUrl}&fileOrgnlFileNm=${bpVO.bpImgUrl}" onerror="this.onerror=null; this.src='/resources/images/profile.jpg';" />
					    </c:when>
					</c:choose>
			</div>
			<div class="a2-2"  style="font-size: 20px;">${bpVO.bpNm}</div>
		</div>
		
		<hr class="hr1">
		
		<!-- 데이터박스 -->
		<div class="a3">
			<!--  왼쪽-->
			<div class="a3-1">
				
				<div class="a3-1-1" >
					<div class="a3-1-1-1">대표자명</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.bpRprsvNm}
					</div>
				</div>
				<div class="a3-1-1" >
					<div class="a3-1-1-1">아이디</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.memId}
					</div>
				</div>
				<div class="a3-1-1" >
					<div class="a3-1-1-1">담당자</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden="" value="${bpVO.empId}"/>${bpVO.empNm}
					</div>
				</div>
				
				
			</div>
			
			<!-- 오른쪽 -->
			<div class="a3-1">
			
				<div class="a3-1-1" >
					<div class="a3-1-1-1">협력업체명</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.bpNm}
					</div>
				</div>
				
				<div class="a3-1-1" >
					<div class="a3-1-1-1">업체분류</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.deptNm}
					</div>
				</div>
				
				<div class="a3-1-1">
				    <div class="a3-1-1-1">권한</div>
				    <div class="a3-1-1-2">
				        <input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>
				        <c:choose>
				            <c:when test="${bpVO.authCode == 'ROLE_AIR'}">
				                항공사(${bpVO.authCode})
				            </c:when>
				            <c:when test="${bpVO.authCode == 'ROLE_FRN'}">
				                입점업체(${bpVO.authCode})
				            </c:when>
				            <c:when test="${bpVO.authCode == 'ROLE_SBCTR'}">
				                외주업체(${bpVO.authCode})
				            </c:when>
				            <c:otherwise>
				                권한없음
				            </c:otherwise>
				        </c:choose>
				    </div>
				</div>
				
				<!-- ROLE_FRN일 때만 업체구분 표시 -->
				<c:if test="${bpVO.authCode == 'ROLE_FRN'}">
				    <div class="a3-1-1">
				        <div class="a3-1-1-1">업체구분</div>
				        <div class="a3-1-1-2">
				            ${myfrn.comDetCdCn}
				        </div>
				    </div>
				</c:if>
				
			</div> <!-- 오른쪽 -->
			
		</div><!-- a3 끝 -->

		<hr class="hr1">

		<div class="a3">
			<!--  왼쪽-->
			<div class="a3-1">
				<div class="a3-1-1" >
					<div class="a3-1-1-1">계약상태</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.comDetCdCn}
					</div>
				</div>
				<div class="a3-1-1" >
					<div class="a3-1-1-1">계약시작일자</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.ctrtYmd}
					</div>
				</div>
				<div class="a3-1-1" >
					<div class="a3-1-1-1">계약종료일자</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.ctrtEndYmd}
					</div>
				</div>
			</div>
			
			<!-- 오른쪽 -->
			<div class="a3-1">
				<div class="a3-1-1" >
					<div class="a3-1-1-1">사업자등록번호</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.bpBrno}
					</div>
				</div>
				<div class="a3-1-1" >
					<div class="a3-1-1-1">유선번호</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.bpTelno}
					</div>
				</div>
				<div class="a3-1-1" >
					<div class="a3-1-1-1">이메일</div>
					<div class="a3-1-1-2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.bpEml}
					</div>
				</div>
			</div>
		</div><!-- a3 끝 -->
	</form>
	
</div>

