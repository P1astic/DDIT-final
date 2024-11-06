<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script>
let empNm = "${memVO.employeeVO.empNm}";
let memIdforVideoChat = "${memVO.memId}";
console.log("memId : " + memIdforVideoChat);
let roomIdforVideoChat = "";
let roomUrl = "";
let roleIdforVideoChat = "participant";
let empListforVideoChat = [];
let deptListforVideoChat = [];
let selEmpListforVideoChat = [];
let selMemIdListforVideoChat = [];

/*
participant : 참여자
speaker 	: 발표자
emcee		: 진행자
*/




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
})


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
				vStr += "<button type='button' id='vSelEmpBtn' data-target='" + empListforVideoChat[i].memId + "' style='width:100%; text-align=center;'>" + empListforVideoChat[i].empNm + "(" + empListforVideoChat[i].jbgdNm + ")" + "</button>";
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
		vSelEmpStr += "<label for='vEmpDel" + i + "'>" + selEmpListforVideoChat[i] + "</label>";
		vSelEmpStr += "<button class='vEmpDel' id='vEmpDel" + i + "' data-index='" + i + "' type='button'>";
		vSelEmpStr += "<img src='/resources/images/icon/trashcan.png' style='width:20px; height:20px;'></button>";
		vSelEmpStr += "</div>";
    }	
	
	console.log("printSelEmpListforVideoChat selEmpListforVideoChat : " + selEmpListforVideoChat);
	
	$(".vSelectedEmp").html(vSelEmpStr);
	
}


$(function() {
	
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
			vStr += "<label for='vEmpDel" + i + "'>" + selEmpListforVideoChat[i] + "</label>";
			vStr += "<button class='vEmpDel' id='vEmpDel" + i + "' data-index='" + i + "' type='button'>";
			vStr += "<img src='/resources/images/icon/trashcan.png' style='width:20px; height:20px;'></button>";
			vStr += "</div>"
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
						vStr += "<button type='button' id='vSelDeptBtn' data-target='" + deptListforVideoChat[i].deptCd + "' style='width:100%; text-align=center;'>" + deptListforVideoChat[i].deptNm + "</button>";						
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
// 	    let selMemIdArray = selMemIdListforVideoChat.split(","); // 쉼표로 구분된 문자열을 배열로 변환
// 	    console.log("createROom selMemIdArray : ", selMemIdArray);
        
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
				
				let vNewTitle = $("#vNewTitle").val("");
				let vNewStTime = $("#vNewStTime").val("");
				let vNewEdTime = $("#vNewEdTime").val("");
			},
			error : function(xhr) {
				console.log("에러 : " + xhr.status);
			}
		});
	});	
	
});

</script>
<div class="vCreateDiv">
	<button type="button" id="openCreateVideoChatBtn">화상회의 생성</button>
</div>

<div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing" style="margin-top:3%">
	<div class="widget-content widget-content-area br-6">
		<h3 class="table-header" align="center">ROOM</h3>
		<br>
		<div class="table-responsive mb-4">
			<table id="roomTable" class="table table-hover" style="width:100%">
				<thead>
					<tr>
						<th>No</th>
						<th>회의 제목</th>
						<th>시작일시</th>
						<td></td>
					</tr>
				</thead>
				
				<tbody id="myRoomList">
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- 회의 생성 모달 -->
<div class="modal fade" id="createVideoChatModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="createVideoChatModalBody">
	            <div class="vNewStTimeDiv">	               
	                <label for="vNewStTime">시작 시간</label>
	                <input type="datetime-local" id="vNewStTime" name="vNewStTime" />
                </div>
	            <div class="vNewEdTimeDiv">	               
	                <label for="vNewEdTime">종료 시간</label>
	                <input type="datetime-local" id="vNewEdTime" name="vNewEdTime" />
                </div>
                                
                <div class="vNewTitleDiv">
	                <label for="vNewTitle">회의 제목</label>
	                <input type="text" id="vNewTitle" name="vNewTitle" placeholder="회의 제목"/>
	                
                </div>
                
                <div class="vNewEmpDiv">
	                <label for="vNewEmp">주최자</label>
	                <input type="text" id="vNewEmp" name="vNewEmp" value="${memVO.employeeVO.empNm}" readonly/>
                </div>
                
                <label for="vNewEmps">참여자</label>
                <button type="button" id="vSelEmps">선택</button>
                <div class="vNewEmpList" style="border:1px solid black; width:400px; height:300px;">
                
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" id="createVideoChatBtn" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 회의 생성 모달 -->

<!-- 사원 선택 모달 -->
<div class="modal fade" id="vSelEmpsModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="vSelEmpsModalBody">
            	<div class="department" style="display:flex;">
	                <label for="vSelDept">부서</label>
	                <div class="vSelDept" style="width:100px; min-width:100px; border:1px solid black;">
	                
	                </div>
	                
	                <label for="vSelEmp">사원</label>
	                <div class="vSelEmp" style="width:150px; height:300px; max-height:300px; overflow-y:auto; min-width:150px; border:1px solid black;">
	                
	                </div>
	                
	                <label for="vSelectedEmp">참여자</label>
	                <div class="vSelectedEmp" style="width:150px; height:300px; max-height:300px; overflow-y:auto; border:1px solid black;">
	                
	                </div>
            	</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" id="vSelEmpDoneBtn" class="btn btn-secondary">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 사원 선택 모달 -->

<!-- 회의 종료 성공 모달 -->
<div class="modal fade" id="delVideoChatRoomModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            	회의가 종료되었습니다
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 회의 종료 성공 모달 -->

<!-- 회의 종료 실패 모달 -->
<div class="modal fade" id="FaildelVideoChatRoomModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            	회의가 종료에 실패했습니다
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 회의 종료 성공 모달 -->