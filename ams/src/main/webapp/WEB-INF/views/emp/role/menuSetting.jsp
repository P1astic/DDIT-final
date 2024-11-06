<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="/resources/adminlte3/plugins/jquery/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/role/menuSetting.css">
<div class ="row" style="max-height : 900px; font-family:Pretendard;">
	<div class="col-12">
		<div class=container>
			<div class="titleHeader d-flex justify-content-between align-items-center ml-3">
				<p>
					<span style="color:#A4A4A4; font-size:20px; font-weight: 600; word-wrap: break-word;">권한관리 - </span>
					<span style="font-size:20px; font-weight: 600; word-wrap: break-word;">권한별 메뉴 설정</span>
				</p>
			</div>
			<div class="card-body table-responsive p-0">
				<div class="d-flex flex-row">
					<div style="width:30%;" class="btn-group btn-group-toggle btn-group-vertical" id="authList" data-toggle="buttons">
						<c:forEach var="authVO" items="${authVOList }">
							<label class="btn btn-primary custom-outline m-0">
								<input type="radio" id="${authVO.authCode }" name="authBtn" autocomplete="off">${authVO.authNm}(${authVO.authCode})
							</label>
						</c:forEach>
					</div>
					<div class="border" style="width:65%; display:none; overflow-y: auto; background-color:#EEEEEE" id="menuDiv">
						<div id="menuList" class="ml-auto">
							<button type="button" name="menuSettingSave" class="btn btn-primary" style="">
								저장
							</button>
						</div>
						<c:forEach var="bigMn" items="${menuList}">
							<c:choose>
								<c:when test="${bigMn.level ==1 }">
									<ul class="submenu m-2" id="${bigMn.mnCd}" style="font-size:16px;">
										<li class="menuCount">
											<input class="form-check-input" type="checkbox" id="${bigMn.mnCd }">
											<p class="menu-toggle">${bigMn.mnTitle }
												<span class="menu-count" id="count-${bigMn.mnCd }">(0/0)</span>
											</p>
											<ul class="sub" id="${bigMn.mnCd }">
											<c:forEach var="midMn" items="${menuList }">
												<c:if test="${midMn.parentMnCd == bigMn.mnCd && midMn.level > bigMn.level }">
													<li class="menuCount">
														<input class="form-check-input" type="checkbox" id="${midMn.mnCd }">
														<p class="menu-toggle" id="${midMn.mnCd }">${midMn.mnTitle }</p>
														<ul class="sub" id="${bigMn.mnCd }">
															<c:forEach var="smMn" items="${menuList }">
																<c:if test="${smMn.parentMnCd == midMn.mnCd && smMn.level > midMn.level }">
																	<li class="menuCount">
																		<input class="form-check-input" type="checkbox" id="${smMn.mnCd }">
																		<p id="${smMn.mnCd }">${smMn.mnTitle }</p>
																	</li>
																</c:if>
															</c:forEach>
														</ul>
													</li>
												</c:if>
											</c:forEach>
											</ul>
										</li>
									</ul>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
					<div id="noAuthMsg" style="display: flex; justify-content: center; align-items: center; width:65%;">
						<p>왼쪽 메뉴에 있는 권한을 클릭하세요</p>
					</div>
				</div>
				<div class="flex-row ml-auto" style="float:right; padding-right:50px;">
					<button type="button" id="registAuth" name="registAuth" class="registBtn mt-2">
						등록
					</button>
					<button type="button" id="deleteAuth" name="deleteAuth" class="btnDel mt-2" style="display:none;">
						삭제
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="authSaveModal" tabindex="-1" role="dialog" aria-labelledby="authSaveModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>권한이 저장되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="menuSaveModal" tabindex="-1" role="dialog" aria-labelledby="menuSaveModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>메뉴가 저장되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="authDeleteModal" tabindex="-1" role="dialog" aria-labelledby="authDeleteModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>권한이 삭제되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="authDeleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="authDeleteConfirmModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>삭제하시겠습니까?.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="authDeleteConfirm" name="authDeleteConfirm">확인</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="registAuthModal" tabindex="-1" role="dialog" aria-labelledby="registAuthLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    	<form action="/emp/role/registAuth" method="post">
			<div class="_registAuthBody">
			  <p class="align-items-center">
			  	<label for="authCode">권한코드</label>
			  	<input type="text" id="authCode" name="authCode" placeholder="ROLE_CODE" style="text-transform:uppercase" required>
			  	<input type="button" class="btn btn-primary" value="중복검사" name="registAuthCheck" style="margin-bottom:5px;">
			  </p>
			  <p>
			  	<label for="authNm">권한명</label>
			  	<input type="text" id="authNm" name="authNm" placeholder="권한명을 입력해주세요" required>
			  </p>
			</div>
			<hr>
			<div class="d-flex justify-content-end flex-wrap"> 
			  <button type="button" class="btn btn-secondary _dismissBtn" data-dismiss="modal">취소</button>
			  <button type="submit" class="btn btn-primary ml-1" id="registAuthModalBtn" name="registAuthModalBtn" disabled>등록</button>
			</div>
			<sec:csrfInput/>
    	</form>
    </div>  	
  </div>
</div>

<script>

	$(function() {
		let auth;
		let authCheckFlag = 0;
		
		$("button[name='registAuth']").on("click", function(){
			$("#registAuthModal").modal('show');
			$("#authCode").val('');
			$("#authNm").val('');
			$("p#authCheckMessage").remove(); 
			$("button[name='registAuthModalBtn']").prop("disabled", true);  // submit 버튼 비활성화
		})
		
		$("input[name='registAuthCheck']").on("click", function(){
			var authCode = $("#authCode").val();
			var self = this;
			$.ajax({
				url:"/emp/role/authCheck",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify({authCode : authCode}),
				type:"POST",
				dataType:"text",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(result){
					if(result === "0"){
			 		    $("p#authCheckMessage").remove();  // 기존 문구 삭제
			 		    $(self).closest("p").append('<p id="authCheckMessage" style="color: blue;">사용가능한 권한 코드입니다.</p>');
			 		    authCheckFlag = 1;
	                    $("button[name='registAuthModalBtn']").prop("disabled", false);  // submit 버튼 활성화

					}else{
			 		    $("p#authCheckMessage").remove();  // 기존 문구 삭제
			 		    $(self).closest("p").append('<p id="authCheckMessage" style="color: red;">이미 있는 권한 코드입니다.</p>');
			 		    authCheckFlag = 0;
	                    $("button[name='registAuthModalBtn']").prop("disabled", true);  // submit 버튼 비활성화
					}
				},
				error:function(xhr,status,error){
					console.log("ajax error", error);
				}
			})
		})
		
		$("form[action='/emp/role/registAuth']").on("submit", function(e){
			e.preventDefault();
			
			var formData={
					authCode : $("#authCode").val(),
					authNm : $("#authNm").val()
			};
			
			$.ajax({
				url:"/emp/role/registAuth",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify(formData),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
			           if (response.result === "success") {
			        	   $("#authSaveModal").modal('show');
			        	   setTimeout(() => window.location.href="/emp/role/menuSetting", 1000);  
			            } else {
			            	setTimeout(() => window.location.href="/emp/role/menuSetting", 1000);  
			            }
				},
		       error: function(xhr, status, error) {
		            alert("권한 등록 중 오류가 발생했습니다. 다시 시도해 주세요.");
		            window.location.reload();
		        }
			})
		})
		
		$("button[name='deleteAuth']").on("click", function(){
			$("#authDeleteConfirmModal").modal('show');
		})
		
		$("button[name='authDeleteConfirm']").on("click", function(){
			var deleteAuthObj = {
				"authCode" : auth
			}
			
			$.ajax({
				url:"/emp/role/deleteAuth",
				contentType:"application/json; charset=utf-8",
				data: JSON.stringify(deleteAuthObj),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
			           if (response.result === "success") {
			        	   $("#authDeleteConfirmModal").modal('hide');
			        	   $("#authDeleteModal").modal('show');
			        	   setTimeout(() => window.location.href="/emp/role/menuSetting", 1000);  
			            } else {
			            	setTimeout(() => window.location.href="/emp/role/menuSetting", 1000);
			            }
				},
		       error: function(xhr, status, error) {
		            alert("권한 삭제 중 오류가 발생했습니다. 다시 시도해 주세요.");
		            window.location.reload();
		        }
			})
			
		})
		
		
		// 권한 버튼 시 ajax 호출 소스
		$("button[name='menuSettingSave']").on("click", function(){
			let checkedMnCd = [];
			let allMnCd = [];
			
			$("input[type='checkbox']").each(function(){
				const mnCd = $(this).attr("id");
				allMnCd.push(mnCd);
				
				if($(this).is(":checked")){
					checkedMnCd.push(mnCd);
				}
			})
			
			let jsonObj = {
				"authCode" : auth,
		        "mnVOList": allMnCd.map(function(mnCd) {
		            return {
		                mnCd: mnCd,
		                checkedYn: checkedMnCd.includes(mnCd) ? 'Y' : 'F'
		            };
		        })
			}
			
			$.ajax({
				url:"/emp/role/menuSave",
				contentType:"application/json; charset=utf-8",
				data:JSON.stringify(jsonObj),
				type:"POST",
				dataType:"text",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(result){
					$("#menuSaveModal").modal('show');
					setTimeout(() => window.location.href="/emp/role/menuSetting", 1000);  
				},
				error:function(xhr, status, error){
					console.log("AJAX error", status, error);
				}
			})
		})
		
		var authMenuListJson = [];
		$("#authList input[name='authBtn']").on("click", function(){
			
			auth = $(this).attr("id");
			
			let jsonObj = {
				"authCode" : auth
			}
			
			$("#menuDiv").show();
			$("#noAuthMsg").hide();
			$("#deleteAuth").show();
			
			$.ajax({
				url:"/emp/role/loadMenu",
				contentType:"application/json; charset=utf-8",
				data:JSON.stringify(jsonObj),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(result){
					authMenuListJson = result;
					checkAuthMenu();
				}
			})
		})
		
		// 권한 로드 관련 소스		
		var menuCounts={};
		
        function checkAuthMenu() {
        	$("input[type='checkbox']").prop("checked", false);
        	
        	authMenuListJson.forEach(function(bigMn) {
				var matchingMenu = $("#" + bigMn.mnCd).find(".form-check-input");
				if(matchingMenu.length > 0){
					matchingMenu.prop("checked", true);
				}
            });
            
            // 메뉴 카운트 업데이트
            $(".submenu").each(function() {
                var mnCd = $(this).attr("id");
                updateMenuCount(mnCd);
            });
        }
		
		$(".submenu").each(function(){
			var mnCd = $(this).attr("id");
			var totalCount = $(this).find(".form-check-input").length +
							 $(this).siblings(".menuCount").find(".form-check-input").length;
			menuCounts[mnCd] = {
				totalCount: totalCount,
				checkedCount : 0
			};
			updateMenuCount(mnCd);
		})
		
		function updateMenuCount(mnCd){
			var checkedCount = $("#" + mnCd).find(".form-check-input:checked").length +
							   $("#" + mnCd).siblings(".menuCount").find(".form-check-input:checked").length; // 대메뉴 체크박스 추가
			menuCounts[mnCd].checkCount = checkedCount;
			$("#count-" + mnCd).text("(" + checkedCount + "/" + menuCounts[mnCd].totalCount + ")");
		}
		
	    $(".menu-toggle").click(function() {
	        $(this).next(".sub").slideToggle();
	    });
	    
	    $(".form-check-input").change(function(){
	    	var mnCd = $(this).closest(".submenu").attr("id");
	    	updateMenuCount(mnCd);
	    })
	    
	    $(".form-check-input").each(function(){
	    	var mnCd = $(this).closest(".submenu").attr("id");
	    	updateMenuCount(mnCd);
	    })
	    
	    $(".menuCount > .form-check-input").change(function() {
	        var isChecked = $(this).is(":checked");
	        $(this).siblings("ul").find(".form-check-input").prop("checked", isChecked);
	        
	        // 체크 상태 변경 후 카운트 업데이트
	        var mnCd = $(this).closest(".submenu").attr("id");
	        updateMenuCount(mnCd);
	    });
	    
	});
</script>