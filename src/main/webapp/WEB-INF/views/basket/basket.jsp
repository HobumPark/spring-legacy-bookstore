<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="resources/css/basket/basket.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		itemIncDecBtn()
		orderBtn()
		itemCheckBtn()
		itemDeleteBtn()
		checkAllBtn()
	})
	
	function itemIncDecBtn(){
		$(".inc-btn").click(function(){
			alert('����!')
			var amount=$(this).prev().val()
			amount=parseInt(amount)+1
			$(this).prev().val(amount)
			
			var itemPrice=$(this).parent().prev().text()
			$(this).parent().next().text(itemPrice*amount)
			totalPriceCheck()
		})
		$(".dec-btn").click(function(){
			alert('����!')
			var amount=$(this).next().val()
			amount=parseInt(amount)-1
			$(this).next().val(amount)
			
			var itemPrice=$(this).parent().prev().text()
			$(this).parent().next().text(itemPrice*amount)
			totalPriceCheck()
		})
	}
	function totalPriceCheck(){
			var totalPrice=0;
			var length=$(".basket-item>#item-price-sum").length;
			alert(length)
			for(var i=0; i<length; i++){
				var txt=$(".basket-item>#item-price-sum").eq(i).text()
				alert(txt)
				totalPrice += parseInt(txt)
				$("#total-price>b").text(totalPrice)
			}
	}
	
	function orderBtn(){
		$("#order-btn").click(function(){
			window.location.href='/db/buy_page'
			/*
			var ajaxJSON = {"no":1,"comment":"hi","id":"asdf1234"}
			console.log(ajaxJSON)
			
			$.ajax({
		        type: "POST",
		        url: '/db/buy_book',
		        data: {'jsonData' : JSON.stringify(ajaxJSON)},
		        dataType: "JSON",
		        success: function(response) {
		            console.log(response);
		            // ���������� ��û�� ó���� ����� �ڵ�
		        },
		        error: function(error) {
		            console.error('Error:', error);
		            // ��û�� ������ ����� �ڵ�
		        }
		    });
			*/
			alert('�ֹ�!')
		})
	}
	function itemCheckBtn(){
		$(".item-check").click(function(){
			alert('����üũ!')
		})
	}
	function itemDeleteBtn(){
		$(".item-delete-btn").click(function(){
			alert('������ ����!')
			$(this).parent().parent().remove()
		})
	}
	function checkAllBtn(){
		$("#check-all-btn").click(function(){
			alert('��üüũ!')
			
		})
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%=(String) session.getAttribute("id")%>
	��ٱ��� ������
	<div id="basket-wrap">
		<div id="basket-check-header">
			<input type='checkbox' id='check-all-btn'/>
			<span>��ü</span>
		</div>
		<div id="basket-contents">
			<div id="basket-contents-inner">
				<div id="basket-head">
					<span id="item-info">��ǰ����</span>
					<span id="item-price">�ǸŰ�</span>
					<span id="item-amount">����</span>
					<span id="item-price-sum">�հ�</span>
					<span id="item-delivery-date">�������</span>
				</div>
				<c:forEach items="${basketList}" var="basket">
				<div class="basket-item">
					<div id="item-info">
						<div id="img-chk">
						 	<input type="checkbox" class='item-check'>
							<img src="./resources/images/bookcover/${basket.bookCover}" alt="��Ŀ��">
						</div>
						
						<div id="book-info">${basket.bookTitle}</div>
					</div>
					<div id="item-price">${basket.bookPrice}</div>
					<div id="item-amount">
						<button class="dec-btn">-</button>
						<input type='text' value='${basket.amount}'/>
						<button class="inc-btn">+</button>
					</div>
					<div id="item-price-sum">${basket.totalPrice*basket.amount}</div>
					<div id="item-delivery-date">
						<button class='item-delete-btn'>X</button>
					</div>
				</div>
				</c:forEach>
			</div>
			<div id="side-control-area">
				<div id="side-control-box">
					<span id="total-price">��ǰ�ݾ� <b>${totalPrice}</b>��</span>
					<span>��ۺ� <b></b>��</span>
					<span>���������ݾ� <b></b>��</span>
					<span>������������Ʈ <b></b>P</span>
					<button id='order-btn'>�ֹ��ϱ�<b></b></button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>