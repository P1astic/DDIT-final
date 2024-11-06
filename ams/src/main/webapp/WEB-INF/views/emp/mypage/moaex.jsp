<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>      
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>


	<div class="mt-3">
		<div class="row">
			<div class="col-6">
				<div class="page-title-box">
					<h4 class="page-title">화상회의</h4>
				</div>
			</div>
			<div class="col-6">
			    <sec:authorize access="hasAuthority('ROLE_ADMIN')">
				    <div class="mb-2 mt-2 col" style="text-align: right;">
				    	<input type="button" id="videoModalBtn" class="btn btn-primary" value="방 생성"/>
				    </div>
			    </sec:authorize>
			</div>
		</div>
<!-- 		<div class="row"> -->
<!-- 		    <div class="mb-2 mt-2 col"> -->
<!-- 		    	<h5>화상회의</h5> -->
<!-- 		    </div> -->
		    
		    
<!-- 		</div> -->
         <c:set var="roomListLength" value="${fn:length(roomList.data.list)}" />
		 <c:set value="${roomListLength }" var="num"/>
		<div class="row">
            	 <c:forEach var="roomList" items="${roomList.data.list }">
			<div class="col-md-4">
                 <div class="card">
                     <div class="card-header bg-light" id="myRoomList">
                     	<c:set value="${num-1 }" var="num" />
                         <c:out value="${num+1 }"/>번 회의실
                         
                     </div>
                     <div class="card-body justify-content-between d-flex">
	                     <div>
		                     <span id="roomId" style="display:none">${roomList.roomId }</span>
		                     <span class="fw-semibold">${roomList.roomTitle}</span>
	                     </div>
	                     <div>
		                     <input type="button" id="enterBtn" class="btn btn-primary" value="참여"/>
		                     <sec:authorize access="hasAuthority('ROLE_ADMIN')">
		                   	 	<input type="button" id="delBtn" class="btn btn-danger" value="삭제"/>
		                  	 </sec:authorize>
	                     </div>
                     </div>
                     <div class="card-footer border-top border-light text-muted">
                         <i class="ri-group-fill"></i>
                         ${roomList.currJoinCnt } / ${roomList.maxJoinCnt } 
                     </div>
                 </div> <!-- end card-->
             </div> <!-- end col-->
                 </c:forEach>
		</div>
	
	</div>
	
	
	 <div class="modal fade" id="video-modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header py-3 px-4 border-bottom-0">
                        <h5 class="modal-title" id="modal-title">화상채팅방 생성</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-4 pb-4 pt-0">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <label class="control-label form-label">방 제목</label>
                                    <input class="form-control" placeholder="방 제목을 입력해 주세요." type="text" name="title" id="video-title" required />
                                    <div class="invalid-feedback">방 제목을 입력해주세요</div>
                                </div>
                            </div>
                            <div class="col-12">
                            	<div class="mb-2">
                            		<label class="control-labe form-label">최대 인원 수 <small class="text-muted">[최소 : 2인] [최대 : 16인]</small></label>
                            		<input class="form-control" type="number" placeholder="최소 2명부터 16명까지 선택 가능합니다." value="2" name="start" min="2" max="16" id="video-max" required/>
                            		<div class="invalid-feedback">인원은 2명부터 16명 까지만 선택 가능합니다 !</div>
                            	</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <button type="button" class="btn btn-danger" id="video-delete-event" style="display : none">삭제</button>
                            </div>
                            <div class="col-6 text-end">
                                <button type="button" class="btn btn-light me-1" data-bs-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-info" id="video-save-event">등록</button>
                                <button type="button" class="btn btn-success" id="video-update-event" style="display : none">수정</button>
                            </div>
                        </div>
                    </div>
                </div> <!-- end modal-content-->
            </div> <!-- end modal dialog-->
        </div>
	
	
	

<script>
$(function(){
	
	
	// 모달
    $('#videoModalBtn').on('click',function(){
		$('#video-modal').modal('show');
	    $('#video-modal').on('shown.bs.modal', function() {
	        $('#video-title').focus();
	    });
    	
    })
    
    // 인원수 막기
    $(document).on('keydown','#video-max',function(){
    	event.preventDefault();
    	
    })
    
	
	token = $("meta[name='_csrf']").attr("content");
	header = $("meta[name='_csrf_header']").attr("content");

	//입장버튼
	$(document).on('click','#enterBtn',function(event){
		var roomId = $(this).parent().parent().find('#roomId').text();
		console.log(roomId);
		var memId = "${empInfo.positionName} ${empInfo.empName}";
		
		var obj = {roomId : roomId , memId : memId};
		var jsonObj = JSON.stringify(obj);
		$.ajax({
			url : "/video/join",
			type : "post",
			data : jsonObj,
			contentType : "application/json;charset=UTF-8",
			dataType : 'json',
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		      },
			success : function(res){
				console.log(res.data.url);
				var url = res.data.url;
				
				
				window.open(url,'_blank');
			},
			error : function(xhr){
				alert(xhr.status);
			}
		});
		
	});
	
	
	//삭제버튼
	$(document).on('click','#delBtn',function(event){
		var roomId = $(this).parent().parent().find('#roomId').text();
		console.log(roomId);
		var obj = {roomId : roomId};
		var jsonObj = JSON.stringify(obj);
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
 					url : "/video/deleteroom",
 					type : "post",
 					data : jsonObj,
 					contentType : "application/json;charset=UTF-8",
 					dataType : 'json',
 					beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
 				         xhr.setRequestHeader(header, token);
 				    },
 					success : function(res){
 						console.log(res);
	                    Swal.fire({
	                        title: '삭제가 완료되었습니다.',
	                        icon: 'info'
	                    }).then(() => {
    	                    location.reload();
	                    });
 					}
 					
 				});
 	        }
 	    });	
		
				
		
		
	});
	
	
	// 새로운 방 만들기
	$('#video-save-event').on('click',function(){
		
		let title = $('#video-title').val();
		let max = $('#video-max').val();
		var obj = {title : title, max : max };
		var jsonObj = JSON.stringify(obj);
		
		
		$.ajax({
			url : "/video/createroom",
			type : "POST",
			data : jsonObj,
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			beforeSend : function(xhr){   // 데이터 전송 전, 헤더에 csrf 값 설정
		         xhr.setRequestHeader(header, token);
		    },
			success : function(res){
				Swal.fire({
                    title: '방 생성이 완료되었습니다.',
                    icon: 'info'
                }).then(() => {
                	location.reload();
                });
				
			},
			error : function(xhr){
				alert(xhr.status);
			}
		});
		
	});
	
});
</script>
