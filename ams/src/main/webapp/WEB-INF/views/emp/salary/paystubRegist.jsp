<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css" href="/resources/css/salary/paystubRegist.css">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<div class="titleHeader d-flex align-items-center">
	<div>
		<span style="color:#A4A4A4; font-family: Pretendard; font-size:20px; font-weight: 600; word-wrap: break-word;">인사 - 급여 - </span>
		<span style="font-family: Pretendard; font-size:20px; font-weight: 600; word-wrap: break-word;">급여명세서 생성</span>
	</div>
</div>
<!-- 기본항목, 임금지급내역, 공제항목 등 전체 div -->
<div class="border d-flex flex-column _container card" style="font-family: Pretendard">
	<div class="_divHead">
		<span>기본항목</span>
	</div>
	<div class="border d-flex flex-row p-3 _divBody">
		<div class="d-flex align-items-center">
			<label for="selectDept" class="col-form-label ml-3 mr-3">부서 : </label>
			<select id="selectDept" name="selectDept" class="_input" style="width:auto;">
				<option value="" selected disabled>부서선택</option>
				<c:forEach var="deptVO" items="${deptVOList }">
					<option value="${deptVO.deptCd }">${deptVO.deptNm }</option>
				</c:forEach>
			</select>
		</div>
		<div class="d-flex align-items-center">
			<label for="selectEmp" class="col-form-label ml-3 mr-3">직원명 : </label>
			<select id="selectEmp" name="selectEmp" class="_input" style="width:auto;">
				<option value="" selected disabled>직원선택</option>
			</select>
		</div>
		<div class="d-flex align-items-center">
			<label for="selectSalaryDay" class="col-form-label ml-3 mr-3">지급일 : </label>
			<input type="date" id="selectSalaryDay" name="selectSalaryDay" class="_input" style="width:auto;">
		</div>
	</div>
	<div class="_divHead">
		<span>임금지급내역</span>
	</div>
	<div class="border d-flex flex-column _divBody">
		<div class="d-flex flex-row p-3 align-items-center">
			<label for="hourly" class="col-form-label ml-3 mr-3 _leftlabel">급여제도 : </label>
			<input type="radio" id="hourly" name="wageType" value="시급" checked/>
			<label for="hourly" class="col-form-label ml-3 mr-3">시급</label>
			<input type="radio" id="daily" name="wageType" value="일급"/>
			<label for="daily" class="col-form-label ml-3 mr-3">일급</label>
			<input type="radio" id="monthly" name="wageType" value="월급"/>
			<label for="monthly" class="col-form-label ml-3 mr-3">월급</label>
		</div>
		<div class="d-flex flex-row p-3 align-items-center">
			<label for="payment" class="col-form-label ml-3 mr-3 _leftlabel">임금 항목</label>
			<select id="payment" name="payment" class="_input" style="width:auto;">
				<option value="" selected disabled>임금 항목을 선택하세요</option>
                <option value="FAMILY">가족수당</option>
                <option value="OVERTIME">연장근로수당</option>
                <option value="NIGHT">야간근로수당</option>
                <option value="HOLIDAY">휴일근로수당</option>
                <option value="DAYOFF">연차휴가수당</option>
                <option value="JOBGRADE">직책수당</option>
			</select>
			<button type="button" class="btn btn-primary ml-3 _btn-payment-add">추가</button>
		</div>
	</div>

	<div class ="d-flex flex-column _div-payment _divBody">
		<!-- 기본급 -->
		<div class="border d-flex flex-column _base">
			<div class="d-flex flex-row p-3 align-items-center _divBody" style="font-size:16px;">
				<label class="ml-3 mr-3 col-form-label _leftlabel">기본급</label>
				<div class="_BSalary"><!-- 기본급 입력시 자동으로 바뀌게 -->
					000,000,000원
				</div>
			</div>
		</div>
		<!-- 시급 기본으로 나옴-->
		<div class="flex-column _base hourly">
			<div class="d-flex flex-row p-3 align-items-center">
				<label for="workHour" class="col-form-label ml-3 mr-3 _leftlabel">근로시간</label>
				<input type="text" id="workHour" name="workHour" class="form-control _input" placeholder="ooo" numberonly="">시간
			</div>
			<div class="d-flex flex-row p-3 align-items-center">
				<label for="hourWage" class="col-form-label ml-3 mr-3 _leftlabel">시급</label>
				<input type="text" id="hourWage" name="hourWage" class="form-control _input" placeholder="ooo,ooo,ooo" numberonly="">원
			</div>
		</div>
		<!-- 일급 -->
		<div class="border flex-column _base daily" style="display:none;">
			<div class="d-flex flex-row p-3 align-items-center">
				<label for="workDay" class="col-form-label ml-3 mr-3 _leftlabel">근로일</label>
				<input type="text" id="workDay" name="workDay" class="form-control _input" placeholder="ooo" numberonly="">일
			</div>
			<div class="d-flex flex-row p-3 align-items-center">
				<label for="dayWage" class="col-form-label ml-3 mr-3 _leftlabel">일급</label>
				<input type="text" id="dayWage" name="dayWage" class="form-control _input" placeholder="ooo,ooo,ooo" numberonly="">원
			</div>
		</div>
		<!-- 월급 -->
		<div class="border flex-column _base monthly" style="display:none;">
			<div class="d-flex flex-row p-3 align-items-center">
				<label for="monthWage" class="col-form-label ml-3 mr-3 _leftlabel">월급</label>
				<input type="text" id="monthWage" name="monthWage" class="form-control _input" placeholder="ooo,ooo,ooo" numberonly="">원<!-- 월급 누르면 나옴 -->
			</div>
		</div>
	</div>
	<div class="border d-flex flex-row align-items-center" style="font-size:20px;">
		<label for="sumWage" class="col-form-label p-3 ml-3 mr-3 _leftlabel">지급액 계</label>
		<button type="button" id="sumWage" class="btn btn-primary _calc-wage">임금 계산</button>
		<span class="p-3 align-items-center _sumWage">
			000,000,000원
		</span>				
	</div>
	<div class="_divHead">
		<span>공제내역</span>
		<span class="_parenthesis">(금액을 입력하지 않으면 '0'원 처리됩니다.)</span>
	</div>
	<div class="border d-flex flex-column _div-deduction">
		<div class="flex-column">
			<div class="d-flex flex-row p-3 align-items-center _divBody">
				<label for="income" class="col-form-label ml-3 mr-3 _leftlabel">소득세</label>
				<input type="text" id="income" name="income" class="_input deduction" placeholder="ooo,ooo,ooo" numberonly="">원
			</div>
			<div class="d-flex flex-row p-3 align-items-center _divBody">
				<label for="pension" class="col-form-label ml-3 mr-3 _leftlabel">국민연금</label>
				<input type="text" id="pension" name="pension" class="_input deduction" placeholder="ooo,ooo,ooo" numberonly="">원
			</div>
			<div class="d-flex flex-row p-3 align-items-center _divBody">
				<label for="health" class="col-form-label ml-3 mr-3 _leftlabel">건강보험</label>
				<input type="text" id="health" name="health" class="_input deduction" placeholder="ooo,ooo,ooo" numberonly="">원
			</div>
			<div class="d-flex flex-row p-3 align-items-center _divBody">
				<label for="employee" class="col-form-label ml-3 mr-3 _leftlabel">고용보험</label>
				<input type="text" id="employee" name="employee" class="_input deduction" placeholder="ooo,ooo,ooo" numberonly="">원
			</div>
		</div>
	</div>
	<div class="border d-flex flex-row align-items-center" style="font-size:20px;">
		<label for="totalDeduction" class="col-form-label ml-3 mr-3 p-3 _leftlabel" >공제액 계</label>
		<button type="button" id="totalDeduction" class="btn btn-primary _calc-deduction">공제액 계산</button>
		<span class="p-3 align-items-center _totalDeduction">
			000,000,000원
		</span>				
	</div>
	<div class="border d-flex flex-row align-items-center" style="font-size:20px;">
		<label for="totalAmt" class="col-form-label ml-3 mr-3 p-3 _leftlabel">실지급액 계</label>
		<button type="button" id="totalAmt" class="btn btn-primary _calc-total">실지급액 계산</button>
		<span class="p-3 align-items-center _totalWage">
			000,000,000원
		</span>
	</div>
	<div>
		<button type="button" id="paystubRegist" name="paystubRegist" class="btn btn-primary _paystubRegist">급여명세서 생성</button>
	</div>
</div>


<!-- 임금항목 선택안하고 추가할 시 오류 -->
<div class="modal fade" id="selectNullModal" tabindex="-1" role="dialog" aria-labelledby="selectNullModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>임금 항목을 선택해주세요</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 임금항목 중복 추가할 시 오류 -->
<div class="modal fade" id="selectDuplicatedModal" tabindex="-1" role="dialog" aria-labelledby="selectDuplicatedModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>이미 추가된 항목입니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 근로시간 또는 시급을 입력하지 않았을때 -->
<div class="modal fade" id="noValueModal" tabindex="-1" role="dialog" aria-labelledby="noValueModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>모든항목을 입력해주세요.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 생성 성공 모달 -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>급여명세서를 생성했습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- PDF 생성을 위한 급여명세서 테이블 HTML -->
<div class="flex-column _paystubPdf" style="font-family:NanumGothic; display:none;">
    <p style="font-size : 35px; margin-bottom:0px;">급여명세서</p>
    <p style="font-size : 25px; margin-top:0px; text-decoration:underline" id="salaryMonth"></p>
    <table class="_upperTable" style="width: 100%; height: 100%; text-align: center; vertical-align: middle; border-collapse: collapse; margin-top:40px;">
        <!-- 상단 테이블 -->
        <thead class="_upperTableHead">
            <tr style="height:40px;">
                <th style="border: 1px solid black; background-color:#F2F2F2; font-size:30px;">부서</th>
                <th colspan="3" class="_selectDeptTable" style="border: 1px solid black; font-size:30px;"></th>
            </tr>
            <tr style="height:40px;">
                <th style="border: 1px solid black; background-color:#F2F2F2; font-size:30px;">성명</th>
                <th colspan="3" class="_selectEmpTable" style="border: 1px solid black; font-size:30px;"></th>
            </tr>
            <tr style="height:40px;">
                <th style="border: 1px solid black; background-color:#F2F2F2; font-size:30px;">지급일</th>
                <th colspan="3" class="_selectSalaryDateTable" style="border: 1px solid black;  font-size:30px;"></th>
            </tr>	  
        </thead>
    </table>
    <table class="_middleTable" style="width: 100%; height:100%; text-align: center; vertical-align: middle; border-collapse: collapse; margin-top:30px;">
        <thead class="_middleTableHead">
            <tr style="height:50px;">
                <th colspan="2" style="border: 1px solid black; background-color:#123763; font-size:25px; color:white;">임금지급내역</th>
                <th colspan="2" style="border: 1px solid black; background-color:#123763; font-size:25px; color:white;">공제내역</th>
            </tr>
        </thead>
        <tbody>
            <tr style="height:40px;">
                <td style="border: 1px solid black; background-color:#2C5F99; font-size:25px; color:white; font-weight: bolder;">임금항목</td>
                <td style="border: 1px solid black; background-color:#2C5F99; font-size:25px; color:white; font-weight: bolder;">지급금액(원)</td>
                <td style="border: 1px solid black; background-color:#2C5F99; font-size:25px; color:white; font-weight: bolder;">공제항목</td>
                <td style="border: 1px solid black; background-color:#2C5F99; font-size:25px; color:white; font-weight: bolder;">지급금액(원)</td>
            </tr>
            <tr style="height:35px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">기본급</td>
                <td class="_BSalaryTable" style="border: 1px solid black; font-size:25px;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">소득세</td>
                <td class="_SalaryTaxTable" style="border: 1px solid black; font-size:25px;"></td>
            </tr>
            <tr style="height:35px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">가족수당</td>
                <td class="_FamilyTable" style="border: 1px solid black; font-size:25px;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">국민연금</td>
                <td class="_PensionTable" style="border: 1px solid black; font-size:25px;"></td>
            </tr>
            <tr style="height:35px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">연장근로수당</td>
                <td class="_OvertimeTable" style="border: 1px solid black; font-size:25px;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">건강보험</td>
                <td class="_HealthTable" style="border: 1px solid black; font-size:25px;"></td>
            </tr>
            <tr style="height:35px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">야간근로수당</td>
                <td class="_NightTable" style="border: 1px solid black; font-size:25px;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">고용보험</td>
                <td class="_EmployeeTable" style="border: 1px solid black; font-size:25px;"></td>
            </tr>
            <tr style="height:35px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">휴일근로수당</td>
                <td class="_HolidayTable" style="border: 1px solid black; font-size:25px;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2;"></td>
                <td style="border: 1px solid black;"></td>
            </tr>
            <tr style="height:35px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">연차휴가수당</td>
                <td class="_DayoffTable" style="border: 1px solid black; font-size:25px;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2;"></td>
                <td style="border: 1px solid black;"></td>
            </tr>
            <tr style="height:35px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; color:#2C5F99; font-weight: bolder;">직책수당</td>
                <td class="_JobgradeTable" style="border: 1px solid black; font-size:25px;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2;"></td>
                <td style="border: 1px solid black;"></td>
            </tr>
            <tr style="height:35px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; font-weight: bolder;">지급액 계</td>
                <td class="_SumwageTable" style="border: 1px solid black; font-size:25px; font-weight: bolder;"></td>
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; font-weight: bolder;">공제액계</td>
                <td class="_totalDeductionTable" style="border: 1px solid black; font-size:25px; font-weight: bolder;"></td>
            </tr>
            <tr style="height:35px;">
                <td style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; font-weight: bolder;">실지급액</td>
                <td colspan="3" class="_totalWageTable" style="border: 1px solid black; background-color:#F2F2F2; font-size:25px; font-weight: bolder;"></td>
            </tr>
        </tbody>
    </table>
</div>
<script>
let eventBinding = function(){
    // 3자리마다 콤마 추가
    $("[numberonly]").off("keyup").on("keyup", function(){
        let x = $(this).val();
        x = x.replace(/[^0-9.-]/g,'');   // 입력값이 숫자 혹은 .이 아니면 공백
        x = x.replace(/,/g,'');        // ,값 공백처리

        let point = x.split(".")[1] != undefined ? x.split(".")[1] : '';

        if(x.indexOf(".") > -1) {
            x = x.split(".")[0];
            point = "." + point;
        }

        $(this).val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + point); // 정규식을 이용해서 3자리 마다 , 추가
    });
}

$(function(){
    eventBinding();
    
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    
    var formattedDate = year + "." + (month < 10 ? "0" + month : month) + "월";
    $("#salaryMonth").text(formattedDate);
    
    
	$("#selectDept").on("change", function(){
		var selectedDeptCd = $("option:selected", this).val()
		
		var selectedData = {
			deptCd : selectedDeptCd
		}
		
		$.ajax({
			url:"/emp/salary/selectDept",
			contentType:"application/json; charset=utf-8",
			data: JSON.stringify(selectedData),
			type:"POST",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(response){
				$("#selectEmp").empty();
				var base = $("<option value=''" + " selected disabled>직원선택</option>");
				$("#selectEmp").append(base);
				for(var i = 0; i<response.length; i++){
					var option = $("<option value='" + response[i].memId + "'>" +response[i].empNm + "</option>");
					$("#selectEmp").append(option);
				}
			},
			error:function(xhr, status, error){
				console.log("Error : " + error);
			}
		})
	})
	
	//급여제도 라디오버튼
	$("input[name=wageType]").on("click", function(){
		$("._base").hide();
		$("._base").find("input").val('');
		$("._base." + $(this).attr("id")).show();
		$("._BSalary").text("000,000,000원");
		$("._totalWage").text("000,000,000원");
	})
	
	$("._btn-payment-add").on("click", function(){
        let selectedVal = $("#payment").find('option:selected').val();
        let selectedTxt = $("#payment").find('option:selected').text();
        
        var uniqueId = "payment_" + selectedVal;
        
        if(selectedVal == ''){
        	$("#selectNullModal").modal('show');
        }else{
        	console.log($("#" + uniqueId).length)
        	if($("#" + uniqueId).length !== 0){
        		$("#selectDuplicatedModal").modal('show');
        		return false;
        	}
        	
        	//항목 추가되는 로직
        	let htmlRow = '';
        	htmlRow += '<div class="border flex-column htmlRow">'
			htmlRow += '	<div class="d-flex flex-row p-3 align-items-center">'
            htmlRow += '		<label for="RID" class="col-form-label ml-3 mr-3 _leftlabel">RTITLE</label>'
			htmlRow += '		<input type="text" id="RID" class="form-control _input addedPayment" placeholder="ooo,ooo,ooo" numberonly="">원'
			htmlRow += '		<input type="button" class="btn btn-primary ml-3 mr-3 _removePayment" value="삭제">'
			htmlRow += '	</div>'
			htmlRow += '</div>'
			
			htmlRow = htmlRow.replace(/RID/gi, uniqueId);
			htmlRow = htmlRow.replace(/RTITLE/gi, selectedTxt);
			
			$("._div-payment").append(htmlRow);
			
			eventBinding();
        }
	})
	
	$(document).on("click", "._removePayment", function(){
		$(this).closest('.htmlRow').remove();
	})
	
     $(document).on("click", "._removeDeduction", function(){
    	 $(this).closest('.htmlRow2').remove();
     })
     
     $("._calc-wage").on("click", function(){
    	 totalPayment = 0;
    	 
    	 if($("input[name=wageType]:checked").attr("id") == "hourly"){
    		
    		var hasEmpty = false;
    		
    		$(".addedPayment").each(function(){
    			if($(this).val() == ''){
    				hasEmpty = true;
    			}
    		})
    		
    		if($("#workHour").val() =='' || $("#hourWage").val()=='' || hasEmpty){
    			$("#noValueModal").modal('show');
    		}else{
				let workHour = parseFloat($("#workHour").val().replace(/,/g, ''));
				let hourWage = parseFloat($("#hourWage").val().replace(/,/g, ''));
				
				$(".addedPayment").each(function(){
					let paymentValue = parseFloat($(this).val().replace(/,/g, ''));
					totalPayment += paymentValue;
				})
				
				var BSalary = (workHour * hourWage).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var totalWage = (workHour * hourWage + totalPayment).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
				$("._BSalary").text(BSalary +"원");
				$("._sumWage").text(totalWage +"원");
    		}
    	 }else if($("input[name=wageType]:checked").attr("id") == "daily"){
			totalPayment = 0;
    		 
    		var hasEmpty = false;
    		
			$(".addedPayment").each(function(){
				if($(this).val() == ''){
					hasEmpty = true;
				}
			})
    		 
			if($("#workDay").val() =='' || $("#dayWage").val()=='' || hasEmpty){
				$("#noValueModal").modal('show');
			}else{
	    		let workDay = parseFloat($("#workDay").val().replace(/,/g, ''));
	    		let dayWage = parseFloat($("#dayWage").val().replace(/,/g, ''));
	    		 
	 			$(".addedPayment").each(function(){
					let paymentValue = parseFloat($(this).val().replace(/,/g, ''));
					totalPayment += paymentValue;
				}) 
				
				var BSalary = (workDay * dayWage).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var totalWage = (workDay * dayWage + totalPayment).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
				$("._BSalary").text(BSalary +"원");
				$("._sumWage").text(totalWage +"원");
				}
    	 }
    	 else if($("input[name=wageType]:checked").attr("id") == "monthly"){
    		 
    		var hasEmpty = false;
    		
			$(".addedPayment").each(function(){
				if($(this).val() == ''){
					hasEmpty = true;
				}
			})
    		 
    		 if($("#monthWage").val()=='' || hasEmpty){
    			 $("#noValueModal").modal('show');
			}else{
	    		totalPayment = 0;
	    		let monthWage = parseFloat($("#monthWage").val().replace(/,/g, ''));
	    		 
	  			$(".addedPayment").each(function(){
					let paymentValue = parseFloat($(this).val().replace(/,/g, ''));
					totalPayment += paymentValue;
				}) 
	    		 
				var totalWage = (monthWage + totalPayment).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
				
				$("._BSalary").text(totalWage + "원");
				$("._sumWage").text(totalWage + "원");
			}
    	 }
     })
     
     $("._calc-deduction").on("click", function(){
    	 totalDeduction = 0;
    	 
    	 $(".deduction").each(function(){
    		 if($(this).val() == ''){
    			 console.log("121312231")
    			 $(this).val('0');
    		 }
    		 let deductionValue = parseFloat($(this).val().replace(/,/g, ''));
    		 totalDeduction += deductionValue;
    	 })
    	 
    	 var total = totalDeduction.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	 
    	 $("._totalDeduction").text(total + "원");
     })
     
     $("._calc-total").on("click", function(){
    	    // 1. 총 급여와 공제액 가져오기
    	    let sumWage = parseFloat($("._sumWage").text().replace(/,/g, '').replace('원', ''));
    	    let totalDeduction = parseFloat($("._totalDeduction").text().replace(/,/g, '').replace('원', ''));
    	    
    	    // 2. 계산: 총 급여에서 공제액 빼기
    	    let netWage = (sumWage - totalDeduction).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	    
    	    $("._totalWage").text(netWage + "원");
     })
     
     $("#paystubRegist").on("click", function(){
    	 
    	 if($("#selectDept").val() == '' || $("#selectEmp").val() == '' || $("#selectSalaryDay").val() == ''
    		|| $("._sumWage").text() =='000,000,000원' || $("._totalDeduction").text() == '000,000,000원'
    		|| $("._totalWage").text() == '000,000,000원'
    	 ){
    		 $("#noValueModal").modal('show');
    	 }else{
	    	 let registData = {
	    			    SALARY_DATE: $("#selectSalaryDay").val(),
	    			    MEM_ID: $("#selectEmp option:selected").val(),
	    			    FAMILY: $("#payment_FAMILY").val() ? parseInt($("#payment_FAMILY").val().replace(/,/g, '')) : 0,
	    			    OVERTIME: $("#payment_OVERTIME").val() ? parseInt($("#payment_OVERTIME").val().replace(/,/g, '')) : 0,
	    			    NIGHT: $("#payment_NIGHT").val() ? parseInt($("#payment_NIGHT").val().replace(/,/g, '')) : 0,
	    			    HOLIDAY: $("#payment_HOLIDAY").val() ? parseInt($("#payment_HOLIDAY").val().replace(/,/g, '')) : 0,
	    			    DAYOFF: $("#payment_DAYOFF").val() ? parseInt($("#payment_DAYOFF").val().replace(/,/g, '')) : 0,
	    			    JOBGRADE: $("#payment_JOBGRADE").val() ? parseInt($("#payment_JOBGRADE").val().replace(/,/g, '')) : 0,
	    			    WORKDAY: $("#workDay").val() ? parseInt($("#workDay").val().replace(/,/g, '')) : 0,
	    			    HOUR_WAGE: $("#hourWage").val() ? parseInt($("#hourWage").val().replace(/,/g, '')) : 0,
	    			    DAY_WAGE: $("#dayWage").val() ? parseInt($("#dayWage").val().replace(/,/g, '')) : 0,
	    			    MONTH_WAGE: $("#monthWage").val() ? parseInt($("#monthWage").val().replace(/,/g, '')) : 0,
	    			    SALARY_TAX: $("._totalDeduction").text() ? parseInt($("._totalDeduction").text().replace(/,/g, '').replace('원', '')) : 0,
	    			    SALARY_BSLRY: $("._BSalary").text() ? parseInt($("._BSalary").text().replace(/,/g, '').replace('원', '')) : 0,
	    			    PENSION: $("#pension").val() ? parseInt($("#pension").val().replace(/,/g, '')) : 0,
	    			    HEALTH: $("#health").val() ? parseInt($("#health").val().replace(/,/g, '')) : 0,
	    			    EMPLOYEE: $("#employee").val() ? parseInt($("#employee").val().replace(/,/g, '')) : 0,
	    			    INCOME_TAX: $("#income").val() ? parseInt($("#income").val().replace(/,/g, '')) : 0,
	    			    WORKHOUR: $("#workHour").val() ? parseInt($("#workHour").val().replace(/,/g, '')) : 0,
	    			    TOTAL_WAGE : $("._totalWage").text() ? parseInt($("._totalWage").text().replace(/,/g, '').replace('원', '')) : 0,
	    			    SUM_WAGE : $("._sumWage").text() ? parseInt($("._sumWage").text().replace(/,/g, '').replace('원', '')) : 0
	    			};
	    	 	
	    	 	//table에 값 넣기
	    	 	$("._selectDeptTable").text($("#selectDept option:selected").text());
	    	 	$("._selectEmpTable").text($("#selectEmp option:selected").text());
	    	 	$("._selectSalaryDateTable").text(registData.SALARY_DATE);
	    	 	$("._BSalaryTable").text(registData.SALARY_BSLRY.toLocaleString());
	    	 	$("._SalaryTaxTable").text(registData.SALARY_TAX.toLocaleString());
	    	 	$("._FamilyTable").text(registData.FAMILY.toLocaleString());
	    	 	$("._PensionTable").text(registData.PENSION.toLocaleString());
	    	 	$("._OvertimeTable").text(registData.OVERTIME.toLocaleString());
	    	 	$("._NightTable").text(registData.NIGHT.toLocaleString());
	    	 	$("._HealthTable").text(registData.HEALTH.toLocaleString());
	    	 	$("._EmployeeTable").text(registData.EMPLOYEE.toLocaleString());
	    	 	$("._HolidayTable").text(registData.HOLIDAY.toLocaleString());
	    	 	$("._DayoffTable").text(registData.DAYOFF.toLocaleString());
	    	 	$("._JobgradeTable").text(registData.JOBGRADE.toLocaleString());
	    	 	$("._SumwageTable").text(registData.SUM_WAGE.toLocaleString());
	    	 	$("._totalDeductionTable").text(registData.SALARY_TAX.toLocaleString());
	    	 	$("._totalWageTable").text(registData.TOTAL_WAGE.toLocaleString());
	    	 	
	    	 	var prevPaystubPdf = '<html><body>';
	    	 	var paystubPdf = $("._paystubPdf").prop('outerHTML');
	    	 	var nextPaystubPdf = '</body></html>';
	    	 	
	    	 	var completePaystubPdf = prevPaystubPdf + paystubPdf + nextPaystubPdf;
	    	 	
	    	 	var sendData ={
	    	 		salaryVO : registData,
	    	 		paystubPdf : completePaystubPdf,
	    	 		fileNm : $("#selectSalaryDay").val().replaceAll("-",'') + "_" + $("#selectEmp option:selected").text() +"_" +"임금명세서"
	    	 	}
	    	 	
	 		$.ajax({
				url:"/emp/salary/registpaystub",
				contentType:"application/json; charset=utf-8",
				data:JSON.stringify(sendData),
				type:"POST",
				dataType:"json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(response){
					$("#successModal").modal('show');
					setTimeout(() => window.location.href="/emp/salary/paystubList", 1000);
				},
				error:function(xhr, status, error){
					console.log(error);
					setTimeout(() => window.location.href="/emp/salary/paystubList", 1000)
				}
			})
    	 }
     })
})
</script>