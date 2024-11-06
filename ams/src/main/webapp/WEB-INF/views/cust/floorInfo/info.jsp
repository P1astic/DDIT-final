<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

</style>

<script>
let mapId = "";
let type = "";
let typeNm = "";
let filePath = "";
let fileOrgnlFileNm = "";
let stTime = "";
let edTime = "";
let prod = "";
let floor = "AA1";

let lastSelectedElement = null;  // 마지막으로 선택한 요소를 저장하는 변수

$(function() {
	
	$("#floorFrame").contents().find(".btns").on("click", function() {
		floor = $("#getFloor").val();
		console.log("floor : " + floor);
		
		$("#detailUl").html("");
		
		let listHtml = "";
		if(floor == "AA1") {
			
			$.ajax({
				url : "/cust/floorInfo/getList",
				type : "post",
				data : {frnFloorLocation : floor},
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : function(result) {
					console.log("result : " , result);
					
					for(let i=0; i<result.length; i++) {
					 	listHtml += "<li class='detailLi'>"
				        listHtml += "<img src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
				        listHtml += "<div class='detail'>";
				        listHtml += "<input type='text' id='frnSeCd' value='" + result[i].franchiseVO.commonCodeDetailVO.comDetCdCn + "' readonly />";
				 		listHtml += "<input type='text' id='mapNm' value='" + result[i].mapNm + "' readonly />";
				        
				 		listHtml += "<label for='floor'>위치</label>";
				 		listHtml += "<input type='text' id='floor' name='floor' value='1F' readonly />";
			
				 		listHtml += "<label for='time'>운영시간</label>";
				 		listHtml += "<input type='text' id='time' name='time' value='" + result[i].franchiseVO.frnOpenTm + " ~ " + result[i].franchiseVO.frnCloseTm  + "' readonly />";
				        
				 		listHtml += "<label for='prod'>주요상품</label>";
				 		listHtml += "<input type='text' id='prod' name='prod' value='" + result[i].franchiseVO.frnProd + "' readonly />";
				 		listHtml += "</div>";
				        listHtml += "</li>"				
					}
					
							
			 		$("#detailUl").html(listHtml);
				}
			});
		} else if(floor == "AA2") {
			$("#detailUl").html("");
			
			listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/1.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='대한항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/2.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='대한항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/3.jpeg' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='카페/디저트' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='던킨도너츠' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='05:00 ~ 20:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='커피, 도너츠, 음료' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/4.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='아시아나항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/5.jpeg' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='아시아나항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/6.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='에어부산' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/7.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='에어서울' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/8.jpeg' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='쇼핑' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='올리브영' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='07:00 ~ 21:30' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='헬스&뷰티 스토어' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/9.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='식당' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='웰리앤카페테리아(동)' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='06:00 ~ 20:30' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='해장국, 만둣국' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/10.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='식당' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='웰리앤카페테리아(서)' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='06:00 ~ 20:30' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='해장국, 만둣국' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/11.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='이스타항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";

	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/12.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='제주항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";

	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/13.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='제주항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";

	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/14.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='진에어' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";

	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/15.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='진에어' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";

	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/2floor/16.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='티웨이 항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='2F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
			
	        $("#detailUl").html(listHtml);
		} else if(floor == "AA3") {

// 			$.ajax({
// 				url : "/cust/floorInfo/getFloorHtml",
// 				type : "post",
// 				data : {mapId : floor},
// 				beforeSend:function(xhr){
// 					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
// 				},
// 				success : function(result) {
// 					console.log(result);
// 				}
// 			})
			$("#detailUl").html("");
			listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/1.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='쇼핑' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='트래블메이트' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='07:00 ~ 19:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='여행용품 판매점' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/2.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='쇼핑' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='CU편의점' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='05:00 ~ 21:30' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='편의점' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/3.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='대한항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/4.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='식당' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='라운지 바이 술펀' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='08:00 ~ 20:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='위스키, 하이볼, 맥주, 논알콜 음료' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/5.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='기타' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='무인안마의자라운지(바디프랜드)' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='05:00 ~ 23:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='무인안마의자서비스' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/6.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='카페/디저트' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='빌라드샬롯 카페' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='05:00 ~ 21:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='커피, 차, 주스' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/7.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='카페/디저트' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='시나본' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='05:30 ~ 21:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='시나본롤, 음료' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/8.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='아시아나항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/9.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='에어부산' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/10.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='제주항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/11.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='진에어' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/3floor/12.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='티웨이 항공' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='3F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='항공기 운항시간 내' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	        
	        $("#detailUl").html(listHtml);
        
		} else if(floor == "AA4") {
	        $("#detailUl").html("");
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/4floor/1.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='대한항공 라운지(보안검색 후)' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='4F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='05:30 ~ 21:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/4floor/2.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='식당' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='로봇김밥' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='4F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='06:00 ~ 21:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='김밥, 비빔밥, 라면' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/4floor/3.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='식당' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='롯데리아' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='4F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='06:00 ~ 21:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='햄버거, 치킨, 디저트' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/4floor/4.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='식당' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='문배동 육칼' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='4F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='06:00 ~ 21:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='곰탕, 칼국수, 냉면, 만두' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/4floor/5.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='식당' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='백미당' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='4F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='08:00 ~ 20:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='아이스크림, 커피, 음료' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/4floor/6.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='식당' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='소담반상' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='4F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='06:00 ~ 20:30' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='비빔밥, 국밥' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/4floor/7.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='식당' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='아메리칸트레일러' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='4F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='06:00 ~ 21:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='주스, 에이드, 커피' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	        
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/4floor/8.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='항공사' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='아시아나항공 라운지(보안검색 후)' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='4F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='05:10 ~ 21:00' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	        
	        listHtml += "<li class='detailLi'>"
	        listHtml += "<img src='/resources/images/floorInfo/4floor/9.JPG' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
	        listHtml += "<div class='detail'>";
	        listHtml += "<input type='text' id='frnSeCd' value='카페/디저트' readonly />";
	 		listHtml += "<input type='text' id='mapNm' value='일리카페(전망대)' readonly />";        
	 		listHtml += "<label for='floor'>위치</label>";
	 		listHtml += "<input type='text' id='floor' name='floor' value='4F' readonly />";
	 		listHtml += "<label for='time'>운영시간</label>";
	 		listHtml += "<input type='text' id='time' name='time' value='06:00 ~ 20:30' readonly />";        
	 		listHtml += "<label for='prod'>주요상품</label>";
	 		listHtml += "<input type='text' id='prod' name='prod' value='커피, 음료, 푸드' readonly />";
	 		listHtml += "</div>";
	        listHtml += "</li>";
	        $("#detailUl").html(listHtml);
		}
		
	});
	
	$.ajax({
		url : "/cust/floorInfo/getList",
		type : "post",
		data : {frnFloorLocation : floor},
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(result) {
			console.log("result : " , result);
			
			let listHtml = "";
			
			for(let i=0; i<result.length; i++) {
			 	listHtml += "<li class='detailLi'>"
		        listHtml += "<img src='/download?filePath=" + result[i].mapImgUrl + "&fileOrgnlFileNm=" + result[i].mapImgNm + "' style='border-radius:5px 5px 0 0; width:100%; height:190px;'>";
		        listHtml += "<div class='detail'>";
		        listHtml += "<input type='text' id='frnSeCd' value='" + result[i].franchiseVO.commonCodeDetailVO.comDetCdCn + "' readonly />";
		 		listHtml += "<input type='text' id='mapNm' value='" + result[i].mapNm + "' readonly />";
		        
		 		listHtml += "<label for='floor'>위치</label>";
		 		listHtml += "<input type='text' id='floor' name='floor' value='1F' readonly />";
	
		 		listHtml += "<label for='time'>운영시간</label>";
		 		listHtml += "<input type='text' id='time' name='time' value='" + result[i].franchiseVO.frnOpenTm + " ~ " + result[i].franchiseVO.frnCloseTm  + "' readonly />";
		        
		 		listHtml += "<label for='prod'>주요상품</label>";
		 		listHtml += "<input type='text' id='prod' name='prod' value='" + result[i].franchiseVO.frnProd + "' readonly />";
		 		listHtml += "</div>";
		        listHtml += "</li>"				
			}
			
					
	 		$("#detailUl").html(listHtml);
		}
	})
	
	$("#floorFrame").contents().find(".pin").on("click", function() {
		console.log($("#getPos").val());
		console.log($("#getSec").val());
		
		mapId = $("#getPos").val();
		section = $("#getSec").val();
		
		 // 이전에 선택된 요소가 있다면 원래 크기로 되돌리기 및 active 클제거
	     if (lastSelectedElement) {
	         $(lastSelectedElement).css("transform", "scale(1)");  // 원래 크기로
	         $(lastSelectedElement).removeClass("active");  // active 클래스 제거
	     }
	    
	     // 새로 선택한 요소에 transform 적용 및 active 클래스 추가
	     $(this).css("transform", "scale(3)");
	     $(this).addClass("active");  // active 클래스 추가
	     
	     // 마지막 선택한 요소 업데이트
	     lastSelectedElement = $(this);
	     name = $(this).data("hover");
	     
	     let maxHtml = "";
	     if(mapId === "map099") {
	    	 let macFilePath = "/upload/floorInfo/AA1/null.jpeg";
	    	 let macFileOrgnlFileNm = "null.jpeg";
	    	 let macTypeNm = "식당";
	    	 let macName = "맥도날드";
	    	 let macSttime = "08:00";
	    	 let macEdTime = "20:00";
	    	 let macProd = "패스트푸드";
	    	 
	    	 maxHtml += "<button type='button' class='close' data-dismiss='modal' aria-label='Close' style='position: absolute; top: 10px; right: 10px; width: 27px; height: 27px; text-indent: -9999px; opacity: 1; background-repeat: no-repeat; background-size: 100% auto; background-image: url(/resources/images/icon/closeBtn.png);'><span aria-hidden='true'>&times;</span></button>";
	    	 maxHtml += "<img src='/download?filePath=" + macFilePath + "&fileOrgnlFileNm=" + macFileOrgnlFileNm + "' style='border-radius:5px 5px 0 0; width:100%; height:200px;'>";
	    	 maxHtml += "<div class='detail'>";
	    	 maxHtml += "<input type='text' id='frnSeCd' value='" + macTypeNm + "' readonly />";
	    	 maxHtml += "<input type='text' id='mapNm' value='" + macName + "' readonly />";
		        
	    	 maxHtml += "<label for='floor'>위치</label>";
	    	 maxHtml += "<input type='text' id='floor' name='floor' value='1F' readonly />";

	    	 maxHtml += "<label for='time'>운영시간</label>";
		        maxHtml += "<input type='text' id='time' name='time' value='" + macSttime + "~" + macEdTime  + "' readonly />";
		        
		        maxHtml += "<label for='prod'>주요상품</label>";
		        maxHtml += "<input type='text' id='prod' name='prod' value='" + macProd + "' readonly />";
		        
		        maxHtml += "</div>";
		        console.log("maxHtml : " + maxHtml);
		        
			    $(".DetailModal-body").html(maxHtml);
	     }
	     
	     
	     $.ajax({
	    	url : "/cust/floorInfo/getInfo",
	    	type : "post",
	    	data : {mapId:mapId},
	    	beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success : function(result) {
				console.log("result : " , result);
				
				filePath = result.mapImgUrl;
				fileOrgnlFileNm = result.mapImgNm;				
				
			    let html = "";
			    

				$.ajax({
					url : "/cust/floorInfo/getDetail",
					type : "post",
					data : {memId : result.memId},
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success : function(result) {
						type = result.frnSeCd;
						stTime = result.frnOpenTm;
						edTime = result.frnCloseTm;
						prod = result.frnProd;
						
						console.log("getDetail result : ", result);
						console.log("getDetail type :" + result.frnSeCd);

						$.ajax({
							url : "/cust/floorInfo/getType",
							type : "post",
							data : {comDetCd : type},
							dataType : "text",		// 받아오는 데이터 타입
							beforeSend:function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
							},
							success : function(result) {
								console.log("getType result : " + result);
								typeNm = result;
								console.log("getType typeNm : " + typeNm);
							    html += "<button type='button' class='close' data-dismiss='modal' aria-label='Close' style='position: absolute; top: 10px; right: 10px; width: 27px; height: 27px; text-indent: -9999px; opacity: 1; background-repeat: no-repeat; background-size: 100% auto; background-image: url(/resources/images/icon/closeBtn.png);'><span aria-hidden='true'>&times;</span></button>";
						        html += "<img src='/download?filePath=" + filePath + "&fileOrgnlFileNm=" + fileOrgnlFileNm + "' style='border-radius:5px 5px 0 0; width:100%; height:200px;'>";
						        html += "<div class='detail'>";
						        html += "<input type='text' id='frnSeCd' value='" + typeNm + "' readonly />";
						        html += "<input type='text' id='mapNm' value='" + name + "' readonly />";
						        
						        html += "<label for='floor'>위치</label>";
						        html += "<input type='text' id='floor' name='floor' value='1F' readonly />";

						        html += "<label for='time'>운영시간</label>";
						        html += "<input type='text' id='time' name='time' value='" + stTime + "~" + edTime  + "' readonly />";
						        
						        html += "<label for='prod'>주요상품</label>";
						        html += "<input type='text' id='prod' name='prod' value='" + prod + "' readonly />";
						        
						        html += "</div>";
						        console.log("html : " + html);
						        
							    $(".DetailModal-body").html(html);
								
							}
						})
					}
				})
				
				
				
			    
			}
	     })
	     
	     if(section == "R") {
	    	 $("#DetailModal").css("left", "22%");
	     } else {
	    	 $("#DetailModal").css("left", "79%");	    	 
	     }

	     
	     $("#DetailModal").modal('show');
	    
	    
	})
	
	//모달이 닫힐 때 원래 크기로 되돌리기
	$('#DetailModal').on('hidden.bs.modal', function () {
	    if (lastSelectedElement) {
	        $(lastSelectedElement).css("transform", "scale(1)");  // 원래 크기로
	        $(lastSelectedElement).removeClass("active");  // active 클래스 제거
	        lastSelectedElement = null;  // 마지막 선택한 요소 초기화
	    }
	    
	    $("#getPos").val("");
	});
	

	
})
	
</script>

<style>
.modal-backdrop {
	display: none;
}

#DetailModal {
	position: absolute;
	top: 69%; /* 상단에서의 간격 */
	left: 79%; /* 왼쪽에서의 간격 */
	/*     left: 22%; */
	transform: translate(-50%, -50%); /* 중앙 정렬 */
	z-index: 1050; /* Bootstrap 모달의 기본 z-index보다 높은 값 */
}

#DetailModal .modal-content {
	box-shadow: none;
}

.modal {
	width: 350px;
	height: auto;
}

.modal-open .modal {
	overflow-y: hidden;
}

.container {
	width: 100%;
	height: auto;
	margin-top: 30px;
}

.iframeDiv {
	background: #b9e7f224;
	margin-left: 60px;
	margin-top: 10px;
	width: 100%;
	min-width: 1000px;
	max-width: 1000px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 680px;
	max-height: 680px;
	min-height: 680px;
	padding : 20px;
}

.modal-content {
	position: relative; /* 상대 위치로 설정하여 자식 요소에 절대 위치 적용 가능 */
}

.close {
	position: absolute; /* 절대 위치로 설정 */
	top: 10px; /* 상단에서의 간격 */
	right: 10px; /* 오른쪽에서의 간격 */
	z-index: 1050; /* 모달 콘텐츠보다 위에 위치 */
}

input {
	border: none;
	width: 75%;
	font-weight: bold;
	margin-bottom: 5px;
}

label {
	width: 25%;
	font-weight: bold;
	margin-bottom: 5px;
}

.detail {
	padding: 20px;
}

#frnSeCd {
	width: 100%;
	text-align: left;
	color: #597ce2;
	font-size: 20px;
	font-weight: bold;
}

#mapNm {
	width: 100%;
	text-align: left;
	font-size: 26px;
	font-weight: bold;
}

.detailLi {
	margin: 10px;
	width: 340px;
	height: 400px;
	border: 0.5px solid #e4e4e4;
	border-radius: 5px;
}

#detailUl {
	padding: 20px;
	display: flex;
	flex-wrap: wrap;
}


</style>
<input type="hidden" id="getPos" />
<input type="hidden" id="getSec" />
<input type="hidden" id="getFloor" />


<div class="container">
	
	<div>
		
		<div class="iframeDiv" style="">
		    <iframe id="floorFrame" src="http://localhost/resources/images/floorInfo/1floor.html" style="padding:20px; width:1000px; height:650px;"></iframe>
		</div>
	</div>
	<hr style="border:1px solid #e4e4e4;">
	
	<div style="height:auto; margin-top:50px;">
			<!-- 리스트형식 -->
				<ul id="detailUl">
					
				</ul>
			<!-- //리스트형식 -->
	</div>
</div>

<!-- 상세 모달 -->
<div class="modal fade" id="DetailModal" tabindex="-1" role="dialog" aria-labelledby="completionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="DetailModal-body">
            	
            </div>
        </div>
    </div>
</div>
<!-- 상세 모달 -->