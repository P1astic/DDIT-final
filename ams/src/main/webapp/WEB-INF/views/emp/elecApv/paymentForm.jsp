<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <script type="text/javascript" src="/resources/js/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />


<link rel="stylesheet" href="/resources/css/approv/paymentForm.css">

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<script>
let empList = [];
let deptList = [];
let selEmpList = [];
let selMemIdList = [];
let approvers = [];

let files = []; // 현재 선택된 파일 저장 배열`
let fileInput = document.getElementById("uploadFile"); // 파일 입력 필드
const maxFiles = 10; // 최대 파일 개수

//추가된 파일명 미리보기
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

$(document).ready(function(){
	
        
        // 이벤트 바인딩
        $('#jstree').on("changed.jstree", function (e, data) {
            console.log("선택된 노드:", data.selected);
        });
//     });
	
	// 파일명 미리보기 호출
	$("#uploadFile").on("change", handleFile);

// 	$("#btnApvDetail").on("click", function() {
// 		$("#myModal").show();

// 	});

	$("#close").on("click", function() {
		$("#myModal").hide();
	});

	$(".accordion h3").on("click", function() {
	    $(this).toggleClass("active");
	    var deptList = $(this).next(".accordion-content");
	    var deptCd = $(this).data("dept-cd");
	    
	    if (!deptList.hasClass("loaded")) {
	        $.ajax({
	            url: "/elecApv/deptEmpListAjax",
	            contentType: "application/json;charset=utf-8",
	            data: deptCd,
	            type: "POST",
	            dataType: "JSON",
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success: function(res) {
	                if (Array.isArray(res)) {
	                    var employeeList = res.map(function(employee) {
	                        return "<span class='employee' data-mem-id='" + employee.memId + "'>" + employee.empNm + "</span><span class='jbgdNm'> [" + employee.jobGrade.jbgdNm + "]</span><br>";
	                    }).join("");
	                    deptList.html(employeeList).addClass("loaded");
	                    
	                } else {
	                    console.error("Expected an array but got: ", res);
	                }
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error("Error fetching employee data: ", textStatus, errorThrown);
	            }
	        });
	        
	    }
	    
	    deptList.slideToggle();
	    $(".accordion h3").not(this).removeClass("active");
	    $(".accordion-content").not(deptList).slideUp();
	});
	
	$(document).on("click", ".employee", function() {
	    const memId = $(this).data("mem-id");
	    const empNm = $(this).text();
	    const jobGrade = $(this).next("span").text().replace(/[\[\]]/g, '').trim();

	    if ($("#approval-line").find("[data-mem-id=" + memId + "]").length > 0) {
	        alert("이미 선택된 직원입니다.");
	        return;
	    }

	    if ($("#approval-line").children().length >= 4) {
	        alert("최대 3명까지만 선택할 수 있습니다.");
	        return;
	    }

	    const approverElement = $("<p>")
	        .attr("data-mem-id", memId)
	        .attr("data-job-grade", jobGrade)
	        .html(empNm + " <button class='approvalLineRemove'>삭제</button>");
	    
	    $("#approval-line").append(approverElement);
	});
	
	
	function addToApprovalLine(memId, empNm) {
	    var approvalLine = $("#approval-line");
	    approvalLine.append("<p data-mem-id='" + memId + "'>" + empNm + " <button class='approvalLineRemove'>삭제</button></p>");
	}


	$(document).on("click", ".approvalLineRemove", function() {
		$(this).parent().remove();
	});
	
	$("#approvalLineBtn").on("click", function() {
	    const approvers = [];
	    
	    $("#approval-line p").each(function(index) {
	        if (index < 3) { 
	            const memId = $(this).data("mem-id");
	            const empNm = $(this).text().split(" ")[0];
	            const jobGrade = $(this).data("job-grade") || "담당자"; 
	            
	            approvers.push({
	                memId: memId,
	                empNm: empNm,
	                jobGrade: jobGrade
	            });
	        }
	    });
	    createApprovalLine(approvers);
	    $("#myModal").hide();
	});
	
	function createApprovalLine(approvers) {
		
	    $('.f1-1').empty();
	    
	    let first = `
	        <div class="f1-1-1">
            <div class="f1-1-1-1">
                <div class="Title">결 재</div>
            </div>
        </div>
        <div class="f1-1-2">
        <div class="f1-1-2-1">
            <div class="f1-1-2-1-1">
                <div class="jName">기안자</div>
            </div>
        </div>
        <div class="f1-1-2-2">
            <div class="f1-1-2-2-1"></div>
            <div class="f1-1-2-2-2">
                <div class="Title"></div>
            </div>
        </div>
        <div class="f1-1-2-3">
            <div class="f1-1-2-3-1">
                <div class="empName" id="listDiv1">
                    <input type="text" id="apvLine1" name="apvId" value="${memVO.memId}" hidden />
                    ${memVO.employeeVO.empNm}
                </div>
            </div>
        </div>
    </div>
    `;

    $('.f1-1').append(first);
	    
	    approvers.forEach((approver, index) => {
// 	    	console.log(approver);
	        let approverHtml = 
	        	'<div class="f1-1-2">' +
	            '<div class="f1-1-2-1">' +
	                '<div class="f1-1-2-1-1">' +
	                    '<div class="jName">' + approver.jobGrade + '</div>' +
	                '</div>' +
	            '</div>' +
	            '<div class="f1-1-2-2">' +
	                '<div class="f1-1-2-2-1"></div>' +
	                '<div class="f1-1-2-2-2">' +
	                    '<div class="Title"></div>' +
	                '</div>' +
	            '</div>' +
	            '<div class="f1-1-2-3">' +
	                '<div class="f1-1-2-3-1">' +
	                    '<div class="empName" id="listDiv' + (index + 2) + '">' +
	                        '<input type="text" id="apvLine' + (index + 2) + '" name="apvId" value="' + approver.memId + '" hidden />' +
	                        approver.empNm +
	                    '</div>' +
	                '</div>' +
	            '</div>' +
	        '</div>';
	        $('.f1-1').append(approverHtml);
	    });  
	};
	
	

		$("#airline").hide();
		
		 let commonCodeDetailList = [
		        <c:forEach var="CommonCodeDetailVO" items="${CommonCodeDetailVOList}" varStatus="status">
		            {
		                comCdGroup: "${CommonCodeDetailVO.comCdGroup}",
		                comDetCd: "${CommonCodeDetailVO.comDetCd}",
		                comDetCdCn: "${CommonCodeDetailVO.comDetCdCn}"
		            }<c:if test="${!status.last}">,</c:if>
		        </c:forEach>
		    ];
		$("#tempSeCd").on("change", function() {
			
			
			let tempSeClob = $("#tempSeCd option:selected").data("html");
			
			let tempSeNm = $("#tempSeCd option:selected").text(); 

			$("#trNm").append(tempSeNm);
			$("#temp").html(tempSeClob);
			
			if($("#tempSeCd option:selected").val() === 'I1'){
				$("#airline").show();
			}else{
				$("#airline").hide();
			}
			
			if($("#tempSeCd option:selected").val() === 'I3'){
				
				let selectHtml = '<select id="lvDetType" name="lvDetType" style="width: 130px;" required>'+
						'<option value="">-선택하세요-</option>';
	            console.log("selectHtml : "+selectHtml);
				
	            for (let i = 0; i < commonCodeDetailList.length; i++) {

	                if (commonCodeDetailList[i].comCdGroup === 'BB') {
	                    selectHtml += '<option value="'+commonCodeDetailList[i].comDetCdCn+'">'+commonCodeDetailList[i].comDetCdCn+'</option>';
	                }
	            }
	            
	            selectHtml += '</select>';
		            $("#lvDetTypeBox").html(selectHtml);
		        } else {
		            $("#lvDetTypeBox").empty();
		        }
			
		});
		
		
		$(document).on("change", "#lvDetType", function(){
			let comDetCd = $(this).val(); 
			console.log("comDetCd : "+comDetCd);
			if(comDetCd == '병가'){
				
				$("#lvUseDay").hide();
				$("#lvUseDay").attr("disabled",true);
			}else{
				$("#lvUseDay").show();
				$("#lvUseDay").attr("disabled",false);
			}
			
		});
		
		$(document).on("change","#lvBgngYmd, #lvEndYmd", function() {
	        hollyDay();
	    });

	    function hollyDay() {
	        let startDate = $('#lvBgngYmd').val();
	        let endDate = $('#lvEndYmd').val();
	        
	        // 둘 다 선택되었을 때만 계산
	        if (startDate && endDate) {
	        	let start = new Date(startDate);
	        	let end = new Date(endDate);
	            
	            if (end < start) {
	                alert('종료일자는 시작일자보다 이후여야 합니다.');
	                $('#lvEndYmd').val('');
	                $('#lvUseDay').val('');
	                return;
	            }
	            
	            let count = 0;
	            let day = new Date(start);
	            
	            // 시작일부터 종료일까지 루프
	            while (day <= end) {
	                // 현재 날짜가 주말(토:6, 일:0)이 아닌 경우에만 카운트
	                if (day.getDay() !== 6 && day.getDay() !== 0) {
	                	count++;
	                }
	                day.setDate(day.getDate() + 1);
	            }
	            
	            // 계산된 일수를 입력란에 설정
	            $('#lvUseDay').val(count);
	        }
	    }
	    
	    
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
		
	    // 사원 선택 모달 띄우기
	    $("#btnApvDetail").on("click", function() {
	    	
	    	approvers = [];
	    	selEmpList = [];
	    	selMemIdList = [];
	    	
	    	$(".selEmp").html('');
	    	$(".selectedEmp").html('');
	    	
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
	    				str += "<button type='button' class='btn btn-third' id='selEmpBtn' data-target='" + empList[i].memId + "' data-name='" + empList[i].empNm + "' data-grade='" + empList[i].jbgdNm
	    						+ "' style='width:100%; float:left; text-align:left;'>" + empList[i].empNm + "(" + empList[i].jbgdNm + ")" + "</button>";
	    			}
	    			$(".selEmp").html('');
	    			$(".selEmp").html(str);
	    		}
	    		
	    	});	
	    });
	 
	 	// 사원 선택하기
	    $(document).on("click", "#selEmpBtn", function() {
	    	
	    	console.log("selEmpBtn memId : " + $(this).data("target"));
	    	console.log("selEmpBtn empNm : " + $(this).data("name"));
	    	console.log("selEmpBtn jobGrade : " + $(this).data("grade"));
	    	let selectedMemId = $(this).data("target");
	    	let selectedEmpNm = $(this).data("name");
	    	let selectedGrade = $(this).data("grade");
	    	
	    	approvers.push({
	    		memId : selectedMemId,
	    		empNm : selectedEmpNm,
	    		jobGrade : selectedGrade
	    	});
	    	
	    	console.log("approvers : " + approvers);
	    	selEmpList.push(selectedEmpNm);
	    	selMemIdList.push(selectedMemId);
	    	
	    	printSelEmpList();
	    });
	 			
	 	
	 	// 선택한 사원 참여자 목록에 출력
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
	    };
	    
	    $("#selEmpDoneBtn").on("click", function() {
			$("#selEmpsModal").modal('hide');
			
			createApprovalLine(approvers);			
		});

		
});

</script>


<div id="title-box">
	<div class="title-txt">전자결재</div>
	<div class="title-txt">-</div>
	<div class="title-txt">결재하기</div>
	<div class="title-txt">-</div>
	<div class="title-txt" style="color: rgba(0, 0, 0, 0.88);">결재생성하기</div>
</div>

<div id="container" >
	<form id="fmId" action="/elecApv/paymentInsert" enctype="multipart/form-data" method="post">
		<div class="a0">
			<button type="submit" id="lastBtn">기안하기</button>
		</div>
		<div class="a1-box">
			<div class="a1">기본설정</div>
			<div class="a2">
				<div class="a2-1">문서종류</div>
				<div class="a2-2">
					<select id="tempSeCd" name="tempSeCd">
						<option value="">선택</option>
						<c:forEach var="TemplateSectionVO"
							items="${TemplateSectionVOList}">
							<option value="${TemplateSectionVO.tempSeCd}"
								data-html="${fn:escapeXml(TemplateSectionVO.tempSeClob)}">
								${TemplateSectionVO.tempSeNm}</option>
						</c:forEach>
					</select> <select id="airline" name="airline">
						<option value="">-항공사 선택-</option>
						<c:forEach var="AirLineVO" items="${AirLineVOList}">
							<option value="${AirLineVO.memId}">${AirLineVO.airKrNm}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="a2">
				<div class="a2-1">부서</div>
				<div class="a2-2">
					<input type="text" id="deptNm" name="deptCd"
						value="${memVO.deptVO.deptCd}" hidden="" />${memVO.deptVO.deptNm}
				</div>
				<div class="a2-1">직급</div>
				<div class="a2-2">
					<input type="text" id="jbgdNm" name="jbgdCd"
						value="${memVO.jobGradeVO.jbgdCd}" hidden="" />${memVO.jobGradeVO.jbgdNm}
				</div>
			</div>
			<div class="a2">
				<div class="a2-1">성명</div>
				<div class="a2-2">
					<input type="text" id="apvLine1" name="empNm"
						value="${memVO.employeeVO.empNm}" hidden="" required />${memVO.employeeVO.empNm}
				</div>
				<div class="a2-1">사번</div>
				<div class="a2-2">
					<input type="text" id="memId" name="memId" value="${memVO.memId}"
						hidden="" />${memVO.memId}
				</div>
			</div>
		</div>
		<hr>
		<div class="a1-box">
			<div class="a1">결재선</div>
			<button type="button" id="btnApvDetail">결재선 지정</button>
		</div>
		<div class="f1">
			<div class="f1-1">

				<div class="f1-1-1">
					<div class="f1-1-1-1">
						<div class="Title">결 재</div>
					</div>
				</div>
			<div class="f1-1-2">
            <div class="f1-1-2-1">
                <div class="f1-1-2-1-1">
                    <div class="jName">기안자</div>
                </div>
            </div>
            <div class="f1-1-2-2">
                <div class="f1-1-2-2-1"></div>
                <div class="f1-1-2-2-2">
                    <div class="Title"></div>
                </div>
            </div>
            <div class="f1-1-2-3">
                <div class="f1-1-2-3-1">
                    <div class="empName" id="listDiv1">
                        <input type="text" id="apvLine1" name="apvId" value="${memVO.memId}" hidden />
                        ${memVO.employeeVO.empNm}
                    </div>
                </div>
            </div>
				</div>
			</div>
		</div>
			<!-- f1-1 -->
		<hr>
		<div class="a1-box">
			<div class="a1">상세 내역</div>
			<div id="temp">
				 <div class="a1-box">
    

				<div class="a1-box">
					<div class="a2">
						<div class="a2-1">제목</div>
						<div class="a2-2">
							<input type="text" id="elecApvTitle" name="elecApvTitle" required />
						</div>
					</div>
					<div class="a2">
						<div class="a2-1 full-width" style="width: 100%">기안 사유</div>
					</div>
					<div class="a2">
						<div class="a2-2 full-width">
							<textarea id="lvDetRsn" name="lvDetRsn" rows="13" cols="117"
								required></textarea>
						</div>
					</div>
					<div class="a2">
						<div class="a2-1">파일첨부</div>
						<div class="a2-2">
							<input type="file" id="uploadFile" name="uploadFile" multiple />
							<div class="fileList"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>		
		
		<!-- 파일 개수 컨펌 모달 -->
		<div class="modal fade" id="fileModal" tabindex="-1" role="dialog"
			aria-labelledby="completionModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">업로드 가능한 파일의 최대 개수는 10개입니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 파일 개수 컨펌 모달 -->
		<sec:csrfInput />
	</form>
</div>

<!-- 사원 선택 모달 -->
<div class="modal fade" id="selEmpsModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true" style="margin-top:20px;">
    <div class="modal-dialog" role="document" style="margin-top:100px;">
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
<script>
$(document).ready(function(){
	function getUrlParameter(name) {
	    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
	    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
	    var results = regex.exec(location.search);
	    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
	}
	
	// URL에서 'selectedValue'라는 파라미터 값을 가져옴
	var selectedValue = getUrlParameter('selectedValue');
	
	// 가져온 값이 있으면 해당 값을 select box에서 선택
	if (selectedValue) {
		
		localStorage.setItem("openMenu", "menuE080202");
		var openMenu = localStorage.getItem("openMenu");
		
        $('#' + openMenu).addClass('menu-open');
        $('#' + openMenu + ' > a').addClass('active');
        $('#' + openMenu).parents('.nav-item').addClass('menu-open');
        $('#' + openMenu).parents('.nav-item').children('a').addClass('active');		
		
		$("#tempSeCd").val(selectedValue).trigger('change');
		
		
		
	}
	
})
</script>