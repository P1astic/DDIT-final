<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>

<!-- 

24.09.27 김예영 프로필 이미지 업로드, 다운로드용 jsp

********* 코드 수정 금지 *********

연관 controller
- comn/controller/ImgController.java

연관 Mapper
- EmployeeMapper
- BpMapper

연관 SQL
- Employee_SQL
- Bp_SQL

 -->


<script>

let files = []; // 현재 선택된 파일 저장 배열
let fileInput = document.getElementById("file"); // 파일 입력 아이디
fileName = "";


// 추가된 파일명 미리보기
function handleFile(e){
	console.log("handleFile 도착");
	let newFiles = e.target.files; // 선택한 파일들
	
	// 새 파일들만 배열에 추가
	for (let i = 0; i < newFiles.length; i++) {
		files.push(newFiles[i]);
	}
	
	updateFileList(); // 파일 목록 업데이트
    
}

// 파일명 미리보기 목록 업데이트 함수
function updateFileList() {
	console.log("updateFileList 도착");
	
	let accumStr = "";
	
	files.forEach((file, index) => {
		accumStr += "<div class='files' id='fileNum" + index + "'>";
		accumStr += "<label>" + file.name + "</label>";
		accumStr += "</div>";
		
		console.log("fileName : " + file.name);
		fileName = file.name;
		
		upload(file); // 파일 업로드 함수 호출
	})
	
	$(".fileList").html(accumStr); // 추가된 파일 div #fileList에 추가

}

// 파일 업로드 함수
function upload(file) {
	
	console.log("upload 도착");
	
	let id = "emp24C1010"; 	// 예시. 실제로는 로그인한 사용자의 정보 불러올 것
	let name = "임세희";		// 예시
	
	let formData = new FormData();
    formData.append("file", file); // 파일 추가 *필수
    formData.append("memId", id); // employeeVO의 memId 추가 *필수
    formData.append("empNm", name); // employeeVO의 empNm 추가 *필수
//     formData.append("bpNm", name); // bpVO의 bpNm 추가 *필수
	
	$.ajax({
        url: "/empImgUpload",
//         url: "/bpImgUpload",
        type: "POST",
        data: formData,
        processData: false,
        contentType : false,
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
        success: function(result) {
            console.log("Ajax result : ", result);
        },
        error: function(xhr, status, error) {
            console.error("오류 발생:", error);
        }
    });
}

$(function() {
	
	// 파일명 미리보기 호출
	$("#file").on("change", handleFile);
	
})
</script>


<h2>이미지 업로드 예시</h2>
<!-- 파일 선택 -->
<div class="form-group" style="width:300px; height:300px; border:1px solid black; display:flex; justify-content:center; align-items:center;">
	<div class="input-group">
		<div class="custom-file">
			<label id="uploadFileBtn" for="file"
				style="border:1px solid black; border-radius:10px; width:100px; height:50px; background:yellow; font-size:20px;"
			>등록 버튼</label>
			<input type="file" id="file" name="file" multiple style="display:none;"/>
	    </div>
   		<span>선택한 파일 :</span>
    	<div class="fileList">
		</div>
	</div>
</div>


<hr>
<hr>
<hr>


<!-- 이미지 다운로드 예시 -->
<h2>이미지 다운로드 예시</h2>
<div style="margin:10px;">
	<img src="/download?filePath=/upload/profile/emp/emp24C1010_임세희/420212b7-ca8a-4827-b1cf-eec5fefed72b_사약햄찌.jpg&fileOrgnlFileNm=420212b7-ca8a-4827-b1cf-eec5fefed72b_사약햄찌.jpg" />
</div>