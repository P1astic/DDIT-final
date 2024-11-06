<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board/regist.css">
<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>


<script type="text/javascript">

let files = []; // 현재 선택된 파일 저장 배열
let fileInput = document.getElementById("uploadFile"); // 파일 입력 필드
const maxFiles = 10; // 최대 파일 개수

// 추가된 파일명 미리보기
function handleFile(e){
	let newFiles = e.target.files; // 선택한 파일들
	
	// 선택한 파일 개수가 최대 개수를 초과하는지 확인
	if(files.length + newFiles.length > maxFiles) {
		$("#fileModal").modal('show');
		return;
	}
	
	// 새 파일들만 배열에 추가
	for (let i = 0; i < newFiles.length; i++) {
		files.push(newFiles[i]);
	}
	
	updateFileList(); // 파일 목록 업데이트
    
}

//파일명 미리보기 목록 업데이트 함수
function updateFileList() {
	let accumStr = "";
	
	files.forEach((file, index) => {
		accumStr += "<div class='files' id='fileNum" + index + "'>";
		accumStr += "<label>" + file.name + "</label>";
		accumStr += "<button class='fileDel' data-index='" + index + "' type='button'><img src='/resources/images/icon/trashcan.png'></button>";
		accumStr += "</div>";
	})
	
	$(".fileList").html(accumStr); // 추가된 파일 div #fileList에 추가
	
}

let defaultText = "[협력업체]";

$(function(){
	
	// 파일명 미리보기 호출
	$("#uploadFile").on("change", handleFile);
	
	// 분류 선택 시 해당 타이틀 제목에 자동 입력
	$("#ntcBrdType").on("change", function() {
		let ntcBrdType = $(this).val();
		console.log("ntcBrdType : " + ntcBrdType);
		if(ntcBrdType !== "O1") {
			
		let data = {
				"comDetCd" : ntcBrdType
		};
		
		$.ajax({
			url : "/bp/board/getNoticeTypeNm",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				console.log("getNoticeTypeNm : " , result.comDetCdNm);
				if(result.comDetCdNm !== "필독") {
					defaultText = "[" + result.comDetCdNm + "] ";
					console.log("defaultText : " + defaultText);
					$("#ntcBrdTtl").val(defaultText);					
				}
				}
			});
		}
	});
	
	// CKEditor의 데이터가 textarea에 반영되도록 처리
	$(".ck-blurred").keydown(function(){
        //window.editor :CKEditor 객체      
        $("#ntcBrdCn").val(window.editor.getData());
     });
	
     //CKEditor로부터 커서 이동 또는 마우스 이동 시 실행
     $(".ck-blurred").on("focusout", function(){
        $("#ntcBrdCn").val(window.editor.getData());
     });
     
     $("#confirmSubmitBtn").on("click", function() {
    	 
    	// AJAX 요청으로 폼 제출
        var formData = new FormData($('#registForm')[0]);
    	
     	// AJAX 요청
        $.ajax({
            url: '/bp/board/registPost',
            type: 'POST',
            data: formData,
            processData: false, // FormData 객체를 사용하므로 false
            contentType: false, // FormData 객체를 사용하므로 false
            beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
            success: function(response) {
                // 성공적으로 전송된 경우 처리
                $("#confirmModal").modal('hide');
            	$("#completionModal").modal('show');
                let ntcBrdNo = response;
                setTimeout(() => window.location.href="/bp/board/detail?ntcBrdNo=" + ntcBrdNo, 1000);
            },
            error: function(xhr, status, error) {
                $("#failureModal").modal("show");
            }
        });
	
	// 폼 제출 시 유효성 검사
	$("#submitBtn").on("click", function(e) {
		// CKEditor의 데이터를 textarea에 설정
		$("#ntcBrdCn").val(window.editor.getData());
		
		if(typeField = $("#ntcBrdType").val() === "") {
    		$("#noTypeModal").modal('show');
			return;
    	}
		
		// 제목란에 '[분류]' 외에 다른 제목이 입력되었는지 확인
		if($("#ntcBrdType").val() !== "O1") {
			let ttlField = $("#ntcBrdTtl").val().trim();
			if(ttlField === defaultText.trim() || ttlField === "") {
				$("#noTitleModal").modal('show');
				return;
			}			
		}
		
		// textarea가 비어있는지 확인
		if($("#ntcBrdCn").val().trim() === "") {
			$("#noContentModal").modal('show');
			return;
		}
		
		$("#confirmModal").modal('show');
	});	
	
	// 동적으로 추가된 fileDel 버튼에 대한 이벤트 추가
    $(document).on("click", ".fileDel", function() {
    	let index = $(this).data('index'); // 클릭한 요소가 부모 요소로부터 몇 번째 요소인지 저장
    	console.log("index 값 : " + index);
     	
     	
     	$(this).parent().remove();
     	console.log(index + "번째 파일 삭제됨");
     	
     	console.log("fileDel의 개수 : " + $(".fileDel").length);
     	
     })

});
</script>


<div class="container">
    <div class="row justify-content-center">
        <div class="col">
        	<div class="titleHeader">
	            <h4 class="pageTitle">공지사항 작성</h4>
	        </div> <!-- card-header 끝 -->
	        
	        <div class="header">
				<form name="registForm" id="registForm">
	                <div class="card-body">                
						<input type="hidden" id="memId" name="memId" value="${memVO.memId}">
						<input type="hidden" id="ntcBrdType" name="ntcBrdType" value="${bpNoticeType.comDetCd}">

	                	<div class="form-group">
							<label for="ntcBrdType">분류</label>
							<select class="form-control" id="selType" required name="ntcBrdType" id="ntcBrdType">
									<option value="${bpNoticeType.comDetCd}" selected disabled>${bpNoticeType.comDetCdNm}</option>
							</select>
						</div>
	                    
	                    <div class="form-group">
	                    	<label for="ntcBrdTtl">제목</label>
	                    	<input type="text"	class="form-control" id="ntcBrdTtl"
	                    		name="ntcBrdTtl" required value="[협력업체] ">
	                    </div>
	
	                    <div class="form-group">
							<label for="ntcBrdCn">내용</label>
							<div id="ntcBrdCnTemp"></div>
							<textarea style="display:none;" class='form-control' name='ntcBrdCn' id='ntcBrdCn'></textarea>
						</div>
						
						<div class="form-group">
                    		<label for="input-group">첨부파일</label>
							<div class="input-group">
		                    	<div class="custom-file">
		                    		<label id="uploadFileBtn" for="uploadFile">선택</label>
		                    		<input type="file" id="uploadFile" name="uploadFile" multiple style="display:none;"/>
	                			</div>
	               				<div class="fileList">
	               				</div>
	                		</div>
	               		</div>
					
					

					<!-- 하단 버튼 -->
		            <div class="regist-footer">
						<button type="button" class="btn btn-primary" id="submitBtn" >등록</button>
						<a href="/bp/board/list" class="btn btn-secondary" id="listBtn" >목록</a>                
					</div>
					
				</div>
			
			<sec:csrfInput/>
			</form>
			</div> <!-- card 끝 -->
		</div> <!-- col-md-8 끝 -->
	</div> <!-- justify-content-center 끝 -->
</div> <!-- container 끝 -->

<!-- 파일 개수 컨펌 모달 -->
<div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                업로드 가능한 파일의 최대 개수는 10개입니다.
            </div>
            <div class="modal-footer">
                <button type="button" id="fileModalCheckBtn" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 파일 개수 컨펌 모달 -->

<!-- 수정 컨펌 모달 -->
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                등록하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" id="confirmCancelBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="confirmSubmitBtn">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 수정 컨펌 모달 -->

<!-- 분류 입력 요청 모달 -->
<div class="modal fade" id="noTypeModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                분류를 선택해주세요.
            </div>
            <div class="modal-footer">
                <button type="button" id="noTypeCheckBtn" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 분류 입력 요청 모달 -->

<!-- 제목 입력 요청 모달 -->
<div class="modal fade" id="noTitleModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                제목을 입력해주세요.
            </div>
            <div class="modal-footer">
                <button type="button" id="noTitleCheckBtn" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 제목 입력 요청 모달 -->

<!-- 내용 입력 요청 모달 -->
<div class="modal fade" id="noContentModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                내용을 입력해주세요.
            </div>
            <div class="modal-footer">
                <button type="button" id="noContentCheckBtn" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 내용 입력 요청 모달 -->


<!-- 등록 완료 모달 -->
<div class="modal fade" id="completionModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                게시물이 등록되었습니다.
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- 등록 완료 모달 -->

<!-- 등록 실패 모달 -->
<div class="modal fade" id="failureModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                수정 실패하였습니다.
            </div>
            <div class="modal-footer">
                <button type="button" id="failureModalCloseBtn" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- 등록 실패 모달 -->

<script>
//CKEditor5 적용 및 데이터 넣기
//<div id="ntcBrdCnTemp"></div>
//uploadUrl => 이미지 업로드 시 요청할 요청URI
//editor : CKEditor가 생성된 후 바로 그 객체
//window.editor : 그 객체를 이렇게 부르겠다 라는 뜻
ClassicEditor.create(document.querySelector('#ntcBrdCnTemp'), {
    ckfinder: {
        uploadUrl: '/image/upload?${_csrf.parameterName}=${_csrf.token}'
    }
})
 .then(editor=>{window.editor=editor;})
 .catch(err=>{console.error(err.stack);});
</script>