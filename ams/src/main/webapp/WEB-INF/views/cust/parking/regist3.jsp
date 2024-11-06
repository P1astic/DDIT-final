<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<form id="reservationVO" name="reservationVO"
	action="/reservation/resComplete.do" method="post">
	<div id="content">
		<div class="inner">
			<!--location-->




			<div class="location">
				<h4 class="subTitle">주차예약</h4>
				<!--breadcrumb-->
				<ul class="breadcrumb web">
					<li><a href="/" class="home">Home</a></li>
					<li><a href="/reservation/recheck.do">주차예약</a></li>
					<li><a href="#">주차예약(예약확인)</a></li>
				</ul>
				<!--//breadcrumb-->
			</div>

			<script>
				function fCallUrl(menuNo, upperMenuId, url) {
					var form = document.mainManageLeftForm;
					form.subMenu1.value = menuNo;
					form.subMenu2.value = upperMenuId;
					form.upperMenuParamId.value = upperMenuId;
					form.action = '<c:out value=""/>' + url;
					form.submit();
				}
			</script>
			<!--//location-->
			<div id="subCont">
				<ul class="tabMenu">
					<li><span>주차조회</span></li>
					<li><span>예약신청</span></li>
					<li class="active"><span>예약확인</span></li>
				</ul>
				<div class="complete">
					<p>주차 예약이 완료되었습니다.</p>
				</div>
				<div class="section">
					<p class="titPage">예약 내역</p>
					<!--web table-->
					<div class="table type04 web">
						<table>
							<caption>예약 신청내역 테이블이며 예약일시, 주차 등의 정보를 나타냅니다.</caption>
							<colgroup>
								<col style="width: auto;">
								<col style="width: 20%;">
								<col style="width: 20%;">
								<col style="width: 20%;">
								<col style="width: 21%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="col" rowspan="2" class="sky">예약일시</th>
									<th scope="col" colspan="2">차량입차</th>
									<th scope="col" colspan="2">차량출차</th>
								</tr>
								<tr>
									<td colspan="2">2024-10-23 06:20:00</td>
									<td colspan="2">2024-10-28 06:20:00</td>
								</tr>
								<tr>
									<th scope="col" rowspan="2" class="sky">주차</th>
									<th scope="col">주차장</th>
									<th scope="col">차량번호</th>
									<th scope="col">차량종류</th>
									<th scope="col">예약상태</th>
								</tr>
								<tr>
									<td>김포공항 국내선 제2주차장 주차타워 2, 3층</td>
									<td><span class="colorType blue">서울12사1234</span></td>
									<td>일반</td>
									<td>결제완료</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table type04 web">
						<table>
							<caption>예약 신청내역 테이블이며 신청정보, 결제정보 등의 정보를 나타냅니다.</caption>
							<colgroup>
								<col style="width: auto">
								<col style="width: 27%">
								<col style="width: 27%">
								<col style="width: 27%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="col" rowspan="2" class="sky">예약정보</th>
									<th scope="col">예약번호</th>
									<th scope="col">전화번호</th>
									<th scope="col">이메일 주소</th>
								</tr>
								<tr>
									<td>1234FJ0005</td>
									<td>01090590210</td>
									<td>swvi1248@gmail.com</td>
								</tr>
								<tr>
									<th scope="col" rowspan="2" class="sky">결제정보</th>
									<th scope="col">총 주차요금</th>
									<th scope="col""="">예약 보증금(선결제)</th>
									<th scope="col"></th>
									<!-- <th scope="col">예상 현장결제요금</th> -->
								</tr>
								<tr>
									<td>130,000원</td>
									<td><span class="colorType blue">10,000원</span></td>
									<td></td>

								</tr>
							</tbody>
						</table>
					</div>
					<!--//web table-->
					<!--mobile table-->
					<div class="table type04 mobile">
						<table>
							<caption>예약 신청내역 테이블이며 예약일시, 주차, 신청정보, 결제정보 등의 정보를
								나타냅니다.</caption>
							<colgroup>
								<col style="width: 50%;">
								<col style="width: 50%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="col" colspan="2" class="sky">예약일시</th>
								</tr>
								<tr>
									<th scope="row">차량입차</th>
									<td>2024-10-23 06:20:00</td>
								</tr>
								<tr>
									<th scope="row">차량출차</th>
									<td>2024-10-28 06:20:00</td>
								</tr>
								<tr>
									<th scope="col" colspan="2" class="sky">주차</th>
								</tr>
								<tr>
									<th scope="row">주차장</th>
									<td>김포공항 국내선 제2주차장 주차타워 2, 3층</td>
								</tr>
								<tr>
									<th scope="row">차량번호</th>
									<td><span class="colorType green">서울12사1234</span></td>
								</tr>
								<tr>
									<th scope="row">차량종류</th>
									<td>일반</td>
								</tr>
								<tr>
									<th scope="row">예약상태</th>
									<td>결제완료</td>
								</tr>
								<tr>
									<th scope="col" colspan="2" class="sky">신청정보</th>
								</tr>
								<tr>
									<th scope="row">예약번호</th>
									<td>1234FJ0005</td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td>01090590210</td>
								</tr>
								<tr>
									<th scope="row">이메일 주소</th>
									<td>swvi1248@gmail.com</td>
								</tr>
								<tr>
									<th scope="col" colspan="2" class="sky">결제정보</th>
								</tr>
								<tr>
									<th scope="row">예상 주차요금</th>
									<td>130,000원</td>
								</tr>
								<tr>
									<th scope="row">보증금(결제요금)</th>
									<td><span class="colorType red">10,000원</span></td>
								</tr>

							</tbody>
						</table>
					</div>
					<!--//mobile table-->
					<!--notice-->
					<div class="notice">
						<ul>
							<li>[예약 기간] <br>・최소 2시간부터 최장 30일까지 예약이 가능합니다.
							</li>
							<li>[입차 시간] <br>・예약시간 기준 2시간 전 및 예약시간 기준 2시간 후 까지는 예약변경
								없이 입차가 가능합니다.
							</li>
							<li>[예약 변경/취소] <br>・예약의 변경 및 취소(수수료없음)는 입차 예정시간 1시간 전까지
								가능합니다. <br>・입차 예정시간 전 1시간 이내에 예약한 경우, 예약신청시간으로부터 20분 이내에는
								예약의 변경 및 취소(수수료없음)가 가능합니다. <br>・입차 예정시간 1시간 이후 ~ 입차 예정시간
								2시간 경과까지 취소(수수료50%)가 가능합니다.
							</li>
						</ul>
					</div>
					<!--//notice-->
					<!--btnArea-->
					<div class="btnArea txt-center mt40">
						<button type="button" class="button dkBlue" onclick="goMain();">메인으로</button>
					</div>
					<!--//btnArea-->
				</div>
			</div>
		</div>
	</div>
</form>