<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <!-- SDK 추가 -->
    <script src="https://js.tosspayments.com/v2/standard"></script>
</head>

<body>
    <!-- 결제하기 버튼 -->
    <button class="button" style="margin-top: 30px" onclick="requestPayment()">결제하기</button>
</body>

<script>
    // ------  SDK 초기화 ------
    const tossPayments = TossPayments(clientKey);

    // 회원 결제
    const payment = tossPayments.payment({ customerKey });

    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
    async function requestPayment() {
        try {
            await payment.requestPayment({
                method: "CARD", // 카드 결제
                amount: {
                    currency: "KRW",
                    value: 10000,
                },
                orderId: "xb70A9o0iKxFjfzXGFhLY", // 고유 주문번호
                orderName: "주차비",
                successUrl: window.location.origin + "/cust/parking/regist2", // 결제 성공 시 리다이렉트 URL
                failUrl: window.location.origin + "/cust/parking/fail", // 결제 실패 시 리다이렉트 URL
                customerEmail: "customer123@gmail.com",
                customerName: "김예영",
                prkRsvtNo: "12",
                customerMobilePhone: "01012341234",
                // 카드 결제에 필요한 정보
                card: {
                    useEscrow: false,
                    flowMode: "DEFAULT", // 통합결제창 여는 옵션
                    useCardPoint: false,
                    useAppCardOnly: false,
                },
            });
        } catch (error) {
            console.error("결제 요청 중 오류 발생:", error);
            alert("결제에 실패했습니다. 다시 시도해 주세요.");
        }
    }

    // Brandpay 설정
    const brandpay = tossPayments.brandpay({
        customerKey,
        redirectUrl: window.location.origin + "/cust/parking/regist2?orderId={ORDER_ID}&paymentKey={PAYMENT_KEY}&amount={AMOUNT}"
    });

    const brandpayFail = tossPayments.brandpay({
        customerKey,
        redirectUrl: window.location.origin + "/cust/parking/fail?code={ERROR_CODE}&message={ERROR_MESSAGE}&orderId={ORDER_ID}"
    });
</script>
