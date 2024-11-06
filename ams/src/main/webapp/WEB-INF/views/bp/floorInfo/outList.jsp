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
let floor = "AB2";
let inOut = "O";
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
				console.log("first out2floorFrame result : " , result);
				
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
							html += "<div class='areaDiv'>";
							html += "<label for='mainCounter2F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='mainCounter2F' value='" + mainArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>";
							
							$(".detail2Fsec1").html(html);
							
						} else if(i == 1) {
							let html = "";
							html += "<div class='imgDiv'>";
							html += "<label for='mainCounter2FImg" + i + "' style='margin-right: 10px;'>시설</label>";
							html += "<img id='mainCounter2FImg" + i + "' src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
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
		
		// out2floorFrame 로딩 후 해당하는 아이콘 효과 부여
	        $("#out2floorFrame").contents().find(".pin").each(function() {
	            pin.push($(this).attr("id").slice(5));	    
	        });
	        
	        for (let i = 0; i < pin.length; i++) {
	            if (pin[i] == memId) {
	                pingId = "#ping_" + pin[i];
	                pinId = "#pin_" + pin[i];

	                if (!hasLogged2f) { // 아직 로그가 출력되지 않았다면
		                
		                // 협력업체에 해당하는 아이콘 효과
	                    $("#out2floorFrame").contents().find(pingId).css("display", "")
											                     .css("top", "69.5%")
											                     .css("transform", "scale(1.5)")
											                     .addClass("active")
	                    
	                    $("#out2floorFrame").contents().find(pinId).css("transform", "scale(1.5)")
	                    										.addClass("active");
                                        
	                    hasLogged2f = true; // 로그를 출력했음을 기록 -> 두 번 출력 방지
	                }
	            }
	        };




	// 버튼 클릭 시 스타일 변화
    $("#AB2").on("click", function() {
        let hasLogged2f = false;
        
        $("#out2floorFrame").attr("src", "http://localhost/resources/images/floorInfo/out2floor.html").one("load", function() {
    	    console.log("out2floorFrame 로드 완료");
	        $("#out2floorFrame").contents().find(".pin").each(function() {
	            pin.push($(this).attr("id").slice(5));	    
	        });
	        
	        for (let i = 0; i < pin.length; i++) {
	            if (pin[i] == memId) {
	                pingId = "#ping_" + pin[i];
	                pinId = "#pin_" + pin[i];

	                if (!hasLogged2f) { // 아직 로그가 출력되지 않았다면
		                
		                // 협력업체에 해당하는 아이콘 효과
	                    $("#out2floorFrame").contents().find(pingId).css("display", "")
											                     .css("top", "69.5%")
											                     .css("transform", "scale(1.5)")
											                     .addClass("active")
	                    
	                    $("#out2floorFrame").contents().find(pinId).css("transform", "scale(1.5)")
	                    										.addClass("active");
                                        
	                    hasLogged2f = true; // 로그를 출력했음을 기록 -> 두 번 출력 방지
	                }
	            }
	        }
    	});
        
     // 카운터 정보 불러오기
     floor = "AB2";
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
				console.log("first out2floorFrame result : " , result);
				
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
							html += "<img src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='width: 500px; height: 300px; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;' >";
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
        
        $("#out2floorFrame").css("display", "");
        $("#out4floorFrame").css("display", "none");
        
        $(".detailContainer2F").css("display", "");
        $(".detailContainer4F").css("display", "none");
        
        $("#AB2").css("font-weight", "600");
        $("#AB2").css("color", "white");
        $("#AB2").css("background", "#334fde");

        $("#AB4").css("font-weight", "normal");
        $("#AB4").css("color", "black");
        $("#AB4").css("background", "white");
        
    });

	// 버튼 클릭 시 스타일 변화
    $("#AB4").on("click", function() {
    	let hasLogged4f = false;
    	
    	$("#out4floorFrame").attr("src", "http://localhost/resources/images/floorInfo/out4floor.html").one("load", function() {
   	    	console.log("out4floorFrame 로드 완료");
   	        $("#out4floorFrame").contents().find(".pin").each(function() {
   	            pin.push($(this).attr("id").slice(5));	    
   	        });
   	        
   	        for (let i = 0; i < pin.length; i++) {
   	            if (pin[i] == memId) {
   	                pingId = "#ping_" + pin[i];
   	                pinId = "#pin_" + pin[i];

   	                if (!hasLogged4f) { // 아직 로그가 출력되지 않았다면
   		                
   		                // 협력업체에 해당하는 아이콘 효과
   	                    $("#out4floorFrame").contents().find(pingId).css("display", "")
   											                     .css("top", "16%")
   											                     .css("transform", "scale(1.5)")
   											                     .addClass("active")
   	                    
   	                    $("#out4floorFrame").contents().find(pinId).css("transform", "scale(1.5)")
   	                    										.addClass("active");
                                           
   	                    hasLogged4f = true; // 로그를 출력했음을 기록 -> 두 번 출력 방지
   	                }
   	            }
   	        }
    	});
    	
    	// 카운터 정보 불러오기
     	floor = "AB4";
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
				console.log("out4floorFrame result : " , result);
				
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
							html += "</div>"
							html += "<div class='areaDiv'>";
							html += "<label for='secCounter4F" + i + "' style='margin-right: 10px;'>구역</label>";
							html += "<input type='text' id='secCounter4F' value='" + secArea + "' style='width: 500px; height: auto; padding: 10px; margin: 10px; border: 0.5px solid #e4e4e4; border-radius: 10px;'>";
							html += "</div>"
							
							$(".detail4Fsec2").html(html);
						}
					}	
				}
			}
		});
    	
        $("#out2floorFrame").css("display", "none");
        $("#out4floorFrame").css("display", "");
        
        $(".detailContainer2F").css("display", "none");
        $(".detailContainer4F").css("display", "");
        
        $("#AB4").css("font-weight", "600");
        $("#AB4").css("color", "white");
        $("#AB4").css("background", "#334fde");
        
        $("#AB2").css("font-weight", "normal");
        $("#AB2").css("color", "black");
        $("#AB2").css("background", "white");
        
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

.mapDiv, .2fDetailDiv, .4fDetailDiv, .sec1, .sec2 {
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

#AB2 {
    border-radius : 5px 0 0 5px;
}


#AB4 {
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
            <span>국제선</span>
        </h3>
    </div>
    
    <div class="bodyDiv">

	    <div class="mapDiv">
	        <div class="floorBtnGroup">
	            <button class="btns" type="button" id="AB2" style="background:#334fde; color:white; font-weight:600;">2F</button>
	            <button class="btns" type="button" id="AB4">4F</button>
	        </div>
	        
	        <div class="iframeDiv">
	            <iframe id="out2floorFrame" src="http://localhost/resources/images/floorInfo/out2floor.html" style="border:none; margin-left:10px; padding-top:50px; width:900px; height:500px;"></iframe>
	            <iframe id="out4floorFrame" style="border:none; padding-top:50px; margin-left:10px; display:none; width:900px; height:500px;"></iframe>
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
	
		<div class="detailContainer4F" style="display:none;">
	   		<div class="title4Fsec1" style="margin-top:20px;">    		
	   			<input type="text" id="mainSticker" value="메인" readonly style="margin-left:10px;" />    			
	   			<label for="mainSticker" style="margin-left:10px;">라운지</label>    		
	   		</div>
		    <div class="4fDetailDiv" style="border:0.5px solid #e4e4e4; border-radius:10px; margin-top:10px; padding:10px;">    
		    	<div class="sec4F1">    	
		    		
		    		<div class="detail4Fsec1" style="display:flex; flex-direction:column;">
		    		</div>
		    		
		    	</div>    
		    </div>
		 </div>
	</div>
</div>
