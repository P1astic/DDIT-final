<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/cus.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>



<link rel="canonical" href="https://www.airport.co.kr/gimpo/index.do" />

<link rel="shortcut icon" href="/type/common/img/common/ico_favicon.ico" />
<link rel="icon" type="image/png"
	href="/type/common/img/common/ico_favicon.png" sizes="192x192" />

<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/common.css" />
<!-- reset -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/board.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/layout.css" />
<!-- 개별 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/kac_n.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/airport.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/cusMain.css" />

<!--[if lt IE 9]>
<script src="../js/html5shiv.js"></script>
<![endif]-->

<!-- <script type="text/javascript" -->
<!-- 	src="/resources/css/custUser/GIMPO/jquery-2.2.1.min.js?v=1.1"></script> -->
<!-- <script type="text/javascript" -->
<!-- 	src="/resources/css/custUser/GIMPO/jquery.easing.1.3.js?v=1.1"></script> -->
<!-- <script type="text/javascript" -->
<!-- 	src="/resources/css/custUser/GIMPO/jquery.font-accessibility.dev_bvs.js?v=1.1"></script> -->
<!-- 폰트줌(제한) -->

<link rel="stylesheet"
	href="/resources/css/custUser/GIMPO/jquery-ui.css" />
<link rel="stylesheet"
	href="/resources/css/custUser/GIMPO/jquery-ui.theme.css" />

<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/GIMPO/slick.css" />





<script type="text/javascript" src="/type/airportKor/js/layout.js"></script>
<script>
    $(document).ready(function() {
        $('#customerVoiceLink').on('click', function(event) {
            // 링크 클릭 시의 기본 동작을 방지하지 않도록 설정
            // 추가적인 조건이 필요하다면 여기에 작성
            console.log("나의 고객의 소리 링크가 클릭되었습니다."); // 클릭 이벤트 확인
        });
    });
</script>
<!-- layout -->
<div id="contents" style="padding-top:10px; padding-bottom:0px;">
    <!-- container -->
    <div id="container">
        <script>
            $(function() {
                $(".btn_print").bind("click", function() {
                    window.print();
                });
                $("#detail").on("click", function() {
                    var name = "${name}";  // EL을 사용하여 변수 값을 가져옵니다.
                    var phone = "${phone}";
//                     window.location.href = "/cust/cus/cusList?name=" + encodeURIComponent(name) + "&phone=" + encodeURIComponent(phone);
                    window.location.href = "/cust/validation/custPass?link=cusList";
                    
                });
            });
        </script>

        <div id="contTabFix">
            <ul class="tabList tab02">
                <li><a href="/cust/cus/main2.do" title="선택됨" class="on">이용안내 및 등록</a></li>
                <li><a id="detail">나의 고객의 소리</a></li> <!-- href를 '#'로 수정 -->
            </ul>
        </div>
    </div>
</div>




	<script type="text/javascript">
		var showDiv = function(type) {
			console.log("type : ", type);

			$("#apDiv").css("display", "none");
			$("#taxDiv").css("display", "none");
			$("#immDiv").css("display", "none");

			$("#apBtn1").removeClass("active");
			$("#apBtn2").removeClass("active");
			$("#taxBtn").removeClass("active");
			$("#immBtn").removeClass("active");

			switch (type) {
			case "ap1":
				$("#apBtn1").addClass("active");
				$("#apDiv").css("display", "block");
				break;
			case "ap2":
				$("#apBtn2").addClass("active");
				$("#apDiv").css("display", "block");
				break;
			case "tax":
				$("#taxBtn").addClass("active");
				$("#taxDiv").css("display", "block");
				break;
			case "imm":
				$("#immBtn").addClass("active");
				$("#immDiv").css("display", "block");
				break;
			}
		};
	</script>




	<div class="voc-wrap txt-defulat-wrap Noto"
		style="padding-bottom: 10px; padding-left:40px; padding-right:40px;">
		<p class="subTit2">
			고객의소리(VOC) 이용안내
			<!-- 고객의소리(VOC) 이용안내 -->
		</p>
		<div class="TxtG-inner-1">
			<p class="subTxt1">
				고객의 소리(VOC) 는 공항을 이용하는 고객님께서 공항 이용에 대한 문의, 불편, 건의 사항 등에 대한 답변과 서비스
				개선을 위해 운영하고 있습니다.
				<!-- 고객의 소리(VOC) 는 공항을 이용하는 고객님께서 공항 이용에 대한 문의, 불편, 건의 사항 등에 대한 답변과 서비스 개선을 위해 운영하고 있습니다. -->
			</p>
			<p class="subTxt1">
				고객께서 주신 소중한 고견은 경영활동에 소중하게 활용하도록 하겠습니다.
				<!-- 고객께서 주신 소중한 고견은 경영활동에 소중하게 활용하도록 하겠습니다. -->
			</p>
			<p class="subTxt1">
				실명 등록 원칙으로 홈페이지 로그인이 필요합니다.
				<!-- 실명 등록 원칙으로 홈페이지 로그인이 필요합니다. -->
			</p>
			<p class="subTxt1 sDot">
				답변기한 : 고객님께서 등록한 시간 ~ 72시간 이내 (주말 및 공휴일 제외)
				<!-- 답변기한 : 고객님께서 등록한 시간 ~ 72시간 이내 (주말 및 공휴일 제외) -->
			</p>
			<p class="subTxt1 sDot Name" data-cont="제외대상 :">
				타인비방, 욕설, 장난, 광고(홍보) 등의 내용은 관리자에 의해 삭제됩니다.<br>한국공항공사에서는 전국공항
				이용에 대한 전화상담도 가능합니다.<br> (DDIT고객만족센터 1661-2626)
			</p>
		</div>
		<p class="subTit2">
			고객의소리(VOC) 등록
			<!-- 고객의소리(VOC) 등록 -->
		</p>
		<div class="box-alert">
			<p class="subTxt4 C_black">
				인천국제공항, 세관, 법무부, 항공사 등과 관련된 사항은 해당 기관으로 직접 문의해 주시고,
				<!-- 인천국제공항, 세관, 법무부, 항공사 등과 관련된 사항은 해당 기관으로 직접 문의해 주시고, -->
				<br> 타 기관 및 항공사 사항의 경우에는 고객님의 정보(성명, 연락처)가 해당기관 및 항공사에 제공될 수
				있습니다.
				<!-- 타 기관 및 항공사 사항의 경우에는 고객님의 정보(성명, 연락처)가 해당기관 및 항공사에 제공될 수 있습니다. -->
			</p>
		</div>

		<p class="subTxt4" style="color: #ff0000; margin-top: 10px;">
			* 아래 공항 이용 프로세스(접점) 아이콘을 클릭하시면, 접수화면으로 이동됩니다.
			<!-- * 아래 공항 이용 프로세스(접점) 아이콘을 클릭하시면, 접수화면으로 이동됩니다. -->
			<br>
		</p>
		<div class="type-list-Link">
			<div class="linkA">
				<c:if test="${phone != null}">
					<div class="item">
						<!-- 
				1. 주차장, 신분확인..
				  - 무엇을 선택했는지 있어야 함
				  - 요청파라미터( 주차장 : /cust/cus/cusForm.do?selType=A1100 )
				  - 요청파라미터( 신분확인 : /cust/cus/cusForm.do?phon name)
				 -->

						<a
							href="/cust/cus/cusForm.do?selType=A1100&phone=${phone}&name=${name}"
							title="페이지이동"> <img
							src="/resources/images/icon/icons8-주차장-96.png" alt="">
							<p class="subTxt3">
								주차장
								<!-- 주차장 -->
							</p>
						</a>

					</div>

					<div class="item" id="apBtn1">
						<!-- ★ 하단 내용 표출, class active로 활성화  -->
						<a href="javascript:showDiv('ap1')" title="체크인카운터 관련정보"> <img
							src="/resources/images/icon/icons8-비행기-100.png" alt="">
							<p class="subTxt3">
								체크인카운터
								<!-- 체크인카운터 -->
							</p>
						</a>
					</div>
					<div class="item">
						<a href="/cust/cus/cusForm.do?selType=A1103&phone=${phone}&name=${name}" title="페이지이동"> <img
							src="/resources/images/icon/icons8-지문-100.png" alt="">
							<p class="subTxt3">
								신분확인
								<!-- 신분확인 -->
							</p>
						</a>
					</div>
					<div class="item">
						<a href="/cust/cus/cusForm.do?selType=A1106&phone=${phone}&name=${name}" title="페이지이동"> <img
							src="/resources/images/icon/icons8-보안-100.png" alt="">
							<p class="subTxt3">
								보안검색
								<!-- 보안검색 -->
							</p>
						</a>
					</div>
					<div class="item" id="immBtn">
						<a href="javascript:showDiv('imm')" title="출국심사 관련정보"> <img
							src="/resources/images/icon/icons8-심사-96.png" alt="">
							<p class="subTxt3">
								출국심사
								<!-- 출국심사 -->
								<br> <span class="C_blue">(국제선<!-- 국제선 -->)
								</span>
							</p>
						</a>
					</div>

					<div class="item" id="apBtn2">
						<a href="javascript:showDiv('ap2')" title="기내탑승 관련정보"> <img
							src="/resources/images/icon/icons8-비행기-100.png" alt="">
							<p class="subTxt3">
								기내탑승
								<!-- 기내탑승 -->
							</p>
						</a>
					</div>
					<div class="item">
						<a href="/cust/cus/cusForm.do?phone=${phone}&name=${name}" title="페이지이동"> <img
							src="/resources/images/icon/icons8-수하물-96.png" alt="">
							<p class="subTxt3">
								수하물찾기
								<!-- 수하물찾기 -->
							</p>
						</a>
					</div>
					<div class="item" id="taxBtn">
						<a href="javascript:showDiv('tax')" title="세관심사 관련정보"> <img
							src="/resources/images/icon/icons8-세관-100.png" alt="">
							<p class="subTxt3">
								세관심사
								<!-- 세관심사 -->
								<br> <span class="C_blue">(국제선<!-- 국제선 -->)
								</span>
							</p>
						</a>
					</div>
					<div class="item">
						<a href="/cust/cus/cusForm?&phone=${phone}&name=${name}" title="페이지이동"> <img
							src="/resources/images/icon/icon_type09.png" alt="">
							<p class="subTxt3">
								기타사항
								<!-- 기타사항 -->
							</p>
						</a>
					</div>
				</c:if>
				<c:if test="${phone == null}">
					<div class="item">
						<a href="/cust/validation/custPass?link=cus" title="페이지이동"> <img
							src="/resources/images/icon/icons8-주차장-96.png" alt="">
							<p class="subTxt3">
								주차장
								<!-- 주차장 -->
							</p>
						</a>
					</div>
					<div class="item" id="apBtn1">
						<!-- ★ 하단 내용 표출, class active로 활성화  -->
						<a href="javascript:showDiv('ap1')" title="체크인카운터 관련정보"> <img
							src="/resources/images/icon/icons8-비행기-100.png" alt="">
							<p class="subTxt3">
								체크인카운터
								<!-- 체크인카운터 -->
							</p>
						</a>
					</div>
					<div class="item">
						<a href="/cust/validation/custPass?link=cus" title="페이지이동"> <img
							src="/resources/images/icon/icons8-지문-100.png" alt="">
							<p class="subTxt3">
								신분확인
								<!-- 신분확인 -->
							</p>
						</a>
					</div>
					<div class="item">
						<a href="/cust/validation/custPass?link=cus" title="페이지이동"> <img
							src="/resources/images/icon/icons8-보안-100.png" alt="">
							<p class="subTxt3">
								보안검색
								<!-- 보안검색 -->
							</p>
						</a>
					</div>
					<div class="item" id="immBtn">
						<a href="javascript:showDiv('imm')" title="출국심사 관련정보"> <img
							src="/resources/images/icon/icons8-심사-96.png" alt="">
							<p class="subTxt3">
								출국심사
								<!-- 출국심사 -->
								<br> <span class="C_blue">(국제선<!-- 국제선 -->)
								</span>
							</p>
						</a>
					</div>

					<div class="item" id="apBtn2">
						<a href="javascript:showDiv('ap2')" title="기내탑승 관련정보"> <img
							src="/resources/images/icon/icons8-비행기-100.png" alt="">
							<p class="subTxt3">
								기내탑승
								<!-- 기내탑승 -->
							</p>
						</a>
					</div>
					<div class="item">
						<a href="/cust/validation/custPass?link=cus" title="페이지이동"> <img
							src="/resources/images/icon/icons8-수하물-96.png" alt="">
							<p class="subTxt3">
								수하물찾기
								<!-- 수하물찾기 -->
							</p>
						</a>
					</div>
					<div class="item" id="taxBtn">
						<a href="javascript:showDiv('tax')" title="세관심사 관련정보"> <img
							src="/resources/images/icon/icons8-세관-100.png" alt="">
							<p class="subTxt3">
								세관심사
								<!-- 세관심사 -->
								<br> <span class="C_blue">(국제선<!-- 국제선 -->)
								</span>
							</p>
						</a>
					</div>
					<div class="item">
						<a href="/cust/validation/custPass?link=cus" title="페이지이동"> <img
							src="/resources/images/icon/icon_type09.png" alt="">
							<p class="subTxt3">
								기타사항
								<!-- 기타사항 -->
							</p>
						</a>
					</div>
				</c:if>

			</div>

		</div>



		<!-- 체크인카운터, 기내탑승 클릭시 표출 div -->
		<div class="banner-list-Link2" id="apDiv" style="display: none;">
			<div class="site_linkA">
				<p class="subTit8">
					<span class="C_blue">인천국제공항</span>과 관련된 내용은 인천국제공항으로 직접 문의해 주시기
					바랍니다.
					<!-- <span class="C_blue">인천국제공항</span>과 관련된 내용은 인천국제공항으로 직접 문의해 주시기 바랍니다. -->
				</p>
				<a
					href="https://www.airport.kr/co_cnt/ko/cuspar/minwon/howuse/howuse.do"
					target="_blank" class="subTxt2">인천국제공항<!-- 인천국제공항 --> <span>바로가기<!-- 바로가기 --></span></a>
			</div>
			<div class="site_linkA">

				<div class="linkA">
					<a
						href="https://www.koreanair.com/content/koreanair/korea/ko/customer-support.html#voice-of-customer"
						title="새창으로 이동" target="_blank"><img
						src="/resources/css/custUser/images/항공사/banner_koreanair.png"
						alt="대한항공"></a> <a
						href="https://flyasiana.com/C/KR/KO/customer/voc?site_preference=normal"
						title="새창으로 이동" target="_blank"><img
						src="/resources/css/custUser/images/항공사/banner_asiana.png"
						alt="아시아나 항공"></a> <a
						href="https://www.airbusan.com/content/common/customercenter/faq"
						title="새창으로 이동" target="_blank"><img
						src="/resources/css/custUser/images/항공사/banner_airbusan.png"
						alt="에어부산"></a> <a href="https://flyairseoul.com/CW/ko/main.do"
						title="새창으로 이동" target="_blank"><img
						src="/resources/css/custUser/images/항공사/banner_airseoul.png"
						alt="에어서울"></a> <a
						href="https://www.jejuair.net/jejuair/kr/cscenter/faqList.do"
						title="새창으로 이동" target="_blank"><img
						src="/resources/css/custUser/images/항공사/banner_jeju.png"
						alt="제주항공"></a> <a
						href="https://jinairbot.azurewebsites.net/webChat.html?username=%EA%B3%A0%EA%B0%9D%EB%8B%98&userid=&locale=ko"
						title="새창으로 이동" target="_blank"><img
						src="/resources/css/custUser/images/항공사/banner_jinair.png"
						alt="진에어"></a> <a
						href="https://www.twayair.com/app/customerCenter" title="새창으로 이동"
						target="_blank"><img
						src="/resources/css/custUser/images/항공사/banner_tway.png"
						alt="티웨이 항공"></a> <a
						href="https://www.flygangwon.com/ko/contents/viewFAQ.do"
						title="새창으로 이동" target="_blank"><img
						src="/resources/css/custUser/images/항공사/banner_flygangwon.png"
						alt="플라이 강원"></a> <a
						href="https://www.hi-airlines.com/v/servicecenter/faq/index"
						title="새창으로 이동" target="_blank"><img
						src="/resources/css/custUser/images/항공사/banner_hiair.png"
						alt="하이에어"></a>
				</div>
			</div>
		</div>
		<!--// 체크인카운터, 기내탑승 클릭시 표출 div -->

		<!-- 출국심사 클릭시 표출 div -->
		<div class="banner-list-Link2" id="immDiv" style="display: none;">
			<div class="site_linkA">

				<a
					href="https://www.airport.kr/co_cnt/ko/cuspar/minwon/howuse/howuse.do"
					title="새창으로 이동" target="_blank" class="subTxt2">인천국제공항<!-- 인천국제공항 -->
					<span>바로가기<!-- 바로가기 --></span></a>
			</div>
			<div class="site_linkA">
				<p class="subTit8">
					<span class="C_blue">출입국</span>과 관련된 내용은 법무부 출입국관리소 또는 법무부 온라인민원서비스
					사이트에서 직접 문의해 주시기 바랍니다.
					<!-- <span class="C_blue">출입국</span>과 관련된 내용은 법무부 출입국관리소 또는 법무부 온라인민원서비스 사이트에서 직접 문의해 주시기 바랍니다. -->
				</p>
				<a href="https://minwon.moj.go.kr/minwon/index.do" title="새창으로 이동"
					target="_blank" class="subTxt2">법무부<!-- 법무부 --> <span>바로가기<!-- 바로가기 --></span></a>
			</div>
		</div>
		<!--// 출국심사 클릭시 표출 div -->

		<!-- 세관심사 클릭시 표출 div -->
		<div class="banner-list-Link2" id="taxDiv" style="display: none;">
			<div class="site_linkA"></div>
			<div class="site_linkA">
				<p class="subTit8">
					<span class="C_blue">세관</span>과 관련된 내용은 세관으로 직접 문의해 주시기 바랍니다.
					<!-- <span class="C_blue">세관</span>과 관련된 내용은 세관으로 직접 문의해 주시기 바랍니다. -->
				</p>
				<a
					href="https://www.customs.go.kr/kcs/ad/cntnts/cntntsView.do?cntntsId=2922&mi=2922"
					title="새창으로 이동" target="_blank" class="subTxt2">세관<!-- 세관 --> <span>바로가기<!-- 바로가기 --></span></a>
			</div>
		</div>
		<!--// 세관심사 클릭시 표출 div -->

<!-- 		<div class="sbtn-wrap"> -->
<!-- 			<a href="/cust/validation/custPass?link=cusList" class="btnC btnGray"><span>등록하기결과확인</span></a> -->
<!-- 		</div> -->
		<div style="padding-bottom:75px;">
		
		</div>
	</div>

<!-- Google Analytics -->
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-74304977-1', 'auto');
	ga('send', 'pageview');
</script>


