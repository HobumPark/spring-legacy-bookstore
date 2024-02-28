<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function(){
            paymentBtn()
        })

        function paymentBtn(){
            $("#paymentBtn").on('click',function(){
                var paymentTypeList=['acount','card','basic']
                var paymentType='';
                var itemPrice=0;
                for(var i=0; i<=2; i++){
                    if($('[name="payment-radio"]')[i].checked===true){
                        paymentType=paymentTypeList[i];
                        
                        itemPrice=$("#item-price").text();
                        itemPrice = itemPrice.replace(/,/g, "");
                        alert(itemPrice)
                        break;
                    }
                }

                $.ajax({
                    type:'post',
                    url:'/paymentProcess',
                    async:true,
                    dataType:'text',
                    data:itemPrice,
                    success:function(result){
                        console.log('success')
                        console.log(result)
                    },
                    error:function(error){
                        console.log('error')
                        console.log(error)
                    }
                })

                //document.getElementById("paymentForm").submit();
            })
        }

    </script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buy/buyPage.css">
    <title>구매페이지</title>
</head>
<body>
    <form id="paymentForm" action="/processPayment" method="post">
        <div id="buy-page-wrap">
            <div id="buy-page-header">
                <h1>주문/결제하기</h1>
            </div>
            <div id="buy-page-contents">
                <div id="buy-page-contents-inner" class="clearfix">
                    <div id="buy-page-contents-left">
                        <div id="buy-page-address">
                            <div id="buy-page-address-head">
                                배송지
                            </div>
                            <div id="buy-page-address-info">
                                <span>이선희(집)</span>
                                <span>010-1234-1234</span>
                                <span>대구광역시 황제타운 103동 303호</span>
                            </div>
                            <div id="buy-page-address-memo">
                                <select>
                                    <option>배송메모를 선택해주세요</option>
                                    <option>문앞에 놓아주세요</option>
                                    <option>부재시 연락부탁드려요</option>
                                </select>
                                <input type="checkbox">
                                <label>다음에도 사용할게요</label>
                            </div>
                        </div>
                        <div id="buy-page-buyer">
                           <span>주문자</span>
                           <span>박호범</span>
                        </div>
                        <div id="buy-page-item">
                            <div id="buy-page-item-head">
                                주문상품
                            </div>
                            <div id="buy-page-item-info-wrap">
	                            <c:forEach items="${basketList}" var="basket">
	                            	<div id="buy-page-item-info">
		                                <a href="#">
		                                    <img src="./resources/images/bookcover/${basket.bookCover}" alt="북커버">
		                                </a>
		                                <div id="item-desc">
		                                    <ul>
		                                        <li>스마트스토어</li>
		                                        <li>${basket.bookTitle}</li>
		                                        <li>수량:${basket.amount}개</li>
		                                        <li><b id="item-price">${basket.totalPrice*basket.amount}</b>원</li>
		                                    </ul>
		                                </div>
	                            	</div>
	                            </c:forEach>
                            </div>
                            
                            <div id="buy-page-item-price">
                               <span>주문금액</span>
                               <span>15,120원</span>
                            </div>
                        </div>
                        <div id="buy-page-point">
                            <div id="buy-page-point-head">
                                <span>포인트</span>
                                <span>보유<b>1,502</b>원</span>
                            </div>
                            <div id="buy-page-point-contents">
                                <span>사용</span>
                                <input type="text">
                                <button>전액사용</button>
                            </div>
                        </div>
                        <div id="buy-page-payment">
                            <div id="buy-page-payment-head">
                                <span>결제수단</span>
                                <span><b>1,502</b>원</span>
                            </div>
                            <div id="buy-page-payment-contents">
                                <div>
                                    <input type="radio" name="payment-radio" id="account-payment"/>
                                    <label>계좌 간편결제</label>
                                </div>
                                <div>
                                    <input type="radio" name="payment-radio" id="card-payment"/>
                                    <label>카드 간편결제</label>
                                </div>
                                <div>
                                    <input type="radio" name="payment-radio" id="basic-payment"/>
                                    <label>일반결제</label>
                                </div>
                            </div>
                        </div>
                        <div id="payment-area">
                            <h3>주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</h3>
                            <button type="button" onclick="validateAndSubmit()" id="paymentBtn">결제하기</button>
                        </div>
                    </div>
                    <div id="buy-page-contents-right">
                        <div id="buy-page-payment-detail">
                            <div id="buy-page-payment-detail-head">
                                <span>결제상세</span>
                            </div>
                            <div id="buy-page-payment-detail-contents">
                                <div>
                                    <span>주문금액</span>
                                    <span><b>34,900</b>원</span>
                                </div>
                                <ul id="buy-page-payment-detail-list">
                                    <li>
                                        <span>상품금액</span>
                                        <span>34900원</span>
                                    </li>
                                    <li>
                                        <span>배송비</span>
                                        <span>0원</span>
                                    </li>
                                    <li>
                                        <span>쿠폰할인</span>
                                        <span>-6100원</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div id="buy-page-point-benefit">
                            <div id="buy-page-point-benefit-head">
                                <span>포인트혜택</span>
                            </div>
                            <div id="buy-page-point-benefit-contents">
                                <div>
                                    <span>구매적립</span>
                                    <span>최대<b>2,768</b>원</span>
                                </div>
                                <ul id="buy-page-point-detail-list">
                                    <li>
                                        <span>기본적립</span>
                                        <span>349원</span>
                                    </li>
                                    <li>
                                        <span>페이머니 결제적립</span>
                                        <span>523원</span>
                                    </li>
                                    <li>
                                        <span>멤버십 추가적립</span>
                                        <span>1396원</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="buy-page-footer">
                푸터
            </div>
        </div>
    </form>

</body>
</html>