<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/franchise/detail.css">

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>

<script>

	let memId = "${memVO.memId}";
	let franchiseId = "${franchiseVO.memId}";
	let franchiseNm = "${franchiseVO.bpVO.bpNm}";
	let nowFloor = "${franchiseVO.frnFloor}";
	let nowPosition = "${franchiseVO.frnPosition}";
	let files = [];
	let fileName = "";
	let mapImgUrl = "";
	let mapImgNm = "";
	
	let fileInput = document.getElementById("file"); // 파일 입력 아이디
	fileName = "";

	function updateSave() {
		
		let position = $("#frnPosition").val();
		let floor = $("#frnFloor").val();
		let zone = $("#frnZoneLocation").val();
		let openTime = $("#frnOpenTm").val();
		let closeTime = $("#frnCloseTm").val();
		let prod = $("#frnProd").val();
		let enterDate = $("#frnEnterDate").val();
		let uploadFile = $("#uploadFile").val();
		let mapNm = $("#bpNm").val();
		let franchiseId = "${franchiseVO.memId}";
		let inout = "";
		let mapId = $("#mapId").val();
		if(position == "AA") {
			inout = "I";
		} else {
			inout = "O";
		}
		
		enterDate = enterDate.replace(/-/g, "");
		
		console.log("position : " + position);
		console.log("floor : " + floor);
		console.log("zone : " + zone);
		console.log("openTime : " + openTime);
		console.log("closeTime : " + closeTime);
		console.log("prod : " + prod);
		console.log("enterDate : " + enterDate);
		console.log("franchiseId : " + franchiseId);		
		console.log("inout : " + inout);
		console.log("mapImgUrl : " + mapImgUrl);
		console.log("mapImgNm : " + mapImgNm);
		console.log("uploadFile : " + uploadFile);
		console.log("mapNm : " + mapNm);

		
		
		
		$.ajax({
			url : "/emp/franchise/update",
			type : "post",
			data : {position : position,
					floor : floor,
					zone : zone,
					openTime : openTime,
					closeTime : closeTime,
					prod : prod,
					enterDate : enterDate,
					memId : franchiseId,
					mapInout : inout,
					mapImgUrl : mapImgUrl,
					mapImgNm : mapImgNm,
					uploadFile : uploadFile,
					mapNm : mapNm,
					mapId : mapId},
			beforeSend: function(xhr) {
		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		    },
		    success : function(result) {
		    	console.log("update : " , result);
		    	location.reload();
		    }
		})
	}
	
	function handleImg(e) {
		let newFiles = e.target.files;
		
		// 새 파일들만 배열에 추가
		for (let i = 0; i < newFiles.length; i++) {
			files.push(newFiles[i]);
		}
		
		fileName = newFiles[0].name;
		
		let reader = new FileReader();
		reader.onload = function(e) {
			$(".mapImg").attr("src", e.target.result);
			$(".mapImg").css("display", "block");
			$("#mapImgNm").val(fileName);
			console.log("mapImgNm : " , $("#mapImgNm").val());
			
			
		}
		
		reader.readAsDataURL(newFiles[0]);
		
		
	}

	// 파일명 미리보기 목록 업데이트 함수
	function updateFileList() {
		console.log("updateFileList 도착");
				
		files.forEach((file, index) => {
			
			console.log("fileName : " + file.name);
			fileName = file.name;
			$("#mapImgNm").val(fileName);			
			
			console.log("updateFileList 끝");
			upload(file); // 파일 업로드 함수 호출
		})

	}

	// 파일 업로드 함수
	function upload(file) {
		
		console.log("upload 도착");
		
		let formData = new FormData();
	    formData.append("file", file); // 파일 추가 *필수
	    formData.append("floor", $("#frnFloor").val());
	    
	    console.log("formData : ", formData);
		
		$.ajax({
	        url: "/franchiseUpload",
	        type: "POST",
	        data: formData,
	        processData: false,
	        contentType : false,
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
	        success: function(result) {
	            console.log("franchiseUpload result : ", result);
	            mapImgUrl = result.mapImgUrl;
	            mapImgNm = result.mapImgNm;
	            
	            console.log("mapImgUrl : " + mapImgUrl);
	            console.log("mapImgNm : " + mapImgNm);
	            
	            updateSave();
	        },
	        error: function(xhr, status, error) {
	            console.error("오류 발생:", error);
	        }
	    });
	}
	
	$(function() {
		
		let floor = $("#frnPosition").val();
	    $.ajax({
	        url: "/emp/franchise/getFloor",
	        type: "post",
	        data: { floor: floor },
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        success: function(result) {
	            console.log("getFloor : ", result);
	            
	            let floorHtml = "<select id='frnFloor' name='frnFloor'>";
	            if (floor === "-") {
	                floorHtml += "<option value='' disabled selected>-</option>";
	            } else {
	                floorHtml += "<option value='' disabled >선택</option>";         
	                for (let i = 0; i < result.length; i++) {
	                    floorHtml += "<option value='" + result[i].comDetCd + "'";
	                    if (result[i].comDetCdCn === "${franchiseVO.frnFloorLocation}") {
	                        floorHtml += " selected";
	                    }
	                    floorHtml += ">" + result[i].comDetCdCn + "</option>";
	                }
	            }
	            floorHtml += "</select>";
	            $(".frnFloorDiv").html(floorHtml);
	            
	            // 구역 변경 활성화
	            $("#frnFloor").on("change", function() {
	                console.log("도착");
	                
	                let position = $("#frnPosition").val();
	                let floor = $("#frnFloor").val();
	                
	                $.ajax({
	                    url: "/emp/franchise/comparePosition",
	                    type: "post",
	                    data: { position: position, floor: floor },
	                    beforeSend: function(xhr) {
	                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                    },
	                    success: function(result) {
	                        console.log("comparePosition result : ", result);
	                        
	                        if (result.length == 0) {
	                            alert("해당 층의 모든 위치가 이용중입니다.");
	                         // 원래 값으로 되돌리기
	                         	if(nowFloor == "1F") {
	                         		nowFloor = "AA1";
	                         	} else if (nowFloor == "2F") {
	                         		nowFoor = "AA2";
	                         	} else if (nowFloor == "3F") {
	                         		nowFoor = "AA3";
	                         	} else if (nowFloor == "4F") {
	                         		nowFoor = "AA4";
	                         	}
	                            $("#frnFloor").val(nowFloor);
	                            
	                            if("${franchiseVO.frnPosition}" == "국내선") {
	                            	nowPosition = "AA";
	                            } else {
	                            	nowPosition = "AB"
	                            }
	                            $("#frnPosition").val(nowPosition);
	                            $("#frnZoneLocation").val("${franchiseVO.frnZoneLocation}");
	                        	console.log("nowFloor : " + nowFloor);
	                        	console.log("nowPosition : " + nowPosition);
	                        	
	                        } else {
	                            $("#frnZoneLocation").css("border", "0.5px solid #81a0db").removeAttr("disabled");
	                            let zoneHtml = "<option value='${franchiseVO.frnZoneLocation}' selected>${franchiseVO.frnZoneLocation}(현재)</option>";
	                            
	                            for (let i = 0; i < result.length; i++) {
	                                zoneHtml += "<option value='" + result[i].zoneSection + "'>" + result[i].zoneSection + "</option>";
	                            }
	                            
	                            $("#frnZoneLocation").html(zoneHtml);
	                        }	                        
	                    }
	                });
	            });
	        }
	    });

		$.ajax({
		    url: "/emp/franchise/getDetFloor",
		    type: "post",
		    beforeSend: function(xhr) {
		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		    },
		    success: function(result) {
		        console.log("getZoneLocation : ", result);
		        
		        let zoneHtml = "";

		        zoneHtml += "<select id='frnZoneLocation' name='frnZoneLocation' disabled>";
		        if (floor === "-") {
		        	zoneHtml += "<option value='' disabled selected>-</option>";
		            $(".frnZoneLocationDiv").html(zoneHtml);
		        } else {
		        	zoneHtml += "<option value='' disabled >선택</option>";
			        for (let i = 0; i < result.length; i++) {
			        	zoneHtml += "<option value='" + result[i].comDetCd + "'";
			            if (result[i].comDetCd === "${franchiseVO.frnZoneLocation}") {
			            	zoneHtml += " selected";
			            }
			            zoneHtml += ">" + result[i].comDetCd + "</option>";
			        }
		        }
		        
		        zoneHtml += "</select>";
		        $(".frnZoneLocationDiv").html(zoneHtml);
		    }
		});
		


		// 수정 버튼 클릭 시 수정모드로 변경
		$("#updateBtn").on("click", function() {

			// readonly 속성 제거, 테두리 색깔 변경
			// #frnFloorLocation, #frnZoneLocation, #frnProd, #frnEnterDate
			$("#frnPosition").css("border", "0.5px solid #81a0db")
					.removeAttr("disabled");
			$("#frnFloor").css("border", "0.5px solid #81a0db")
					.removeAttr("disabled");
			$("#frnProd").css("border", "0.5px solid #81a0db")
					.removeAttr("readonly");
			$("#frnEnterDate").css("border", "0.5px solid #81a0db")
					.removeAttr("readonly");
			$("#frnOpenTm").css("border", "0.5px solid #81a0db")
					.removeAttr("readonly");
			$("#frnCloseTm").css("border", "0.5px solid #81a0db")
					.removeAttr("readonly");
			$("#uploadFileBtn").css("border", "0.5px solid #81a0db")
					.css("display", "");
			$("#mapImgNm").css("border", "0.5px solid #81a0db");
			
			$("#updateSaveBtn").css("display", "");
			$("#updateCancelBtn").css("display", "");
			$("#updateBtn").css("display", "none");
			$("#listBtn").css("display", "none");
			
			let position = $("#frnPosition").val();
            let floor = $("#frnFloor").val();
            
            
            $.ajax({
                url: "/emp/franchise/comparePosition",
                type: "post",
                data: { position: position, floor: floor },
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function(result) {
                    console.log("comparePosition result : ", result);
                    
                    if (result.length != 0) {
                        $("#frnZoneLocation").css("border", "0.5px solid #81a0db").removeAttr("disabled");
                        let zoneHtml = "<option value='${franchiseVO.frnZoneLocation}' selected>${franchiseVO.frnZoneLocation}(현재)</option>";
                        
                        for (let i = 0; i < result.length; i++) {
                            zoneHtml += "<option value='" + result[i].zoneSection + "'>" + result[i].zoneSection + "</option>";
                        }
                        
                        $("#frnZoneLocation").html(zoneHtml);
                    }
                    
                    
                }
            });

		});
		
		$("#updateCancelBtn").on("click", function() {
			
			if(confirm("취소하시겠습니까?")) {
				location.reload();				
			} 			
		})
		
		$("#updateSaveBtn").on("click", function() {

			if(confirm("저장하시겠습니까?")) {							
				updateFileList(); // 파일 목록 업데이트
			} 			
			
		});
		
		$("#uploadFile").on("change", handleImg);

	});
</script>

<div class="container">
	<div class="titleHeader">
		<h3>
			<span style="color: #B7B7B7;">상업시설 관리 - </span> <span>상세</span>
		</h3>
	</div>

	<div class="bodyDiv">
		<input type="hidden" id="mapId" name="mapId" value="${franchiseVO.floorInfoVO.mapId}">

			<div class="imgDivHeader">
				<input type="text" id="sectionSticker" value="시설 이미지" readonly
					style="margin-left: 10px;">
			</div>
			<div class="imgDiv" style="width: 100%; height: 470px; border: 0.5px solid #e4e4e4; border-radius: 10px; padding: 10px;">
			    <c:choose>
			        <c:when test="${empty franchiseVO.frnFloorLocation}">
			            <div style="height: 100%; width: 100%; ">
			                <img class="mapImg" src="/resources/images/nonImage.png" style="width:100%; height:400px; border-radius:5px;">
			                <label id="uploadFileBtn" for="uploadFile" style="display:none;">선택</label>
                    		<input type="file" id="uploadFile" name="uploadFile" style="display:none;" accept=".jpg, .jpeg, .png"/>
                    		<input type="text" id="mapImgNm" name="mapImgNm" value="-" readonly/>
			            </div>
			        </c:when>
			        <c:otherwise>
			            <div style="height:100%; width:100%; ">
			                <img class="mapImg" src="/download?filePath=${franchiseVO.floorInfoVO.mapImgUrl}&fileOrgnlFileNm=${franchiseVO.floorInfoVO.mapImgNm}" style="width: 100%; height: 400px; border-radius: 5px;">
			                <label id="uploadFileBtn" for="uploadFile" style="display:none;">선택</label>
                    		<input type="file" id="uploadFile" name="uploadFile" multiple style="display:none;" accept=".jpg, .jpeg, .png"/>
                    		<input type="text" id="mapImgNm" name="mapImgNm" value="${franchiseVO.floorInfoVO.mapImgNm}" readonly/>
			            </div>
			        </c:otherwise>
			    </c:choose>
			</div>


			<div class="detailDivHeader">
				<input type="text" id="sectionSticker" value="시설 정보" readonly
					style="margin-left: 10px;">
			</div>
			<div class="detailDiv">
				<div class="detailChildDiv" id="bpNmDiv">
					<label class="typeName">업체명</label> <input type="text" id="bpNm"
						name="bpNm" value="${franchiseVO.bpVO.bpNm }" readonly>
				</div>

				<div class="detailChildDiv" id="typeDiv">
					<label class="typeName">업체 구분</label> <input type="text"
						id="comDetCdCn" name="comDetCdCn"
						value="${franchiseVO.commonCodeDetailVO.comDetCdCn}" readonly>
				</div>

				<div class="detailChildDiv" id="frnPositionDiv">
					<label class="typeName">구역</label>
						
					<select id='frnPosition' name='frnPosition' disabled>
						<option value='' disabled
							<c:if test="${franchiseVO.frnFloorLocation} == null">
							selected
							</c:if>
						>선택</option>
						<option value='AA'
							<c:if test="${franchiseVO.frnPosition == '국내선'}">
							selected
							</c:if>
						>국내선</option>
						<option value='AB'
							<c:if test="${franchiseVO.frnPosition == '국제선'}">
							selected
							</c:if>
						>국제선</option>
					</select>
				</div>

				<div class="detailChildDiv" id="floorLocationDiv" style="display:flex;">
					<label class="typeName">위치</label>
					<div class="frnFloorDiv" style="margin-left:5px;">
					
					</div>
					
					<label class="spacer" style="margin:5px;">-</label>
				
					<div class="frnZoneLocationDiv">
					
					</div>
				</div>

				<div class="detailChildDiv" id="rprsvNmDiv">
					<label class="typeName">대표자</label>
					<input type="text" id="bpRprsvNm" name="bpRprsvNm" value="${franchiseVO.bpVO.bpRprsvNm}" readonly>
				</div>

				<div class="detailChildDiv" id="openTmDiv">
				    <label class="typeName">운영시간</label>
				    <input type="time" id="frnOpenTm" name="frnOpenTm" value="${franchiseVO.frnOpenTm != null ? franchiseVO.frnOpenTm : ''}" readonly>
				    <label class="spacer">~</label>
				    <input type="time" id="frnCloseTm" name="frnCloseTm" value="${franchiseVO.frnCloseTm != null ? franchiseVO.frnCloseTm : ''}" readonly>
				</div>


				<div class="detailChildDiv" id="bpTelnoDiv">
					<label class="typeName">연락처</label>
					<input type="text" id="bpTelno" name="bpTelno" value="${franchiseVO.bpVO.bpTelno}" readonly>
				</div>

				<div class="detailChildDiv" id="prodDiv">
					<label class="typeName">주요상품</label>
					<input type="text" id="frnProd" name="frnProd" value="${franchiseVO.frnProd != null ? franchiseVO.frnProd : '-'}" readonly>
				</div>

				<div class="detailChildDiv" id="crtrYmdDiv">
				    <label class="typeName">계약일자</label>
				    <input type="date" id="ctrtYmd" name="ctrtYmd" value="${franchiseVO.bpVO.ctrtYmd != null ? franchiseVO.bpVO.ctrtYmd : ''}" readonly>
				</div>
				
				<div class="detailChildDiv" id="enterDateDiv">
				    <label class="typeName">입점일자</label>
				    <input type="date" id="frnEnterDate" name="frnEnterDate" value="${franchiseVO.frnEnterDate != null ? franchiseVO.frnEnterDate : ''}" readonly>
				</div>

			</div>

		<!-- 하단 버튼 -->
		<div class="detail-footer">
			<button type="button" id="updateBtn">수정</button>
			<button type="button" id="updateSaveBtn" style="display:none;">저장</button>
			<button type="button" id="updateCancelBtn" style="display:none;">취소</button>
			<a href="/emp/franchise/list" id="listBtn">목록</a>
		</div>
	</div>
</div>