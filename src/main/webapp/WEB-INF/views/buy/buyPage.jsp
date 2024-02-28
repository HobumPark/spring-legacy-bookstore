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
    <title>����������</title>
</head>
<body>
    <form id="paymentForm" action="/processPayment" method="post">
        <div id="buy-page-wrap">
            <div id="buy-page-header">
                <h1>�ֹ�/�����ϱ�</h1>
            </div>
            <div id="buy-page-contents">
                <div id="buy-page-contents-inner" class="clearfix">
                    <div id="buy-page-contents-left">
                        <div id="buy-page-address">
                            <div id="buy-page-address-head">
                                �����
                            </div>
                            <div id="buy-page-address-info">
                                <span>�̼���(��)</span>
                                <span>010-1234-1234</span>
                                <span>�뱸������ Ȳ��Ÿ�� 103�� 303ȣ</span>
                            </div>
                            <div id="buy-page-address-memo">
                                <select>
                                    <option>��۸޸� �������ּ���</option>
                                    <option>���տ� �����ּ���</option>
                                    <option>����� ������Ź�����</option>
                                </select>
                                <input type="checkbox">
                                <label>�������� ����ҰԿ�</label>
                            </div>
                        </div>
                        <div id="buy-page-buyer">
                           <span>�ֹ���</span>
                           <span>��ȣ��</span>
                        </div>
                        <div id="buy-page-item">
                            <div id="buy-page-item-head">
                                �ֹ���ǰ
                            </div>
                            <div id="buy-page-item-info-wrap">
	                            <c:forEach items="${basketList}" var="basket">
	                            	<div id="buy-page-item-info">
		                                <a href="#">
		                                    <img src="./resources/images/bookcover/${basket.bookCover}" alt="��Ŀ��">
		                                </a>
		                                <div id="item-desc">
		                                    <ul>
		                                        <li>����Ʈ�����</li>
		                                        <li>${basket.bookTitle}</li>
		                                        <li>����:${basket.amount}��</li>
		                                        <li><b id="item-price">${basket.totalPrice*basket.amount}</b>��</li>
		                                    </ul>
		                                </div>
	                            	</div>
	                            </c:forEach>
                            </div>
                            
                            <div id="buy-page-item-price">
                               <span>�ֹ��ݾ�</span>
                               <span>15,120��</span>
                            </div>
                        </div>
                        <div id="buy-page-point">
                            <div id="buy-page-point-head">
                                <span>����Ʈ</span>
                                <span>����<b>1,502</b>��</span>
                            </div>
                            <div id="buy-page-point-contents">
                                <span>���</span>
                                <input type="text">
                                <button>���׻��</button>
                            </div>
                        </div>
                        <div id="buy-page-payment">
                            <div id="buy-page-payment-head">
                                <span>��������</span>
                                <span><b>1,502</b>��</span>
                            </div>
                            <div id="buy-page-payment-contents">
                                <div>
                                    <input type="radio" name="payment-radio" id="account-payment"/>
                                    <label>���� �������</label>
                                </div>
                                <div>
                                    <input type="radio" name="payment-radio" id="card-payment"/>
                                    <label>ī�� �������</label>
                                </div>
                                <div>
                                    <input type="radio" name="payment-radio" id="basic-payment"/>
                                    <label>�Ϲݰ���</label>
                                </div>
                            </div>
                        </div>
                        <div id="payment-area">
                            <h3>�ֹ� ������ Ȯ���Ͽ�����, ���� ���� � �����մϴ�.</h3>
                            <button type="button" onclick="validateAndSubmit()" id="paymentBtn">�����ϱ�</button>
                        </div>
                    </div>
                    <div id="buy-page-contents-right">
                        <div id="buy-page-payment-detail">
                            <div id="buy-page-payment-detail-head">
                                <span>������</span>
                            </div>
                            <div id="buy-page-payment-detail-contents">
                                <div>
                                    <span>�ֹ��ݾ�</span>
                                    <span><b>34,900</b>��</span>
                                </div>
                                <ul id="buy-page-payment-detail-list">
                                    <li>
                                        <span>��ǰ�ݾ�</span>
                                        <span>34900��</span>
                                    </li>
                                    <li>
                                        <span>��ۺ�</span>
                                        <span>0��</span>
                                    </li>
                                    <li>
                                        <span>��������</span>
                                        <span>-6100��</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div id="buy-page-point-benefit">
                            <div id="buy-page-point-benefit-head">
                                <span>����Ʈ����</span>
                            </div>
                            <div id="buy-page-point-benefit-contents">
                                <div>
                                    <span>��������</span>
                                    <span>�ִ�<b>2,768</b>��</span>
                                </div>
                                <ul id="buy-page-point-detail-list">
                                    <li>
                                        <span>�⺻����</span>
                                        <span>349��</span>
                                    </li>
                                    <li>
                                        <span>���̸Ӵ� ��������</span>
                                        <span>523��</span>
                                    </li>
                                    <li>
                                        <span>����� �߰�����</span>
                                        <span>1396��</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="buy-page-footer">
                Ǫ��
            </div>
        </div>
    </form>

</body>
</html>