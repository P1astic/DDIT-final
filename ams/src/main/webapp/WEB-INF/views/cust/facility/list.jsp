<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="/resources/css/emp/regist.css">
<sec:authorize access="isAuthenticated()">
	<%-- 		<sec:authentication property="principal.memberVO" /> --%>
	<sec:authentication property="principal.memberVO" var="memVO" />
</sec:authorize>
<script>

	function checkNumber(aptFacRsvtMoblphon, aptFacRsvtNo) {
        // 핸드폰 번호의 뒷자리 4자리
        let phonNumber = aptFacRsvtMoblphon.slice(-4);
        console.log("phonNumber : "+phonNumber);
        
        // 사용자에게 핸드폰 번호 뒷자리 입력 받기
        let check = prompt("핸드폰 번호 뒷자리 4자리를 입력하세요. ");
        
        // 입력한 값과 핸드폰 번호 뒷자리 비교
        if (check === phonNumber) {
        	
            location.href = "/cust/airportFacility/detail?aptFacRsvtNo=" + aptFacRsvtNo;
        } else {
            alert("번호가 맞지 않습니다.");
        }
    }
	
</script>
<style>
.input1 {
    width: 100%;
    flex: 1 1 0;
    height: 39px;
    padding-left: 12.73px;
    padding-right: 12.73px;
    padding-top: 5.30px;
    padding-bottom: 5.30px;
    background: white;
    border-radius: 3px;
    border: 1px #D9D9D9 solid;
}
#title{
font-weight: 800;
    font-size: 42px;
    padding-bottom: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #2B3A46;
    width: 100%;
    border-top: 1px solid #2B3A46;
    padding-top: 90px;
}
</style>
<div style="display: flex; flex-direction: column; gap: 20px; align-items: center;">
<div id="title">공항시설 예약안내</div>
<div style="padding: 20px; transform: scale(0.9); transform-origin: top center;">

  <div style="align-self: stretch; height: 70px;  flex-direction: column; justify-content: center; align-items: flex-start; display: flex">
    <div style="align-self: stretch; height: 30px; flex-direction: column; justify-content: center; align-items: flex-start; gap: 10px; display: flex">
      <div style="text-align: center; color: black; font-size: 27px; font-weight: 400; line-height: 30px; word-wrap: break-word">체육시설 운영 현황</div>
    </div>
  </div>
  <div style="height: 361px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: flex">
    <div style="align-self: stretch; height: 65px; background: #EEF1F6; border-top: 1px black solid; justify-content: flex-start; align-items: center; display: inline-flex">
      <div style="width: 685px; align-self: stretch; padding: 15px; justify-content: center; align-items: center; gap: 9.38px; display: flex">
        <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">구분</div>
      </div>
      <div style="flex: 1 1 0; align-self: stretch; padding: 15px; justify-content: center; align-items: center; gap: 9.38px; display: flex">
        <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">규모</div>
      </div>
      <div style="width: 366px; align-self: stretch; padding: 15px; justify-content: center; align-items: center; gap: 9.38px; display: flex">
        <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">비고</div>
      </div>
    </div>
    <div style="align-self: stretch; border-bottom: 1px black solid; justify-content: flex-start; align-items: center; display: inline-flex">
      <div style="width: 685px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: inline-flex">
        <div style="align-self: stretch; height: 148px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; display: inline-flex">
          <div style="flex: 1 1 0; align-self: stretch; padding: 15px; border-right: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: flex">
            <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">실내체육관</div>
          </div>
          <div style="flex: 1 1 0; align-self: stretch; flex-direction: column; justify-content: center; align-items: flex-start; display: inline-flex">
            <div style="align-self: stretch; flex: 1 1 0; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
              <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">배드민턴장</div>
            </div>
            <div style="align-self: stretch; flex: 1 1 0; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
              <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">족구장(1면)</div>
            </div>
            <div style="align-self: stretch; flex: 1 1 0; padding: 15px; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
              <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">농구장</div>
            </div>
          </div>
        </div>
        <div style="align-self: stretch; height: 148px; justify-content: center; align-items: center; display: inline-flex">
          <div style="flex: 1 1 0; align-self: stretch; padding: 15px; border-right: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: flex">
            <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">종합운동장</div>
          </div>
          <div style="flex: 1 1 0; align-self: stretch; flex-direction: column; justify-content: center; align-items: flex-start; display: inline-flex">
            <div style="align-self: stretch; flex: 1 1 0; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
              <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">풋살장</div>
            </div>
            <div style="align-self: stretch; flex: 1 1 0; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
              <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">야구연습장</div>
            </div>
            <div style="align-self: stretch; flex: 1 1 0; padding: 15px; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
              <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">농구장</div>
            </div>
          </div>
        </div>
      </div>
      <div style="width: 191px; border-left: 1px #D6D6D6 solid; flex-direction: column; justify-content: center; align-items: flex-start; display: inline-flex">
        <div style="align-self: stretch; height: 49.33px; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
          <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">6 * 13.5</div>
        </div>
        <div style="align-self: stretch; height: 49.33px; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
          <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">19 * 13.5</div>
        </div>
        <div style="align-self: stretch; height: 49.33px; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
          <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">32 * 17</div>
        </div>
        <div style="align-self: stretch; height: 49.33px; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
          <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">32 * 17</div>
        </div>
        <div style="align-self: stretch; height: 49.33px; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
          <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">32 * 17</div>
        </div>
        <div style="align-self: stretch; height: 49.33px; padding: 15px; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
          <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">32 * 17</div>
        </div>
      </div>
      <div style="width: 366px; height: 296px; border-left: 1px #D6D6D6 solid; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: inline-flex">
        <div style="align-self: stretch; flex: 1 1 0; padding: 15px; border-bottom: 1px #D6D6D6 solid; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
          <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">샤워실 이용 시 개인 세면도구 지참</div>
        </div>
        <div style="align-self: stretch; flex: 1 1 0; padding: 15px; justify-content: center; align-items: center; gap: 9.38px; display: inline-flex">
          <div style="color: #0E0E0E; font-size: 16px; font-family: ?????; font-weight: 400; line-height: 30px; word-wrap: break-word">배팅연습, 펑고 가능(야구 경기 불가)           권장 이용인원 : 15명 이내</div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<%-- <p>${airportFacilityRSVVOList}</p> --%>
<div class="card" style="    height: 900px;    padding: 24px; display: flex;flex-direction: column; align-items: center;">
	<div class="card-header" style="    width: 1050px;">
	
		<div  id="invenCurrent"></div>
		<div class="ml-auto d-flex align-items-center" style="justify-content: space-between;">
			<a href="/cust/airportFacility/regist"><button type="button" id="insertBtn" style="float: right; background-color: white; border : 1px solid #001B2B; border-radius : 10px; color : #001B2B;     padding: 6px 11px;" ><h4>예약신청</h4></button></a>
            <form id="searchForm" class="d-flex align-items-center" style="margin-bottom: 0;">
                <div class="input-group input-group-sm" style="margin-right: 10px;">
                    <select id="selGubun" name="gubun" class="input1">
                        <option value="all" selected>전체</option>
                        <option value="title" <c:if test="${param.gubun=='title'}">selected</c:if>>제목</option>
                        <option value="author" <c:if test="${param.gubun=='author'}">selected</c:if>>작성자명</option>
                    </select>
                </div>
                <div class="input-group input-group-sm" style=" display: flex; margin-right: 10px;">
                    <input type="text" id="keyword" name="keyword" placeholder="검색어 입력" value="${param.keyword}" class="input1"/>
	                <button type="submit" class="btn btn-default" style="width:41px; font-size:10px; background: white;">
	                <img src="/resources/images/icon/searchBtn.png" style="height: 20px; width: 20px; line-height:1.5; margin-bottom:3px;">
	                </button>
                </div>
            </form>
        </div>
<div style="flex: 8;"></div>
<!-- 	<button type="button" id="insertBtn" >자재등록</button> -->
	</div>

	<div class="card-body table-responsive p-0" style="width: 1050px;">
		<table class="table table-hover text-nowrap">
			<thead style="    color: #2B3A46;font-weight: 700;     background: #EEF1F6;">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>예약자 명</th>
					<th>예약일자</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach var="airportFacilityRSVVO" items="${airportFacilityRSVVOList}" varStatus="stat">
				<tr onclick="checkNumber('${airportFacilityRSVVO.aptFacRsvtMoblphon}', '${airportFacilityRSVVO.aptFacRsvtNo}')" >
					<td>${stat.index+1}</td>
					<td>${airportFacilityRSVVO.aptFacRsvtTtl}</td>
					<td>${airportFacilityRSVVO.aptFacRsvtNm}</td>
					<td>${airportFacilityRSVVO.aptFacRsvtYmd}</td>
				</tr>
  			</c:forEach>
			</tbody>
		</table>
		<div class="card-footer clearfix" style="    background: none;">
       		${articlePage.pagingArea}
        </div>
	</div>
</div>