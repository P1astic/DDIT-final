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
			<div class="title-txt">협력직원</div>
			<div class="title-txt">-</div>
			<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">인사기록카드</div>
		</div>
		<div id="btnBox"> 
			<div class="btnEdit" onclick="window.location.href='/bp/bpUser/bpList'">목록</div>	
			<div class="btnEdit" onclick="window.location.href='/bp/bpUser/edit?memId=${bpVO.memId}'">수정</div>	
			<div class="btnEdit">비활성화</div>	
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
<%-- 				<img id="profileImg" src="/upload/bp/${bpVO.bpRprsvNm}/${bpVO.bpImgUrl}"  /> --%>
				<img id="profileImg" src="/download?filePath=/upload/profile/bp/${bpVO.bpNm}/${bpVO.bpImgUrl}&fileOrgnlFileNm=${bpVO.bpImgUrl}" />
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
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${bpVO.empNm}
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

