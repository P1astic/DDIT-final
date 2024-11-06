<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/bp/edit.css">
<script>
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
   
   //저장버튼 클릭   
   $("#edit").on("click", function(){
      //form Data 객체 생성
      var formData = new FormData();
      
//       <input type="file" name="uploadFile"...
      let files = $("input[name='uploadFile']")[0].files;
      
      for(let i=0;i<files.length;i++){
         formData.append("uploadFile",files[i]);
      }
      
       formData.append("memId", $("#memId").val()); //아이디 
       formData.append("bpImgUrl", $("#bpImgUrl").val()); //이미지경로
       
       formData.append("bpRprsvNm", $("#bpRprsvNm").val()); //대표자명
       formData.append("empId", $("#empId").val()); // 담당자명 

       formData.append("bpNm", $("#bpNm").val()); // 협력업체명
       formData.append("deptCd", $("#deptCd").val()); // 업체 분류
       formData.append("authCd", $("#authCode").val()); // 권한
       
       formData.append("frnSeCd", $("#frnSeCd").val()); // 권한private String frnSeCd;	
       
       
       formData.append("ctrtYmd", $("#ctrtYmd").val().replace(/-/g, ''));  // 계약 시작일자
       formData.append("ctrtEndYmd", $("#ctrtEndYmd").val().replace(/-/g, '')); // 계약 종료일자

       formData.append("bpBrno", $("#bpBrno").val().replace(/-/g, '')); // 사업자 등록번호
       formData.append("bpTelno", $("#bpTelno").val().replace(/-/g, ''));  // 유선번호
       formData.append("bpEml", $("#bpEml").val()); // 이메일
       
       
      $.ajax({
         url : "/bp/bpUser/registPost",
         type:"POST",
         data:formData,
         processData:false,
         contentType:false,
         dataType:"json",
         beforeSend:function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
         },
         success:function(response){
        	 /*
        	 response.put("result", "success");
				response.put("memId", bpVO.getMemId());
				
				response{"result":"success","memId":"bp24C6009"}
        	 */
            console.log("response : ", response);
            setTimeout(() => window.location.href="/bp/bpUser/detail?memId=" + response.memId, 1000);
         },
         error:function(xhr, status, error){
            console.log(error);
         }
      })
      
   });
   
   
});
</script>

<div id="container" >

   <!-- 헤더 -->
   <div id="tbox">
      <div id="title-box">
         <div class="title-txt">인사</div>
         <div class="title-txt">-</div>
         <div class="title-txt">협력직원</div>
         <div class="title-txt">-</div>
         <div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">인사기록카드 등록</div>
      </div>
      <div id="btnBox"> 
         <div id="edit" class="btnEdit">등록</div>
         <div class="btnEdit" onclick="window.location.href='/bp/bpUser/list'">취소</div>   
      </div>
   </div> 
   <!-- form -->
   <form id="content"  action="/bp/bpUser/editPost" method="post">
      <div class="a1">인사정보</div>
      
<!--       프로필박스 -->
      <div class="a2">
         <div class="a2-1">
          <!-- 프로필 이미지가 없으면 기본 이미지 --> 
				<c:if test="${empty bpVO.bpImgUrl}">
					<img id="profileImg" name="profileImg"
						src="/resources/images/profile.jpg" id="profileImage">
				</c:if>
				<!--추가할 프로필 이미지가 있으면 추가한 이미지  -->
              <c:if test="${!empty bpVO.bpImgUrl}" >
            <img id="profileImg" src="/download?filePath=/${bpVO.bpNm}/${bpVO.bpImgUrl}&fileOrgnlFileNm=${bpVO.bpImgUrl}" />
           </c:if>
<%--             <input type="hidden" id="bpImgNm" name="bpImgNm" value="${bpVO.bpImgNm}"> --%>
         </div>
         <div class="a2-2">
<!--             이미지 파일 선택 -->
            <label for="uploadFile" class="btnEdit">사진 변경</label>
            <input type="file" class="btnEdit" name="uploadFile"
               style="font-size: 14px; display:none;"  id="uploadFile"/>
            <div class="btnEdit" id="deleteImageBtn">삭제</div>   
         </div>
         <div style="font-size: 14px;">*프로필 사진 권장 최대 사이즈는 330x330px(10MB미만)입니다.</div>
      </div>
      
      <hr class="hr1">
      
      <!-- 데이터박스 -->
      <div class="a3">
         <!--  왼쪽-->
         <div class="a3-1">
            
            <div class="a3-1-1" >
               <div class="a3-1-1-1">대표자명<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="text" class="input1" placeholder="이름 입력"
               			 id="bpRprsvNm" name="bpRprsvNm" value="${bpVO.bpRprsvNm}" />
               </div>
            </div>

            <div class="a3-1-1" >
               <div class="a3-1-1-1">담당자<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <select class="input1" id="empId" name="empId">
                  <option value="" disabled="disabled">선택</option>
                  <c:forEach var="empVO" items="${empVOList}" varStatus="stat">
                      <option value="${empVO.memId}" ${bpVO.empId == empVO.memId ? 'selected' : ''}>${empVO.empNm}</option>
                  </c:forEach>
                </select>
               </div>
            </div>
            <div class="a3-1-1" >
               <div class="a3-1-1-1">업체구분<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <select class="input1" id="frnSeCd" name="frnSeCd">
                  <option value="" disabled="disabled">선택</option>
                  <c:forEach var="frnSeCdVO" items="${selFrnSeCd}" varStatus="stat">
                      <option value="${frnSeCdVO.comDetCd}" ${frnSeCdVO.comDetCd == frnSeCdVO.comDetCd ? 'selected' : ''}>${frnSeCdVO.comDetCdCn}</option>
                  </c:forEach>
                </select>
               </div>
            </div>
         </div>
       
         
         <!-- 오른쪽 -->
         <div class="a3-1">
         
            <div class="a3-1-1" >
               <div class="a3-1-1-1">협력업체명<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="text" class="input1" placeholder="업체명 입력" 
               				id="bpNm" name="bpNm" value="${bpVO.bpNm}"/>
               </div>
            </div>
            
            <div class="a3-1-1" >
               <div class="a3-1-1-1">업체분류<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
                  <select class="input1" id="deptCd" name="deptCd" >
                      <option value="" disabled="disabled">선택</option>
                      <c:forEach var="deptVO" items="${deptList}" varStatus="stat">
                      <c:if test="${deptVO.deptCd == 'C5' || deptVO.deptCd == 'C6' || deptVO.deptCd == 'C7' }">
                          <option value="${deptVO.deptCd}" ${bpVO.deptCd == deptVO.deptCd ? 'selected' : ''}>${deptVO.deptNm}</option>
                      </c:if>
                      </c:forEach>
                  </select>
               </div>
            </div>
            
            <div class="a3-1-1">
                <div class="a3-1-1-1">권한<span style="color:red"> *</span></div>
                <div class="a3-1-1-2">
                  <select class="input1" id="authCode" name="authCd">
                      <option value="" disabled="disabled">선택</option>
                      <c:forEach var="authVO" items="${authList}" varStatus="stat">
                          <option value="${authVO.authCode}" ${bpVO.authCode == authVO.authCode ? 'selected' : ''}>${authVO.authNm}&nbsp;(${authVO.authCode})</option>
                      </c:forEach>
                  </select>
                </div>
            </div>
            
         </div> <!-- 오른쪽 -->
         
      </div><!-- a3 끝 -->

      <hr class="hr1">

      <div class="a3">
         <!--  왼쪽-->
         <div class="a3-1">
<!--             <div class="a3-1-1" > -->
<!--                <div class="a3-1-1-1">계약상태</div> -->
<!--                <div class="a3-1-1-2"> -->
<!--                 <input type="text" class="input1" readonly="readonly" -->
<%--                				id="bpCtrtStat" name="bpCtrtStat" value="${bpVO.bpCtrtStat}"/> --%>
<!--                </div> -->
<!--             </div> -->
            <div class="a3-1-1" >
               <div class="a3-1-1-1">계약시작일자<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="date" class="input1" value="${bpVO.ctrtYmd}" id="ctrtYmd" name="ctrtYmd" />
               </div>
            </div>
            <div class="a3-1-1" >
               <div class="a3-1-1-1">계약종료일자<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="date" class="input1" id="ctrtEndYmd" name="ctrtEndYmd" value="${bpVO.ctrtEndYmd}" />
               </div>
            </div>
         </div>
         
         <!-- 오른쪽 -->
         <div class="a3-1">
            <div class="a3-1-1" >
               <div class="a3-1-1-1">사업자등록번호<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="text" class="input1" id="bpBrno" name="bpBrno"
               				 placeholder="사업자등록번호 8자리 입력" value="${bpVO.bpBrno}"/>
               </div>
            </div>
            <div class="a3-1-1" >
               <div class="a3-1-1-1">유선번호<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="text" class="input1" placeholder="전화번호 9자리 입력"
               			 id="bpTelno" name="bpTelno" value="${bpVO.bpTelno}"/>
               </div>
            </div>
            <div class="a3-1-1" >
               <div class="a3-1-1-1">이메일<span style="color:red"> *</span></div>
               <div class="a3-1-1-2">
               <input type="email" class="input1" placeholder="이메일 입력"
               			 id="bpEml" name="bpEml" value="${bpVO.bpEml}" />
               </div>
            </div>
         </div>
      </div><!-- a3 끝 -->
   </form>
   
</div>
