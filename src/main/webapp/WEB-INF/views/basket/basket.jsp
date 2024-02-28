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
			alert('증가!')
			var amount=$(this).prev().val()
			amount=parseInt(amount)+1
			$(this).prev().val(amount)
			
			var itemPrice=$(this).parent().prev().text()
			$(this).parent().next().text(itemPrice*amount)
			totalPriceCheck()
		})
		$(".dec-btn").click(function(){
			alert('감소!')
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
		            // 성공적으로 요청이 처리된 경우의 코드
		        },
		        error: function(error) {
		            console.error('Error:', error);
		            // 요청이 실패한 경우의 코드
		        }
		    });
			*/
			alert('주문!')
		})
	}
	function itemCheckBtn(){
		$(".item-check").click(function(){
			alert('개별체크!')
		})
	}
	function itemDeleteBtn(){
		$(".item-delete-btn").click(function(){
			alert('아이템 삭제!')
			$(this).parent().parent().remove()
		})
	}
	function checkAllBtn(){
		$("#check-all-btn").click(function(){
			alert('전체체크!')
			
		})
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%=(String) session.getAttribute("id")%>
	장바구니 페이지
	<div id="basket-wrap">
		<div id="basket-check-header">
			<input type='checkbox' id='check-all-btn'/>
			<span>전체</span>
		</div>
		<div id="basket-contents">
			<div id="basket-contents-inner">
				<div id="basket-head">
					<span id="item-info">상품정보</span>
					<span id="item-price">판매가</span>
					<span id="item-amount">수량</span>
					<span id="item-price-sum">합계</span>
					<span id="item-delivery-date">배송일정</span>
				</div>
				<c:forEach items="${basketList}" var="basket">
				<div class="basket-item">
					<div id="item-info">
						<div id="img-chk">
						 	<input type="checkbox" class='item-check'>
							<img src="./resources/images/bookcover/${basket.bookCover}" alt="북커버">
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
					<span id="total-price">상품금액 <b>${totalPrice}</b>원</span>
					<span>배송비 <b></b>원</span>
					<span>결제예정금액 <b></b>원</span>
					<span>적립예정포인트 <b></b>P</span>
					<button id='order-btn'>주문하기<b></b></button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>