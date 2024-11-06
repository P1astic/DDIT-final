<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/emp/loginForm.css">
<script>
$(function(){
	
	//입력버튼
	$("#selectt").on("click",function(){
		
		var  memId        =  'emp24c1005';
		var  empEml        =  'plastic333527@gmail.com';

		
		$("#memId").val(memId );
		$("#empEml").val(empEml );
		
	
	});
	
	
	//관리자버튼
	$("#con-btn1").on("click",function(){
		let username = 'admin1';
		$("#username").val(username);
		
		let pass = '1234';
		$("#password").val(pass);
		
	});
	
	//인사팀 버튼
	$("#con-btn2").on("click",function(){
		let username = 'emp24c2003';
		$("#username").val(username);
		
		let pass = '1234';
		$("#password").val(pass);
		
	});

	//회계팀 버튼
	$("#con-btn3").on("click",function(){
		let username = 'emp24c1002';
		$("#username").val(username);
		
		let pass = '1234';
		$("#password").val(pass);
		
	});

	//회계팀 결재자 버튼
	$("#con-btn4").on("click",function(){
		let username = 'emp24c1008';
		$("#username").val(username);
		
		let pass = '1234';
		$("#password").val(pass);
		
	});

	//시설팀 버튼
	$("#con-btn5").on("click",function(){
		let username = 'emp24c4001';
		$("#username").val(username);
		
		let pass = '1234';
		$("#password").val(pass);
		
	});

	//물류팀 버튼
	$("#con-btn6").on("click",function(){
		let username = 'emp24c3001';
		$("#username").val(username);
		
		let pass = '1234';
		$("#password").val(pass);
		
	});

	//항공사 버튼
	$("#con-btn7").on("click",function(){
		let username = 'bp24c5001';
		$("#username").val(username);
		
		let pass = '1234';
		$("#password").val(pass);
		
	});	
	
	//kttelecop버튼
	$("#con-btn8").on("click",function(){
		let username = 'kttelecop';
		$("#username").val(username);
		
		let pass = '1234';
		$("#password").val(pass);
		
	});
	
	
	//비밀번호 찾기
	$("#btn2").on("click",function(){ 
		console.log("안녕");
	    $("#modalUpdateReply").modal("show");	   
	});
	

	//모달 창에서 [이메일전송] 버튼 클릭
	$("#btnSendEmail").on("click",function(){
		//240923 임세희 아이디 이메일이 DB에 존재하는지 검사
		   console.log("아이디와 이메일이 매핑되었는지 체킹");
		   
		   //사용자가 입력한 값이 잘 찍혔는지 확인
		   var memId = $("#memId").val();
		   console.log("memId : " + memId);
		   
		   let empEml = $("#empEml").val();
		   console.log("empEml : " + empEml);
		   
		   if(memId == '' || memId.length == 0) {
			$(".label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
				return false;
			}else if(!memId == '' || memId.length == 0) {
				$(".label1").css("color", "red").text(" ");
			}
		   
		   var data = {
			    "memId":memId,
			    "employeeVO":{"empEml":empEml}
			};
		   
		   /*
		   {memId:a001,empEml:sehe0700@naver.co}
		   */
		   console.log("data : ", data);
		   
	       //Ajax로 전송
	       $.ajax({
	            url : "/checkEmail", 
	            contentType:"application/json;charset=utf-8",
	 		    data:JSON.stringify(data),
	            type:"post",
	 		    dataType:"json",
	 		   beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
	 		   success:function(result){
	 			   console.log("!!");
	 			   //result : memberVO
	 			   console.log("result :",result);
	 			  console.log("result type:", typeof result);
	 			   
	 			   if(result.result ==="0"){
	 				   $(".label1").css("color", "blue").text("인증에 성공하셨습니다!");
		 			   $("#modalUpdateReply").modal('hide');
		 			   $("#mailSentModal").modal('show');
	 			   }
	 			   else if(result.result==="1"){
	 				  $(".label1").css("color", "orange").text("아이디가 일치하지 않습니다"); 
	 			   }else if(result.result==="2"){
	 				  $(".label1").css("color", "orange").text("이메일이 일치하지 않습니다"); 
	 			   }else{
	 				  $(".label1").css("color", "green").text("잘못입력했습니다."); 
	 			   }
	 		   },//end success,
	 		  error: function(xhr, status, error,jqXHR) {
	 		        console.log("Ajax 요청 실패:", status, error); // 요청 실패 시 에러 로그
	 		       console.log("서버 응답:", xhr.responseText);
	 		      $(".label1").css("color", "red").text("존재하지 않는 아이디 입니다."); 
	 		    }
	 		   
	       }); //ajax
	});
	
});
</script>
<div id="concon">
<div id="login-box-1">
	<div class="login-logo">
	
		<div id="lo-1">AMS</div>
		<div id="lo-2">Airport Management System</div>
	</div>
	<div class="lolo-box">
		<div class="">
			
			<!-- 
			[스프링 시큐리티 로그인 폼 규칙]
			1. 아이디   : name속성값이 username
			2. 비밀번호 : name속성값이 password
			3. form태그의 action속성값이 /login, method속성값이 post
			4. csrf 처리
			5. submit 버튼
			 -->
			<form action="/login" method="post" id="forfor">
				<div id="aa">
					<svg id="svsv" xmlns="http://www.w3.org/2000/svg" height="26px" viewBox="0 -960 960 960" width="26px" fill="#666666"><path d="M245.5-268.81q51.77-37.34 109.62-58.46 57.84-21.11 124.88-21.11 67.04 0 124.88 21.11 57.85 21.12 109.85 58.46 38.42-42.11 59.83-95.52 21.4-53.41 21.4-115.68 0-131.68-92.13-223.82-92.14-92.13-223.83-92.13t-223.83 92.13q-92.13 92.14-92.13 223.82 0 62.27 21.4 115.68 21.41 53.41 60.06 95.52Zm234.62-182.81q-54.27 0-91.39-36.99-37.11-36.99-37.11-91.27 0-54.27 36.99-91.39 36.99-37.11 91.27-37.11 54.27 0 91.39 36.99 37.11 36.99 37.11 91.27 0 54.27-36.99 91.39-36.99 37.11-91.27 37.11ZM480-108.08q-77.25 0-145.24-29.22-67.98-29.23-118.12-79.46Q166.5-267 137.29-334.91q-29.21-67.92-29.21-145.19 0-77.34 29.22-145.23 29.23-67.89 79.46-118.03Q267-793.5 334.91-822.71q67.92-29.21 145.19-29.21 77.34 0 145.23 29.22 67.89 29.23 118.03 79.46Q793.5-693 822.71-625.2q29.21 67.8 29.21 145.2 0 77.25-29.22 145.24-29.23 67.98-79.46 118.12Q693-166.5 625.2-137.29q-67.8 29.21-145.2 29.21Zm-.01-55.96q53.36 0 102.57-17.02 49.21-17.02 89.52-48.33-40.31-29.65-88.36-46.34-48.04-16.69-103.65-16.69-55.6 0-104.26 16.15-48.66 16.15-87.89 46.88 40.31 31.31 89.51 48.33t102.56 17.02Zm.01-343.54q30.35 0 51.39-21.03 21.03-21.04 21.03-51.39t-21.03-51.39q-21.04-21.03-51.39-21.03t-51.39 21.03q-21.03 21.04-21.03 51.39t21.03 51.39q21.04 21.03 51.39 21.03Zm0-72.42Zm0 351.77Z"/></svg>
					<input type="text" class="input1" style="color:black;"
						placeholder="아이디" autocomplete="off"
						name="username" id="username" />
				</div>
				
				<div id="aa1">
					<svg id="svsv2" xmlns="http://www.w3.org/2000/svg" height="26px" viewBox="0 -960 960 960" width="26px" fill="#666666"><path d="M96.15-214.85v-55.96h767.39v55.96H96.15Zm31.27-237.73-38.8-22.23 36.61-63.84H52.31v-44.77h72.92l-36.61-61.85 38.8-22.23 36.31 61.85 36.31-61.85 38.81 22.23-36.81 61.85h73.11v44.77h-73.11l36.81 63.84-38.81 22.23-36.31-63.84-36.31 63.84Zm315.96 0-38.49-22.23 36.3-64.15h-72.92v-44.46h72.92l-36.3-62.35L443.38-668l36.31 62.35L516.31-668l38.5 22.23-36.31 62.35h72.92v44.46H518.5l36.31 64.15-38.5 22.23-36.62-63.84-36.31 63.84Zm316.27 0-38.8-22.23 36.8-64.15h-73.11v-44.46h73.11l-36.8-62.35 38.8-22.23 36.31 62.35L832.27-668l38.81 22.23-36.62 62.35h72.92v44.46h-72.92l36.62 64.15-38.81 22.23-36.31-63.84-36.31 63.84Z"/></svg>
					<input type="password" class="input1" style="color:black;"
						placeholder="비밀번호" autocomplete="off"
						name="password" id="password" />
				</div>
				
					<button type="submit" id="login-btn1">로그인</button>
					<div id="btn2-box">
						<div id="btn2" >비밀번호 찾기</div>
					</div>
				<!-- csrf : Cross Site(크로스 사이트) Request(요청) Forgery(위조) -->
				<sec:csrfInput/>
			</form>
		</div>
	</div>
</div>
<!-- <div id="con-box"> -->
<!-- 	<div id="con-btn1" class="con-btn">관리자</div> -->
<!-- 	<div id="con-btn2" class="con-btn">인사팀</div> -->
<!-- 	<div id="con-btn3" class="con-btn">회계팀</div> -->
<!-- 	<div id="con-btn4" class="con-btn">회계팀 결재자</div> -->
<!-- 	<div id="con-btn5" class="con-btn">시설팀</div> -->
<!-- 	<div id="con-btn6" class="con-btn">물류팀</div> -->
<!-- 	<div id="con-btn7" class="con-btn">항공사</div> -->
<!-- 	<div id="con-btn8" class="con-btn">보안</div> -->

<!-- </div> -->
</div><!-- concon -->

<!-- 비밀번호 찾기 -->
     <div class="modal fade" id="modalUpdateReply">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">비밀번호 찾기</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">본인확인</h3>
					</div>


					<form>
						<div class="card-body">
							<div class="form-group">
								<label for="exampleInputPassword1">아이디</label> <input
									type="text" class="form-control" id="memId"
									placeholder="아이디 입력" />
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">이메일</label> <input
									type="email" class="form-control" id="empEml"
									placeholder="이메일 입력" />
								
							</div>
							
						</div>
	 					 <label class="label1"></label>
						<div class="card-footer" style="display: flex; gap: 10px;">
							<!-- submit 버튼 : 동기방식
								button 버튼 : 비동기처리를 위함
							 -->
							<button type="button" id="btnSendEmail" class="btn btn-primary">이메일 전송</button>
							 <div id="selectt">입력</div>
						</div>
					</form>
				</div>
			</div>
            <div class="modal-footer justify-content-between">
              <button type="button" id="modalHide" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
<!-- 댓글 수정 모달  끝 -->
<div class="modal fade" id="mailSentModal" tabindex="-1" role="dialog" aria-labelledby="menuSaveModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <p>메일이 전송되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
