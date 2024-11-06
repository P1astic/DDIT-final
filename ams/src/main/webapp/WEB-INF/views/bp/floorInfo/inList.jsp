<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<script>
let memId = "${memVO.memId}";
let floor = "AA2";
let inOut = "I";
let pin = [];
let pingId = "";
let pinSecId = "";
console.log("memId : " + memId);

// $(function() {
$(document).ready(function() {
	
		let hasLogged2f = false; // pingId가 출력되었는지 여부를 추적
		let hasLogged3f = false; // pingId가 출력되었는지 여부를 추적
		let hasLogged4f = false; // pingId가 출력되었는지 여부를 추적
		
		// 카운터 정보 불러오기
		$.ajax({
			url : "/bp/floorInfo/getCounter",
			type : "post",
			data : {memId : memId,
					mapFloor : floor,
					mapInout : inOut},
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				let mainArea = "";
				let secArea = "";
				console.log("first 2floorFrame result : " , result);
				
				if(result == null || result.length === 0) {
					$(".2fDetailDiv").css("text-align", "center");
					let html = "<span>해당 항공사 시설이 존재하지 않습니다.</span>";
					
					$(".2fDetailDiv").html("");
					$(".2fDetailDiv").html(html);
// 					$(".detail2Fsec2").css("display", "none");
				} else {
				
					// airCounter를 배열로 변환
			        let airCounters = result[0].airLineVO.airCounter.split(',').map(item => item.trim());
					console.log("airCounters : " + airCounters);
			        
			        if (airCounters.length >= 2) {
			            mainArea = airCounters[0];
			            secArea = airCounters[1];
			            console.log("mainArea : " + mainArea);
			            console.log("secArea : " + secArea);
			        }
					
					for(let i=0; i<result.length; i++) {
						console.log("i : " + i);
						if (i == 0) {
							let html = "";
							html += "<div class='imgDiv'>";
							html += "<label for='mainCounter2FImg" + i + "' style='margin-right: 10px;'>시설</label>";
							html += "<img id='mainCounter2FImg" + i + "' src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
							html += "</div>";
							html += "<div class='areaDiv'>";
							html += "<label for='mainCounter2F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='mainCounter2F' value='" + mainArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>";
							
							$(".detail2Fsec1").html(html);
							
						} else if(i == 1) {
							let html = "";
							html += "<div class='imgDiv'>";
							html += "<label for='secCounter2FImg" + i + "' style='margin-right: 10px;'>시설</label>";
							html += "<img id='secCounter2FImg" + i + "' src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
							html += "</div>";
							html += "<div class='areaDiv'>";
							html += "<label for='secCounter2F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='secCounter2F' value='" + secArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>";
							
							$(".detail2Fsec2").html(html);
						}
					}
				}
			}
		});
		
		// 2floorFrame 로딩 후 해당하는 아이콘 효과 부여
	        $("#2floorFrame").contents().find(".pin").each(function() {
	            pin.push($(this).attr("id").slice(5));	    
	        });
	        
	        for (let i = 0; i < pin.length; i++) {
	            if (pin[i] == memId) {
	                pingId = "#ping_" + pin[i];
	                pinId = "#pin_" + pin[i];
	                pingSecId = "#ping_" + pin[i] + "_2";
	                pinSecId = "#pin_" + pin[i] + "_2";

	                if (!hasLogged2f) { // 아직 로그가 출력되지 않았다면
		                
		                // 협력업체에 해당하는 아이콘 효과
	                    $("#2floorFrame").contents().find(pingId).css("display", "")
											                     .css("top", "53.5352%")
											                     .css("transform", "scale(1.5)")
											                     .addClass("active")
	                    
	                    $("#2floorFrame").contents().find(pinId).css("transform", "scale(1.5)")
	                    										.addClass("active");	                    
	                    
	                    $("#2floorFrame").contents().find(pingSecId).css("display", "")
												                    .css("top", "68%")
												                    .css("transform", "scale(1.5)")
												                    .addClass("active");
	                    
	                    $("#2floorFrame").contents().find(pinSecId).css("transform", "scale(1.5)")
	                    										   .addClass("active");
                                        
	                    hasLogged2f = true; // 로그를 출력했음을 기록 -> 두 번 출력 방지
	                }
	            }
	        };




	// 버튼 클릭 시 스타일 변화
    $("#AA2").on("click", function() {
        let hasLogged2f = false;
        
        $("#2floorFrame").attr("src", "http://localhost/resources/images/floorInfo/2floor.html").one("load", function() {
    	    console.log("2floorFrame 로드 완료");
	        $("#2floorFrame").contents().find(".pin").each(function() {
	            pin.push($(this).attr("id").slice(5));	    
	        });
	        
	        for (let i = 0; i < pin.length; i++) {
	            if (pin[i] == memId) {
	                pingId = "#ping_" + pin[i];
	                pinId = "#pin_" + pin[i];
	                pingSecId = "#ping_" + pin[i] + "_2";
	                pinSecId = "#pin_" + pin[i] + "_2";

	                if (!hasLogged2f) { // 아직 로그가 출력되지 않았다면
		                
		                // 협력업체에 해당하는 아이콘 효과
	                    $("#2floorFrame").contents().find(pingId).css("display", "")
											                     .css("top", "53.5352%")
											                     .css("transform", "scale(1.5)")
											                     .addClass("active")
	                    
	                    $("#2floorFrame").contents().find(pinId).css("transform", "scale(1.5)")
	                    										.addClass("active");	                    
	                    
	                    $("#2floorFrame").contents().find(pingSecId).css("display", "")
												                    .css("top", "68%")
												                    .css("transform", "scale(1.5)")
												                    .addClass("active");
	                    
	                    $("#2floorFrame").contents().find(pinSecId).css("transform", "scale(1.5)")
	                    										   .addClass("active");
                                        
	                    hasLogged2f = true; // 로그를 출력했음을 기록 -> 두 번 출력 방지
	                }
	            }
	        }
    	});
        
     // 카운터 정보 불러오기
     floor = "AA2";
		$.ajax({
			url : "/bp/floorInfo/getCounter",
			type : "post",
			data : {memId : memId,
					mapFloor : floor,
					mapInout : inOut},
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				let mainArea = "";
				let secArea = "";
				console.log("first 2floorFrame result : " , result);
				
				if(result == null || result.length === 0) {
					$(".2fDetailDiv").css("text-align", "center");
					let html = "<span>해당 항공사 시설이 존재하지 않습니다.</span>";
					
					$(".2fDetailDiv").html("");
					$(".2fDetailDiv").html(html);
				} else {
				
					// airCounter를 배열로 변환
			        let airCounters = result[0].airLineVO.airCounter.split(',').map(item => item.trim());
					console.log("airCounters : " + airCounters);
			        
			        if (airCounters.length >= 2) {
			            mainArea = airCounters[0];
			            secArea = airCounters[1];
			            console.log("mainArea : " + mainArea);
			            console.log("secArea : " + secArea);
			        }
					
					for(let i=0; i<result.length; i++) {
						console.log("i : " + i);
						if (i == 0) {
							let html = "";
							html += "<div class='imgDiv'>";
							html += "<label for='mainCounter2FImg" + i + "' style='margin-right: 10px;'>시설</label>";
							html += "<img id='mainCounter2FImg" + i + "' src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
							html += "</div>";
							html += "<div class='areaDiv'>"
							html += "<label for='mainCounter2F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='mainCounter2F' value='" + mainArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>";
							
							$(".detail2Fsec1").html(html);
							
						} else if(i == 1) {
							let html = "";
							html += "<div class='imgDiv'>";
							html += "<label for='secCounter2FImg" + i + "' style='margin-right: 10px;'>시설</label>";
							html += "<img id='secCounter2FImg" + i + "' src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
							html += "</div>";
							html += "<div class='areaDiv'>";
							html += "<label for='secCounter2F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='secCounter2F' value='" + secArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>";
							
							$(".detail2Fsec2").html(html);
						}
					}			
				}
			}
		});
        
        $("#2floorFrame").css("display", "");
        $("#3floorFrame").css("display", "none");
        $("#4floorFrame").css("display", "none");
        
        $(".detailContainer2F").css("display", "");
        $(".detailContainer2FSec").css("display", "");
        $(".detailContainer3F").css("display", "none");
        $(".detailContainer4F").css("display", "none");
        
        $("#AA2").css("font-weight", "600");
        $("#AA2").css("color", "white");
        $("#AA2").css("background", "#334fde");
        
        $("#AA3").css("font-weight", "normal");
        $("#AA3").css("color", "black");
        $("#AA3").css("background", "white");

        $("#AA4").css("font-weight", "normal");
        $("#AA4").css("color", "black");
        $("#AA4").css("background", "white");
        
    });

	// 버튼 클릭 시 스타일 변화
    $("#AA3").on("click", function() {
    	let hasLogged3f = false;
    	
    	$("#3floorFrame").attr("src", "http://localhost/resources/images/floorInfo/3floor.html").one("load", function() {
    	    console.log("3floorFrame 로드 완료");
	        $("#3floorFrame").contents().find(".pin").each(function() {
	            pin.push($(this).attr("id").slice(5));	    
	        });
	        
	        for (let i = 0; i < pin.length; i++) {
	            if (pin[i] == memId) {
	                pingId = "#ping_" + pin[i];
	                pinId = "#pin_" + pin[i];
	                

	                if (!hasLogged3f) { // 아직 로그가 출력되지 않았다면
		                
		                // 협력업체에 해당하는 아이콘 효과
	                    $("#3floorFrame").contents().find(pingId).css("display", "")
											                     .css("top", "38.5352%")
											                     .css("transform", "scale(1.5)")
											                     .addClass("active")
	                    
	                    $("#3floorFrame").contents().find(pinId).css("transform", "scale(1.5)")
	                    										.addClass("active");
                                        
	                    hasLogged3f = true; // 로그를 출력했음을 기록 -> 두 번 출력 방지
	                }
	            }
	        }
    	});
    	
        // 카운터 정보 불러오기
     	floor = "AA3";
		$.ajax({
			url : "/bp/floorInfo/getCounter",
			type : "post",
			data : {memId : memId,
					mapFloor : floor,
					mapInout : inOut},
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				let mainArea = "";
				let secArea = "";
				console.log("3floorFrame result : " , result);
				
				if(result == null || result.length === 0) {
					$(".3fDetailDiv").css("text-align", "center");
					let html = "<span>해당 항공사 시설이 존재하지 않습니다.</span>";
					
					$(".3fDetailDiv").html("");
					$(".3fDetailDiv").html(html);
				} else {
				
					// airCounter를 배열로 변환
			        let airCounters = result[0].airLineVO.airCounter.split(',').map(item => item.trim());
					console.log("airCounters : " + airCounters);
			        
			        if (airCounters.length >= 2) {
			            mainArea = airCounters[0];
			            secArea = airCounters[1];
			            console.log("mainArea : " + mainArea);
			            console.log("secArea : " + secArea);
			        }
					
					for(let i=0; i<result.length; i++) {
						console.log("i : " + i);
						if (i == 0) {
							let html = "";
							html += "<div class='imgDiv'>";
							html += "<label for='mainCounter3FImg" + i + "' style='margin-right: 10px;'>시설</label>";
							html += "<img id='mainCounter3FImg" + i + "' src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
							html += "</div>";
							html += "<div class='areaDiv>'";
							html += "<label for='mainCounter3F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='mainCounter3F' value='" + mainArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>";
							
							$(".detail3Fsec1").html(html);
							
						} else if(i == 1) {
							let html = "";
							html += "<div class='imgDiv'>";
							html += "<label for='secCounter3FImg" + i + "' style='margin-right: 10px;'>시설</label>";
							html += "<img id='secCounter3FImg" + i + "' src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
							html += "</div>";
							html += "<div class='areaDiv'>";
							html += "<label for='secCounter3F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='secCounter3F' value='" + secArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>";
							
							$(".detail3Fsec2").html(html);
						}
					}
				}
			}
		});
    	
        $("#2floorFrame").css("display", "none");
        $("#3floorFrame").css("display", "");
        $("#4floorFrame").css("display", "none");
        
        $(".detailContainer2F").css("display", "none");
        $(".detailContainer2FSec").css("display", "none");
        $(".detailContainer3F").css("display", "");
        $(".detailContainer4F").css("display", "none");
        
        $("#AA3").css("font-weight", "600");
        $("#AA3").css("color", "white");
        $("#AA3").css("background", "#334fde");
        
        $("#AA2").css("font-weight", "normal");
        $("#AA2").css("color", "black");
        $("#AA2").css("background", "white");
        
        $("#AA4").css("font-weight", "normal");
        $("#AA4").css("color", "black");
        $("#AA4").css("background", "white");
    });

	// 버튼 클릭 시 스타일 변화
    $("#AA4").on("click", function() {
    	let hasLogged4f = false;
    	
    	$("#4floorFrame").attr("src", "http://localhost/resources/images/floorInfo/4floor.html").one("load", function() {
   	    	console.log("4floorFrame 로드 완료");
   	        $("#4floorFrame").contents().find(".pin").each(function() {
   	            pin.push($(this).attr("id").slice(5));	    
   	        });
   	        
   	        for (let i = 0; i < pin.length; i++) {
   	            if (pin[i] == memId) {
   	                pingId = "#ping_" + pin[i];
   	                pinId = "#pin_" + pin[i];

   	                if (!hasLogged4f) { // 아직 로그가 출력되지 않았다면
   		                
   		                // 협력업체에 해당하는 아이콘 효과
   	                    $("#4floorFrame").contents().find(pingId).css("display", "")
   											                     .css("top", "28%")
   											                     .css("transform", "scale(1.5)")
   											                     .addClass("active")
   	                    
   	                    $("#4floorFrame").contents().find(pinId).css("transform", "scale(1.5)")
   	                    										.addClass("active");
                                           
   	                    hasLogged4f = true; // 로그를 출력했음을 기록 -> 두 번 출력 방지
   	                }
   	            }
   	        }
    	});
    	
    	// 카운터 정보 불러오기
     	floor = "AA4";
		$.ajax({
			url : "/bp/floorInfo/getCounter",
			type : "post",
			data : {memId : memId,
					mapFloor : floor,
					mapInout : inOut},
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				let mainArea = "";
				let secArea = "";
				console.log("4floorFrame result : " , result);
				
				if(result == null || result.length === 0) {
					$(".4fDetailDiv").css("text-align", "center");
					let html = "<span>해당 항공사 시설이 존재하지 않습니다.</span>";
					
					$(".4fDetailDiv").html("");
					$(".4fDetailDiv").html(html);
				} else {
				
					// airCounter를 배열로 변환
			        let airCounters = result[0].airLineVO.airCounter.split(',').map(item => item.trim());
					console.log("airCounters : " + airCounters);
			        
			        if (airCounters.length >= 2) {
			            mainArea = airCounters[0];
			            secArea = airCounters[1];
			            console.log("mainArea : " + mainArea);
			            console.log("secArea : " + secArea);
			        }
					
					for(let i=0; i<result.length; i++) {
						console.log("i : " + i);
						if (i == 0) {
							let html = "";
							html += "<div class='imgDiv'>";
							html += "<label for='mainCounter4FImg" + i + "' style='margin-right: 10px;'>시설</label>";
							html += "<img id='mainCounter4FImg" + i + "' src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
							html += "</div>";
							html += "<div class='areaDiv'>";
							html += "<label for='mainCounter4F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='mainCounter4F' value='" + mainArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>";
							
							$(".detail4Fsec1").html(html);
							
						} else if(i == 1) {
							let html = "";
							html += "<div class='imgDiv'>";
							html += "<label for='secCounter4FImg" + i + "' style='margin-right: 10px;'>시설</label>";
							html += "<img id='secCounter4FImg" + i + "' src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
							html += "</div>";
							html += "<div class='areaDiv'>";
							html += "<label for='secCounter4F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='secCounter4F' value='" + secArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>";
							
							$(".detail4Fsec2").html(html);
						}
					}
				}
			}
		});
    	
        $("#2floorFrame").css("display", "none");
        $("#3floorFrame").css("display", "none");
        $("#4floorFrame").css("display", "");
        
        $(".detailContainer2F").css("display", "none");
        $(".detailContainer2FSec").css("display", "none");
        $(".detailContainer3F").css("display", "none");
        $(".detailContainer4F").css("display", "");
        
        $("#AA4").css("font-weight", "600");
        $("#AA4").css("color", "white");
        $("#AA4").css("background", "#334fde");
        
        $("#AA2").css("font-weight", "normal");
        $("#AA2").css("color", "black");
        $("#AA2").css("background", "white");
        
        $("#AA3").css("font-weight", "normal");
        $("#AA3").css("color", "black");
        $("#AA3").css("background", "white");
    });
});
</script>

<style>
.container {
    margin-top : 20px;
}

.titleHeader {
    margin : 20px;
}

.mapDiv, .2fDetailDiv, .3fDetailDiv, .4fDetailDiv, .sec1, .sec2 {
    border : 0.5px solid #e4e4e4;
    border-radius : 5px;
    padding : 20px;
    margin-bottom : 20px;
}

.btns {
    border : 0.5px solid #e4e4e4;
    background : white;
    margin-right : -5px;
    width: 100px;
    font-size : 15px;
    height : 30px;
}

#AA2 {
    border-radius : 5px 0 0 5px;
}

#AA3 {
}

#AA4 {
    border-radius : 0 5px 5px 0;
}

#mainSticker {
	width: 60px;
	border : none;
	background : #909dff;
	color : white;
	border-radius : 5px;
	text-align : center;
}

.bodyDiv {
	border:0.5px solid #e4e4e4;
	border-radius : 10px;
	padding : 20px;
}

.mapDiv {
	border:0.5px solid #e4e4e4;
	border-radius : 10px;
	padding : 10px;
}
</style>

<input type="hidden" id="getPos" />
<input type="hidden" id="getSec" />
<input type="hidden" id="getFloor" />

<div class="container">
    <div class="titleHeader">
        <h3>
            <span style="color:#B7B7B7;">항공사 시설 위치 조회 - </span>
            <span>국내선</span>
        </h3>
    </div>

	<div class="bodyDiv">
	
	    <div class="mapDiv">
	        <div class="floorBtnGroup">
	            <button class="btns" type="button" id="AA2" style="background:#334fde; color:white; font-weight:600;">2F</button>
	            <button class="btns" type="button" id="AA3">3F</button>
	            <button class="btns" type="button" id="AA4">4F</button>
	        </div>
	        
	        <div class="iframeDiv">
	            <iframe id="2floorFrame" src="http://localhost/resources/images/floorInfo/2floor.html" style="border:none; margin-left:10px; padding:20px; width:930px; height:500px;"></iframe>
	            <iframe id="3floorFrame" style="border:none; padding-top:50px; margin-left:10px; display:none; width:930px; height:500px;"></iframe>
	            <iframe id="4floorFrame" style="border:none; padding-top:50px; margin-left:10px; display:none; width:930px; height:500px;"></iframe>
	        </div>
	    </div>
	    
	    <div class="detailContainer2F">
    		<div class="title2Fsec1" style="margin-top:20px;">    		
    			<input type="text" id="mainSticker" value="메인" readonly style="margin-left:10px;" />    			
	   			<label for="mainSticker" style="margin-left:10px;">카운터</label>    			
    		</div>
		    <div class="2fDetailDiv" style="border:0.5px solid #e4e4e4; border-radius:10px; margin-top:10px; padding:10px;">
		    	<div class="sec2F1" style="display:flex; flex-direction:column;">    		
		    		<div class="detail2Fsec1" style="display:flex; flex-direction:column;">
		    		</div>    		
		    	</div>
		    	
		    </div>
	    </div>
	    

	    <div class="detailContainer2FSec">
    		<div class="title2FSec2" style="margin-top:20px;">    		   			
	   			<label style="margin-left:10px;">카운터</label>    			
    		</div>
		    <div class="2fDetailDivSec" style="border:0.5px solid #e4e4e4; border-radius:10px; margin-top:10px; padding:10px;">
		    	<div class="sec2F2" style="display:flex; flex-direction:column;">    		
		    		<div class="detail2Fsec2" style="display:flex; flex-direction:column;">
		    		</div>    		
		    	</div>
		    	
		    </div>
	    </div>
	    
	    <div class="detailContainer3F" style="display:none;">
    		<div class="title3Fsec1" style="margin-top:20px;">    			
	   			<label for="mainSticker" style="margin-left:10px;">카운터</label>    			
    		</div>
		    <div class="3fDetailDiv" style="border:0.5px solid #e4e4e4; border-radius:10px; margin-top:10px; padding:10px;">
		    	<div class="sec3F1" style="display:flex; flex-direction:column;">    		
		    		<div class="detail3Fsec1" style="display:flex; flex-direction:column;">
		    		</div>    		
		    	</div>		    	
		    </div>
	    </div>
	
	    <div class="detailContainer4F" style="display:none;">
	   		<div class="title4Fsec1" style="margin-top:20px;">    		
	   			<input type="text" id="mainSticker" value="메인" readonly style="margin-left:10px;" />    			
	   			<label for="mainSticker" style="margin-left:10px;">라운지</label>    		
	   		</div>
		    <div class="4fDetailDiv" style="border:0.5px solid #e4e4e4; border-radius:10px; margin-top:10px; padding:10px;">    
		    	<div class="sec4F1" style="display:flex; flex-direction:column;">		    		
		    		<div class="detail4Fsec1" style="display:flex; flex-direction:column;">
		    		</div>
		    		
		    	</div>    
		    </div>
		 </div>
	 </div>
</div>
