<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <h4 class="page-title">개인 일정</h4>
        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
    <div class="col-12">

        <div class="card">
            <div class="card-body">
                <div class="row">

                    <div class="col-lg-12">
                        <div class="mt-4 mt-lg-0">
                            <div id="calendar"></div>
                        </div>
                    </div> <!-- end col -->

                </div> <!-- end row -->
            </div> <!-- end card body-->
        </div> <!-- end card -->

        <!-- Add New Event MODAL -->
        <div class="modal fade" id="event-modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header py-3 px-4 border-bottom-0">
                        <h5 class="modal-title" id="modal-title">일정</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-4 pb-4 pt-0">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <label class="control-label form-label">일정명</label>
                                    <input class="form-control" placeholder="일정명을 입력해 주세요." type="text" name="title" id="event-title" required />
                                    <input type="hidden" value="" id="event-id"/>
                                    <div class="invalid-feedback">일정명을 입력해주세요</div>
                                </div>
                            </div>
                            <div class="col-12">
                            	<div class="mb-2">
                            		<label class="control-labe form-label">시작일</label>
                            		<input class="form-control" type="datetime-local" name="start" id="event-start" required/>
                            		<div class="invalid-feedback">시작일을 입력해주세요</div>
                            	</div>
                            </div>
                            <div class="col-12">
                            	<div class="mb-2">
                            		<label class="control-labe form-label">종료일</label>
                            		<input class="form-control" type="datetime-local" name="end" id="event-end" required/>
                            		<div class="invalid-feedback">종료일을 입력해주세요</div>
                            	</div>
                            </div>
                            <div class="col-6">
                            	<div class="mb-2">
                            		<label class="control-labe form-label">하루종일</label>
                            		<input type="checkbox" id="event-allday" value="Y" class="form-check-input"/>
                            		<div class="invalid-feedback">종료일을 입력해주세요</div>
                            	</div>
                            </div>
                            <div class="col-3 text-end">
                                <div class="mb-3">
                                    <label class="control-label form-label">색상 선택</label>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <input type="color" name="textColor" id="event-category" class="color-input form-control"/>
                                    <div class="invalid-feedback">배경색을 지정해주세요.</div>
                                </div>
                            </div>
                            <div class="col-12">
                            	<div class="mb-2">
                            		<label class="control-labe form-label">설명</label>
                            		<textarea class="form-control" name="content" id="event-content"></textarea>
                            	</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <button type="button" class="btn btn-danger" id="btn-delete-event" style="display : none">삭제</button>
                            </div>
                            <div class="col-6 text-end">
                                <button type="button" class="btn btn-light me-1" data-bs-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-success" id="btn-save-event">등록</button>
                                <button type="button" class="btn btn-success" id="btn-update-event" style="display : none">수정</button>
                            </div>
                        </div>
                    </div>
                </div> <!-- end modal-content-->
            </div> <!-- end modal dialog-->
        </div>
        <!-- end modal-->
    </div>
    <!-- end col-12 -->
</div> <!-- end row -->

<!-- Fullcalendar js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/fullcalendar/index.global.min.js"></script>
<!-- 구글캘린더 플러그인 -->
<script src="https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.15/index.global.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
	
	var allDayFlag;
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	googleCalendarApiKey : '',
    	eventSources:[
    		{
    			googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
    				className : 'ko_event',
    				color : 'white',
    				textColor : 'red'
    		}
    	],
        headerToolbar: {
            left: 'prev,next,today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        locale: 'ko',
        navLinks: true,
        selectable: true,
        editable: true,
        droppable: true,
        eventAdd: function() {
            console.log("하");
        },
//         dayCellDidMount: function(info) {
//             var day = info.date.getDay();
//             if (day === 0) { // 일요일
//                 info.el.style.backgroundColor = '#EDF1EF'; // 원하는 색상으로 변경
//             } else if (day === 6) { // 토요일
//                 info.el.style.backgroundColor = '#EDF1EF'; // 원하는 색상으로 변경
//             }
//         },
        select: function(info) {
        	let startdate = new Date(info.start.getTime() - (info.start.getTimezoneOffset() * 60000)).toISOString();
            let enddate = new Date(info.end.getTime() - (info.end.getTimezoneOffset() * 60000)).toISOString();
            let end = new Date(info.end);
//             end.setDate(end.getDate() - 1);
            let enddateAdjusted = new Date(end.getTime() - (end.getTimezoneOffset() * 60000)).toISOString();
            
        	console.log(info);
        	console.log(startdate);
        	let startd = startdate.replace(/:\d{2}\.\d{3}Z$/, '');
        	console.log(startd);
        	console.log(enddate);
        	let endd = enddateAdjusted.replace(/:\d{2}\.\d{3}Z$/, '');
        	console.log(endd);
        	
        	let endDateObj = new Date(endd);
//         	endDateObj.setMinutes(endDateObj.getMinutes() + 1);

        	// 타임존 보정
        	let endDateWithTimezone = new Date(endDateObj.getTime() - (endDateObj.getTimezoneOffset() * 60000));
        	let enddPlusOneMinute = endDateWithTimezone.toISOString().replace(/:\d{2}\.\d{3}Z$/, '');
        	console.log(enddPlusOneMinute);
        	
        	$('#event-start').val(startd);
        	$('#event-end').val(enddPlusOneMinute);
        	
        	$('#event-modal').modal('show');
            $('#event-modal').on('shown.bs.modal', function() {
                $('#event-title').focus();
            });

             
        },
        events: function(fetchInfo, callback, failureCallback) {
            $.ajax({
                url: "/calendar/events.do",
                type: "get",
                contentType: "application/json;charset=utf-8",
                success: function(res) {
                	var events=[];
                   for(i=0; i<res.length; i++){
                	   
                	   var isAllDay = res[i].allday === 'true'
                	   if(isAllDay){
                	   console.log("allDay : "+isAllDay)
                		   events.push({
                			 id : res[i].id,
  	                		 title : res[i].title,
  	                		 start : res[i].startdate,
  	                		 end : res[i].enddate,
  	                		 backgroundColor : res[i].textColor,
  	                		 allDay : isAllDay,
  	                		durationEditable: true
                		   });
                	   }else{
                	   console.log("allDay : "+isAllDay)
	                	   events.push({
	                		 id : res[i].id,
	                		 title : res[i].title,
	                		 start : res[i].startdate,
	                		 end : res[i].enddate,
	                		 backgroundColor : res[i].textColor,
	                		 allDay : isAllDay,
	                		 durationEditable: true
	                	   });
                	   }
                	   
                	   
                	   
                   }
                   callback(events)
                   
                },
                error: function(xhr) {
                	failureCallback(xhr);
                    console.log(xhr.status);
                }
            });
        },
        eventDidMount: function(info) {
            if (info.event.backgroundColor) {
                info.el.style.backgroundColor = info.event.backgroundColor;
            }
        },
        eventDrop : function(info){
        	
        	let startdate;
        	let enddate;
       	    let id = info.event.id;
       	    if (info.event.allDay) {
       	        // allDay 이벤트의 경우
       	        startdate = moment(info.event.start).format('YYYY-MM-DD');
        		enddate = moment(info.event.end || info.event.start).format('YYYY-MM-DD');
       	        console.log("allday startdate : "+startdate);
       	        console.log("allday enddate : "+enddate);
       	     	let myData = {
 	        		start : startdate,
 	        		end : enddate,
 	        		id : id
 	        	}
       	        $.ajax({
       	        	url : "/calendar/updateEventAllday.do",
       	        	type : "post",
       	        	contentType : "application/json",
       	        	data : JSON.stringify(myData),
       	        	beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
     	   		       xhr.setRequestHeader(header, token);
     	   		    },
   		   		    success: function(res) {
   		   		        console.log(res);
   		   		    },
   		   		    error: function(xhr) {
   		   		    	alert(xhr.status);
   		   		    }
       	        	
       	        	
       	        })
       	        
       	        
       	    } else {
       	        // 일반 이벤트의 경우
       	        startdate = moment(info.event.start).format('YYYY-MM-DDTHH:mm');
       	        let enddate;
       	        if (!info.event.end) {
       	            let endDateObj = new Date(info.event.start);
       	            console.log("기본 obj : "+endDateObj);
       	            endDateObj = endDateObj.setDate(endDateObj.getDate() + 1);
       	            console.log("1일 추가 후 : "+endDateObj);
       	            enddate = moment(endDateObj).format('YYYY-MM-DDTHH:mm');
       	        } else {
       	        	let endDateObj = new Date(info.event.end);
       	            endDateObj = endDateObj.setMinutes(endDateObj.getMinutes()+1);
       	            console.log("1분 추가 후 : "+endDateObj);
       	            enddate = moment(endDateObj).format('YYYY-MM-DDTHH:mm');
       	        }
       	        console.log("normal startdate : "+startdate);
       	        console.log("normal enddate : "+enddate);
	        	console.log(id);
	        	let myData = {
	        		start : startdate,
	        		end : enddate,
	        		id : id
	        	}
	        	$.ajax({
	        		url : "/calendar/updateEvent.do",
	        		type : "post",
	        		contentType : 'application/json',
	        		data : JSON.stringify(myData),
	        		beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
	   		       xhr.setRequestHeader(header, token);
	   		       },
		   		    success: function(res) {
		   		        console.log(res);
		   		    },
		   		    error: function(xhr) {
		   		    	alert(xhr.status);
		   		    }
	
	        		
	        		
	        	});
       	    }
        	
        	
        },
        
        eventClick : function(info){
            console.log("Event Click");
            console.log("Event ID: ", info.event.id);
            console.log("All Day: ", info.event.allDay);
            console.log("Event Object: ", info.event);
        	$('#event-modal').modal('show');
            $('#event-modal').on('shown.bs.modal', function() {
                $('#event-title').focus();
            });
            
            $.ajax({
        		url : "/calendar/eventDetail.do",
        		type : "post",
        		contentType : 'application/json',
        		data : JSON.stringify({ id : info.event.id}),
        		beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
   		       xhr.setRequestHeader(header, token);
   		       },
	   		    success: function(res) {
	   		    	$('#event-title').val(res.title);
	   		    	$('#event-content').val(res.content);
	   		    	$('#event-start').val(res.startdateStr);
	   		    	$('#event-end').val(res.enddateStr);
	   		    	$('#event-category').val(res.textColor);
	   		    	$('#event-id').val(res.id);
	   		    	
	   		    	
	   		    	$('#btn-save-event').hide();
	   		    	$('#btn-update-event').show();
	   		    	$('#btn-delete-event').show();
	   		    	
	   		    },
	   		    error: function(xhr) {
	   		    	alert(xhr.status);
	   		    }
        	});
            
        },
        eventResize : function(info){
        	let id = info.event.id;
        	if(info.event.allDay != true){
//         		alert("리사이즈 취소");
	            info.revert(); // resize를 취소합니다.
        	}else{
        		
        		let startdate = moment(info.event.start).format('YYYY-MM-DDTHH:mm');
       	        let enddate;
       	        if (!info.event.end) {
       	            let endDateObj = new Date(info.event.start);
       	            console.log("기본 obj : "+endDateObj);
       	            endDateObj = endDateObj.setDate(endDateObj.getDate() + 1);
       	            console.log("1일 추가 후 : "+endDateObj);
       	            enddate = moment(endDateObj).format('YYYY-MM-DDTHH:mm');
       	        } else {
       	        	let endDateObj = new Date(info.event.end);
       	            endDateObj = endDateObj.setMinutes(endDateObj.getMinutes()+1);
       	            console.log("1분 추가 후 : "+endDateObj);
       	            enddate = moment(endDateObj).format('YYYY-MM-DDTHH:mm');
       	        }
       	        console.log("normal startdate : "+startdate);
       	        console.log("normal enddate : "+enddate);
	        	console.log(id);
	        	let myData = {
	        		start : startdate,
	        		end : enddate,
	        		id : id
	        	}
	        	$.ajax({
	        		url : "/calendar/updateEvent.do",
	        		type : "post",
	        		contentType : 'application/json',
	        		data : JSON.stringify(myData),
	        		beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
	   		       xhr.setRequestHeader(header, token);
	   		       },
		   		    success: function(res) {
		   		        console.log(res);
		   		    },
		   		    error: function(xhr) {
		   		    	alert(xhr.status);
		   		    }
	
	        		
	        		
	        	});
        		
        		
        	}
        }
        
    });
    calendar.render();
    
    $(document).on('click','#btn-update-event',function(){
    	let title = $('#event-title').val();
        let content = $('#event-content').val();
        let start = $('#event-start').val();
        let end = $('#event-end').val();
        let textColor = $('#event-category').val();
        console.log(start);
        let allday;
        let id = $('#event-id').val();
        
        if($('#event-allday').is(':checked')){
       	 allday = 'true';
       	 
        }else{
       	 allday = 'false';
        }
        
        console.log("title : "+title);
        console.log("content : "+content);
        console.log("start : "+start);
        console.log("end : "+end);
        console.log("textColor : "+textColor);
        console.log("allday : "+allday);
        
        let startDate = new Date(start);
        let endDate = new Date(end);

        if (endDate < startDate) {
            Swal.fire({title : '종료일은 시작일보다 나중이어야 합니다.',
    			icon : 'warning'});
            return; // 함수 종료
        }
        
        $('#event-modal').modal('hide'); // 모달 닫기
        $.ajax({
            url: '/calendar/updateEventDetail.do',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
            	id : id,
                title: title,
                content: content,
                start: start,
                end: end,
                textColor: textColor,
                allday : allday
            }),
            beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
            success: function(res) {
            	if(res == "success"){
                    Swal.fire({title : '수정이 완료되었습니다.',
            			icon : 'info'});
            	}
                console.log(res);
                calendar.refetchEvents(); // 이벤트 다시 가져오기
            }
        });
    	
    });
    
    $(document).on('click','#btn-delete-event',function(){
    	 let id = $('#event-id').val();
    	    
    	    Swal.fire({
    	        title: '정말로 삭제하시겠습니까?',
    	        icon: 'warning',
    	        showCancelButton: true,
    	        confirmButtonText: '삭제',
    	        cancelButtonText: '취소'
    	    }).then((result) => {
    	        if (result.isConfirmed) {
    	            $('#event-modal').modal('hide');
    	            $.ajax({
    	                url: '/calendar/deleteEvent.do',
    	                method: 'post',
    	                contentType: 'application/json',
    	                data: JSON.stringify({
    	                    id: id
    	                }),
    	                beforeSend: function(xhr) {   // 데이터 전송 전, 헤더에 csrf 값 설정
    	                    xhr.setRequestHeader(header, token);
    	                },
    	                success: function(res) {
    	                    console.log(res);
    	                    Swal.fire({
    	                        title: '삭제가 완료되었습니다.',
    	                        icon: 'info'
    	                    }).then(() => {
	    	                    calendar.refetchEvents(); // 이벤트 다시 가져오기
    	                    });
    	                },
    	                error: function(xhr) {
    	                    console.log(xhr.status);
    	                }
    	            });
    	        }
    	    });
    })
    
    $(document).on('hidden.bs.modal',$('#event-modal'), function (e) {
    	let title = $('#event-title').val('');
        let content = $('#event-content').val('');
        let start = $('#event-start').val('')
        let end = $('#event-end').val('')
        let textColor = $('#event-category').val('');
        let id = $('#event-id').val('');
        let allday = $('#event-allday').val('');
        
        $('#btn-save-event').show();
	    $('#btn-update-event').hide();
	    $('#btn-delete-event').hide();
    });
    
    $(document).on('change','#event-allday',function(){
    	if ($(this).is(':checked')) {
            let targetDate = $('#event-start').val();
            
            // 시작 시간을 00:00으로 설정
            let startDateTime = moment(targetDate).startOf('day').format('YYYY-MM-DDTHH:mm');
            $('#event-start').val(startDateTime);
            
            // 종료 시간을 23:59으로 설정
            let endDateTime = moment(targetDate).endOf('day').format('YYYY-MM-DDTHH:mm');
            $('#event-end').val(endDateTime);
            
            $('#event-end').attr('readonly', true);
        } else {
            $('#event-end').attr('readonly', false);
        }
    	
    	
    });
    
    $(document).on('click','#btn-save-event', function() {
    	
        let title = $('#event-title').val();
        let content = $('#event-content').val();
        let start = $('#event-start').val();
        let end = $('#event-end').val();
        let textColor = $('#event-category').val();
        console.log(start);
        let allday;
        
        if($('#event-allday').is(':checked')){
       	 allday = 'true';
       	 
        }else{
       	 allday = 'false';
        }
        
        console.log("title : "+title);
        console.log("content : "+content);
        console.log("start : "+start);
        console.log("end : "+end);
        console.log("textColor : "+textColor);
        console.log("allday : "+allday);
        
        let startDate = new Date(start);
        let endDate = new Date(end);

        if (endDate < startDate) {
        	Swal.fire({title : '종료일은 시작일보다 나중이어야 합니다.',
    			icon : 'warning'});
            return; // 함수 종료
        }
        
        $('#event-modal').modal('hide'); // 모달 닫기
        $.ajax({
            url: '/calendar/addEvent.do',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                title: title,
                content: content,
                start: start,
                end: end,
                textColor: textColor,
                allday : allday
            }),
            beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
            success: function(res) {
                console.log(res);
                calendar.refetchEvents(); // 이벤트 다시 가져오기
            }
        });
    });
    
    
    
});


function formatDate(date) {
    // 년, 월, 일, 시, 분, 초를 추출
    var year = date.getUTCFullYear();
    var month = String(date.getUTCMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
    var day = String(date.getUTCDate()).padStart(2, '0');
    var hours = String(date.getUTCHours()).padStart(2, '0');
    var minutes = String(date.getUTCMinutes()).padStart(2, '0');
    var seconds = String(date.getUTCSeconds()).padStart(2, '0');

    // 원하는 형식으로 문자열 생성
    return `${year}-${month}-${day}T${hours}:${minutes}:${seconds}`;
}
</script>

</html>