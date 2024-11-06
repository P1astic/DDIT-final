<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/chat/chat.css">

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<div class="d-flex flex-row" style="height: 90vh; margin-top:30px; font-family: Pretendard;">
	<div class="card flex-column" style="width:35%;">
		<div class="d-flex justify-content-between align-items-center" style="padding:10px;">
			<button type="button" class="btn btn-primary _makeChatRoom" style="width:100%; height:40px;"><strong>채팅방 만들기</strong></button>
		</div>
		<div class="card-body" style="padding-top:0px;">
			<ul class="list-group">
				<c:forEach var="chatRoomVO" items="${chatRoomVOList }">
					<c:if test="${chatRoomVO.memId eq memVO.memId }">
						<li class="list-group-item _chatTitle d-flex justify-content-between align-items-center" id="${chatRoomVO.chatRoomNo }" style="height:70px;">
							<span>${chatRoomVO.chatRoomTitle}</span>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="card flex-column" style="width:65%; font-family: Pretendard;">
		<div class="card-body _chatBody">
			<div class="d-flex flex-column" id="_chatHead" style="height: 70px; background-color:#f2f5f7; border-radius:5px; visibility:hidden;">
				<div id="_chatHeadTitle">채팅방제목</div>
				<div class="d-flex flex-row align-items-center">
					<span id="chatEmpList">
						<i class="bi bi-person-fill"></i>
						<span id="_chatHeadNumber">00명</span>
						<div id="memListModal" style="display:none; position:absolute; left:0; background:white; border:1px solid #ddd; border-radius:5px; width:200px; z-index:1000;">
					      <div class="memlist-body" style="min-height:230px; max-height:230px; overflow-y:auto">
					        
					      </div>
						</div>
					</span>
					<span class="ml-auto">
						<button id="addMember" class="btn btn-primary">초대하기</button>
						<button id="chatExit" class="btn btn-secondary">채팅방나가기</button>
					</span>
				</div>
			</div>
			<ul id="messages">
			</ul>
		</div>
		<div class="input-group mb-3" id="sendMessageDiv" style="display:none;">
		  <textarea class="form-control" id="message" placeholder="메시지를 입력하세요" aria-label="메시지를 입력하세요" aria-describedby="sendMessageBtn" style="resize:none;"></textarea>
		  <button class="btn btn-outline-primary" type="button" id="sendMessageBtn">전송</button>
		</div>
	</div>
</div>

<!-- 사원 선택 모달 -->
<div class="modal fade" id="makeChatRoomModal" tabindex="-1" role="dialog" aria-labelledby="makeChatRoomLabel" aria-hidden="true" style="font-family: Pretendard;">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="makeChatRoomBody">
            	<div class="department" style="display:flex; margin-top:20px;">
            		<div class="d-flex flex-column">
		                <label for="selDept" class="mr-1">부서</label>
		                <div class="selDept" style="width:200px; min-width:100px; border:1px solid #B1B1B1;">
		                
		                </div>
            		</div>
	                <div class="d-flex flex-column" style="margin-left:30px;">
		                <label for="selEmp" style="margin-left:10px;">사원</label>
		                <div class="selEmp" style="width:200px; height:300px; max-height:300px; overflow-y:auto; min-width:150px; border:1px solid #B1B1B1;">
		                
		                </div>
	                </div>
	                <div style="height:300px; max-height:300px; width:30px; display:flex; align-items:center; margin-left:30px;">
	                	<span>
		                	<i class="bi bi-arrow-bar-right" style="font-size:30px; font-weight:600; vertical-align:center; -webkit-text-stroke: 2px"></i>
	                	</span>
	                </div>
	                <div class="d-flex flex-column" style="margin-left:30px;">
		                <label for="selectedEmp">참여자</label>
		                <div class="selectedEmp" style="width:200px; height:300px; max-height:300px; overflow-y:auto; border:1px solid #B1B1B1;">
		                </div>
	                </div>
            	</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" id="makeChatRoomDoneModal" class="btn btn-primary">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 사원 선택 모달 -->
<div class="modal fade" id="chatTitleModal" tabindex="-1" role="dialog" aria-labelledby="chatTitleModalLabel" aria-hidden="true" style="font-family: Pretendard;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
		<div class="newTitleDiv">
		    <label for="newTitle">채팅방 제목</label>
		    <input type="text" class="form-control" id="newTitle" name="newTitle" placeholder="채팅방 제목" style="width:400px; height:50px;"/>
		</div>
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		<button type="button" id="makeChatRoomDoneModalBtn" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 삭제 확인 모달 -->
<div class="modal fade" id="exitChatModal" tabindex="-1" role="dialog" aria-labelledby="exitChatModalLabel" aria-hidden="true" style="font-family: Pretendard;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>정말로 채팅방을 나가시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" name="exitChatBtn" class="btn btn-danger">나가기</button>
      </div>
    </div>
  </div>
</div>
<!-- 삭제 확인 모달 -->
<div class="modal fade" id="ajaxSuccessModal" tabindex="-1" role="dialog" aria-labelledby="successModallabel" aria-hidden="true" style="font-family: Pretendard;">
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
<script>
	$(function(){
		let chatRoomVO;
		let empList = [];
		let deptList = [];
		let selEmpList = [];
		let selMemIdList = [];
		let empNm = "${memVO.employeeVO.empNm}";
		let memId = "${memVO.memId}";
		let selectedChatRoomNo = "";
		let empImgUrl = "${memVO.employeeVO.empImgUrl}";
		let bpImgUrl = "${memVO.bpVO.bpImgUrl}";
		let chatEmpVOList;
		
		const today = new Date();

		const year = today.getFullYear(); // 2023
		const month = (today.getMonth() + 1).toString().padStart(2, '0'); // 06
		const day = today.getDate().toString().padStart(2, '0'); // 18

		const date = year + month + day; // 20230618		
		
		
		if(empImgUrl !== null && empImgUrl !== ""){
			empImgUrl = empImgUrl;
		}else if(bpImgUrl !== null && bpImgUrl !== ""){
			bpImgUrl = bpImgUrl;
		}else{
			empImgUrl = "/resources/images/profile.jpg";
			bpImgUrl = "/resources/images/profile.jpg";
		}
		
       var stompClient = null;

       function connect(selectedChatRoomNo) {
           // '/chat/chatMain' 엔드포인트로 SockJS를 통해 연결
           var socket = new SockJS('/chat/chatMain');
           stompClient = Stomp.over(socket);

           // 연결 시 처리할 콜백
           stompClient.connect({}, function (frame) {
        	   
               // '/chat/messages' 경로를 구독하여 서버로부터 메시지 수신
               stompClient.subscribe('/chat/messages/' + selectedChatRoomNo , function (message) {
            	
            	var msgData = JSON.parse(message.body)
	            var isMyMessage = (msgData.memId === memId); // 내가 보낸 메시지인지 확인
	            var messageBody = createMessageHTML(msgData, isMyMessage);
	            
                showMessage(messageBody, isMyMessage);
                
               });
           }, function(error){
        	   console.error("에러발생 : " + error);
           });
       }

       // 사용자가 입력한 메시지 전송 함수 시작
       function sendMessage() {
    	   //메시지 입력칸의 val 가져오기
           var message = $("#message").val();
           var chatMsgVO = {
           		msgNo : null,
           		memId : memId,
           		empNm : empNm,
           		empImgUrl : empImgUrl,
           		bpImgUrl : bpImgUrl,
           		msgContent : message,
           		msgDt : new Date(),
           		chatRoomNo : selectedChatRoomNo
           }
           //DB에 메시지를 저장
           $.ajax({
	       	   	url : "/chat/sendMessageforDB",
	   			contentType : "application/json; charset=utf-8",
				type : "post",
				data : JSON.stringify(chatMsgVO),
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(result){
		           // '/app/sendMessage' 경로로 chatMsgVO 전송
		           stompClient.send("/app/sendMessage", {}, JSON.stringify(chatMsgVO));
				   $("#message").val('');
				},
				error:function(xhr){
					alert("메시지 전송 실패");
					console.log("에러발생 : " + xhr)
					$("#message").val('');
				}
           })
       }
		// 사용자가 입력한 메시지 전송 함수 끝
    
       function createMessageHTML(msgData, isMyMessage) {
    	   
    	   if(msgData.empImgUrl !== null && msgData.empImgUrl !== ''){
    		   profileImg = msgData.empImgUrl;
    	   }else if(msgData.bpImgUrl !== null && msgData.bpImgUrl !== ''){
    		   profileImg = msgData.bpImgUrl;
    	   }else{
    		   profileImg = "/resources/images/profile/img";
    	   }
    	   
    	    var messageBody = "";
			//작성자 프로필 사진
    	    messageBody += '<span class="message-content"><img src="/download?filePath='+ profileImg +
    	    		'&fileOrgnlFileNm=' + profileImg +'" style="width:25px; height:25px; border-radius: 9999px; margin-right:5px;">'
    	    
    	    		
    	    // 작성자
    	    messageBody += '<strong class="message-sender">' + msgData.empNm + '</strong></span>';

    	    // 메시지 본문
    	    messageBody += '<span class="message-content">' + msgData.msgContent + '</span>';

    	    // 보낸 날짜
    	    var messageDate = new Date(msgData.msgDt).toLocaleString(); // 사람이 읽기 쉬운 날짜 형식으로 변환
    	    messageBody += '<span class="message-date">' + messageDate +'</span>';
			
    	    
    	    return messageBody;
    	}       

       function showMessage(messageBody, isMyMessage) {
           var messages = document.getElementById("messages");
           var newMessage = document.createElement("li");
           
           if (isMyMessage) {
               newMessage.className = "my-message";
           } else {
               newMessage.className = "received-message";
           }           
           
           newMessage.innerHTML = messageBody;
           
           messages.appendChild(newMessage);
           $("#messages").scrollTop($("#messages")[0].scrollHeight);
       }
       
       function disconnect() {
    	    if (stompClient !== null) {
    	        stompClient.disconnect(function () {
    	            console.log("Disconnected");
    	        });
    	    }
    	}      //구독 취소로 가는게 좋음 소켓 disconnect하면 전체 연결 끊김
       
       $("#sendMessageBtn").on("click", sendMessage);
       
       $('#message').keypress(function(event) {
           if (event.which === 13 && !event.shiftKey) { // Enter key without Shift
               event.preventDefault(); // Prevents a new line from being added
               $('#sendMessageBtn').click(); // Triggers the button click
           }
       });
       
       $("._makeChatRoom").on("click", function(){
    	   $("#makeChatRoomModal").modal('show');
    	   
    	   $.ajax({
    		 	url : "/chat/getDeptList",
    			contentType : "application/json; charset=utf-8",
    			type : "post",
    			beforeSend:function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    			},
    			success : function(result) {
    				deptList = result;
    				let str = "";
    				
    				for(var i=0; i<deptList.length; i++) {
   						str += "<button type='button' class='btn btn-third' id='selDeptBtn' data-target='" + deptList[i].deptCd + "' style='width:100%; float:left; text-align:left;'>" + deptList[i].deptNm + "</button>";						
    				}
    				$(".selDept").html(str);
    			}
    	   })
    	   
       })
       
       $(document).on("click", "#selDeptBtn", function() {
    		let deptCd = $(this).data("target");
    		
    		$.ajax({
    			url : "/chat/getEmpList",
    			data : {deptCd : deptCd},
    			type : "post",
    			beforeSend:function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    			},
    			success : function(result) {
    				empList = result;
    				let str = "";
    				for(var i=0; i<empList.length; i++) {
						if(empList[i].employeeVO.empNm){
							str += "<button type='button' class='btn btn-third' id='selEmpBtn' data-target='" + empList[i].memId + "' style='width:100%; float:left; text-align:left;'>" + empList[i].employeeVO.empNm + "(" + empList[i].jobGradeVO.jbgdNm + ")" + "</button>";
						}
						if(empList[i].bpVO.bpNm){
							str += "<button type='button' class='btn btn-third' id='selEmpBtn' data-target='" + empList[i].memId + "' style='width:100%; float:left text-align:left;'>" + empList[i].bpVO.bpNm + "</button>";
						}
    				}
    				$(".selEmp").html(str);
    			}
    		});
    	})

    	$(document).on("click", "#selEmpBtn", function() {
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
    		
    		$(".selectedEmp").html(selEmpStr);
    	}

    	// 동적으로 추가된 fileDel 버튼에 대한 이벤트 추가
    	$(document).on("click", ".empDel", function() {
    		let index = $(this).data('index'); // 클릭한 요소가 부모 요소로부터 몇 번째 요소인지 저장
    	 	
    	 	$(this).parent().remove();

    		selEmpList.splice(index, 1);
    		selMemIdList.splice(index, 1);
    	 	
    	 	printSelEmpList();  
    	 	
    	 });
    	
    	$("#makeChatRoomDoneModal").on("click", function(){
    		
    		selEmpList.push(empNm);
    		selMemIdList.push(memId);
    		
    	    chatEmpVOList = selMemIdList.map(function(memId) {
    	        return {
    	            memId: memId,
    	            chatRoomNo: null // 채팅방 번호는 서버에서 생성 후 설정
    	        };
    	    });
    		
    	    //if chatEmpVOList is 2
    	    if(chatEmpVOList.length == 2){
    	    	
        		chatRoomVO = {
        				chatRoomNo : null,
        				memId : memId,
        				chatRoomTitle : selEmpList[0] + "님, " + selEmpList[1] + "님의 채팅방",
        				chatRoomStat : 1,
        				createDt : date.toString(),
        				chatEmpVOList : chatEmpVOList
        		}
        		
        		$.ajax({
    			url : "/chat/createRoom",
    			type : "post",
    			contentType : "application/json; charset=utf-8",
    			data : JSON.stringify(chatRoomVO),
    			dataType: "json",
    			beforeSend:function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    			},
    			success : function(result){
		    		$("#makeChatRoomModal").modal('hide');
    				window.location.reload(true);
    			},
    			error : function(xhr){
    				console.log("에러 : " + xhr.status);
    			}
    		})
        		
    	    }else{
	    		$("#chatTitleModal").modal('show');
    	    }
    	})
    	
    	$("#makeChatRoomDoneModalBtn").on("click", function(){
    		console.log($("#newTitle").val());
    		
    		var chatRoomTitle;
    		
    		if($("#newTitle").val() == null || $("#newTitle").val() == ''){
    			chatRoomTitle = selEmpList[0] + "님, " + selEmpList[1] + "님 외 " + (selEmpList.length -2) +" 명 채팅방"
    			console.log(chatRoomTitle);
    		}else{
    			chatRoomTitle = $("#newTitle").val();
    		}
    		
    		chatRoomVO = {
    				chatRoomNo : null,
    				memId : memId,
    				chatRoomTitle : chatRoomTitle,
    				chatRoomStat : 1,
    				createDt : date.toString(),
    				chatEmpVOList : chatEmpVOList
    		}
    		
    		console.log(chatRoomVO);
    		
    		$.ajax({
				url : "/chat/createRoom",
				type : "post",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(chatRoomVO),
				dataType: "json",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result){
			    		$("#makeChatRoomModal").modal('hide');
					window.location.reload(true);
				},
				error : function(xhr){
					console.log("에러 : " + xhr.status);
				}
			})
    	})
    	
    	$("li._chatTitle").on("click", function(){
    		disconnect();
    		$("#messages").empty();
    		$("#_chatHead").css('visibility', 'visible');
    		
    		$("li._chatTitle").removeClass("active");
    		$(this).addClass("active");
    		
    		selectedChatRoomNo = $("li._chatTitle.active").attr("id");
    		selectedChatRoomTitle = $(this).find("span").text();
    		
    		// 채팅방 제목 클릭시 채팅방의 메시지 목록을 불러오는 로직 시작
    		if(selectedChatRoomNo){
	    		// 웹소켓 연결 시작
				connect(selectedChatRoomNo);
				$.ajax({
					url : "/chat/getMessageList",
					type : "post",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify({chatRoomNo : selectedChatRoomNo}),
					dataType: "json",
	    			beforeSend:function(xhr){
	    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	    			},
	    			success : function(result){
	    				result.forEach(function(msgData){
	    					// 자신이 보낸 메시지인지 구별
	    					var isMyMessage = (msgData.memId === memId);
	    					// messageBody 생성
	    					var messageBody = createMessageHTML(msgData, isMyMessage);
	    					// message 출력
	    					showMessage(messageBody, isMyMessage);
	    				})
	    			},
	    			error : function(xhr){
	    				console.error("에러발생 : " + xhr);
	    			}
				})
			// 채팅방 제목 클릭시 메시지 목록을 불러오는 로직 끝	
    		$.ajax({
    			url:"/chat/chatEmpCount",
    			type : "post",
    			contentType : "application/json; charset=utf-8",
    			data : JSON.stringify({chatRoomNo : selectedChatRoomNo}),
    			dataType :"json",
    			beforeSend:function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    			},
    			success : function(result){
    				$("#_chatHeadNumber").text(result + "명");
    				$("#_chatHeadTitle").text(selectedChatRoomTitle);
    		        $("#addMember").attr('data-toggle', selectedChatRoomNo);
    		        $("#chatExit").attr('data-toggle', selectedChatRoomNo);
    		        $("span[id='chatEmpList']").attr('data-toggle', selectedChatRoomNo);
    			},
    			error : function(xhr){
    				console.error("에러발생 : " + xhr);
    			}
    		})				
				
			$("#sendMessageDiv").show();
			$("#messages").scrollTop($("#messages")[0].scrollHeight);
			
    		}else{
    			console.error("chat room id is undefined");
    		}
    	})
    	
    	$("#chatExit").on("click", function(){
    		$("#exitChatModal").modal("show");
    	})
    	
    	$("button[name='exitChatBtn']").on("click", function(){
    		
    		var chatEmpVO = {
    			memId : memId,
    			chatRoomNo : $("button[id='chatExit']").data("toggle")
    		}
    		
    		console.log("exitChatBtn toggle data  : ", chatEmpVO);
    		
    		$.ajax({
    			url : "/chat/exitChat",
    			type : "post",
    			contentType : "application/json; charset=utf-8",
    			data : JSON.stringify(chatEmpVO),
    			dataType :"json",
    			beforeSend:function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    			},
    			success : function(result){
    	            var exitMessage = {
    	                    msgNo: null,
    	                    memId: memId,
    	                    empNm: empNm,
    	                    msgContent:"[시스템] : " + empNm + "님이 나갔습니다.",
    	                    msgDt: new Date(),
    	                    chatRoomNo: chatEmpVO.chatRoomNo
    	                };
    	                
    	                // WebSocket으로 나간 메시지 전송
    	                stompClient.send("/app/sendMessage", {}, JSON.stringify(exitMessage));
    				window.location.reload(true);
    			},
    			error : function(xhr){
    				console.error("에러발생 : " + xhr);
    			}
    			
    		})
    	})
    	
    	$("span[id='chatEmpList']").on("click", function(){
    		
    		var chatRoomNo = $(this).attr("data-toggle")
    		
    		var chatEmpVO = {
        			chatRoomNo : chatRoomNo
        		}
    		
    		$.ajax({
    			url :"/chat/chatEmpList",
    			type : "post",
    			contentType : "application/json; charset=utf-8",
    			data : JSON.stringify(chatEmpVO),
    			dataType :"json",
    			beforeSend:function(xhr){
    				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    			},
    			success : function(result){
    				
    				var modalContent = "";
    				
    				result.forEach(function(mem){
    				    if(mem.employeeVO.empNm){
    				    	if(mem.employeeVO.empImgUrl !== null && mem.employeeVO.empImgUrl !== ''){
	    				    	modalContent += "<p>" + "<img src='/download?filePath=" + mem.employeeVO.empImgUrl + "&fileOrgnlFileNm=" + mem.employeeVO.empImgUrl + "' style='width:13px; height:13px; border-radius: 9999px; margin-right:5px;'>" + mem.employeeVO.empNm + "(" + mem.jobGradeVO.jbgdNm + ") - " + mem.deptVO.deptNm + "</p>";
    				    	}else{
	    				    	modalContent += "<p>" + "<img src='/download?filePath=/resources/images/profile.jpg&fileOrgnlFileNm=/resources/images/profile.jpg' style='width:13px; height:13px; border-radius: 9999px; margin-right:5px;'>" + mem.employeeVO.empNm + "(" + mem.jobGradeVO.jbgdNm + ") - " + mem.deptVO.deptNm + "</p>";
    				    	}
    				    }
    				    else if(mem.bpVO.bpNm){
    				    	if(mem.bpVO.bpImgUrl !== null && mem.bpVO.bpImgUrl !== ''){
	    				    	modalContent += "<p>" + "<img src='download?filePath=" + mem.bpVO.bpImgUrl + "&fileOrgnlFileNm=" + mem.bpVO.bpImgUrl + "' style='width:13px; height:13px; border-radius:9999px; margin-right:5px'>" + mem.bpVO.bpNm + "(" + mem.deptVO.deptNm + ")</p>";
    				    	}else{
	    				    	modalContent += "<p>" + "<img src='download?filePath=/resources/images/profile.jpg&fileOrgnlFileNm=/resources/images/profile.jpg' style='width:13px; height:13px; border-radius:9999px; margin-right:5px'>" + mem.bpVO.bpNm + "(" + mem.deptVO.deptNm + ")</p>";
    				    	}
    				    }
    				});

    				$(".memlist-body").html("");
    				$(".memlist-body").html(modalContent);
    				$("#memListModal").show();

    			},
    			error : function(xhr){
    				console.error("에러발생 : " + xhr);
    			}
    		})
    	})
    	
        // 드롭다운 버튼 클릭 시 드롭다운 메뉴 토글
        $(".dropbtn").on("click", function(e) {
        	e.stopPropagation();
        	$(".dropdown-content").not($(this).siblings(".dropdown-content")).hide();
        	$(this).siblings(".dropdown-content").toggle();
        });

        // 드롭다운 외부 클릭 시 드롭다운 메뉴 숨기기
        $(document).on("click", function(e) {
            if (!$(e.target).closest('.dropdown').length) {
                $(".dropdown-content").hide();
            }
        });
        
        $(document).mouseup(function (e) {
            var $modal = $("#memListModal"); // 모달 영역
            var $chatEmpList = $("#chatEmpList"); // 모달을 여는 버튼

            // 클릭한 위치가 모달 내부가 아니고, 모달을 여는 버튼도 아닌 경우
            if (!$modal.is(e.target) && $modal.has(e.target).length === 0 && !$chatEmpList.is(e.target)) {
                $modal.hide(); // 모달 닫기
            }
        });        
    	
	})
</script>