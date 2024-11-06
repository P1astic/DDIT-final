<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/css/emp/regist.css">
<sec:authorize access="isAuthenticated()">
	<%-- 		<sec:authentication property="principal.memberVO" /> --%>
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<script>


$(document).ready(function() {
	
    // 시작시간과 종료시간 옵션을 초기화하는 함수
    function timeSetting() {
        let startSelect = $("#aptFacRsvtBgngTm");
        let endSelect = $('#aptFacRsvtEndTm');
        
        // 옵션 초기화
        startSelect.html('<option value="">-선택하시오-</option>');
        endSelect.html('<option value="">-선택하시오-</option>');
        
        // 예약 시작
        let startTimes = ['1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900'];
        startTimes.forEach(times => {
            let time = times.replace(/(\d{2})(\d{2})/, '$1:$2');
            console.log("time : "+time);
            startSelect.append("<option value="+times+">"+time+"</option>");
        });
        
        // 예약종료
        let endTimes = ['1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000'];
        endTimes.forEach(times => {
            let time = times.replace(/(\d{2})(\d{2})/, '$1:$2');
            endSelect.append("<option value="+times+">"+time+"</option>");
        });
    }
    
    

 	// 예약 가능시간
    function updateTime(selectDate) {
 		
 		let returnDate = selectDate.replaceAll("-", "");
 		console.log("returnDate : "+returnDate);
        $.ajax({
            url: '/cust/airportFacility/timeSetting',
            type: 'GET',
            data: {
                aptFacRsvtYmd: returnDate
            },
            dataType: 'json', 
            beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
            success: function(result) {
            	console.log("result :",result);
            	
                timeSetting();
                
                if (result && result.length > 0) {
                    let startSelect = $('#aptFacRsvtBgngTm');
                    let endSelect = $('#aptFacRsvtEndTm');
                    
                    // 그날 예약시간 체크
                    result.forEach(res => {
                    	let startTime = res.aptFacRsvtBgngTm;
                    	let endTime = res.aptFacRsvtEndTm;
                        console.log("startTime : "+startTime);
                        console.log("endTime : "+endTime);
                        
                        // 예약 제한
                        startSelect.find('option').each(function() {
                        	let optionValue = $(this).val();
                            console.log("optionValue : "+optionValue);
                            if (optionValue >= startTime && optionValue < endTime) {
                                $(this).prop('disabled', true).text($(this).text() + "예약불가");
                            }
                        });
                        
                        endSelect.find('option').each(function() {
                        	let optionValue = $(this).val();
                            if (optionValue > startTime && optionValue <= endTime) {
                                $(this).prop('disabled', true).text($(this).text() + "예약불가");
                            }
                        });
                    });
                }
            },
            error: function(xhr, status, error) {
                console.error('오류 발생:', error);
                alert('오류 발생!!');
            }
        });
    }
	
	 
    $('#aptFacRsvtYmd').on('change', function() {
        let selectDate = $(this).val();
//         console.log("selectDate : "+selectDate);
        if (selectDate) {
            updateTime(selectDate);
        } else {
        	timeSetting();
        }
    });

    // 예약시간 제한
    $('#aptFacRsvtBgngTm').on('change', function() {
    	let startTime = $(this).val();
    	let endSelect = $('#aptFacRsvtEndTm');
        
        endSelect.find('option').prop('disabled', false);
        
        if (startTime) {
            endSelect.find('option').each(function() {
            	let optionValue = $(this).val();
                if (optionValue <= startTime) {
                    $(this).prop('disabled', true).text($(this).text());
                }
            });
        }
    });

    timeSetting();
    
    // 날짜가 이미 선택되어 있다면 시간 옵션 업데이트
    const aptFacRsvtYmd1 = $('#aptFacRsvtYmd').val();
    if (aptFacRsvtYmd1) {
    	updateTime(aptFacRsvtYmd1);
    }
    
    $("#edit").on("click",function(){
    	
    	$(".error").hide();
    	
    	
    	let aptFacRsvtNm = $("#aptFacRsvtNm").val();
    	let aptFacRsvtUtztnRsn = $("#aptFacRsvtUtztnRsn").val();
    	let aptFacEml = $("#aptFacEml").val();
    	let aptFacRsvtMoblphon = $("#aptFacRsvtMoblphon").val();
    	let aptFacRsvtUtztnNope = $("#aptFacRsvtUtztnNope").val();
    	let aptFacNo = $("#aptFacNo").val();
    	let aptFacRsvtTtl = $("#aptFacRsvtTtl").val();
    	let empJncmpYmd = $("#empJncmpYmd").val();
    	let aptFacRsvtYmd = $("#aptFacRsvtYmd").val();
    	let aptFacRsvtBgngTm = $("#aptFacRsvtBgngTm").val();
    	let aptFacRsvtEndTm = $("#aptFacRsvtEndTm").val();

 		
    	
    	var data = {
    			"aptFacRsvtNm" : aptFacRsvtNm,
    			"aptFacRsvtUtztnRsn" : aptFacRsvtUtztnRsn,
    			"aptFacEml" : aptFacEml,
    			"aptFacRsvtMoblphon" : aptFacRsvtMoblphon,
    			"aptFacRsvtUtztnNope" : aptFacRsvtUtztnNope,
    			"aptFacNo" : aptFacNo,
    			"aptFacRsvtTtl" : aptFacRsvtTtl,
    			"empJncmpYmd" : empJncmpYmd,
    			"aptFacRsvtYmd" : aptFacRsvtYmd,
    			"aptFacRsvtBgngTm" : aptFacRsvtBgngTm,
    			"aptFacRsvtEndTm" : aptFacRsvtEndTm,
    	};
    	
    	console.log("data",data);
    	
    	$.ajax({
    		url:"/cust/airportFacility/registPost",
    		contentType:"application/json;charset=utf-8",
    		data:JSON.stringify(data),
    		type:"post",
    		dataType:"json",
    		beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
    		success:function(result){
    			console.log("result : ", result);
    			alert("예약 신청되었습니다");
    			
    			
    			location.href = "/cust/airportFacility/list";
    		},
    		error: function(xhr, status, error) {
                console.error('오류 발생:', error);
                alert(' * 표시된 곳을 입력해주세요.');
            }
    	});
    	
    });
    
    $("#aptFacRsvtMoblphon").on("blur", function() {
    	
        let aptFacRsvtMoblphon = $("#aptFacRsvtMoblphon").val();
        
        let pattern = /^010\d{8}$/;
        
        // 유효성 검사 (test=boolean)
        if (!pattern.test(aptFacRsvtMoblphon)) {
            $("#aptFacRsvtMoblphonCheck").text("정확한 휴대폰 번호를 입력해주세요 ex.01033334444");
            $("#aptFacRsvtMoblphon").focus();
        } else {
            $("#aptFacRsvtMoblphonCheck").text("");
        }
    });

    
});


</script>
<style>
#cancel:hover, #edit:hover{
	color: white;
}

</style>
<div id="container" >

<!-- 헤더 -->
<div id="tbox">
	<div id="title-box">
		<div class="title-txt">비회원</div>
		<div class="title-txt">-</div>
		<div class="title-txt">공항시설</div>
		<div class="title-txt">-</div>
		<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">공항시설예약</div>
	</div>
</div> 
<!-- <button type="button" id="list" class="btn btn-outline-primary" style=" width: 80px;">목록가기</button> -->

<!-- 폼 박스 -->
<form id="content">
	<div class="a">
	<div class="t1">예약자 정보</div>
	
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">예약자명<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="aptFacRsvtNm" name="aptFacRsvtNm"
					placeholder="이름입력" required/>
					<span id="aptFacRsvtNmError" class="error" style=" display:none; color:red;">이름을 입력해주세요.</span>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">이용인원<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="number" class="input1" id="aptFacRsvtUtztnNope" name="aptFacRsvtUtztnNope" style="width: 30%;" required/>&nbsp;명
					<span id="aptFacRsvtUtztnNopeError" class="error" style=" display:none; color:red;">이용인원을 입력해주세요.</span>
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">이메일</div>
					<div class="a1-2-td2">
					<input type="email" class="input1" placeholder="이메일 입력" name="aptFacEml" id="aptFacEml"	/>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">휴대전화<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" 
						placeholder="'-'&nbsp;없이 입력하세요." name="aptFacRsvtMoblphon" id="aptFacRsvtMoblphon"/>
					<div id="aptFacRsvtMoblphonCheck" style="color:red;"></div>
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
		
		<hr class="hr1">
		<div class="t1">시설예약 정보</div>
		
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">시설명<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<select id="aptFacNo" name="aptFacNo" class="input1">
					<option value="">-선택하시오-</option>
					<c:forEach var="AirportFacilityVO" items="${AirportFacilityVOList}">
						<option value="${AirportFacilityVO.aptFacNo}">${AirportFacilityVO.aptFacNm}</option>
					</c:forEach>
					</select>
					<span id="aptFacNoError" class="error" style="display:none; color:red;">시설을 선택해주세요.</span>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">제목<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="aptFacRsvtTtl" name="aptFacRsvtTtl" 	required />
					<span id="aptFacRsvtTtlError" class="error" style=" display:none; color:red;">제목을 입력해주세요.</span>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">이용사유<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="aptFacRsvtUtztnRsn" name="aptFacRsvtUtztnRsn" placeholder="간단히 입력해 주세요."/>
					<span id="aptFacRsvtUtztnRsnError" class="error" style=" display:none; color:red;">이용사유를 입력해주세요.</span>
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">예약일자<span style="color:red">*</span></div>
					<div class="a1-2-td2" id="a1-2-td2-box">
						<input type="date" class="input1" name="aptFacRsvtYmd" id="aptFacRsvtYmd" style="flex: 6;"/>
						<span id="aptFacRsvtYmdError" class="error" style=" display:none; color:red;">예약일자를 선택해주세요.</span>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">예약시작시간<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<select id="aptFacRsvtBgngTm" name="aptFacRsvtBgngTm" class="input1">
					</select>
					<span id="aptFacRsvtBgngTmError" class="error" style=" display:none; color:red;">예약시간을 선택해주세요.</span>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">예약종료시간<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<select id="aptFacRsvtEndTm" name="aptFacRsvtEndTm" class="input1">
					</select>
					<span id="aptFacRsvtEndTmError" class="error" style=" display:none; color:red;">종료시간을 선택해주세요.</span>
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
	<div id="btn-box1" style="width:88%">
		<button type="button" id="edit" class="btn btn-outline-primary btn2-1" 
					style=" font-size: 14px; border : 1px solid;">등록</button>
		<a href="/cust/airportFacility/list">
		<button type="button" id="cancel" class="btn btn-outline-secondary "
			style="font-size: 14px; border : 1px solid;">취소</button>
		</a>
	</div>
	</div>
	<!-- 사원 저장 취소 -->
	<sec:csrfInput />
</form>
</div>