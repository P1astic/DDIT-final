<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/emp/detail.css">
<div id="container" >
<!-- 헤더 -->
<div id="tbox">
	<div id="title-box">
		<div class="title-txt">인사</div>
		<div class="title-txt">-</div>
		<div class="title-txt">사원</div>
		<div class="title-txt">-</div>
		<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">인사기록카드</div>
	</div>
	<div id="btnBox"> 
		<div class="btnEdit" onclick="window.location.href='/emp/employee/list'">목록</div>	
		<div class="btnEdit" onclick="window.location.href='/emp/employee/edit?memId=${employeeVO.memId}'">수정</div>	
	</div>
</div> 

<!-- 폼 박스 -->
<form id="content">
	<div class="a">
	<div class="t1"></div>
		<!-- 프로필 사진 박스 -->
		<div class="a1-1">
			<div class="a1-1-1" > <!-- 이미지박스 -->
			<!-- 프로필 이미지가 없으면 기본 이미지 -->
					<c:if test="${empty employeeVO.empImgUrl}">
						<img id="profileImg" name="profileImg"
							src="/resources/images/profile.jpg" id="profileImage">
					</c:if>
					<c:choose>
					    <c:when test="${!empty employeeVO.empImgUrl}">
					        <img id="profileImg" src="/download?filePath=${employeeVO.empImgUrl}&fileOrgnlFileNm=${employeeVO.empImgUrl}" onerror="this.onerror=null; this.src='/resources/images/profile.jpg';" />
					    </c:when>
					    <c:otherwise>
					        <img id="profileImg" src="/resources/images/profile.jpg" />
					    </c:otherwise>
					</c:choose>
			</div>
			<div class="a1-2-td2" style="font-size: 18px;">${employeeVO.empNm}</div>
		</div>
		<hr class="hr1">
		
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr" >
					<div class="a1-2-td">이름</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>${employeeVO.empNm}
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">아이디</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="아이디" hidden="" id="memId" value="${employeeVO.memId}"/>${employeeVO.memId}
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">부서</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="부서" hidden=""/>${employeeVO.deptNm} 
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">직급</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="직급" hidden=""/>${employeeVO.jbgdNm} 
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">성별</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="성별" hidden=""/>
					     <c:choose>
					        <c:when test="${employeeVO.empGender=='V1'}">여성</c:when>
					        <c:when test="${employeeVO.empGender=='V2'}">남성</c:when>
					        <c:otherwise>-</c:otherwise>
					    </c:choose>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">생년월일</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="생년월일" hidden=""/>
					${employeeVO.empRrno}
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">이메일</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="이메일" hidden=""/>${employeeVO.empEml} 
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">휴대전화</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="휴대전화" hidden=""/>${employeeVO.empMoblphon} 
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
		
		<hr class="hr1">
		
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">재직상태</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="이름을 입력하세요" hidden=""/>
					<c:choose>
 							<c:when test="${employeeVO.empHdofStat =='T1'}">재직</c:when>
							<c:when test="${employeeVO.empHdofStat =='T2'}">휴직</c:when>
							<c:when test="${employeeVO.empHdofStat =='T3'}">퇴직</c:when>
							<c:otherwise>기타</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">입사일자</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="아이디" hidden=""/>${employeeVO.empJncmpYmd}
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">퇴사일자</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="부서" hidden=""/>
						<c:choose>
							<c:when test="${employeeVO.empHdofStat =='T1'}">-</c:when>
							<c:when test="${employeeVO.empHdofStat =='T2'}">-</c:when>
							<c:when test="${employeeVO.empHdofStat =='T3'}">${employeeVO.empRsgntnYmd}</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose> 
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">연차일 수</div>
					<div class="a1-2-td2">
					<input type="number" class="input1" placeholder="0" hidden=""/>${employeeVO.empYrycDaycnt} 
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">우편번호</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="우편번호" hidden=""/>${employeeVO.empZip} 
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">주소</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="주소" hidden=""/>
					${employeeVO.empRoadNmAddr}
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">상세주소</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="상세주소" hidden=""/>${employeeVO.empDaddr} 
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">권한</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" placeholder="권한" hidden=""/>
					${employeeVO.authNm }(${employeeVO.authCode })
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
	</div>
	<sec:csrfInput />
</form>
</div> <!-- container -->

