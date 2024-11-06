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

$(document).ready(function(){
	
	$("#aptFacRsvtNm").hide();
	$("#aptFacRsvtUtztnNope").hide();
	$("#aptFacEml").hide();
	$("#aptFacRsvtMoblphon").hide();
	$("#aptFacNo").hide();
	$("#aptFacRsvtTtl").hide();
	$("#aptFacRsvtUtztnRsn").hide();
	$("#aptFacRsvtYmd").hide();
	$("#aptFacRsvtBgngTm").hide();
	$("#aptFacRsvtEndTm").hide();
	
	$("#updateBtn").on("click",function(){
		$("#aptFacRsvtMoblphon").val().replaceAll("-","");
		let ee = $("#aptFacRsvtMoblphon").val();
		
		console.log("ee : "+ee);
		
		
		$("#deleteBtn").hide();
		$("#updateBtn").hide();
		$("#close").hide();

		$("#checkBtn").show();
		$("#noBtn").show();
		
		$("#aptFacRsvtNm").show();
		$("#aptFacRsvtUtztnNope").show();
		$("#aptFacEml").show();
		
		$("#aptFacRsvtMoblphon").val($("#aptFacRsvtMoblphon").val().replaceAll("-",""));
		$("#aptFacRsvtMoblphon").show();
		$("#aptFacNo").show();
		$("#aptFacRsvtTtl").show();
		$("#aptFacRsvtUtztnRsn").show();
		$("#aptFacRsvtYmd").show();
		$("#aptFacRsvtBgngTm").show();
		$("#aptFacRsvtEndTm").show();
		
		$("#aptFacRsvtNm1").hide();
		$("#aptFacRsvtUtztnNope1").hide();
		$("#aptFacEml1").hide();
		$("#aptFacRsvtMoblphon1").hide();
		$("#aptFacNo1").hide();
		$("#aptFacRsvtTtl1").hide();
		$("#aptFacRsvtUtztnRsn1").hide();
		$("#aptFacRsvtYmd1").hide();
		$("#aptFacRsvtBgngTm1").hide();
		$("#aptFacRsvtEndTm1").hide();
		
		
		
	});
	
	$("#checkBtn").on("click",function(){
		
		let data = {
				
				"aptFacRsvtNo" : $("#aptFacRsvtNo").val(),
				"aptFacRsvtNm" : $("#aptFacRsvtNm").val(),
				"aptFacRsvtUtztnNope" : $("#aptFacRsvtUtztnNope").val(),
				"aptFacEml" : $("#aptFacEml").val(),
				"aptFacRsvtMoblphon" : $("#aptFacRsvtMoblphon").val(),
				"aptFacNo" : $("#aptFacNo").val(),
				"aptFacRsvtTtl" : $("#aptFacRsvtTtl").val(),
				"aptFacRsvtUtztnRsn" : $("#aptFacRsvtUtztnRsn").val(),
				"aptFacRsvtYmd" : $("#aptFacRsvtYmd").val(),
				"aptFacRsvtBgngTm" : $("#aptFacRsvtBgngTm").val(),
				"aptFacRsvtEndTm" : $("#aptFacRsvtEndTm").val()
		}
		console.log("data : ",data);
		
		$.ajax({
	    	   
	    	   url : "/cust/airportFacility/update",
	    	   contentType:"application/json;charset=utf-8",
			   data : JSON.stringify(data),
			   type : "post",
			   dataType : "json",
			   beforeSend : function(xhr){
			    	xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			   },
			   success : function(res){
				   console.log("res : ",res);
				   
				   $("#content").submit();
			   },
			   error : function(xhr, status, error) {
		            console.error("AJAX Error: ", error);
		            alert("응답 실패!!");
		       }
	       });
		
	});
	
	$("#noBtn").on("click",function(){
		
		$("#deleteBtn").show();
		$("#updateBtn").show();
		$("#close").show();

		$("#checkBtn").hide();
		$("#noBtn").hide();
		
		$("#aptFacRsvtNm").hide();
		$("#aptFacRsvtUtztnNope").hide();
		$("#aptFacEml").hide();
		$("#aptFacRsvtMoblphon").hide();
		$("#aptFacNo").hide();
		$("#aptFacRsvtTtl").hide();
		$("#aptFacRsvtUtztnRsn").hide();
		$("#aptFacRsvtYmd").hide();
		$("#aptFacRsvtBgngTm").hide();
		$("#aptFacRsvtEndTm").hide();
		
		$("#aptFacRsvtNm1").show();
		$("#aptFacRsvtUtztnNope1").show();
		$("#aptFacEml1").show();
		$("#aptFacRsvtMoblphon1").show();
		$("#aptFacNo1").show();
		$("#aptFacRsvtTtl1").show();
		$("#aptFacRsvtUtztnRsn1").show();
		$("#aptFacRsvtYmd1").show();
		$("#aptFacRsvtBgngTm1").show();
		$("#aptFacRsvtEndTm1").show();
	});
	
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
    const aptFacRsvtYmd1 = $("#aptFacRsvtYmd").val();
    if (aptFacRsvtYmd1) {
    	updateTime(aptFacRsvtYmd1);
    }
    
    $("#deleteBtn").on("click",function(){
    	
    	let aptFacRsvtNo = $("#aptFacRsvtNo").val();
    	console.log("aptFacRsvtNo : "+aptFacRsvtNo);
    	
    	$.ajax({
	    	   
	    	   url : "/cust/airportFacility/delete",
// 	    	   contentType:"application/json;charset=utf-8",
			   data : {
				   aptFacRsvtNo : aptFacRsvtNo
			   },
			   type : "post",
// 			   dataType : "json",
			   beforeSend : function(xhr){
			    	xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			   },
			   success : function(res){
// 				   console.log("res : ",res);
				   location.href = "/cust/airportFacility/list";
				   alert("예약이 취소되었습니다.");
			   },
			   error : function(xhr, status, error) {
		            console.error("AJAX Error: ", error);
		            alert("취소 실패!!");
		       }
	       });
    	
    });
    
});

</script>
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

<!-- 폼 박스 -->
<form id="content">
	<div class="a">
	<div class="t1">예약자 정보</div>
	
		<!-- 데이터 박스 1  -->
		<div class="a1-2">
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<input type="text" id="aptFacRsvtNo" name="aptFacRsvtNo" value="${airportFacilityRSVVO.aptFacRsvtNo}" hidden="" />
					<div class="a1-2-td">예약자명&nbsp;<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="aptFacRsvtNm" name="aptFacRsvtNm" value="${airportFacilityRSVVO.aptFacRsvtNm}" />
					<div class="input1" id="aptFacRsvtNm1">
					${airportFacilityRSVVO.aptFacRsvtNm}
					</div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">이용인원&nbsp;<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="number" class="input1" id="aptFacRsvtUtztnNope" name="aptFacRsvtUtztnNope" value="${airportFacilityRSVVO.aptFacRsvtUtztnNope}" />
					<div class="input1" id="aptFacRsvtUtztnNope1">
					${airportFacilityRSVVO.aptFacRsvtUtztnNope}
					</div>
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">이메일</div>
					<div class="a1-2-td2">
					<input type="email" class="input1" name="aptFacEml" id="aptFacEml" value="${airportFacilityRSVVO.aptFacEml}"/>
					<div class="input1" id="aptFacEml1">
					${airportFacilityRSVVO.aptFacEml}
					</div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">휴대전화&nbsp;<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" name="aptFacRsvtMoblphon" id="aptFacRsvtMoblphon" value="${airportFacilityRSVVO.aptFacRsvtMoblphon}"/>
					<div class="input1" id="aptFacRsvtMoblphon1">
					${airportFacilityRSVVO.aptFacRsvtMoblphon}</div>
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
					<div class="a1-2-td">시설명&nbsp;<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<select id="aptFacNo" name="aptFacNo" class="input1">
					<option value="">-선택하시오-</option>
					<c:forEach var="airportFacilityVO" items="${airportFacilityRSVVO.airportFacilityVOList}">
						<option value="${airportFacilityVO.aptFacNo}">${airportFacilityVO.aptFacNm}</option>
					</c:forEach>
					</select>
					<div class="input1" id="aptFacNo1">
					${airportFacilityRSVVO.airportFacilityVO.aptFacNm}</div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">제목&nbsp;<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="aptFacRsvtTtl" name="aptFacRsvtTtl" value="${airportFacilityRSVVO.aptFacRsvtTtl}"/>
					<div class="input1" id="aptFacRsvtTtl1">
					${airportFacilityRSVVO.aptFacRsvtTtl}</div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">이용사유&nbsp;<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<input type="text" class="input1" id="aptFacRsvtUtztnRsn" name="aptFacRsvtUtztnRsn" value="${airportFacilityRSVVO.aptFacRsvtUtztnRsn}"/>
					<div class="input1" id="aptFacRsvtUtztnRsn1">
					${airportFacilityRSVVO.aptFacRsvtUtztnRsn}
					</div>
					</div>
				</div>
			</div>
			<div class="a1-2-tbody">
				<div class="a1-2-tr">
					<div class="a1-2-td">예약일자&nbsp;<span style="color:red">*</span></div>
					<div class="a1-2-td2" id="a1-2-td2-box">
					<input type="date" class="input1" name="aptFacRsvtYmd" id="aptFacRsvtYmd" value="${airportFacilityRSVVO.aptFacRsvtYmd}" style="flex: 6;"/>
					<div class="input1" id="aptFacRsvtYmd1">
					${airportFacilityRSVVO.aptFacRsvtYmd}
					</div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">예약시작시간&nbsp;<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<select id="aptFacRsvtBgngTm" name="aptFacRsvtBgngTm" class="input1" >
					</select>
					<div class="input1" id="aptFacRsvtBgngTm1">
					${airportFacilityRSVVO.aptFacRsvtBgngTm}
					</div>
					</div>
				</div>
				<div class="a1-2-tr">
					<div class="a1-2-td">예약종료시간&nbsp;<span style="color:red">*</span></div>
					<div class="a1-2-td2">
					<select id="aptFacRsvtEndTm" name="aptFacRsvtEndTm" class="input1">
					</select>
					<div class="input1" id="aptFacRsvtEndTm1">
					${airportFacilityRSVVO.aptFacRsvtEndTm}
					</div>
					</div>
				</div>
			</div>
		</div> <!--a1-2 끝  -->
		<div style="display: flex; justify-content: space-between; margin-top: 10px; gap: 15px; padding: 10px;">
				<button type="button" id="checkBtn" style="width: 70px; display: none; border: 1px solid #3498db; background-color: white; color: #007bff; border-radius: 5px;">확인</button>
				<button type="button" id="noBtn" style="width: 70px; display: none; border: 1px solid #585b5d; background-color: white; color: #585b5d; border-radius: 5px;">취소</button>
				<button type="button" id="deleteBtn" style="width: 70px; border: 1px solid #dc3545; background-color: white; color: #dc3545;; border-radius: 5px;">예약취소</button>
				<button type="button" id="updateBtn" style="width: 70px; border: 1px solid #3498db; background-color: white; color: #007bff; border-radius: 5px;">예약수정</button>
				<button type="button" id="close" style="width: 70px; border: 1px solid #585b5d; background-color: white; color: #585b5d; border-radius: 5px;"><a onclick="location.href='/cust/airportFacility/list'">목록</a></button>
			</div>
<!-- 	<div id="btn-box1" style="width:88%"> -->
<!-- 		<button type="button" id="edit" class="btn btn-outline-primary btn2-1"  -->
<!-- 					style=" font-size: 14px; border : 1px solid;">등록</button> -->
<!-- 		<a href="/cust/airportFacility/list"> -->
<!-- 		<button type="button" id="cancel" class="btn btn-outline-secondary " -->
<!-- 			style="font-size: 14px; border : 1px solid;">취소</button> -->
<!-- 		</a> -->
<!-- 	</div> -->
	</div>
	<!-- 사원 저장 취소 -->
	<sec:csrfInput />
</form>
</div>