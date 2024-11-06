<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" type="text/css" href="/resources/css/salary/calcRetirement.css">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<style>
	._calcFooter{
		label{
			width:150px;
			margin-bottom:0px;
		}
	}
	
</style>
<div class="titleHeader" style="font-family:Pretendard;">
	<h3>
		<span style="color:#A4A4A4; font-family: Pretendard; font-size:20px; font-weight: 600; word-wrap: break-word;">인사  - 급여 - </span>
		<span style="font-family: Pretendard; font-size:20px; font-weight: 600; word-wrap: break-word;">예상퇴직금 계산</span>
	</h3>
</div>
<div class="card-body table-responsive p-0" style="font-family:Pretendard;">
	<div class="searchHeader d-flex flex-column">
		<div class="ml-auto d-flex flex-row align-items-end">
			<div>
				<label for="syear" class="_itemLabel">입사일자:</label>
				<input type="date" id="syear" class="form-control _itemInput" style="width:150px;">
			</div>
			<div>
				<label for="eyear" class="_itemLabel">퇴사일자:</label>
				<input type="date" id="eyear" class="form-control _itemInput" style="width:150px;">
			</div>
			<div>
				<label for="sday" class="_itemLabel">재직일:</label>
				<input type="text" id="sday" class="form-control _itemInput" style="width:150px;" readonly>
			</div>
		</div>
		<div class="ml-auto d-flex flex-row align-items-end" style="margin-top:5px;">
			<div class="_calDate ">
				<input type="button" class="btn btn-primary _calDatebtn" value="평균임금계산보기">
			</div>
			<div>
				<input type="button" id="_payResetbtn" class="btn btn-primary _payResetbtn" value="임금초기화">
			</div>
		</div>
	</div>
	<div class="tableDiv">
		<table style="width:100%; border:0.5px solid #e4e4e4; border-top:none; border-left:none; border-right:none;">
			<caption>기간, 기간별일수, 기본급, 기타수당 항목으로 구성된 퇴직전 3개월 임금 총액 계산(세전금액) 표</caption>
			<thead style="background:#e4e4e463; height:35px;">
				<tr style="text-align:center;">
					<th scope="col">기간</th>
					<th scope="col">기간별일수</th>
					<th scope="col">기본급</th>
					<th scope="col">기타수당</th>
				</tr>
			</thead>
			<tbody>
				<tr class="_firstRow boardTR">
					<td class="_firstPeriod">
						<div class="d-flex flex-row align-items-center justify-content-center">
							<input class="_firstPeriodStart form-control" type="text" value="" style="width:150px; text-align:center;" readonly>
							<span class="mr-1 ml-1" style="font-size:20px;">~</span>
							<input class="_firstPeriodEnd form-control" type="text" value="" style="width:150px; text-align:center;" readonly>
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_firstPeriodDay form-control" type="text" value="" style="width:150px; text-align:right;" readonly>
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_firstPeriodBSalary _BSalary form-control" type="text" placeholder="0" style="width:150px; text-align:right;" numberonly="">
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_firstPeriodEtc _Etc form-control" type="text" placeholder="0" style="width:150px; text-align:right;" numberonly="">
						</div>
					</td>
				</tr>
				<tr class="_secondRow boardTR">
					<td class="_secondPeriod">
						<div class="d-flex flex-row align-items-center justify-content-center">
							<input class="_secondPeriodStart form-control" type="text" value="" style="width:150px; text-align:center;" readonly>
							<span class="mr-1 ml-1" style="font-size:20px;">~</span>
							<input class="_secondPeriodEnd form-control" type="text" value="" style="width:150px; text-align:center;" readonly>
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_secondPeriodDay form-control" type="text" value="" style="width:150px; text-align:right;" readonly>
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_secondPeriodBSalary _BSalary form-control" type="text" placeholder="0" style="width:150px; text-align:right;" numberonly="">
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_secondPeriodEtc _Etc form-control" type="text" placeholder="0" style="width:150px; text-align:right;" numberonly=""> 
						</div>
					</td>
				</tr>
				<tr class="_thirdRow boardTR">
					<td class="_thirdPeriod">
						<div class="d-flex flex-row align-items-center justify-content-center">
							<input class="_thirdPeriodStart form-control" type="text" value="" style="width:150px; text-align:center;" readonly>
							<span class="mr-1 ml-1" style="font-size:20px;">~</span>
							<input class="_thirdPeriodEnd form-control" type="text" value="" style="width:150px; text-align:center;" readonly>
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_thirdPeriodDay form-control" type="text" value="" style="width:150px; text-align:right;" readonly>
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_thirdPeriodBSalary _BSalary form-control" type="text" placeholder="0" style="width:150px; text-align:right;" numberonly="">
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_thirdPeriodEtc _Etc form-control" type="text" placeholder="0" style="width:150px; text-align:right;" numberonly="">
						</div>
					</td>
				</tr>
				<tr class="_fourthRow boardTR">
					<td class="_fourthPeriod">
						<div class="d-flex flex-row align-items-center justify-content-center">
							<input class="_fourthPeriodStart form-control" type="text" value="" style="width:150px; text-align:center;" readonly>
							<span class="mr-1 ml-1" style="font-size:20px;">~</span>
							<input class="_fourthPeriodEnd form-control" type="text" value="" style="width:150px; text-align:center;" readonly>
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_fourthPeriodDay form-control" type="text" value="" style="width:150px; text-align:right;" readonly>
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_fourthPeriodBSalary _BSalary form-control" type="text" placeholder="0" style="width:150px; text-align:right;" numberonly="">
						</div>
					</td>
					<td>
						<div class="d-flex flex-column align-items-center">
							<input class="_fourthPeriodEtc _Etc form-control" type="text" placeholder="0" style="width:150px; text-align:right;" numberonly="">
						</div>
					</td>
				</tr>
			</tbody>
			<tfoot>
			
				<tr style="height:50px;">
					<td>
						<div class="d-flex flex-row align-items-center justify-content-center">
							<span>
								합계
							</span>
						</div>
					</td>
					<td>
						<div class="d-flex flex-row align-items-center justify-content-center">
							<input type="text" name="sumday" id="sumday" size="2" class="form-control" style="width:140px; text-align:center;" readonly>
							<span>일</span>
						</div>
					</td>
					<td>
						<div class="d-flex flex-row align-items-center justify-content-center">
							<input type="text" name="sumbasic" id="basicSum" size="10" class="form-control" title="기본급합계" style="width:140px; text-align:right;" readonly>					
							<span>원</span>
						</div>
					</td>
					<td>
						<div class="d-flex flex-row align-items-center justify-content-center">
							<input type="text" name="sumbonus" id="etcSum" size="10" class="form-control" title="기타수당합계" style="width:140px; text-align:right;" readonly>					
							<span>원</span>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
		<div class="d-flex flex-column _calcFooter">
				
			<div class="d-flex flex-row align-items-center mb-2">
				<label for="_sumBonus align-items-center">연간상여금 총액 : </label> <!-- label 크기 동일하게 맞추기  -->
				<input class="_sumBonus form-control" type="text" placeholder="0" numberonly="" style="width:150px; text-align:right;">
			</div>
			<div class="d-flex flex-row align-items-center mb-2">
				<label for="_yearBonus align-items-center">연차수당 : </label> <!-- label 크기 동일하게 맞추기  -->
				<input class="_yearBonus form-control" type="text" placeholder="0" numberonly="" style="width:150px; text-align:right;">	
			</div>
			<div class="d-flex flex-row align-items-center mb-2">
				<label for="_totalBonus align-items-center">임금총액 : </label> <!-- label 크기 동일하게 맞추기  -->
				<input class="_totalBonus form-control" type="text" placeholder="0" numberonly="" readonly style="width:150px; text-align:right;">	
				<div class="input-group-append ml-2">
					<button type="button" class="btn btn-primary _totalBonusBtn">평균임금계산</button>
				</div>
			</div>
			<div class="d-flex flex-row align-items-center mb-2">
				<label for="_salaryPerDay">1일 평균임금 : </label> <!-- label 크기 동일하게 맞추기  -->
				<div class="input-group-append">
					<input class="_salaryPerDay form-control" type="text" placeholder="0" numberonly="" readonly style="width:150px; text-align:right;">	
				</div>
			</div>
			<div class="d-flex flex-row align-items-center mb-2">
				<label for="_retirement">퇴직금 : </label> <!-- label 크기 동일하게 맞추기  -->
				<input class="_retirement form-control" type="text" placeholder="0" numberonly="" readonly style="width:150px; text-align:right;">
				<div class="input-group-append ml-2">
					<button type="button" class="btn btn-primary _retirementBtn">퇴직금계산</button>
				</div>
			</div>
		</div>
	</div>
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
	
    // 입사일자를 3년 전 날짜로 지정
    var date = new Date();
    var startDate = new Date(date.getFullYear() - 1, date.getMonth(), date.getDate());
    var formattedStartDate = startDate.getFullYear() + "-" +
                             String(startDate.getMonth() + 1).padStart(2, '0') + "-" +
                             String(startDate.getDate()).padStart(2, '0');
    var formattedEndDate = date.getFullYear() + "-" +
                           String(date.getMonth() + 1).padStart(2, '0') + "-" +
                           String(date.getDate()).padStart(2, '0');
    $("#syear").val(formattedStartDate);//입사일자
    $("#eyear").val(formattedEndDate);//퇴사일자
    

    $("._calDatebtn").on("click", function(){
        var today = new Date();
        var periods = [];
		
        // 입사일자와 퇴사일자 가져오기
        var startDateValue = $("#syear").val(); // 입사일자
        var endDateValue = $("#eyear").val();   // 퇴사일자

        // 날짜 문자열을 Date 객체로 변환
        var startDate = new Date(startDateValue);
        var endDate = new Date(endDateValue);

        // 두 날짜 간의 차이 계산
        var diffTime = endDate.getTime() - startDate.getTime();
        var diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

        // 결과를 HTML에 표시할 경우
        $("#sday").val(diffDays);
        
        
        // 오늘 날짜에서 하루를 빼서 시작
        today.setDate(today.getDate() - 1);

        for (var i = 0; i < 4; i++) {
            // 종료일 설정
            var end = new Date(today.getFullYear(), today.getMonth(), today.getDate());
            var endFormatted = end.getFullYear() + "." +
                               String(end.getMonth() + 1).padStart(2, '0') + "." +
                               String(end.getDate()).padStart(2, '0');
            
            // 시작일 설정: firstPeriod는 7월 4일, 나머지는 각 월의 첫날
            var start;
            if (i === 3) {
                // 첫 번째 기간만 7월 4일로 시작
                start = new Date(end.getFullYear(), end.getMonth(), 4);
            } else {
                start = new Date(end.getFullYear(), end.getMonth(), 1);
            }
            var startFormatted = start.getFullYear() + "." +
                                 String(start.getMonth() + 1).padStart(2, '0') + "." +
                                 String(start.getDate()).padStart(2, '0');

            // 날짜 차이 계산 (_periodDay)
            var diffTime = end.getTime() - start.getTime();
            var diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;
            
            periods.push({start: startFormatted, end: endFormatted, days: diffDays});
            today = new Date(end.getFullYear(), end.getMonth(), 0);
        }

        // 최근 3개월의 기간을 각각의 input 태그에 설정
        $("._fourthPeriodStart").val(periods[0].start);
        $("._fourthPeriodEnd").val(periods[0].end);
        $("._fourthPeriodDay").val(periods[0].days);

        $("._thirdPeriodStart").val(periods[1].start);
        $("._thirdPeriodEnd").val(periods[1].end);
        $("._thirdPeriodDay").val(periods[1].days);

        $("._secondPeriodStart").val(periods[2].start);
        $("._secondPeriodEnd").val(periods[2].end);
        $("._secondPeriodDay").val(periods[2].days);

        $("._firstPeriodStart").val(periods[3].start);
        $("._firstPeriodEnd").val(periods[3].end);
        $("._firstPeriodDay").val(periods[3].days);
        
        $("#sumday").val(periods[0].days + periods[1].days + periods[2].days + periods[3].days);
        
        console.log($("#sumday").val());
        
    });
    
    $("._BSalary").on("change", function(){
    	
        var firstVal = parseInt($("._firstPeriodBSalary").val().replace(/,/g, '') || 0);
        var secondVal = parseInt($("._secondPeriodBSalary").val().replace(/,/g, '') || 0);
        var thirdVal = parseInt($("._thirdPeriodBSalary").val().replace(/,/g, '') || 0);
        var fourthVal = parseInt($("._fourthPeriodBSalary").val().replace(/,/g, '') || 0);
    	
        var basicSum = (firstVal + secondVal + thirdVal + fourthVal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        
    	$("#basicSum").val(basicSum);
    })
    
    $("._Etc").on("change", function(){
    	
        var firstVal = parseInt($("._firstPeriodEtc").val().replace(/,/g, '') || 0);
        var secondVal = parseInt($("._secondPeriodEtc").val().replace(/,/g, '') || 0);
        var thirdVal = parseInt($("._thirdPeriodEtc").val().replace(/,/g, '') || 0);
        var fourthVal = parseInt($("._fourthPeriodEtc").val().replace(/,/g, '') || 0);
        
        var sumbonus = (firstVal + secondVal + thirdVal + fourthVal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        
        $("#etcSum").val(sumbonus);
    
	});
    
    $("._totalBonusBtn").on("click", function(){
    	
    	var basicSum = parseInt($("#basicSum").val().replace(/,/g, '') || 0);
    	var etcSum = parseInt($("#etcSum").val().replace(/,/g, '') || 0);
    	var sumBonus = parseInt($("._sumBonus").val().replace(/,/g, '') || 0);
    	var yearBonus = parseInt($("._yearBonus").val().replace(/,/g, '') || 0);
    	
    	var totalBonus = (basicSum + etcSum + sumBonus + yearBonus).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	
    	console.log(basicSum)
    	console.log(etcSum)
    	console.log(sumBonus)
    	console.log(yearBonus)
    	console.log(totalBonus);
    	
    	
    	$("._totalBonus").val(totalBonus);
    	
    	
    	
    	var salaryPerDay = parseInt((basicSum + etcSum + sumBonus + yearBonus) / $("#sumday").val());
    	
    	console.log($("#sumday").val());
    	console.log(salaryPerDay);
    	
    	var salaryPerDayText = salaryPerDay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	
    	$("._salaryPerDay").val(salaryPerDayText);
    	
    })
    
    $("._retirementBtn").on("click", function(){
		
    	var salaryPerDay = $("._salaryPerDay").val().replace(/,/g, '');
    	var sday = $("#sday").val();
    	
    	var retirement = parseInt(salaryPerDay * 30 * (sday / 365));
    	
    	console.log(retirement);
    	
    	var retirementText = retirement.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    	
    	$("._retirement").val(retirementText);
    	
    })
    
    $("._payResetbtn").on("click", function(){
    	$("._firstPeriodBSalary").val(0);
    	$("._secondPeriodBSalary").val(0);
    	$("._thirdPeriodBSalary").val(0);
    	$("._fourthPeriodBSalary").val(0);
    	
    	$("._firstPeriodEtc").val(0);
    	$("._secondPeriodEtc").val(0);
    	$("._thirdPeriodEtc").val(0);
    	$("._fourthPeriodEtc").val(0);
    	
    	$("#basicSum").val(0);
    	$("#etcSum").val(0);
    })
    
})
</script>