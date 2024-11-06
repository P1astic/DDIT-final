<!-- 
 * 2024-09-25 김예영
 * 풀캘린더 api 작동 테스트 목적으로 생성
 * daygrid-views.html
 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<meta charset="UTF-8">
<script src='/resources/js/index.global.js'></script>	<!-- fullCalendar용 js 파일 -->
<script src='/resources/js/index.global.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.14/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/calendar/calendar.css">


<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script>
let empList = [];
let deptList = [];
let selEmpList = [];
let selMemIdList = [];
let createEmp = "${memVO.memId}"; // 현재 사용자의 ID
let memDept = "${memVO.deptVO.deptCd}";
let empNm = "${memVO.employeeVO.empNm}";
let isAdmin = ${memVO.authLinkVOList[0].authCode.equals('ROLE_ADMIN') || memVO.authLinkVOList[0].authCode.equals('ROLE_HR_MNG')}; // 권한 체크
let memAuth = "${memVO.authLinkVOList[0].authCode}";
console.log("memAuth : " + memAuth);
let groupId = "";
let roomId = "";
let roleId = "";
let videoCreateMemId = "";
let selScheId = "";



// videoChat 변수
let memIdforVideoChat = "${memVO.memId}";
let roomIdforVideoChat = "";
let roomUrl = "";
let roleIdforVideoChat = "participant";
let empListforVideoChat = [];
let deptListforVideoChat = [];
let selEmpListforVideoChat = [];
let selMemIdListforVideoChat = [];

// miniCalendar용 script 시작

$(document).ready(function() {
    calendarInit();
});
/*
달력 렌더링 할 때 필요한 정보 목록 

현재 월(초기값 : 현재 시간)
금월 마지막일 날짜와 요일
전월 마지막일 날짜와 요일
*/
function calendarInit() {

    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    // 달력에서 표기하는 날짜 객체
  
    
    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

    // kst 기준 현재시간
    // console.log(thisMonth);

    // 캘린더 렌더링
    renderCalender(thisMonth);

    function renderCalender(thisMonth) {

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate(); // 이전 달의 마지막 날짜
        var prevDay = startDay.getDay(); // 이전 달 마지막 날짜의 요일 (0: 일요일)

        // 이번 달의 마지막 날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate(); // 이번 달의 마지막 날짜
        var nextDay = endDay.getDay(); // 이번 달 마지막 날짜의 요일 (0: 일요일)

        // 현재 월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));

        // 렌더링 html 요소 생성
        calendar = document.querySelector('.dates');
        calendar.innerHTML = '';

        // 지난달 날짜 출력 (일요일부터 시작)
        for (var i = prevDate - prevDay; i <= prevDate; i++) {
            calendar.innerHTML += '<div class="day prev disable">' + i + '</div>';
        }

        // 이번달 날짜 출력
        for (var i = 1; i <= nextDate; i++) {
            calendar.innerHTML += '<div class="day current">' + i + '</div>';
        }

        // 다음달 날짜 출력 (다음 달 첫 번째 날짜가 일요일일 경우 처리)
        for (var i = 1; i <= (6 - nextDay); i++) {
            calendar.innerHTML += '<div class="day next disable">' + i + '</div>';
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
            todayDate = today.getDate();
            var currentMonthDate = document.querySelectorAll('.dates .current');
            currentMonthDate[todayDate - 1].classList.add('today');
        }
    }


    // 이전달로 이동
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth); 
    });
}
// miniCalendar용 script 끝



// 부서 선택
$(document).on("click", "#selDeptBtn", function() {
	let deptCd = $(this).data("target");
	
	$.ajax({
		url : "/emp/videoChat/getEmpList",
		data : {deptCd : deptCd},
		type : "get",
		contentType : "application/json; charset=utf-8",
		type : "get",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(result) {
			
			console.log("getEmpList : ", result);
			
			empList = result;
			
			console.log("empList : ", empList);
						
			let str = "";
			
			for(var i=0; i<empList.length; i++) {
				str += "<button type='button' class='btn btn-third' id='selEmpBtn' data-target='" + empList[i].memId + "' style='width:100%; float:left; text-align:left;'>" + empList[i].empNm + "(" + empList[i].jbgdNm + ")" + "</button>";
			}
			$(".selEmp").html('');
			$(".selEmp").html(str);
		}
		
	});	
})

$(document).on("click", "#selEmpBtn", function() {
	console.log("selEmpBtn memId : " + $(this).data("target"));
	console.log("selEmpBtn empNm(grade) : " + $(this).text());
	let selectedMemId = $(this).data("target");
	let selectedEmpNm = $(this).text();
	
	selEmpList.push(selectedEmpNm);
	selMemIdList.push(selectedMemId);
	
	printSelEmpList();
});

function printSelEmpList() {
	let selEmpStr = "";
	
	for (var i = 0; i < selEmpList.length; i++) {
        
        selEmpStr += "<div>"
        selEmpStr += "<button class='empDel btn btn-third' id='empDel" + i + "' data-index='" + i + "' style='width:100%; float:left; text-align:left;' type='button'>";
        selEmpStr += selEmpList[i] + "<img src='/resources/images/icon/trashcan.png' style='width:20px; height:20px; float:right; text-align:left;'></button>";
        selEmpStr += "</div>";
    }	
	
	console.log("printSelEmpList selEmpList : " + selEmpList);
	
	$(".selectedEmp").html(selEmpStr);
}

function printGetEmpList(getMemList) {
	let selEmpStr = "";
	
	 for (var i = 0; i < getMemList.length; i++) {
	        // 현재 사용자의 ID와 같지 않은 경우에만 추가
	        if (getMemList[i].memId !== createEmp && getMemList[i].memId !== "admin1") {
	            
	            selEmpStr += "<div>"
    	        selEmpStr += "<button class='empDel btn btn-third' id='empDel" + i + "' data-index='" + i + "' style='width:100%; float:left; text-align:left;' type='button'>";
    	        selEmpStr += getMemList[i].empNm + "(" + getMemList[i].jbgdNm + ")" + "<img src='/resources/images/icon/trashcan.png' style='width:20px; height:20px; float:right; text-align:left;'></button>";
    	        selEmpStr += "</div>";
	        }
	}  	
	
	console.log("printGetEmpList getMemList : ", getMemList);
	
	$(".selectedEmp").html(selEmpStr);
	$(".selEmpDiv").html(selEmpStr);
	
	if(groupId == "com" ) {
		$(".selEmpDiv").css("display", "none");		
		$("#selEmpBtnDiv").css("display", "none");		
	}
}

// VideoChat 함수 시작
$(document).on("click", "#getVideoUrlBtn", function() {
	roomIdforVideoChat = $(this).data("target");
	roomIdforVideoChat = roomIdforVideoChat.replace("#getUrl_", "");
	console.log("getUrl roomIdforVideoChat : " + roomIdforVideoChat);	
	
	let vData = {
		roleId : roleIdforVideoChat,
		roomId : roomIdforVideoChat,
		apiUserId : memIdforVideoChat,
		username : empNm		
	}
	
	$.ajax({
		url : "/emp/videoChat/getUrl",
		type : "get",
		data : vData,
		dataType : "json",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(result) {
			console.log("getUrl result : ", result);
			window.open(result.data.url, "_blank", "width=600, height=400");
		},
		error : function(xhr) {
			console.log("에러 : " + xhr.status);
		}
	});
});


$(document).on("click", "#vDelBtn", function() {
	roomIdforVideoChat = $(this).closest("tr").find("#getVideoUrlBtn").data("target");
	roomIdforVideoChat = roomIdforVideoChat.replace("#getUrl_", "");
	console.log("vDelBtn roomIdforVideoChat : " + roomIdforVideoChat);
	
	 let vCurrentRow = $(this).closest("tr");  // 클릭한 버튼의 해당 tr을 저장
	
	$.ajax({
		url : "/emp/videoChat/deleteRoom",
		type : "get",
		data : {roomId : roomIdforVideoChat},
		dataType : "json",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(result) {
			
			if(result === 1) {
				$("#delVideoChatRoomModal").modal('show');
				vCurrentRow.remove();
				
				// 남은 행들의 번호를 다시 할당
                $("#myRoomList tr").each(function(index) {
                    // 첫 번째 열(td)에 있는 번호를 index + 1로 변경
                    $(this).find("td:first").text(index + 1);
                });
			}else {
				$("#FaildelVideoChatRoomModal").modal('show');
			}
		},
		error : function(xhr) {
			console.log("에러 : " + xhr.status);
		}
	})
});


$(document).on("click", "#vSelDeptBtn", function() {
	let vDeptCd = $(this).data("target");
	
	$.ajax({
		url : "/emp/videoChat/getEmpList",
		data : {deptCd : vDeptCd},
		type : "get",
		contentType : "application/json; charset=utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(result) {
			console.log("getEmpList : ", result);
			empListforVideoChat = result;
			console.log("empListforVideoChat : ", empListforVideoChat);
						
			let vStr = "";
			
			for(var i=0; i<empListforVideoChat.length; i++) {
				vStr += "<button type='button' class='btn btn-third' id='vSelEmpBtn' data-target='" + empListforVideoChat[i].memId + "' style='width:100%; float:left; text-align:left;'>" + empListforVideoChat[i].empNm + "(" + empListforVideoChat[i].jbgdNm + ")" + "</button>";
			}
			$(".vSelEmp").html('');
			$(".vSelEmp").html(vStr);
		}
		
	});	
})

$(document).on("click", "#vSelEmpBtn", function() {
	console.log("vSelEmpBtn memId : " + $(this).data("target"));
	console.log("vSelEmpBtn empNm(grade) : " + $(this).text());
	let vSelectedMemId = $(this).data("target");
	let vSelectedEmpNm = $(this).text();
	
	selEmpListforVideoChat.push(vSelectedEmpNm);
	selMemIdListforVideoChat.push(vSelectedMemId);
	
	printSelEmpListforVideoChat();
});

function printSelEmpListforVideoChat() {
	let vSelEmpStr = "";
	
	for (var i = 0; i < selEmpListforVideoChat.length; i++) {
		
		vSelEmpStr += "<div>"
		vSelEmpStr += "<button class='vEmpDel btn btn-third' id='vEmpDel" + i + "' data-index='" + i + "' style='width:100%; float:left; text-align:left;' type='button'>";
		vSelEmpStr += selEmpListforVideoChat[i] + "<img src='/resources/images/icon/trashcan.png' style='width:20px; height:20px; float:right; text-align:left;'></button>";
		vSelEmpStr += "</div>";
    }	
	
	console.log("printSelEmpListforVideoChat selEmpListforVideoChat : " + selEmpListforVideoChat);
	
	$(".vSelectedEmp").html(vSelEmpStr);
	
}

// VideoChat 함수 끝




$(function() {
	
	// VideoChat 함수 시작
	let memIdforVideoChat = "${memVO.memId}";
	
	$.ajax({
	    url: "/emp/videoChat/getMyList",
	    type: "post",
	    data: {memId: memIdforVideoChat}, // JSON 문자열로 변환
	    dataType: "json",
	    beforeSend: function(xhr) {
	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    },
	    success: function(result) {
	        let html = "";
	    	if(result.length == 0) {
	    		html += "<span>생성된 회의가 없습니다</span>";
	    	}
	        console.log("result : ", result);
	        for(var i=0; i<result.length; i++) {
	        	let rnum = i + 1;
	        	
				html += "<tr>";
				html += "<td>" + rnum + "</td>";
				html += "<td id='roomId' style='display:none;'>" + result[i].roomId + "</td>";
				html += "	<td>" + result[i].roomTitle + "</td>";
				html += "	<td>" + result[i].roomStDate + "</td>";
				if(memIdforVideoChat == result[i].memId) {
					html += "	<td><button id='vDelBtn' class='btn btn-warning'>종료</button></td>";					
				}
				html += "	<td><span class='btn btn-primary' id='getVideoUrlBtn' data-toggle='modal' data-target='#getUrl_" + result[i].roomId + "'>참여</span></td>";
				html += "</tr>";
			}
	        $("#myRoomList").html("");
			$("#myRoomList").html(html);	        
	    }
	});
	

	// 동적으로 추가된 fileDel 버튼에 대한 이벤트 추가
    $(document).on("click", ".vEmpDel", function() {
    	let index = $(this).data('index'); // 클릭한 요소가 부모 요소로부터 몇 번째 요소인지 저장
    	console.log("index 값 : " + index);     	
     	
     	$(this).parent().remove();

     	selEmpListforVideoChat.splice(index, 1);
     	selMemIdListforVideoChat.splice(index, 1);
     	console.log(index + "번째 직원 삭제됨");
     	
     	printSelEmpListforVideoChat();  
     	
     });

	$("#vSelEmpDoneBtn").on("click", function() {
		$("#vSelEmpsModal").modal('hide');
		
		let vStr = "";
		for(var i=0; i<selEmpListforVideoChat.length; i++) {
			
			vStr += "<div>"
			vStr += "<button class='vEmpDel btn btn-third' id='vEmpDel" + i + "' data-index='" + i + "' style='width:100%; float:left; text-align:left;' type='button'>";
			vStr += selEmpListforVideoChat[i] + "<img src='/resources/images/icon/trashcan.png' style='width:20px; height:20px; float:right; text-align:left;'></button>";
			vStr += "</div>";
		}
		
		$(".vNewEmpList").html('');
		$(".vNewEmpList").html(vStr);
		
		
	})
	
	$("#openCreateVideoChatBtn").on("click", function() {
		$(".vNewEmpList").html('');
		selEmpListforVideoChat.length = 0; // selEmpListforVideoChat 배열 비우기
		selMemIdListforVideoChat.length = 0; 
		$(".vSelEmp").html('');
		$(".vSelectedEmp").html('');
		$("#createVideoChatModal").modal('show');
	});
	
	$("#vSelEmps").on("click", function() {
		$("#vSelEmpsModal").modal('show');		

		$.ajax({
			url : "/emp/videoChat/getDeptList",
			contentType : "application/json; charset=utf-8",
			type : "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				console.log("getDeptList : ", result);
				deptListforVideoChat = result;
				console.log("deptListforVideoChat : ", deptListforVideoChat);
				
				let vStr = "";
				
				for(var i=0; i<deptListforVideoChat.length; i++) {
					if(deptListforVideoChat[i].deptCd != "C5" && deptListforVideoChat[i].deptCd != "C6" && deptListforVideoChat[i].deptCd != "C7") {
						vStr += "<button type='button' class='btn btn-third' id='vSelDeptBtn' data-target='" + deptListforVideoChat[i].deptCd + "' style='width:100%; float:left; text-align:left; background:white; border-color:#e1e1e1; color:black;'>" + deptListforVideoChat[i].deptNm + "</button>";
					}
				}
				$(".vSelDept").html(vStr);				
			}			
		});	
	})
	
	
	$("#createVideoChatBtn").on("click", function() {
		
		console.log("selEmpListforVideoChat : " + selEmpListforVideoChat);
		console.log("selMemIdListforVideoChat : " + selMemIdListforVideoChat);
		
		let vNewTitle = $("#vNewTitle").val();
		let vNewStTime = $("#vNewStTime").val(); // 2024-09-30T10:12
		let vNewEdTime = $("#vNewEdTime").val();
		let vUserRoleId = roleIdforVideoChat;
		let vApiUserId = memIdforVideoChat;
		let vUsername = empNm;
		
		console.log("create : " + vNewTitle + ", " + vNewStTime + ", " + vNewEdTime + ", " + vUserRoleId + ", " + vApiUserId + ", " + vUsername);	
		
		
		let vEncodedStDate = new Date(vNewStTime); // Mon Sep 30 2024 10:14:00 GMT+0900 (한국 표준시)
		let vEncodedEdDate = new Date(vNewEdTime);
		
		const vStDateString = vEncodedStDate.toString();
		const vEdDateString = vEncodedEdDate.toString();
		
		vEncodedStDate = vStDateString.replace("GMT","");
		vEncodedStDate = vEncodedStDate.substring(0,30).trim();
		vEncodedStDate = encodeURIComponent(vEncodedStDate);

		vEncodedEdDate = vEdDateString.replace("GMT","");
		vEncodedEdDate = vEncodedEdDate.substring(0,30).trim();
		vEncodedEdDate = encodeURIComponent(vEncodedEdDate);		
		
	    console.log(vEncodedStDate);
	    console.log(vEncodedEdDate);
	    
	    // selMemIdListforVideoChat를 리스트 형식으로 변환
        
		$.ajax({
			url : "/emp/videoChat/createRoom",
			type : "get",
			data : {roomTitle : vNewTitle,
					roomStDate : vEncodedStDate,
					roomEdDate : vEncodedEdDate,
					memId : memIdforVideoChat,
					selMemIdList: JSON.stringify(selMemIdListforVideoChat) // 배열을 JSON 문자열로 변환하여 전송
					},
			dataType : "json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				console.log("createRoom result : ", result);
				var html = "";
				
				for(var i=0; i<result.length; i++) {
					html += "<tr>";
					html += "<td>" + result[i].rnum + "</td>";
					html += "<td id='roomId' style='display:none;'>" + result[i].roomId + "</td>";
					html += "	<td>" + result[i].roomTitle + "</td>";
					html += "	<td>" + result[i].roomStDate + "</td>";					
					if(memIdforVideoChat == result[i].memId) {
						html += "	<td><button id='vDelBtn' class='btn btn-warning'>종료</button></td>";					
					}
					html += "	<td><span class='btn btn-primary' id='getVideoUrlBtn' data-toggle='modal' data-target='#getUrl_" + result[i].roomId + "'>참여</span></td>";
					html += "</tr>";
				}
				$("#myRoomList").html("");
				$("#myRoomList").html(html);
				
				let vNewTitle = $("#vNewTitle").val("");
				let vNewStTime = $("#vNewStTime").val("");
				let vNewEdTime = $("#vNewEdTime").val("");
				$("#successModal").modal('show');
				setTimeout(() => location.reload(), 1000);
			},
			error : function(xhr) {
				console.log("에러 : " + xhr.status);
			}
		});
	});
	
	// VideoChat 함수 끝	
	let createEmp = "${memVO.memId}";
	let nowDate = "${nowDate}";
	
	// 동적으로 추가된 fileDel 버튼에 대한 이벤트 추가
    $(document).on("click", ".empDel", function() {
    	let index = $(this).data('index'); // 클릭한 요소가 부모 요소로부터 몇 번째 요소인지 저장
    	console.log("index 값 : " + index);     	
     	
     	$(this).parent().remove();

		selEmpList.splice(index, 1);
		selMemIdList.splice(index, 1);
     	console.log(index + "번째 직원 삭제됨");
     	
     	printSelEmpList();  
     	
     });
	
	
    $("#selEmpDoneBtn").on("click", function() {
		$("#selEmpsModal").modal('hide');
		
		let str = "";
		for(var i=0; i<selEmpList.length; i++) {
			str += "<div>"
			str += "<label for='empDel" + i + "'>" + selEmpList[i] + "</label>";
			str += "<button class='empDel' id='empDel" + i + "' data-index='" + i + "' type='button'>";
			str += "<img src='/resources/images/icon/trashcan.png' style='width:20px; height:20px;'></button>";
	        str += "</div>"
		}
		
		$(".selEmpDiv").html('');
		$(".selEmpDiv").html(str);		
	})
	
	
	var calendarEl = $("#calendar")[0];

	var calendar;  // 전역 변수로 calendar 선언
	
	// 선택한 날짜
	let startStr = "";
	let endStr = "";
	
    // FullCalendar 인스턴스 생성
    function initializeCalendar(events = []) {
        calendar = new FullCalendar.Calendar(calendarEl, {
        	googleCalendarApiKey : "${googleCalendarApiKey}",		// 구글 캘린더 api key
        	
        	// 캘린더 헤더에 표시되는 툴바
            headerToolbar: {
                left: 'title',
//                 center: ,
                right: 'today, prev,next'
            },
            
            initialDate: nowDate,											// 초기 날짜 설정
            editable: true,													// 수정 가능 여부
            selectable : true,												// 달력 일자 드래그 설정 가능
            nowIndicator : true,											// 현재 시간 마크
            dayMaxEvents: true,												// 이벤트가 오버되면 높이 제한(+ 몇 개 식으로 표현)
//             locale: 'ko', 												// 한국어 설정

            eventAdd: function(obj) { 										// 이벤트가 추가되면 발생하는 이벤트
            	console.log("eventAdd : ", obj);
            },
            eventChange: function(obj) { 									// 이벤트가 수정되면 발생하는 이벤트
            	console.log("eventChange : ", obj);
            },
            eventRemove: function(obj){ 									// 이벤트가 삭제되면 발생하는 이벤트
            	console.log("eventRemove : ", obj);
            },
            eventClick : function(info) { 									// 이벤트 클릭 시 발생하는 이벤트(일정 상세)
            

            	
            	selScheId = info.event.extendedProps.scheId;
            	videoCreateMemId = info.event.extendedProps.videoCreateMemId;
            	groupId = info.event.groupId;
            	roomId = info.event.extendedProps.roomId;
            	$("#type").val(groupId);

            	console.log("info : ", info);
            	console.log("scheId : " + info.event.extendedProps.scheId);
            	console.log("groupId : " + groupId);
            	console.log("roomId : " + roomId);
            	console.log("videoCreateMemId : " + videoCreateMemId);
           		console.log("type before : " + $("#type").val());
           		console.log("type after : " + $("#type").val());
            	
            	 // Moment.js를 사용해서 날짜와 시간을 포맷
                var startDateStr = moment(info.event.start).format('YYYY-MM-DD');
                var endDateStr = moment(info.event.end).format('YYYY-MM-DD');
                var startTimeStr = moment(info.event.start).format('HH:mm:ss');
                var endTimeStr = moment(info.event.end).format('HH:mm:ss');
                
                
            	$("#title").val(info.event.title);
            	$("#startDate").val(startDateStr);
            	$("#endDate").val(endDateStr);
            	$("#content").val(info.event.extendedProps.description);
            	
            	
            	
            	$("#color").val(info.event.backgroundColor);

            	
            	// allDay 체크 여부에 따라 시간 표시
            	if(info.event.allDay) {
            		$("#allDay").prop("checked", true);
            		$("#allDay").prop("disabled", true);
            		
            		$("#startTime").val("");
            		$("#endTime").val("");
            		
            		$("#startTimeLabel").css("display", "none");
            		$("#startTime").css("display", "none");
            		$("#endTimeLabel").css("display", "none");
            		$("#endTime").css("display", "none");
            		
            	} else {
            		$("#allDay").prop("checked", false);
            		$("#allDay").prop("disabled", true);
            		
	            	$("#startTime").val(startTimeStr);
	            	$("#endTime").val(endTimeStr);
	            	
            		$("#startTimeLabel").css("display", "");
            		$("#startTime").css("display", "");
            		$("#endTimeLabel").css("display", "");
            		$("#endTime").css("display", "");
            	}
            	
            	
            	 // 참여자 리스트 표시				
            	$("#editableBtn").css("display", "none");
            	$("#saveChanges").css("display", "");
            	$("#editCancelBtn").css("display", "none");
            	$("#editSaveBtn").css("display", "none");
				
				// 관리자일 경우 수정 버튼 보임
				if(memAuth == "ROLE_ADMIN" || memAuth == "ROLE_HR_MNG") {
					$("#eventDelBtn").css("display", "");
					$("#editableBtn").css("display", "");				
					
				// groupId가 C2, 회계 관리자일 경우 수정 버튼 보임
				} else if(memAuth == "ROLE_FA_MNG" && info.event.groupId == "C1" && info.event.groupId !== "com") {
					$("#eventDelBtn").css("display", "");
					$("#editableBtn").css("display", "");
					
				// groupId가 C3, 물류 관리자일 경우 수정 버튼 보임
				} else if(memAuth == "ROLE_LM_MNG" && info.event.groupId == "C3" && info.event.groupId !== "com") {
					$("#eventDelBtn").css("display", "");
					$("#editableBtn").css("display", "");
					
				// groupId가 C4, 시설 관리자일 경우 수정 버튼 보임
				} else if(memAuth == "ROLE_FM_MNG" && info.event.groupId == "C4" && info.event.groupId !== "com") {
					$("#eventDelBtn").css("display", "");
					$("#editableBtn").css("display", "");
					
				// groupId가 per인 경우 모두에게 보임
				} else if(info.event.groupId == "per" && info.event.groupId !== "com" ) {
					$("#eventDelBtn").css("display", "");
					$("#editableBtn").css("display", "");										

				// groupId가 videoChat이면서, 해당 회의의 생성자일 경우 삭제, 수정 버튼 보임
				} else if(info.event.groupId == "videoChat" && info.event.videoCreateMemId == videoCreateMemId) {
					$("#eventDelBtn").css("display", "");
					$("#editableBtn").css("display", "");
					
				} else
				
            	// input 태그들 비활성화
				$("#title").prop("disabled", true);
				$("#title").attr("disabled", true);
				$("#title").attr("readonly", true);
            	$("#startDate").prop("disabled", true);
            	$("#startTime").prop("disabled", true);
            	$("#endDate").prop("disabled", true);
            	$("#endTime").prop("disabled", true);
            	$("#content").prop("disabled", true);
            	$("#type").prop("disabled", true);
            	$("#color").prop("disabled", true);
            	$("#selEmps").prop("disabled", true);
            	
            	$("#saveChanges").css("display", "none");

            	
            	// 일정과 연관된 멤버 리스트 호출 함수            	
				$.ajax({
					url : "/emp/calendar/getScheduleMemList",
					data : {scheId : selScheId},
					dataType : "json",
					beforeSend: function(xhr) {
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			        },
			        success : function(result) {
			        	console.log("getScheduleMemList result : " , result);
			        	
			        	 // 새로운 memList 생성
			            let getMemList = [];
			            
			            // result를 반복하여 memList에 추가
			            for (let i = 0; i < result.length; i++) {
			                let member = {
			                    memId: result[i].memId,
			                    empNm: result[i].empNm,
			                    jbgdNm : result[i].jobGrade.jbgdNm
			                };
			                getMemList.push(member); // 새로운 리스트에 멤버 추가
			            }
			            
			            console.log("getMemList : ", getMemList);
			            // 참여자 리스트 출력 함수 호출
			            printGetEmpList(getMemList); // memList를 전달하여 호출
			        }
					
				});
            	
            	if(groupId == "videoChat") {            		
            		$.ajax({
            		    url: "/emp/calendar/getScheduleVideoChat",
            		    type: "post",
            		    data: {memId: createEmp,
            		    		scheId : selScheId,
            		    		roomId : roomId},
            		    dataType: "json",
            		    beforeSend: function(xhr) {
            		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            		    },
            		    success: function(result) {            		        	
            					console.log("getScheduleVideoChat result", result);	 
            					$("#videoChatLinkDiv").css("display", "");
            					let urlStr = "#getUrl_" + result.roomId;
            					$("#getUrlBtn").attr("data-target", urlStr);
            					roleId = result.roleId;
            		    }
            		});
            	}
            	
				$("#addModal").modal('show');
				
				// 모달이 닫힐 때 videoChatLinkDiv 숨기기
				$('#addModal').on('hidden.bs.modal', function () {
			    	$("#videoChatLinkDiv").css("display", "none");
			    	$("#eventDelBtn").css("display", "none");
				});
            	
            },
            select : function(arg) {				// 날짜 클릭 시 발생하는 이벤트
            	

            	
            	// 일정 상세에서 비활성화한 input 태그들 재활성화
				$("#title").prop("disabled", false);
				$("#title").attr("disabled", false);
				$("#title").attr("readonly", false);
            	$("#startDate").prop("disabled", false);
            	$("#startTime").prop("disabled", false);
            	$("#endDate").prop("disabled", false);
            	$("#endTime").prop("disabled", false);
            	$("#content").prop("disabled", false);
            	$("#type").prop("disabled", false);
            	$("#color").prop("disabled", false);
            	$("#editableBtn").css("display", "none");
            	$("#saveChanges").css("display", "");
            	$("#editCancelBtn").css("display", "none");
            	$("#editSaveBtn").css("display", "none");
            	$("#eventDelBtn").css("display", "none");

            	
            	if(startStr != "" || endStr != "") {
        			$("#startDate").val(startStr);			
        			$("#endDate").val(endStr);
        		}
            	// 관리자/인사 관리자는 회사 분류로 초기화
            	if (memAuth == "ROLE_ADMIN" || memAuth == "ROLE_HR_MNG") {
            	    $("#type").val("com");             
            	    $(".selEmpDiv").css("display", "none");
            	    $("#selEmpBtnDiv").css("display", "none");
            	    $("#color").val("#F6CED8").prop("disabled", true); // 빨강색 고정
            	    
            	// 각 부서 관리자는 해당 부서 분류로 초기화
            	} else if (memAuth == "ROLE_FA_MNG") {
            	    $("#type").val("C1");
            	    $(".selEmpDiv").css("display", "");
            	    $("#selEmpBtnDiv").css("display", "");
            	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
	            	$("#selEmps").prop("disabled", false);

            	} else if (memAuth == "ROLE_LM_MNG") {
            	    $("#type").val("C3");
            	    $(".selEmpDiv").css("display", "");
            	    $("#selEmpBtnDiv").css("display", "");
            	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
	            	$("#selEmps").prop("disabled", false);

            	} else if (memAuth == "ROLE_FM_MNG") {
            	    $("#type").val("C4");
            	    $(".selEmpDiv").css("display", "");
            	    $("#selEmpBtnDiv").css("display", "");
            	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
	            	$("#selEmps").prop("disabled", false);

            	// 실무자는 개인 분류로 초기화
            	} else {
            	    $("#type").val("per");
            	    $("#color").val("orange");
            	}

            	
        		$("#content").val("");
        		$("#title").val("");
                $("#startTime").val("");
                $("#endTime").val("");
                $("#startTimeLabel").css("display", "");
                $("#endTimeLabel").css("display", "");
                $("#startTime").css("display", "");
                $("#endTime").css("display", "");
                $("#allDay").prop("checked", false);
           		$("#allDay").prop("disabled", false);
				$("#addModal").modal('show');
            },
            eventSources :[ 	// 공휴일 가져오기
                {
                    googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com'
                    , color: 'white'
                    , textColor: 'red'
                    , url : 'none'
                    
                } 
            ],
            events: events,  // 초기 이벤트 배열
            eventTimeFormat: {
                hour: '2-digit',
                minute: '2-digit',
                hour12: false
            }
        });
        calendar.render();  // 캘린더 렌더링
	}
	
    // 캘린더 초기화
    initializeCalendar();
    
    // 참여 버튼 클릭 시 구루미 이동
    $(document).on("click", "#getUrlBtn", function() {
    	let selRoomId = $(this).data("target");
    	selRoomId = selRoomId.replace("#getUrl_", "");
    	console.log("getUrl selRoomId : " + selRoomId);	
    	
    	
    	
    	let data = {
    		roleId : roleId,
    		roomId : selRoomId,
    		apiUserId : createEmp,
    		username : empNm		
    	}
    	
    	$.ajax({
    		url : "/emp/videoChat/getUrl",
    		type : "get",
    		data : data,
    		dataType : "json",
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success : function(result) {
    			console.log("getUrl result : ", result);
    			window.open(result.data.url, "_blank", "width=600, height=400");
    		},
    		error : function(xhr) {
    			console.log("에러 : " + xhr.status);
    		}
    	});
    });

    $.ajax({
        url: "/emp/calendar/getMySchedule",
        data: { memId: createEmp, deptCd: memDept },
        type: "get",
        dataType: "json",
        beforeSend: function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function(result) {
            console.log("getMySchedule result: ", result);
            let list = result;
            
            var events = list.map(function(item) {
                // 날짜 및 시간 처리 로직
                let event = {
                    title: item.scheTitle,
                    color: item.backGroundColor, // 지정한 색깔로 불러옴
                    start: item.scheStartDate + "T" + item.scheStartTime, // 시작일과 시작 시간
                    description: item.scheContent,
                    groupId: item.scheType,
                    extendedProps: {
                        scheId: item.scheId, // scheId를 extendedProps에 추가
                        roomId : item.roomId,
                        videoCreateMemId : item.videoCreateMemId
                    }
                };

                // allDay가 true인 경우 종료일에 하루를 추가
                if (item.allDay === "true") {
                    event.allDay = true;
                    // 종료일 다음날 00:00까지 포함되도록 설정 (FullCalendar 규칙)
                    event.end = moment(item.scheEndDate).add(1, 'days').format('YYYY-MM-DD');
                } else {
                    event.allDay = false;
                    // 시간 기반 이벤트의 경우 종료시간 그대로 사용
                    event.end = item.scheEndDate + "T" + item.scheEndTime;
                }

                return event; // 수정된 event 객체 반환
            });

            console.log("events : ", events);

            // AJAX 응답으로 받은 이벤트를 FullCalendar에 추가
            calendar.addEventSource(events);  // 기존 인스턴스에 이벤트 추가
            calendar.render();  // 캘린더 렌더링
        },
        error: function(result) {
            console.log("에러 발생: " + result);
        }
    });

    
  //모달창 이벤트
    $("#saveChanges").on("click", function () {

    	
    	let checked = $("#allDay").is(":checked");
    	let checkedValue;

    	if (checked) {
    	    $("#allDay").val("true");
    	    checkedValue = "true";
    	} else {
    	    $("#allDay").val("false");
    	    checkedValue = "false";
    	}
    	
    	let color = "";
    	if($("#type").val()=="com") {
    		color = "#F6CED8";
        } else if($("#type").val() === "C1" || $("#type").val() === "C2" || $("#type").val() === "C3" || $("#type").val() === "C4") {
        	color = "#A9D0F5";
        }

    	// 달력에 반영될 이벤트 데이터
    	var eventData = {
    	    title: $("#title").val(),
    	    start: $("#startDate").val() + "T" + $("#startTime").val(),
    	    end: moment($("#endDate").val() + "T" + $("#endTime").val()).add(1, 'days').format('YYYY-MM-DDTHH:mm:ss'), // 종료일에 하루 추가
    	    color: color,
    	    allDay: (checkedValue == "true") ? true : false, // 삼항 연산자를 사용하여 allDay 설정
    	    description : $("#content").val(),
    	    groupId : $("#type").val(),
    	    
    	};

    	console.log("color : " + $("#color").val());
    	console.log("eventData : ", eventData);
      
	      //빈값입력시 오류
	      if (
	        eventData.scheTitle == "" ||
	        eventData.scheStartDate == "" ||
	        eventData.scheEndDate == ""
	        
	      ) {
	        alert("입력하지 않은 값이 있습니다.");
	
	        //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
	      } else if ($("#startDate").val() > $("#endDate").val()) {
    	  	if($("#allDay").val() === "true") {
    	  		return;
    	  	} else {
	        	alert("시간을 잘못입력 하셨습니다.");    	  		
    	  	}
        
    	  }	else {	        
	        
	        $("#addScheduleModal").modal("hide");
	       
	        
	        console.log("title : " + $("#title").val());
	        let newTitle = $("#title").val();
	        console.log("newTitle : " + newTitle);
	        
	        if($("#type").val()=="com") {
	        	$("#color").val("#F6CED8");
	        } else if($("#type").val() === "C1" || $("#type").val() === "C2" || $("#type").val() === "C3" || $("#type").val() === "C4") {
	        	$("#color").val("#A9D0F5");
	        }
        
			if(confirm("저장하시겠습니까?")) {
				$.ajax({
					url : "/emp/calendar/addSchedule",
					type : "post",
					data : {scheTitle 	   : newTitle,
					        scheStartDate  : $("#startDate").val(),
					        scheStartTime  : $("#startTime").val() + ":00",
					        scheEndDate    : $("#endDate").val(),
					        scheEndTime    : $("#endTime").val() + ":00",
					        createEmp	   : createEmp,
					        scheType	   : $("#type").val(),
					        scheContent	   : $("#content").val(),
					        backGroundColor: $("#color").val(),
					        allDay		   : $("#allDay").val(),
					        scheType	   : $("#type").val(),
					        selMemIdList: JSON.stringify(selMemIdList) // 배열을 JSON 문자열로 변환하여 전송
					        },
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success : function(result) {
				    	  // 이벤트 추가
				    	console.log("addSchedule result scheId : " + result);
				    	eventData.extendedProps = {
				    		    scheId: result, // scheId 값을 나중에 추가
				    		    selMemIdList: selMemIdList, // 참여자 리스트 추가
				    		    selEmpList : selEmpList
				    		};
				        calendar.addEvent(eventData);

						
				    	// 관리자/인사 관리자는 회사 분류로 초기화
		            	if (memAuth == "ROLE_ADMIN" || memAuth == "ROLE_HR_MNG") {
		            	    $("#type").val("com");             
		            	    $(".selEmpDiv").css("display", "none");
		            	    $("#selEmpBtnDiv").css("display", "none");
		            	    $("#color").val("#F6CED8").prop("disabled", true); // 빨강색 고정
		            	    
		            	// 각 부서 관리자는 해당 부서 분류로 초기화
		            	} else if (memAuth == "ROLE_FA_MNG") {
		            	    $("#type").val("C1");
		            	    $(".selEmpDiv").css("display", "");
		            	    $("#selEmpBtnDiv").css("display", "");
		            	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
		            	    $("#selEmps").prop("disabled", false);

		            	} else if (memAuth == "ROLE_LM_MNG") {
		            	    $("#type").val("C3");
		            	    $(".selEmpDiv").css("display", "");
		            	    $("#selEmpBtnDiv").css("display", "");
		            	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
		            	    $("#selEmps").prop("disabled", false);

		            	} else if (memAuth == "ROLE_FM_MNG") {
		            	    $("#type").val("C4");
		            	    $(".selEmpDiv").css("display", "");
		            	    $("#selEmpBtnDiv").css("display", "");
		            	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
		            	    $("#selEmps").prop("disabled", false);

		            	// 실무자는 개인 분류로 초기화
		            	} else {
		            	    $("#type").val("per");
		            	    $("#color").val("orange");
		            	}

				    	
						$("#content").val("");
						$("#title").val("");
				        $("#startDate").val("");
				        $("#startTime").val("");
				        $("#endDate").val("");
				        $("#endTime").val("");
						$("#addModal").modal('hide');
						
						$("#successModal").modal('show');
						setTimeout(() => location.reload(), 1000);
						
						
					},
					error : function(xhr) {
						console.log("addSchedule error : " + xhr.status);
					}
				});
			}
      	}     
    });
  
  // 사원 선택 모달
    $("#selEmps").on("click", function() {
		$("#selEmpsModal").modal('show');		

		$.ajax({
			url : "/emp/videoChat/getDeptList",
			contentType : "application/json; charset=utf-8",
			type : "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				console.log("getDeptList : ", result);
				deptList = result;
				console.log("deptList : ", deptList);
				
				let str = "";
				
				for(var i=0; i<deptList.length; i++) {
					if(deptList[i].deptCd != "C5" && deptList[i].deptCd != "C6" && deptList[i].deptCd != "C7") {
						str += "<button type='button' class='btn btn-third' id='selDeptBtn' data-target='" + deptList[i].deptCd + "' style='width:100%; float:left; text-align:left; background:white; border-color:#e1e1e1; color:black;'>" + deptList[i].deptNm + "</button>";
					}
				}
				$(".selDept").html(str);				
			}			
		});	
	});
  // 사원 선택 모달
  
  // 관리자/인사관리자일 경우 일정 생성 시 회사 값이 제일 먼저 선택됨
  if (isAdmin) {
        $("#color").val("#F6CED8").prop("disabled", true); // 빨강색 고정
    }
  
  
  // 구분 값 변경에 따라 사원 선택 메뉴 표출/숨기기
    $("#type").on("change", function() {
    	let selectedType = $(this).val();
    	
    	  if($("#type").val() === "com") {
    		  
    		  
    		  if(memAuth !== "ROLE_ADMIN" && memAuth !== "ROLE_HR_MNG") {
    			  alert("해당 일정 생성에 대한 권한이 없습니다");
    			  if(memAuth == "ROLE_FA_MNG") {
    				  $("#type").val("C1");
    				  $(".selEmpDiv").css("display", "");
    		      		$("#selEmpBtnDiv").css("display", "");
    		    	    $("#color").val("#A9D0F5").prop("disabled", true);		
    			  } else if(memAuth == "ROLE_LM_MNG") {
    				  $("#type").val("C3");
    				  $(".selEmpDiv").css("display", "");
    		      		$("#selEmpBtnDiv").css("display", "");
    		    	    $("#color").val("#A9D0F5").prop("disabled", true); 		
    			  } else if(memAuth == "ROLE_FM_MNG") {
    				  $("#type").val("C4");
    				  $(".selEmpDiv").css("display", "");
    		      		$("#selEmpBtnDiv").css("display", "");
    		    	    $("#color").val("#A9D0F5").prop("disabled", true); 		
    			  } else {
    				  $("#type").val("per");
    			  }
    		  } else {
	    		$(".selEmpDiv").css("display", "none");
	      		$("#selEmpBtnDiv").css("display", "none");
	    	    $("#color").val("#F6CED8").prop("disabled", true); // 빨강색 고정			  
    		  }
    	    
    	  } else if($("#type").val() === "per" ){
       	    $(".selEmpDiv").css("display", "none");
       		$("#selEmpBtnDiv").css("display", "none");
       		$("#color").prop("disabled", false); // 색상 선택 가능
            $("#color").val("orange"); // 초기값 설정
            
    	  } else {
       	    $(".selEmpDiv").css("display", "");
       		$("#selEmpBtnDiv").css("display", "");
       	    $("#selEmps").removeAttr("disabled");  // 버튼 활성화 (type이 0이 아닐 때)
       	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
    		  

    	  }
   	});
  
	$("#startDate").on("change", function() {
		var isChecked = $("#allDay").is(":checked");
		if (isChecked) {
	        $("#startTime").prop("disabled", true);
	    } else {
	        $("#startTime").prop("disabled", false);
			$("#startTime").val("00:00");
	    }
	});
	
	$("#endDate").on("change", function() {
		var isChecked = $("#allDay").is(":checked");
		if (isChecked) {
	        $("#endTime").prop("disabled", true);
	    } else {
	        $("#endTime").prop("disabled", false);
			$("#endTime").val("23:59");
	    }
	})
	
	$("#addScheduleBtn").on("click", function() {
		if(startStr != "" || endStr != "") {
			$("#startDate").val(startStr);			
			$("#endDate").val(endStr);
		}
		$("#addModal").modal('show');
	})
	
	// 모달이 닫힐 때 videoChatLinkDiv 숨기기
		$('#addModal').on('hidden.bs.modal', function () {
	    $("#videoChatLinkDiv").css("display", "none");
	});
	
	
	$(".dismissBtn").on("click", function() {
		console.log("버튼클릭");
		$("#type").val("");
		$("#content").val("");
		$("#title").val("");
        $("#startDate").val("");
        $("#startTime").val("");
        $("#endDate").val("");
        $("#endTime").val("");
        $("#color").val("");
        $("#allDay").prop("checked", false);
   		$("#allDay").prop("disabled", false);
   		
   		$("#title").prop("disabled", false);
    	$("#startDate").prop("disabled", false);
    	$("#startTime").prop("disabled", false);
    	$("#endDate").prop("disabled", false);
    	$("#endTime").prop("disabled", false);
    	$("#content").prop("disabled", false);
    	$("#type").prop("disabled", false);
    	$("#color").prop("disabled", false);
    	
    	$("#videoEditSaveBtn").css("display", "none");
		$("#editableBtn").css("display", "none");
		$("#eventDelBtn").css("display", "none");
		$("#saveChangesBtn").css("display", "none");
		$("#editableBtn").css("display", "none");
		$("#editCancelBtn").css("display", "none");
		$("#videoChatLinkDiv").css("display", "none");
		 $(this).closest('.modal').modal('hide');
	})
	
	$("#allDay").on("change", function() {
		// 체크박스가 체크되었는지 여부 확인
	    var isChecked = $("#allDay").is(":checked");

	    if (isChecked) {
	    	$("#startTime").val("00:00");
	    	$("#endTime").val("23:59");
	    	
	    	$("#startTimeLabel").css("display", "none");
	    	$("#endTimeLabel").css("display", "none");
	    	
	    	$("#startTime").css("display", "none");
	    	$("#endTime").css("display", "none");
	    	
	    } else {
	        // 체크가 해제되었을 때의 처리
	    	$("#startTime").val("");
	    	$("#endTime").val("");
	    	
	    	$("#startTimeLabel").css("display", "");
	    	$("#endTimeLabel").css("display", "");
	    	
	    	$("#startTime").css("display", "");
	    	$("#endTime").css("display", "");
	    	
	    }
	});
	
	// 날짜 선택 시 선택한 날짜 출력
    calendar.on("select", info => {
    	
    	console.log("select startStr : ", info.startStr);
    	console.log("select endStr : ", info.endStr);
    	
    	// startStr은 그대로 사용
        startStr = info.startStr;

        // moment.js 사용해서 endStr에서 하루를 뺌
        endStr = moment(info.endStr).subtract(1, 'days').format('YYYY-MM-DD');
        
        console.log("startStr : " + startStr);
        console.log("endStr (1 day subtracted): " + endStr);
    	
    	$("#startDate").val(startStr);	// 선택한 날짜 자동 입력
    	$("#endDate").val(endStr);		// 선택한 날짜 자동 입력
    	
    });
	
	
	$("#editableBtn").on("click", function() {    	
    	
    	$("#title").prop("disabled", false);
    	$("#title").attr("disabled", false);
		$("#title").attr("readonly", false);
    	$("#startDate").prop("disabled", false);
    	$("#startTime").prop("disabled", false);
    	$("#endDate").prop("disabled", false);
    	$("#endTime").prop("disabled", false);
    	$("#content").prop("disabled", false);
    	$("#type").prop("disabled", true);
    	$("#color").prop("disabled", true);
    	$("#selEmps").prop("disabled", true);
		$("#allDay").prop("disabled", false);
		$("#editableBtn").css("display", "none");
    	$("#saveChanges").css("display", "none");
    	$("#eventDelBtn").css("display", "none");
    	$("#editCancelBtn").css("display", "");
    	if(groupId == "videoChat") {
    		$("#videoEditSaveBtn").css("display", "");
    	} else {
	    	$("#editSaveBtn").css("display", "");    		
    	}
	});
	
	$("#editCancelBtn").on("click", function() {
		if(confirm("취소하시겠습니까?")) {
			$("#addModal").modal('hide');
			$("#videoEditSaveBtn").css("display", "none");
			$("#editableBtn").css("display", "none");
			$("#eventDelBtn").css("display", "none");
			$("#saveChangesBtn").css("display", "none");
			$("#editableBtn").css("display", "none");
			$("#editCancelBtn").css("display", "none");
			$("#videoChatLinkDiv").css("display", "none");
		} else {
			return;
		}
	})
	
	$("#eventDelBtn").on("click", function() {
		if(confirm("삭제하시겠습니까?")) {
			$.ajax({
				url : "/emp/calendar/deleteSchedule",
				type : "post",
				data : {scheId : selScheId,
						roomId : roomId},
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log("deleteSchedule result : " + result);
					$("#addModal").modal('hide');
					$("#videoEditSaveBtn").css("display", "none");
					$("#editableBtn").css("display", "none");
					$("#eventDelBtn").css("display", "none");
					$("#saveChangesBtn").css("display", "none");
					$("#editableBtn").css("display", "none");
					$("#editCancelBtn").css("display", "none");
					$("#videoChatLinkDiv").css("display", "none");
					location.reload();
				}
			})
		}
	});
	
	$("#videoEditSaveBtn").on("click", function() {
		console.log("videoEditSaveBtn 버튼 클릭");
	})
	
	$("#editSaveBtn").on("click", function() {
		let checked = $("#allDay").is(":checked");
    	let checkedValue;

    	if (checked) {
    	    $("#allDay").val("true");
    	    $("#startTime").val("00:00");
    	    $("#endTime").val("23:59");
    	    checkedValue = "true";
    	} else {
    	    $("#allDay").val("false");
    	    checkedValue = "false";
    	}
    	
    	let color = "";

        if($("#type").val()=="com") {
        	color = "#F6CED8";
        } else if($("#type").val() === "C1" || $("#type").val() === "C2" || $("#type").val() === "C3" || $("#type").val() === "C4") {
        	color = "#A9D0F5";
        }
        
    	// 달력에 반영될 이벤트 데이터
    	var eventData = {
    	    title: $("#title").val(),
    	    start: $("#startDate").val() + "T" + $("#startTime").val(),
    	    end: moment($("#endDate").val() + "T" + $("#endTime").val()).add(1, 'days').format('YYYY-MM-DDTHH:mm:ss'), // 종료일에 하루 추가
    	    color: color,
    	    allDay: (checkedValue == "true") ? true : false, // 삼항 연산자를 사용하여 allDay 설정
    	    description : $("#content").val(),
    	    groupId : $("#type").val(),
    	    
    	};

    	 
    	console.log("eventData : ", eventData);
    	
    	
      
	      //빈값입력시 오류
	      if (
	        eventData.scheTitle == "" ||
	        eventData.scheStartDate == "" ||
	        eventData.scheEndDate == ""
	        
	      ) {
	        alert("입력하지 않은 값이 있습니다.");
	
	        //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
	      } else if ($("#startDate").val() > $("#endDate").val()) {
    	  	if($("#allDay").val() === "true") {
    	  		return;
    	  	} else {
	        	alert("시간을 잘못입력 하셨습니다.");    	  		
    	  	}
        
    	  }	else {	        
	        
	        $("#addScheduleModal").modal("hide");
	       
	        
	        console.log("title : " + $("#title").val());
	        let newTitle = $("#title").val();
	        console.log("newTitle : " + newTitle);
	        
	        if($("#type").val()=="com") {
	        	$("#color").val("#F6CED8");
	        } else if($("#type").val() === "C1" || $("#type").val() === "C2" || $("#type").val() === "C3" || $("#type").val() === "C4") {
	        	$("#color").val("#A9D0F5");
	        }
        
			if(confirm("저장하시겠습니까?")) {
				$.ajax({
					url : "/emp/calendar/updateSchedule",
					type : "post",
					data : {scheId		   : selScheId,
							scheTitle 	   : newTitle,
					        scheStartDate  : $("#startDate").val(),
					        scheStartTime  : $("#startTime").val() + ":00",
					        scheEndDate    : $("#endDate").val(),
					        scheEndTime    : $("#endTime").val() + ":00",
					        createEmp	   : createEmp,
					        scheType	   : $("#type").val(),
					        scheContent	   : $("#content").val(),
					        backGroundColor: $("#color").val(),
					        allDay		   : $("#allDay").val(),
					        scheType	   : $("#type").val(),
					        selMemIdList: JSON.stringify(selMemIdList) // 배열을 JSON 문자열로 변환하여 전송
					        },
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success : function(result) {
				    	  // 이벤트 추가
				    	console.log("addSchedule result scheId : " + result);
				    	  
				    	eventData.extendedProps = {
				    		    scheId: result, // scheId 값을 나중에 추가
				    		    selMemIdList: selMemIdList, // 참여자 리스트 추가
				    		    selEmpList : selEmpList
				    		};
				    	



						
				    	// 관리자/인사 관리자는 회사 분류로 초기화
		            	if (memAuth == "ROLE_ADMIN" || memAuth == "ROLE_HR_MNG") {
		            	    $("#type").val("com");             
		            	    $(".selEmpDiv").css("display", "none");
		            	    $("#selEmpBtnDiv").css("display", "none");
		            	    $("#color").val("#F6CED8").prop("disabled", true); // 빨강색 고정
		            	    
		            	// 각 부서 관리자는 해당 부서 분류로 초기화
		            	} else if (memAuth == "ROLE_FA_MNG") {
		            	    $("#type").val("C1");
		            	    $(".selEmpDiv").css("display", "");
		            	    $("#selEmpBtnDiv").css("display", "");
		            	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
		            	    $("#selEmps").prop("disabled", false);

		            	} else if (memAuth == "ROLE_LM_MNG") {
		            	    $("#type").val("C3");
		            	    $(".selEmpDiv").css("display", "");
		            	    $("#selEmpBtnDiv").css("display", "");
		            	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
		            	    $("#selEmps").prop("disabled", false);

		            	} else if (memAuth == "ROLE_FM_MNG") {
		            	    $("#type").val("C4");
		            	    $(".selEmpDiv").css("display", "");
		            	    $("#selEmpBtnDiv").css("display", "");
		            	    $("#color").val("#A9D0F5").prop("disabled", true); // 파랑색 고정
		            	    $("#selEmps").prop("disabled", false);

		            	// 실무자는 개인 분류로 초기화
		            	} else {
		            	    $("#type").val("per");
		            	    $("#color").val("orange");
		            	}

				    	
						$("#content").val("");
						$("#title").val("");
				        $("#startDate").val("");
				        $("#startTime").val("");
				        $("#endDate").val("");
				        $("#endTime").val("");
						$("#addModal").modal('hide');
						
						$("#videoEditSaveBtn").css("display", "none");
						$("#editableBtn").css("display", "none");
						$("#eventDelBtn").css("display", "none");
						$("#saveChangesBtn").css("display", "none");
						$("#editableBtn").css("display", "none");
						$("#editCancelBtn").css("display", "none");
						$("#videoChatLinkDiv").css("display", "none");
						
				    	$("#successModal").modal('show');
						setTimeout(() => location.reload(), 1000);
						
					},
					error : function(xhr) {
						console.log("addSchedule error : " + xhr.status);
					}
				});
			}
      	}     
	})
});


</script>
<div class="titleHeader">
	<span class="pageTitle" style="font-size:20px; font-weight: 600; word-wrap: break-word;">캘린더</span>
</div>
<div class="container" style="font-family:Pretendard; border:0.5px solid #e4e4e4; border-radius : 10px; padding-bottom : 20px;">

	<div class="aside">		
		<div class="miniCalendar">
			<div class="sec_cal">
			  <div class="cal_nav">
			    <a href="javascript:;" class="nav-btn go-prev">
			    	&lt;
			    </a>
			    <div class="year-month"></div>
			    <a href="javascript:;" class="nav-btn go-next">
			    	&gt; 
			    </a>
			  </div>
			  <div class="cal_wrap">
			    <div class="days">
			      <div class="day">SUN</div>
			      <div class="day">MON</div>
			      <div class="day">TUE</div>
			      <div class="day">WED</div>
			      <div class="day">THU</div>
			      <div class="day">FRI</div>
			      <div class="day">SAT</div>
			    </div>
			    <div class="dates"></div>
			  </div> <!-- cal_wrap 끝 -->
			</div> <!-- sec_cal 끝 -->
		</div>	<!-- miniCalendar 끝 -->
		
		<div class="createBtnsDiv">
			<button id="addScheduleBtn" type="button">일정 추가</button>
			<button type="button" id="openCreateVideoChatBtn">화상회의 생성</button>
			<div class="colorRegend">
				<div id="regendGroup1">
					<label id="regendComSticker"></label>
					<input type="text" id="regendCom" name="regendCom" value="  회사" readonly>
					<label id="regendDepSticker"></label>
					<input type="text" id="regendDep" name="regendDep" value="  부서" readonly>
				</div>
				<div id="regendGroup2">
					<label id="regendPerSticker"></label>
					<input type="text" id="regendPer" name="regendPer" value="  개인" readonly>
					<label id="regendVideoSticker"></label>
					<input type="text" id="regendVideo" name="regendVideo" value="  화상회의" readonly>
				</div>
			</div>
		</div>
		
	</div>	
	<!-- aside 끝 -->

  <div id='calendar'></div>
</div>
  
  <!-- 일정 추가 모달 -->
  <div
      class="modal fade"
      id="addModal"
      tabindex="-1"
      aria-labelledby="addModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="addSchedule-header">
            <button
              class="dismissBtn"
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            >
            <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="addSchedule-body">
          	<div id="newTitleDiv">
	          	<label for="title">제목</label>
	          	<input type="text" id="title" name="title" required/>
          	</div>
          	
          	<div id="videoChatLinkDiv" style="display:none;">
          		<label for="videoChatLink">화상 회의</label>
          		<button class="btn btn-primary" id="getUrlBtn"
					            data-toggle="modal"
					            data-target="">
					            참여</button>
          	</div>
          	
          	<div id="newAlldayDiv">
          		<label for="allDay">하루종일</label>
          		<input type="checkbox" id="allDay" name="allDay" />
          	</div>
          	
          	<div id="newStDateDiv">
	          	<label for="startDate">시작일자</label>
	          	<input type="date" id="startDate" name="startDate" />

	          	<label for="startTime" id="startTimeLabel">시작시간</label>
	          	<input type="time" id="startTime" name="startTime" />
          	</div>
          	
          	<div id="newEdDateDiv">
	          	<label for="endDate">종료일자</label>
	          	<input type="date" id="endDate" name="endDate"/>

	          	<label for="endTime" id="endTimeLabel">종료시간</label>
	          	<input type="time" id="endTime" name="endTime"/>
          	</div>

          	<div id="newContentDiv">
	          	<label for="content">내용</label>
	          	<input type="text" id="content" name="content" />
          	</div>
          	
          	<div id="newTypeDiv">
	          	<label for="type">구분</label>
	          	<select id="type" name="type">
	          	<c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_ADMIN") || memVO.authLinkVOList[0].authCode.equals("ROLE_HR_MNG")}'>
	          		<option value="com" selected>회사</option>
	          		<option value="C2">인사팀</option>
	          		<option value="C1">회계팀</option>
	          		<option value="C3">물류팀</option>
	          		<option value="C4">시설팀</option>
                </c:if>
<%-- 	          	<c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_HR_MNG")}'> --%>
<!-- 	          		<option value="C2" selected>인사팀</option> -->
<%--                 </c:if> --%>
                <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_FA_MNG")}'>
	          		<option value="C1" selected>회계팀</option>
	          	</c:if>
                <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_LM_MNG")}'>
	          		<option value="C3" selected>물류팀</option>
	          	</c:if>
                <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_FM_MNG")}'>
	          		<option value="C4" selected>시설팀</option>
	          	</c:if>
	          		<option value="per">개인</option>
	          	</select>
          	</div>
          	
          	
          	<c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_ADMIN") || memVO.authLinkVOList[0].authCode.equals("ROLE_HR_MNG")}'>
	       		    <div id="selEmpBtnDiv" style="display:none;">
			          	<label for="selEmps">참여자</label>
			          	<button type="button" id="selEmps">선택</button>
			        </div>
		          	
		          	
			        <div class="selEmpDiv" style="display:none;">
			        </div>
               </c:if>
<%-- 	          	<c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_HR_MNG")}'> --%>
<!-- 	          		<option value="C2" selected>인사팀</option> -->
<%--                 </c:if> --%>
               <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_FA_MNG")}'>
          		          	<div id="selEmpBtnDiv">
						          	<label for="selEmps">참여자</label>
						          	<button type="button" id="selEmps">선택</button>
					        </div>
				          	
				          	
					        <div class="selEmpDiv">
					        </div>
          	</c:if>
               <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_LM_MNG")}'>
          		<div id="selEmpBtnDiv">
			          	<label for="selEmps">참여자</label>
			          	<button type="button" id="selEmps">선택</button>
		        </div>
	          	
	          	
		        <div class="selEmpDiv">
		        </div>
          	</c:if>
               <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_FM_MNG")}'>
          		<div id="selEmpBtnDiv">
			          	<label for="selEmps">참여자</label>
			          	<button type="button" id="selEmps">선택</button>
		        </div>
	          	
	          	
		        <div class="selEmpDiv">
		        </div>
          	</c:if>
<!--           	<div id="selEmpBtnDiv"> -->
<!-- 		          	<label for="selEmps">참여자</label> -->
<!-- 		          	<button type="button" id="selEmps">선택</button> -->
<!-- 	        </div> -->
          	
          	
<!-- 	        <div class="selEmpDiv"> -->
<!-- 	        </div> -->
            
            <div id="selColorDiv">
	            <label for="color">색상</label>
	            <select id="color">
			        <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_ADMIN") || memVO.authLinkVOList[0].authCode.equals("ROLE_HR_MNG")}'>
	            	<option value="#F6CED8" selected>빨강색</option>
	                <option value="#A9D0F5">파랑색</option>	                
	                </c:if>
	                <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_FA_MNG")}'>
	                <option value="#A9D0F5" selected >파랑색</option>	                
	                </c:if>
	                <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_LM_MNG")}'>
	                <option value="#A9D0F5" selected >파랑색</option>	                
	                </c:if>
	                <c:if test='${memVO.authLinkVOList[0].authCode.equals("ROLE_FM_MNG")}'>
	                <option value="#A9D0F5" selected >파랑색</option>	                
	                </c:if>
	                <option value="orange">주황색</option>
	                <option value="indigo">남색</option>
	                <option value="purple">보라색</option>
	                <option value="#E6E6E6">회색</option>
	            </select>
	        </div>
	        
	       		 
	        
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="saveChanges">
             등록
            </button>
            <button type="button" class="btn btn-primary" id="eventDelBtn" style="display:none;">
         	삭제
            </button>
            <button type="button" class="btn btn-primary" id="editableBtn" style="display:none;">
             수정
            </button>
            <button type="button" class="btn btn-primary" id="editCancelBtn" style="display:none;">
         	취소
            </button>
            <button type="button" class="btn btn-primary" id="editSaveBtn" style="display:none;">
         	완료
            </button>
            <button type="button" class="btn btn-primary" id="videoEditSaveBtn" style="display:none;">
         	완료
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- 일정 추가 모달 -->
    
 
    
<!-- 사원 선택 모달 -->
<div class="modal fade" id="selEmpsModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="selEmpsModalContent">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" class="dismissBtn" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="selEmpsModalBody">
            	<div class="department" style="display:flex; margin-top:20px;">
            		<div class="d-flex flex-column">
	                <label for="selDept" class="mr-1">부서</label>
	                <div class="selDept" style="width:200px; min-width:100px; border:1px solid #B1B1B1;">
	                
	                </div>
	            </div>
	            <div class="d-flex flex-column" style="margin-left:30px;">	                
	                <label for="selEmp" style="margin-left:10px;">사원</label>
	                <div class="selEmp" style="width:200px; height:380px; max-height:380px; overflow-y:auto; min-width:150px; border:1px solid #B1B1B1;">
	                
	                </div>
	            </div>
	            <div style="height:300px; max-height:300px; width:30px; display:flex; align-items:center; margin-left:30px;">
            		<span>
	                	<i class="bi bi-arrow-bar-right" style="font-size:30px; font-weight:600; vertical-align:center; -webkit-text-stroke: 2px"></i>
                	</span>
	            </div>
	            <div class="d-flex flex-column" style="margin-left:30px;">
	                <label for="selectedEmp">참여자</label>
	                <div class="selectedEmp" style="width:200px; height:380px; max-height:380px; overflow-y:auto; border:1px solid #B1B1B1;">
	                </div>
            	</div>
            	</div>
       		</div>
            <div class="modal-footer">
                <button type="button" id="selEmpCalcelBtn" class="btn btn-secondary" class="dismissBtn" data-bs-dismiss="modal">취소</button>
                <button type="button" id="selEmpDoneBtn" class="btn btn-secondary">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 사원 선택 모달 -->

<!-- 회의 생성 모달 -->
<div class="modal fade" id="createVideoChatModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="createVideoChat-header">
                <button type="button" class="dismissBtn" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="creaetVideoChat-body" id="createVideoChatModalBody">
                <div class="vNewTitleDiv">
	                <label for="vNewTitle">회의 제목</label>
	                <input type="text" id="vNewTitle" name="vNewTitle" placeholder="회의 제목"/>	                
                </div>
                
                <div class="vNewEmpDiv">
	                <label for="vNewEmp">주최자</label>
	                <input type="text" id="vNewEmp" name="vNewEmp" value="${memVO.employeeVO.empNm}" readonly/>
                </div>
                
	            <div class="vNewStTimeDiv">	               
	                <label for="vNewStTime">시작 시간</label>
	                <input type="datetime-local" id="vNewStTime" name="vNewStTime" />
                </div>
	            <div class="vNewEdTimeDiv">	               
	                <label for="vNewEdTime">종료 시간</label>
	                <input type="datetime-local" id="vNewEdTime" name="vNewEdTime" />
                </div>
                                
                
                <label for="vNewEmps">참여자</label>
                <button type="button" id="vSelEmps">선택</button>
                <div class="vNewEmpList">
                
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="cancelVideoChatBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" id="createVideoChatBtn" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 회의 생성 모달 -->

<!-- 화상회의 사원 선택 모달 -->
<div class="modal fade" id="vSelEmpsModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="vSelEmpContent">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" class="dismissBtn" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="vSelEmpsModalBody">
            	<div class="department" style="display:flex; margin-top:20px;">
            		<div class="d-flex flex-column">
		                <label for="vSelDept">부서</label>
		                <div class="vSelDept" style="width:200px; min-width:100px; border:1px solid #B1B1B1;">
		                
		                </div>
	                </div>
	                <div class="d-flex flex-column" style="margin-left:30px;">
	                
	                <label for="vSelEmp" style="margin-left:10px;">사원</label>
	                <div class="vSelEmp" style="width:200px; height:380px; max-height:380px; overflow-y:auto; min-width:150px; border:1px solid #B1B1B1;">
	                
	                </div>
	            </div>
	            <div style="height:300px; max-height:300px; width:30px; display:flex; align-items:center; margin-left:30px;">
            		<span>
	                	<i class="bi bi-arrow-bar-right" style="font-size:30px; font-weight:600; vertical-align:center; -webkit-text-stroke: 2px"></i>
                	</span>
	            </div>
	            <div class="d-flex flex-column" style="margin-left:30px;">
	                <label for="vSelectedEmp">참여자</label>
	                <div class="vSelectedEmp" style="width:200px; height:380px; max-height:380px; overflow-y:auto; border:1px solid #B1B1B1;">
	                </div>
            	</div>
            	</div>
            </div>
            <div class="modal-footer">
                <button type="button" id="vselEmpCalcelBtn" class="btn btn-secondary" class="dismissBtn" data-dismiss="modal">취소</button>
                <button type="button" id="vSelEmpDoneBtn" class="btn btn-secondary">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 화상회의 사원 선택 모달 -->

<!-- 일정 등록 완료 모달 -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="successModalContent" style="border-radius:5px; background: white; text-align: center; height: 150px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" class="dismissBtn" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="successModalBody">
            	일정이 등록되었습니다.
            </div>
        </div>
    </div>
</div>
<!-- 일정 등록 완료 모달 -->
