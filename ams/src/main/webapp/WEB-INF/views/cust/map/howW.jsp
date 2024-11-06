<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<link rel="canonical" href="https://www.airport.co.kr/gimpo/index.do" />

<link rel="shortcut icon" href="/type/common/img/common/ico_favicon.ico" />
<link rel="icon" type="image/png"
	href="/type/common/img/common/ico_favicon.png" sizes="192x192" />

<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/common.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac_n.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/airport.css">

<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/layout.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac.css">


<div id="contents">


	<div id="contTabFix">
		<ul class="tabList tab02">



			<li><a href="/cust/map/howCheck" id="in">국내선</a></li>




			<li><a href="/cust/map/howW" id="zz" title="선택됨" class="on">국제선</a></li>


		</ul>
	</div>




	<article>
		<script>
			$(function() {
				$("#zz").on("click", function() {
					window.location.href = "/cust/map/howW";
				})
				$("#in").on("click", function() {
					window.location.href = "/cust/map/howCheck";
				})
				$(document).on("click", "ul#gnb li, ul#snb li", function() {
					setHref($(this), $(this));
				});
			});
		</script>
		<form id="contFileDown" name="contFileDown" method="POST">
			<input type="hidden" name="FILE_NM"> <input type="hidden"
				name="FILE_ORG_NM">
		</form>
		<div class="simulation-wrap Noto">
			<div class="slide-UpDown2" data-slide="listBtn2">
				<ul>
					<li><button type="button" class="noArr" title="상세내용 없음">
							<span class="subTxt2 C_blue">Step 01</span>
							<p class="subTit3">공항도착</p>
						</button></li>
					<li><button type="button" title="상세내용 열기">
							<span class="subTxt2 C_blue">Step 02</span>
							<p class="subTit3">항공사 탑승수속 및 수하물 위탁</p>
						</button>
						<div class="list-dtl">
							<div class="txtGroup">
								<div class="TxtG-inner-1">
									<p class="subTit4">항공사 체크인 카운터에서 탑승수속하기</p>
									<p class="subTxt1 sDot">
										공항 여객청사에 도착하신 승객은 먼저 해당 항공사에서 운영하는 체크인카운터에서 탑승수속을 밟습니다.<br>체크인카운터에서는
										항공기 기내로 휴대가 가능한 물품을 제외하고는 모두 위탁수하물로 처리하여야 하며, 항공기 내에는 가로55cm,
										세로40cm, 높이20cm (총합 115cm 이내), 무게 10kg 이내의 물품에 대해서만 반입이 허용됩니다.
									</p>
									<p class="subTxt1 sDot">항공안전 및 보안에 위협이 될 수 있는 물품은 위탁수하물에
										넣으면 안됩니다. 아래 운송 제한 품목을 참고해주시기 바랍니다.</p>
								</div>
								<div class="TxtG-inner-1">
									<p class="subTxt2">복잡한 탑승수속을 간편하게 이용해 보세요!</p>
									<div class="link-group">
										<a
											href="/gimpo/cms/frCon/index.do?MENU_ID=1130&amp;CONTENTS_NO=6"
											target="_blank" title="새창이동" class="sbtn-mid LinkArrow"><span>홈탑승권서비스</span></a><a
											href="/gimpo/cms/frCon/index.do?MENU_ID=1130&amp;CONTENTS_NO=5"
											target="_blank" title="새창이동" class="sbtn-mid LinkArrow"><span>모바일탑승권서비스</span></a><a
											href="/gimpo/cms/frCon/index.do?MENU_ID=1130&amp;CONTENTS_NO=4"
											target="_blank" title="새창이동" class="sbtn-mid LinkArrow"><span>키오스크탑승서비스</span></a>
									</div>
									<p class="exclam black small">위탁수하물을 X-ray 장비로 검색한 결과 의심스러운
										물품이 발견될 경우, 승객 입회 하에 개봉검색을 실시할 수 있습니다.</p>
								</div>
								<div class="TxtG-inner-1">
									<p class="subTxt2">항공안전 및 보안을 위한 기내반입금지물품 안내</p>
									<div class="link-group">
										<a href="https://www.avsec365.or.kr" target="_blank"
											title="새창이동" class="sbtn-mid LinkArrow"><span>기내반입금지물품
												안내</span></a>
									</div>
								</div>
							</div>
							<div class="txtGroup">
								<div class="TxtG-inner-1">
									<p class="subTit4">짐을 꾸릴 때는 이런 점을 유의하세요!</p>
									<p class="subTxt1 sDot">안전한 여행을 위해 개인 짐은 되도록 간편하게 꾸립니다. 특히,
										항공기 객실에서는 선반에 들어갈 수 있는 작은 가방 1개 정도만 휴대하십시오. 만약을 대비해 가방의 안쪽과
										바깥쪽에 고객님의 이름과 주소지 그리고 목적지가 잘 보일 수 있도록 영문으로 작성한 이름표를 붙여두십시오.</p>
									<p class="subTxt1 sDot">노트북 컴퓨터, 캠코더, 카메라, 보석류, 골동품, 귀금속류 등
										고가의 물품은 짐에 넣지 마시고 직접 휴대하시기 바랍니다. 이러한 물품 또는 현금, 유가증권, 계약서류, 논문,
										의약품 등의 분실이나 그로 인한 손해에 대해 공항당국 및 항공사에서는 책임을 지지 않습니다.</p>
									<p class="subTxt1 sDot">수하물은 항공사마다 그 크기나 무게에 관한 기준이 다르기 때문에
										반드시 항공사에서 안내하는 지정된 크기와 무게를 초과하지 않도록 해주시고, 내용품이 손상되지 않도록 적절히
										포장하시기 바랍니다. 자전거, 서핑보드와 같은 스포츠 용품 등 특수물품이나 애완동물은 사전에 반드시 항공사에
										알려주시고 출발 당일 여유 있게 처리하십시오.</p>
									<p class="subTxt1 sDot">일반적으로 미주 지역은 개수가 기준이 되며 동남아, 유럽 등
										미주 이외의 지역은 무게를 기준으로 합니다. 고객님의 여행 구간과 탑승 클래스를 확인하시기 바랍니다.</p>
								</div>
							</div>
							<div class="txtGroup">
								<div class="TxtG-inner-1">
									<p class="subTit4">객실로 가져갈 수 없는 운송 제한 품목</p>
									<p class="subTxt1">다용도 칼(일명 맥가이버칼), 커터칼, 가위, 과도, 골프채 등은
										객실반입이 금지되어 있어 체크인할 때 위탁수하물로 처리해주시기 바랍니다.</p>
								</div>
							</div>
							<div class="txtGroup">
								<div class="TxtG-inner-1">
									<p class="subTit4">위탁수하물로 가져갈 수 없는 운송 제한 품목</p>
									<p class="subTxt1">라이터, 전자담배, 보조배터리 등은 폭발위험성 때문에 꼭 휴대물품으로
										소지하여 객실로 반입하셔야 합니다. 라이터는 1인 1개까지 반입가능합니다. 단, 용량이 160wh가 넘는
										보조배터리는 객실로도 반입이 불가하오니, 자세한 내용은 해당 항공사에 문의하시기 바랍니다.</p>
									<p class="subTxt1 sDot weightM">
										리튬 배터리의 운송<span class="subTxt4 weightN">카메라, 랩톱 컴퓨터, 휴대
											전화기 등의 여분의 리튬 또는 리튬이온 배터리는 단락방지를 위해 전극부분을 <br>절연처리해야 하며,
											100wh 이하의 경우 1인당 5개까지 객실 반입이 가능합니다. 추가적인 여분의 배터리에 대해서는 <br>항공사마다
											기준이 다르므로 항공사에 미리 문의하시기 바랍니다. 100wh~160wh의 경우 항공사 승인 후 2개까지 <br>객실
											반입가능하며, 160wh 이상은 객실 반입이 불가합니다.
										</span>
									</p>
									<p class="subTxt1 sDot weightM">
										보조배터리 전력량(Wh) 계산 방법 : 전압(V) x 전류량(Ah)<span
											class="subTxt4 weightN">예시) 10000mAh, 3.6V 보조배터리의 경우 :
											3.6 x 10 = 36Wh<br> <i class="C_blue">*</i> 1000mAh=1Ah
										</span>
									</p>
								</div>
							</div>
						</div></li>
					<li><button type="button" class="noArr" title="상세내용 없음">
							<span class="subTxt2 C_blue">Step 03</span>
							<p class="subTit3">검역</p>
						</button></li>
					<li><button type="button" title="상세내용 열기">
							<span class="subTxt2 C_blue">Step 04</span>
							<p class="subTit3">세관신고</p>
						</button>
						<div class="list-dtl">
							<div class="txtGroup">
								<div class="TxtG-inner-1">
									<p class="subTxt1">국제선을 이용하는 승객은 위탁수하물 중에 세관신고가 필요한 물품의
										경우에는 세관에 신고하여야 합니다.</p>
									<p class="subTit4 mbt">출국통관</p>
									<p class="subTxt1 sBullet" data-cont="1.">해외거주자가 출국시 반출할 것을
										조건으로 입국시 면세통관(휴대반입) 받은 물품(미반출시, 당해 물품에 대한 세금을 내야 함)</p>
									<p class="subTxt1 sBullet" data-cont="2.">
										국내 거주자가 비디오 카메라, 골프채, 고급시계, 모피의류, 악기, 보석류 등 고가물품을 해외여행 중 사용하고
										입국 시 재반입고자 하는 물품<br>(출국시 세관장의 반출확인이 없이 국내에 반입되는 경우에는 세금을
										내야 함)
									</p>
									<p class="subTxt1 sBullet" data-cont="3.">휴대하여 수출하는 물품으로서
										기적확인을 세관에서 받아야 하는 물품 기적확인을 받지 않으면 수출로 인정되지 않으므로 관세환급을 받을 수 없는
										경우가 발생함.</p>
									<p class="subTxt1 sBullet" data-cont="4.">US$ 10,000 상당액을
										초과하는 외화 및 원화수표, 여행자 T/C등 모든 지급수단을 포함하여 한국은행 총재의 사전허가를 받아야 함.</p>
								</div>
							</div>
							<div class="txtGroup">
								<div class="TxtG-inner-1">
									<p class="subTit4">해외로 반출이 금지되는 물품</p>
									<p class="subTxt1 sDot">마약, 항정신성의약품 및 이들의 제품</p>
									<p class="subTxt1 sDot">문화재 보호법에 의거 해외 반출이 금지된 골동품 등 문화재</p>
									<p class="subTxt1 sDot">화폐, 지폐, 채권 등의 위조품, 변조품, 모조품 등</p>
								</div>
							</div>
						</div></li>
					<li><button type="button" title="상세내용 열기">
							<span class="subTxt2 C_blue">Step 05</span>
							<p class="subTit3">보안검색</p>
						</button>
						<div class="list-dtl">
							<div class="txtGroup">
								<div class="TxtG-inner-1">
									<p class="subTit4">보안검색</p>
									<p class="subTxt1 sDot Name" data-cont="STEP 1">검색이 원활히 진행될
										수 있도록 대기하시는 동안 가방과 자켓 등을 미리 벗어주세요.</p>
									<p class="subTxt1 sDot Name" data-cont="STEP 2">휴대물품(가방,
										핸드백, 자켓 등)을 포함한 모든 소지품(휴대폰, 지갑, 동전, 열쇠 등)을 바구니에 담아주세요.</p>
									<p class="subTxt1 sDot Name" data-cont="STEP 3">
										검색원의 안내에 따라 문형금속탐지기를 통과하여 검색을 받습니다.<br>알람이 발생하거나 검색원의 판단에
										따라 추가로 검색을 받으실 수도 있으니, 검색원의 안내에 협조하여 주시기 바랍니다.
									</p>
									<p class="subTxt1 sDot Name" data-cont="STEP 4">
										X-ray 검색이 완료되면 본인의 소지품을 모두 챙겨 탑승구로 이동합니다.<br>기내 반입금지 물품
										확인을 위해 추가로 검색을 받으실 수 있으니, 검색원의 안내에 협조하여 주시기 바랍니다.
									</p>
									<div class="link-group mbt">
										<a href="https://www.avsec365.or.kr" target="_blank"
											title="새창이동" class="sbtn-mid LinkArrow"><span>항공기
												내 반입금지 위해물품 확인하기</span></a>
									</div>
								</div>
							</div>
						</div></li>
					<li><button type="button" title="상세내용 열기">
							<span class="subTxt2 C_blue">Step 06</span>
							<p class="subTit3">출국심사</p>
						</button>
						<div class="list-dtl">
							<div class="txtGroup">
								<div class="TxtG-inner-1">
									<p class="subTxt1 sDot">모든 출국자는 출국심사를 위해 여권, 항공권을 준비해야 합니다.</p>
									<p class="subTxt1 sDot">출발장 입구에서 경비요원에게 여권 및 항공권을 제시하여 신원을
										확인받습니다.</p>
									<div class="limit_area">
										<div class="lineTop_tbArea" style="min-width: 700px">
											<table class="lineTop_tbL2">
												<caption>
													<p>출국심사 구비서류</p>
												</caption>
												<colgroup>
													<col width="20%">
													<col width="80%">
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">여권발급</th>
														<td>
															<p class="tabTxt1">대한민국 국민이 외국 여행을 하려면 외교부 장관이 발행하는
																여권을 발급 받아야 합니다.</p>
														</td>
													</tr>
													<tr>
														<th scope="row">구비서류</th>
														<td>
															<p class="tabTxt1">여권용 사진 2매, 주민등록증(타지역 거주자는 주민등록등본
																1부), 여권 발급신청서, 해당 병무청장의 해외여행 허가서 (병역 미필자에 한함)</p>
														</td>
													</tr>
													<tr>
														<th scope="row">외국 입국사증 (VISA)</th>
														<td>
															<p class="tabTxt1">
																여권을 발급받은 다음에는 해당 여행국의 공관에서 입국사증을 발급받아야 합니다.<br>그러나,
																대한민국과 사증면제협정이 체결된 나라로 여행할 때에는 사증 없이 출국할 수 있습니다.
															</p>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<p class="exclam black small weightL">신원확인을 마친 승객은 순서대로
									보안검색대로 진입하시기 바랍니다.</p>
							</div>
						</div></li>
					<li><button type="button" class="noArr" title="상세내용 없음">
							<span class="subTxt2 C_blue">Step 07</span>
							<p class="subTit3">격리대합실 대기(면세품 구입 등)</p>
						</button></li>
					<li><button type="button" class="noArr" title="상세내용 없음">
							<span class="subTxt2 C_blue">Step 08</span>
							<p class="subTit3">항공기 탑승</p>
						</button></li>
				</ul>
			</div>
			<script>
				$("[data-slide=listBtn2] button").on(
						"click",
						function(e) {
							if (!$(this).hasClass("noArr")) {
								$(this).not(".noArr").toggleClass("on").parent(
										"li").find(".list-dtl")
										.slideToggle(300);
								$("[data-slide=listBtn2] button").not(this)
										.removeClass("on").parent("li").find(
												".list-dtl").slideUp(300);
								if ($(this).hasClass("on")) {
									$(this).attr("title", "상세내용 열기");
								} else {
									$(this).attr("title", "상세내용 닫기");
								}
							}
						});
			</script>
		</div>




	</article>
</div>