<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/emp/edit.css">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.btn{
background-color: white;
} 
</style>
<script>
function handleImg(e){
	   // e.target : <input type="file" id="uploadFile"..>
	   let files = e.target.files; // 선택한 파일들
	   // fileArr = [a.jpg,b.jpg,c.jpg]
	   let fileArr = Array.prototype.slice.call(files);
	   let accumStr = "";
	   fileArr.forEach(function(f){
	      // 이미지가 아니면
	      if(!f.type.match("image.*")){
	         alert("이미지 확장자만 가능합니다");
	         return; // 함수 자체가 종료됨
	      }
	      // 이미지가 맞다면
	      let reader = new FileReader();
	      // e : reader가 이미지 객체를 읽는 이벤트
	      reader.onload = function(e){
	         accumStr += "<img src='"+e.target.result+"' style='width:20%;border:1px solid #D7DCE1;' />";
	         $("#pImg").html(accumStr);
	      }
	      reader.readAsDataURL(f);
	   });
	   // 요소.append : 누적, 요소.html : 새로고침, 요소.innerHTML : J/S에서 새로고침
}
		
$(function(){
	 $('#deleteImageBtn').on('click', function() {
         // 프로필 이미지를 기본 이미지로 변경
         $('#profileImg').attr('src', '/resources/images/profile.jpg');
         
         // 서버로 전송되는 이미지 경로(hidden input)도 초기화
         $('#empImgUrl').val('');
     });

	//파일명 미리 보기 호출
	$('#uploadFile').on('change', function(event) {
	    var file = event.target.files[0];
	    if (file) {
	        var reader = new FileReader();
	        reader.onload = function(e) {
	            // 새롭게 선택한 이미지를 미리보기로 보여줌
	            $('#profileImg').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(file);
	    }
	});


	//저장 버튼 클릭 시 데이터가 폼으로 전송됨
	$("#edit").on("click", function(){
		//form Data 객체 생성
		var formData = new FormData();
		
		//<input type="file" name="uploadFile"...
		let files = $("input[name='uploadFile']")[0].files;
		
		//1회 반복하겠지만..
		for(let i=0;i<files.length;i++){
			// 파일 추가 (키를 "uploadFile"로 가정)
			//<input type="file" name="uploadFile"...을 가상으로 만들어줌
			//<form><input type="file" name="uploadFile"... /></form>
			//가상의 <form 태그의 마지막 자식 요소로 파일객체를 넣어줌
			formData.append("uploadFile",files[i]);
		}
		
		//$("#memId").val() : 아이디 속성의 값이 medId인 요소의 값(emp24C1012)
		formData.append("memId",$("#memId").val()); //아이디
		
		formData.append("password",$("#password").val()); //비밀번호
		
		formData.append("empNm",$("#empNm").val()); //사원이름
		formData.append("empEml",$("#empEml").val()); //이메일
		formData.append("empZip",$("#empZip").val()); //우편번호
		formData.append("empRoadNmAddr",$("#empRoadNmAddr").val()); //주소 
		formData.append("empDaddr",$("#empDaddr").val()); //상세주소
		
		formData.append("empImgUrl",$("#empImgUrl").val()); //이미지경로
		
		formData.append("empYrycDaycnt",$("#empYrycDaycnt").val()); //연차일수 
		formData.append("empHdofStat",$("#empHdofStat").val()); //재직상태
		//formData : <form><input type="text" name="empRrno" value="20240912" /></form>
		formData.append("empRrno",$("#empRrno").val().replace(/-/g, '')); //생년월일 
		formData.append("empMoblphon",$("#empMoblphon").val().replace(/-/g, '')); //휴대전화
		formData.append("empJncmpYmd",$("#empJncmpYmd").val().replace(/-/g, '')); //입사일자
		formData.append("empRsgntnYmd",$("#empRsgntnYmd").val().replace(/-/g, '')); //퇴사일자
		
		formData.append("empGender",$("#empGender").val()); //성별
		formData.append("deptCd ",$("#deptCd").val()); //부서
		formData.append("jbgdCd  ",$("#jbgdCd").val()); //직급
		
		formData.append("authCode", $("#authCode").val());
		
		$.ajax({
			url : "/emp/employee/editPost",
			type:"POST",
			data:formData,
			processData:false,
			contentType:false,
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				console.log("response : ", response);
				$("#ajaxSuccessModal").modal('show');
				setTimeout(() => window.location.href="/emp/employee/detail?memId=" + $("#memId").val(), 1000);
			},
			error:function(xhr, status, error){
				console.log(error);
			}
		})
		
	})
	
	
    // 주소 api
	$("#btnPost").on("click",function(){
	   console.log("우편번호 검색!")
	    new daum.Postcode({
	       //다음 창에서 검색이 완료되어 클릭하면 콜백함수에 의해
	       // 결과 데이터(JSON string)가 data 객체로 들어옴
	        oncomplete: function(data) {
	           //data{"zonecode":"12345","address":"대전 중구","buildingName":"123-67"}
	         $("#empZip").val(data.zonecode);
	         $("#empRoadNmAddr").val(data.address);
	         $("#empDaddr").val(data.buildingName);
	         $("#addrDet").focus();
	        }
	    }).open();
	});
	  
});
</script>

<div id="container" >

<!-- 헤더 -->
<div id="tbox">
	<div id="title-box">
		<div class="title-txt">인사</div>
		<div class="title-txt">-</div>
		<div class="title-txt">사원</div>
		<div class="title-txt">-</div>
		<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">인사기록카드 수정</div>
	</div>
	<div id="btnBox"> 
			<button type="button" id="edit" class="btnEdit">저장</button>	
			<div class="btnEdit" onclick="window.location.href='/emp/employee/detail?memId=${employeeVO.memId}'">취소</div>	
	</div>
</div> 

<!-- 폼 박스 -->
<form id="content" action="/emp/employee/editPost" method="post">
	<div class="a">
	<div class="t1"></div>
	
		<!-- 프로필 사진 박스 -->
		<div class="a1-1">
		
			<!-- 기존이미지 표시 -->	
			<div class="a1-1-1" > 
			
			<c:if test="${empty employeeVO.empImgUrl}">
						<img id="profileImg" name="profileImg"
							src="/resources/images/profile.jpg" id="p    
							
							
							rofileImage">
					</c:if>
					<c:choose>
					    <c:when test="${!empty employeeVO.empImgUrl}">
					        <img id="profileImg" src="/download?filePath=${employeeVO.empImgUrl}&fileOrgnlFileNm=${employeeVO.empImgUrl}" onerror="this.onerror=null; this.src='/resources/images/profile.jpg';" />
					    </c:when>
					    <c:otherwise>
					        <img id="profileImg" src="/resources/images/profile.jpg" />
					    </c:otherwise>
					</c:choose>
				<!-- 이미지 표시해주는 경로  -->
<%-- 				<img id="profileImg"  name="profileImg" src="/download?filePath=${employeeVO.empImgUrl}&fileOrgnlFileNm=${employeeVO.empImgNm}" /> --%>
				<!-- 서버로 전송 -->
<%-- 				 <input type="hidden"  value="${employeeVO.empImgUrl}" id="empImgUrl"   name="empImgUrl"  /> --%>
			</div>
			
			<div class="a1-1-2" >
				
				<!-- 이미지 파일 선택 -->
				<label for="uploadFile" id="lalala" style="font-size: 14px;">사진 변경</label>
				<input type="file" class="btn btn-outline-primary btn2-1" name="uploadFile"
					style="font-size: 14px; display:none;"  id="uploadFile"/>
				
				<div class="delBtn" id="deleteImageBtn">삭제</div>
			</div>
			<div class="text2" style="font-size: 14px;">*프로필 사진 권장 최대 사이즈는 330x330px(10MB미만)입니다.</div>
		</div>
		<hr class="hr1">
		
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">이름</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="empNm" name="empNm"
					placeholder="이름입력"
					 value="${employeeVO.empNm}"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">비밀번호</div>
					<div class="a1-2-td2">
					<input type="password" class="input1" id="password" name="password"
					placeholder="비밀번호입력"
					 value="${spass}"/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">아이디</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="memId" value="${employeeVO.memId}"  readonly="readonly"
					style="background-color: #F0F0F0; color: #A4A4A4; "
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">부서</div>
					<div class="a1-2-td2">
					<select name="deptCd" class="input1" id="deptCd">
				        <option value="" ${employeeVO.deptCd == '' ? 'selected' : ''}>부서선택</option>
				        <option value="C1" ${employeeVO.deptCd == 'C1' ? 'selected' : ''}>회계부</option>
				        <option value="C2" ${employeeVO.deptCd == 'C2' ? 'selected' : ''}>인사부</option>
				        <option value="C3" ${employeeVO.deptCd == 'C3' ? 'selected' : ''}>물류부</option>
				        <option value="C4" ${employeeVO.deptCd == 'C4' ? 'selected' : ''}>시설부</option>
				    </select>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">직급</div>
					<div class="a1-2-td2">
  					<select name="jbgdCd" class="input1" id="jbgdCd">
					        <option value="" ${employeeVO.jbgdCd == '' ? 'selected' : ''}>직급선택</option>
					        <option value="B1" ${employeeVO.jbgdCd == 'B1' ? 'selected' : ''}>사장</option>
					        <option value="B2" ${employeeVO.jbgdCd == 'B2' ? 'selected' : ''}>부사장</option>
					        <option value="B3" ${employeeVO.jbgdCd == 'B3' ? 'selected' : ''}>부장</option>
					        <option value="B4" ${employeeVO.jbgdCd == 'B4' ? 'selected' : ''}>차장</option>
					        <option value="B5" ${employeeVO.jbgdCd == 'B5' ? 'selected' : ''}>과장</option>
					        <option value="B6" ${employeeVO.jbgdCd == 'B6' ? 'selected' : ''}>대리</option>
					        <option value="B7" ${employeeVO.jbgdCd == 'B7' ? 'selected' : ''}>사원</option>
					    </select>
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">성별</div>
					<div class="a1-2-td2">
				      <select name="empGender" class="input1" id="empGender">
				        <option value="V2" ${employeeVO.empGender == 'V2' ? 'selected' : ''}>남성</option>
				        <option value="V1" ${employeeVO.empGender == 'V1' ? 'selected' : ''}>여성</option>
				     </select>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">생년월일</div>
					<div class="a1-2-td2">
					<input type="date" class="input1" id="empRrno" name="empRrno"
					 value="${employeeVO.empRrno}"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">이메일</div>
					<div class="a1-2-td2">
					<input type="email" class="input1" name="empEml"  id="empEml"
						placeholder="이메일 입력"
					 value="${employeeVO.empEml}"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">휴대전화</div>
					<div class="a1-2-td2">
					<input type="text" class="input1"  id="empMoblphon"
					placeholder="전화번호 입력"
					 value="${employeeVO.empMoblphon}"
					/>
					<input type="text" id="empMoblphon1" hidden="" name="empMoblphon" />
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
					<select name="empHdofStat" class="input1" id="empHdofStat">
				        <option value="T1" ${employeeVO.empHdofStat == 'T1' ? 'selected' : ''}>재직</option>
				        <option value="T2" ${employeeVO.empHdofStat == 'T2' ? 'selected' : ''}>휴직</option>
				        <option value="T3" ${employeeVO.empHdofStat == 'T3' ? 'selected' : ''}>퇴직</option>
				    </select>					
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">입사일자</div>
					<div class="a1-2-td2">
					<input type="date" class="input1" id="empJncmpYmd" 
					 value="${employeeVO.empJncmpYmd}"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">퇴사일자</div>
					<div class="a1-2-td2">
					<input type="date" class="input1" id="empRsgntnYmd"
					 value="${employeeVO.empRsgntnYmd}" name="empRsgntnYmd"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">연차일 수</div>
					<div class="a1-2-td2">
					<input type="number" class="input1" placeholder="0" 
					id="empYrycDaycnt" name="empYrycDaycnt"
					value="${employeeVO.empYrycDaycnt}"/> 
					</div>
				</div>
			</div>
			
	
			
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">우편번호</div>
					<div class="a1-2-td2" id="a1-2-td2-box">
						<input type="text" name="empZip" id="empZip"
						 value="${employeeVO.empZip}" placeholder="우편번호 5자리"/>
						<button type="button" id="btnPost"  
						style="flex: 3; font-size: 14px;" 
						> 주소 검색</button>
					</div>
				</div>
				
				<div class="a1-2-tr">
					<div class="a1-2-td">주소</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="empRoadNmAddr"
					 value="${employeeVO.empRoadNmAddr}" name="empRoadNmAddr"
					 placeholder="주소 입력"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">상세주소</div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="empDaddr"
					 value="${employeeVO.empDaddr}"name="empDaddr"
					 placeholder="상세주소 입력"
					/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">권한부여</div>
					<div class="a1-2-td2">
						<select name="authCode" class="input1" id="authCode">
				        <option value="${employeeVO.authCode}">${employeeVO.authNm}</option>
						<c:forEach var="authVO" items="${authVOList}">
							<c:if test="${authVO.authCode != 'ROLE_MEMBER'}">
								<option value="${authVO.authCode}">${authVO.authNm}(${authVO.authCode})</option>
							</c:if>
						</c:forEach>
				    </select>			
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
	</div>

		<sec:csrfInput />
</form >
</div> <!-- container -->

<!-- 수정완료시 모달 -->
<div class="modal fade" id="ajaxSuccessModal" tabindex="-1" role="dialog" aria-labelledby="successModallabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>처리에 성공하였습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
