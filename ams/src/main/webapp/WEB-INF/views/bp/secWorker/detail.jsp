<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/secWorker/detail.css">
<style>


	.btn-primary {
	    background-color: #1890FF;
	    border-color: #007bff;
	    padding: 15px 30px; /* 버튼 크기 조정 */
	    font-size: 1.2rem;
	}
	
	.btn-secondary {
	    background-color: #D9D9D9;
	    border-color: #D9D9D9;
	    color: black;
	    padding: 15px 30px; /* 버튼 크기 조정 */
	    font-size: 1.2rem;
	}
	
	.btn-secondary:hover {
		background-color: #BDBDBD;
		border-color: #BDBDBD;
	}	
	
	.btn-warning {
	    color: #212529;
	    background-color: #FFD512;
	    border-color: #FFD512;
	}
	
	
	
	
</style>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card shadow-sm">

				<div class="card-header text-center py-4" style="background-color: white; color: black;">
				    <h3 style="font-size: 1.8rem;">작업자 상세</h3>
				</div>

                <div class="card-body p-5"> <!-- 카드 패딩(padding)을 넓혀 내부 공간 확보 -->
                    <form action="/bp/secWorker/secWorkerDetail" method="get" class="form" style="margin-left: 188px; 	">
                        <input type="hidden" id="memSeq" name="memSeq" value="${securityWorkerVO.memSeq}" />

                        <!-- 이름 및 프로필 사진 -->
                        <div class="form-group row mt-4">
                            <label for="workerName" class="col-sm-3 col-form-label d-flex align-items-center" style="font-size: 1.2rem;">이름</label>
                             </div>
                             
                             
                            <div class="col-sm-7 d-flex align-items-center">
                                <!-- 이름 입력란 크기 확대 -->
                                <input type="text" class="form-control mr-3" id="workerName" name="workerName" value="${securityWorkerVO.workerName}" readonly style="height: 40px; font-size: 1.2rem;">
</div>

                                <!-- 프로필 사진 크기 확대 -->
                                <c:if test="${securityWorkerVO.fileGroupNo > 0}">
                                    <div class="file-info">
                                        <div class="fileList">
                                            <input type="hidden" name="fileGroupNo" id="fileGroupNo" value="${securityWorkerVO.fileGroupNo}">
                                            <c:forEach var="fileDetailVO" items="${fileDetailVOList}" varStatus="status">
                                                <div id="fileNum${status.index}" class="d-flex">
                                                    <!-- 이미지 크기 확대 -->
                                                    <button id="fileDown" data-file-path="${fileDetailVO.fileFilePathNm}" type="button" style="background:none; border:none; padding: 0;">
                                                        <img src="C:/upload/2024/10/01/125b2c35-c356-435c-b8b7-11bc50786f1c_스크린샷 2024-06-17 154457.png" style="width: 150px; height: 150px; border-radius: 15px; border: 2px solid #ddd;">
                                                    </button>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                            
                        

                        <!-- 회사 전화번호 -->
                        <div class="form-group row mt-4">
                            <label for="empTel1" class="col-sm-3 col-form-label d-flex align-items-center" style="font-size: 1.2rem;">회사 전화번호</label>
                        </div>
                            <div class="col-sm-9 d-flex">
                                <input type="text" class="form-control" id="memTel1" name="memTel1" value="${securityWorkerVO.memTel1}" readonly style="width: 150px; height: 50px; margin-right: 10px; font-size: 1.1rem;">
                                <input type="text" class="form-control" id="memTel2" name="memTel2" maxlength="4" value="${securityWorkerVO.memTel2}" readonly style="width: 150px; height: 50px; margin-right: 10px; font-size: 1.1rem;">
                                <input type="text" class="form-control" id="memTel3" name="memTel3" maxlength="4" value="${securityWorkerVO.memTel3}" readonly style="width: 150px; height: 50px; font-size: 1.1rem;">
                            </div>

                        <!-- 주소 -->
                        <div class="form-group row mt-4">
                            <label for="empAdd1" class="col-sm-3 col-form-label d-flex align-items-center" style="font-size: 1.2rem;">주소</label>
                        </div>
                            <div class="col-sm-9">
                                <input type="text" id="empAdd1" name="empAdd1" class="form-control mt-2" value="${securityWorkerVO.memAdd1}" title="${securityWorkerVO.memAdd1}" readonly style="height: 50px; font-size: 1.1rem;">
                                <input type="text" id="empAdd2" name="empAdd2" class="form-control mt-2" value="${securityWorkerVO.memAdd2}" title="${securityWorkerVO.memAdd2}" readonly style="height: 50px; font-size: 1.1rem;">
                            </div>

                        <!-- 메일 -->
                        <div class="form-group row mt-4">
                            <label for="mail" class="col-sm-3 col-form-label d-flex align-items-center" style="font-size: 1.2rem;">메일</label>
                        </div>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="mail" name="mail" value="${securityWorkerVO.mail}" readonly style="height: 50px; font-size: 1.1rem;">
                            </div>

                        
                       <!-- 메모사항 -->
							<div class="form-group row mt-4">
							    <label for="memo" class="col-sm-3 col-form-label d-flex align-items-center" style="font-size: 1.2rem;">메모사항</label>
							</div>
							<div class="col-sm-9" style="border: 0.5px solid #e4e4e4; padding: 10px; font-size: larger; height: 200px;">
							    <!-- escapeXml="false"를 사용하여 HTML 태그를 해석하도록 설정 -->
							    <c:out value="${securityWorkerVO.memo}" escapeXml="false" />
							</div>

                        <!-- 버튼 섹션 -->
					<div class="card-footer text-center mt-4 py-4" style="width: 75%;">
					    <!-- 버튼 크기 및 폰트 확대 -->
					    <a href="/bp/secWorker/list" class="btn" style="background-color: #6c757d; border: none; float: left; - width: 60px;
- height : 32.5px; border-radius : 5px; color: white;">목록</a>
					    <a href="/bp/secWorker/edit?memSeq=${securityWorkerVO.memSeq}" style="text-decoration: none;">
					        <button type="button" id="mntBtn" class="btn" style="background-color: #1890FF; - width: 60px;
- height : 32.5px; border: none; float: right; border-radius : 5px; color: white;">수정</button> 
					    </a>
					    
					</div>





                        <sec:csrfInput/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>