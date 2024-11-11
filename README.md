# DDIT-final
대덕인재개발원 최종프로젝트

# 프로젝트 개요
그룹웨어 및 사용자 페이지 관리 기능을 제공하는 서비스

# 주요 기능
 - 직원페이지 로그인/로그아웃
 - Tiles를 이용한 권한 별 메뉴 설정
 - WebSocket을 이용한 실시간 채팅
 - PdfBox, itextPdf를 이용한 급여명세서/출입증 신청서 관리
 - 토스페이먼츠를 이용한 주차예약
 - 한국공항공사 API를 활용한 실시간 탑승 수속 소요시간, 항공편 조회

# 사용언어
|구분|버전|
|:---:|:---:|
|Java|1.8|
|JSP|2.2|
|JavaScript|ES6|
|HTML|5|
|CSS|3|
|JSTL|1.2|
|EL|3.0.3|

# 개발환경
|구분|툴명|버전|
|:---:|:---:|:---:|
|IDE|Eclipse|4.16.0|
|DB|Oracle|11g XE|
|DB Tool|SQL Developer|21.4.3|
|FrameWork|Spring|5.2.5|
|FrameWork|Mybatis|3.5.10|
|FrameWork|BootStrap|5|
|데이터모델링|Erd Cloud|-|
|프로젝트관리|Manven|3.88|
|UML모델링|StarUML|5.0|
|WAS|Apache Tomcat|9.0.3|
|형상관리|SVN|3.7.1|

# 사용 API
|이름|용도|참고|
|---|---|---|
|FullCalendar|캘린더 일정 생성 및 조회|https://fullcalendar.io|
|TossPayment|주차장 보증금 결제|https://docs.tosspayments.com/guides/v2/get-started|
|한국공항공사_공항 혼잡도 정보(김포, 제주공항)|공항 혼잡도 조회|https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15095480|
|구루미 화상회의|화상회의 생성 및 입장|https://gooroomee.readme.io/reference/goa|
|우편번호 서비스|우편번호(주소) 검색|[https://www.juso.go.kr/CommonPageLink.do?link=/addrlink/devAddrLinkRequestSample](https://postcode.map.daum.net/guide)|
|한국공항공사_공항 소요시간 정보(김포, 제주공항)|	탑승수속 소요시간 조회|https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15095478|
|한국공항공사_실시간 항공운항 현황 정보 상세 조회 서비스|항공운항 현황 조회|https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15113771
|카카오맵|지도 조회|https://apis.map.kakao.com/|
|쿨SMS|문자발송|https://developers.coolsms.co.kr/intro|
|한국공항공사_전국공항 주차장 혼잡도|주차장 혼잡도 조회|https://www.data.go.kr/data/15063437/openapi.do


