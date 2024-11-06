<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/emp/list.css">
<script type="text/javascript">
$(function(){

	//검색 초기화 버튼
	$("#reset").on("click",function(){
		   window.location.href = "/emp/employee/list";
	});
	
   //부서선택 select box 요소 -> 변화가 있을 때 콜백함수를 실행
   $("#selgetDept").on("change",function(){
      console.log("잘 됨");
      
      //this : 변화가 있는 바로 그 요소(select box)
      let getDepts = $(this).val();
      console.log("getDepts : ", getDepts);
      
      //searchForm : <form id="searchForm" class....>
      //action이 없음. method가 없음.
      //action은 자동으로 본인 /emp/list
      //method는 자동으로 get
      
      ///emp/list?getDepts=C1&gubun=all&keyword=
      $("#searchForm").submit();
   });
   
   //직급선택
   $("#selGetJobGrade").on("change",function(){
      let getJobGrades = $(this).val();
      
      $("#searchForm").submit();
   });

   //재직상태 선택
   $("#selGetEmpStat").on("change",function(){
      let getEmpStats = $(this).val();
      
      $("#searchForm").submit();
   });
   //사원등록 버튼
   $("#btnRegist").on("click",function(){
	   window.location.href = "/emp/employee/regist";
   });
   
   
});
</script>
<div id="container">
   <div id="title-box">
   <div id="tt-1">
      <div class="title-txt">인사</div>
      <div class="title-txt">-</div>
      <div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">사원목록</div>
   </div>
	    <button type="button" id="btnRegist">사원등록</button>
   </div>
   
   
   <div class="card-body" id="cc">
      <!-- 검색어 검색 -->
	   <form id="searchForm" class="" >
	
	         <!-- 
	         param : getDepts=C2&gubun=all&keyword=
	          -->
			<div class="sel-option-box">
		       <div class="lala">상태</div>
		      <select id="selGetEmpStat" name="getEmpStats" class="input1">
		         <option value=""
		            <c:if test="${empty param.getEmpStats}">selected</c:if>>전체</option>
		         <c:forEach var="vo" items="${getEmpStat}">
		            <option value="${vo.comDetCd}"
		               <c:if test="${param.getEmpStats == vo.comDetCd}">selected</c:if>
		            >${vo.comDetCdCn}</option>
		         </c:forEach>
		      </select>
		
		      
		
		     <div class="lala">부서</div>
		      <select id="selgetDept" name="getDepts" class="input1">
		         <option value=""
		            <c:if test="${empty param.getDepts}">selected</c:if>
		         >전체</option>
		         <c:forEach var="vo" items="${getDept}">
		            <option value="${vo.deptCd}"
		               <c:if test="${param.getDepts == vo.deptCd}">selected</c:if>
		            >${vo.deptNm}</option>
		         </c:forEach>
		      </select>
		      
		      <div class="lala">직급</div>
		      <select id="selGetJobGrade" name="getJobGrades" class="input1">
		         <option value=""
		            <c:if test="${empty param.getJobGrades}">selected</c:if>
		         >전체</option>
		         <c:forEach var="vo" items="${getJobGrade}">
		            <option value="${vo.jbgdCd}"
		               <c:if test="${param.getJobGrades == vo.jbgdCd}">selected</c:if>
		            >${vo.jbgdNm}</option>
		         </c:forEach>
		      </select>
		     </div>
	      <!--sel-option-box  -->
	      
	      <!-- gubun-search-box -->
	      <div class="gubun-box">
	         <div class="lala">분류</div>
	         <select id="selGubun" name="gubun" class="input1">
	            <option value="all" selected>전체</option>
	            <option value="empNm"
	               <c:if test="${param.gubun=='empNm'}">selected</c:if>>이름</option>
	            <option value="email"
	               <c:if test="${param.gubun=='email'}">selected</c:if>>이메일</option>
	            <option value="phone"
	               <c:if test="${param.gubun=='phone'}">selected</c:if>>휴대전화</option>
	            <option value="deptNm"
	               <c:if test="${param.gubun=='deptNm'}">selected</c:if>>부서명</option>
	            <option value="jbgdNm"
	               <c:if test="${param.gubun=='jbgdNm'}">selected</c:if>>직급명</option>
	            <option value="empHdofStat"
	               <c:if test="${param.gubun=='empHdofStat'}">selected</c:if>>재직상태</option>
	         </select>
	      <div class="kk">
	         <input type="text" id="keyword" name="keyword"
	            placeholder="검색어 입력" value="${param.keyword}"/>
		     
	      <button type="submit" id="searchSubmitBtn">
	         	<img src="/resources/images/icon/searchBtn.png" id="immmm">
	         </button>
<!-- 	          <button type="button" id="reset" class="btn btn-default" -->
<!-- 	         style="width: 100px; font-size: 10px;">초기화</button> -->
		 </div>
	         </div>
	         <!-- gubun-search-box 끝-->
	         
	   </form>
 
      <table class="table table-hover text-nowrap" id="cc-1">
         <thead style="background: #e4e4e463;" >
            <tr>
               <th width="2%"></th>
               <th>No</th>
               <th>부서</th>
               <th>직급</th>
               <th>이름</th>
               <th>이메일</th>
               <th>휴대전화</th>
               <th>상태</th>
<!--                <th>계정상태</th> -->
          	 <th width="2%"></th>
            </tr>
         </thead>
         <tbody>
          <!-- 
          articlePage.content : List<EmployeeVO>
           -->
          <c:forEach var="employeeVO" items="${articlePage.content}" varStatus="stat">
            <tr onclick="redirectToDetail(event, '${employeeVO.memId}')" style="cursor: pointer;" id="trtrtr">
               <td width="2%"></td>
               <td>${employeeVO.rnum}</td>
               <td>${employeeVO.department.deptNm}</td>
               <td>${employeeVO.jobGrade.jbgdNm}</td>
               <td>${employeeVO.empNm}</td>
               <td style="text-align: start; padding-left: 30px;">${employeeVO.empEml}</td>
               <td>${employeeVO.empMoblphon}</td>
               <td>
                     <c:choose>
                       <c:when test="${employeeVO.empHdofStat =='T1'}"> <span style="color: #1890FF;">재직</span></c:when>
                       <c:when test="${employeeVO.empHdofStat =='T2'}"> <span style="color: red;">휴직</span></c:when>
                       <c:when test="${employeeVO.empHdofStat =='T3'}"><span style="color: gray;">퇴사</span></c:when>
                       <c:otherwise>기타</c:otherwise>
                   </c:choose>
               </td>
<!--                <td> -->
             
<%--                      <c:choose> --%>
<%--                        <c:when test="${employeeVO.memberVO.enabled == 0}">비활성화</c:when> --%>
<%--                        <c:when test="${employeeVO.memberVO.enabled == 1}">활성화</c:when> --%>
<%--                        <c:otherwise>기타</c:otherwise> --%>
<%--                    </c:choose> --%>
<!--                </td> -->
               <td width="2%"></td>
            </tr>
           </c:forEach>
         </tbody>
      </table>
        <div class="board-footer">
                    ${articlePage.pagingArea}
         </div>
   </div>
</div><!-- card 끝 -->

<script>
function redirectToDetail(event, memId) {
     
   // 체크박스 클릭 시 페이지 이동 방지
    if (event.target.type === 'checkbox') {
      return;
    }
    window.location.href = '/emp/employee/detail?memId=' + memId;
  }
  

</script>