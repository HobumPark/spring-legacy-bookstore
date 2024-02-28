<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/common/header.css" type="text/css" rel="stylesheet">
<link href="resources/css/searchResult/searchResult.css" type="text/css" rel="stylesheet">	
<link href="resources/css/searchResult/buyBasketPopUp.css" type="text/css" rel="stylesheet">
<link href="resources/css/common/footer.css" type="text/css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		shopBagOrBuy()
	})
	
	function shopBagOrBuy(){
		$(".shop-bag-btn").click(function(){
			alert('장바구니!')
			$("#dialog-background").show()
		})
		$(".buy-btn").click(function(){
			alert('구매!')
		})
		$("#cancel").click(function(){
			alert('취소!')
			$("#dialog-background").hide()
		})
		$("#confirm").click(function(){
			alert('확인!')
			window.location.href='/db/basket'
		})
	}
	
	function buyPage(){
		window.location.href='/db/buy_book'
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String searchText=request.getParameter("searchText");
	
	%>
	<%=(String) session.getAttribute("id")%>
	<%
		String id = (String) session.getAttribute("id");
	%>
	<div id="dialog-background">
		<div id="dialog">
			<h1>상품이 장바구니에 담겼습니다.</h1>
			<h1>장바구니로 이동하시겠습니까?</h1>
			<div id="btn-wrap">
				<button id="cancel">취소</button>
				<button id="confirm">확인</button>
			</div>
		</div>
	</div>
	<div id=search-wrap>
		<div id="ad-top">
			<img src="${pageContext.request.contextPath}/resources/images/home/bnD_top.jpg" alt="광고">
			<span id="close-btn">
				<img src="${pageContext.request.contextPath}/resources/images/home/header/btn_close5.gif" alt="닫기버튼">
			</span>
		</div>
		<header id="header">
			<div id="header-top">
				<div id="header-top-left">
					<ul>
						<li><a href="#">바로콘</a></li>
						<li id="introduce-market">
							<a href="#">매장안내</a>
							<div id="market-div">
								<div id="section1">
									<ul>
										<li>서울</li>
										<li><a href="#">광화문점</a></li>
										<li><a href="#">가든파이브 바로드림센터</a></li>
									</ul>
								</div>
								<div id="section2">
									<ul>
										<li>경기/인천</li>
										<li><a href="#">광교점</a></li>
										<li><a href="#">광교 월드스퀘어센터</a></li>
									</ul>
								</div>
								<div id="section3">
									<ul>
										<li>수도권 외</li>
										<li><a href="#">경성대 부경대 센터</a></li>
										<li><a href="#">광주상무 센터</a></li>
										<li><a href="./daegu">대구점</a></li>
									</ul>
								</div>
							</div></li>
						<li><a href="#">회원혜택</a></li>
						<li><a href="#">Prestige Lounge</a></li>
					</ul>
				</div>
				<div id="header-top-right">
					<%
					if (id == null) {
					%>
					<a href="${pageContext.request.contextPath}/login" id="login-btn">로그인</a>
					<%
					} else {
					%>
					<a href="${pageContext.request.contextPath}/update">회원정보수정</a> 
					<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
					<%
					}
					%>
					<a href="${pageContext.request.contextPath}/signup">회원가입</a> 
					<a href="#">출석체크</a> 
					<a href="${pageContext.request.contextPath}/customer_center">고객센터</a>
					<a href="#">주문배송</a> 
					<a href="${pageContext.request.contextPath}/basket">장바구니</a>
				</div>
			</div>
			<div id="header-bottom">
				<div id="logo">
					<a href="${pageContext.request.contextPath}/"> 
						<img src="${pageContext.request.contextPath}/resources/images/home/logo_kyobo.png" alt="로고">
					</a>
				</div>
				<div id="search">
					<div id="search-text-slide">
						
					</div>
					<form action="${pageContext.request.contextPath}/search">
						<div id="search-input-area">
							<input type="text" placeholder="홍춘욱의 돈의 신호를 포착하는 방법" name="searchText" id="searchText" />
						</div>
						<input type="submit" value="" id="search-btn" /> 
						<input type="hidden" placeholder="1페이지 넘기기" name="page" id="page" value="1" />
					</form>

				</div>
				<div id="right">
					<div id="tab">
						<img src="${pageContext.request.contextPath}/resources/images/home/gnb_slide/gnb_slide01.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/home/gnb_slide/gnb_slide02.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/home/gnb_slide/gnb_slide03.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/home/gnb_slide/gnb_slide04.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/home/gnb_slide/gnb_slide05.jpg">
					</div>
					<div id="tab-btn">
						<span id="current-slide">1</span> <span>/5</span>
						<button class="prev"></button>
						<button class="next"></button>
					</div>
				</div>
			</div>
		</header>
		<nav id="nav">
			<div id="nav-left">
				<ul>
					<li><a href="#"> <span></span> <span></span> <span></span>
					</a></li>
					<li><a href="#">국내도서</a></li>
					<li><a href="#">외국도서</a></li>
					<li><a href="#">eBook</a></li>
					<li><a href="#">웹소설</a></li>
					<li><a href="#">기프트</a></li>
					<li><a href="#">음반</a></li>
					<li><a href="#">중고장터</a></li>
					<li><a href="#">+</a></li>
				</ul>
			</div>
			<div id="nav-right">
				<ul>
					<li><a href="#">베스트</a></li>
					<li><a href="#">신상품</a></li>
					<li><a href="#">이벤트</a></li>
					<li><a href="#">사은품</a></li>
				</ul>
			</div>
		</nav>
		<div id="contents">
			컨텐츠
			<%
			out.println(searchText+" 검색결과");
			%>

			<c:forEach items="${bookList}" var="book">
				<div id="book">
					<div id="book-left">
						<a href="${pageContext.request.contextPath}/bookDetailView?regNo=${book.regNo}">
							<img src="${pageContext.request.contextPath}/resources/images/bookcover/${book.coverImg}" alt="커버" />
						</a>
						<br /> <span>새창보기</span> <span class="bar"></span> <span>미리보기</span>
					</div>
					<div id="book-right">
						<div id="book-desc-inline1">
							<section id="section1">
								<span id="title">
									<a href="${pageContext.request.contextPath}/bookDetailView?regNo=${book.regNo}">
										${book.title}
									</a>
								</span> 
								<span id="sub-title">${book.subTitle}</span>
							</section>
							<section id="section2">
								<span>${book.author}</span> <span>${book.publishingCompany}</span>
								<span>${book.publishingDate}</span>
							</section>
							<section id="section3">
								<span>[당일배송] 지금 주문하면 오늘(19일, 화) 도착 예정 </span>
							</section>
						</div>
						<div id="book-desc-inline2">
							<section id="section1">
								<span>${book.userRating}/10</span>
							</section>
							<section id="section2">
								<span>리뷰</span>
							</section>
							<section id="section3">
								<span>ebook${book.ebookPrice}</span>
							</section>

						</div>
						<div id="book-desc-inline3">
							<span>${book.price}원</span> <span>${book.discountedPrice}원</span>
						</div>
						<div id="book-desc-inline4">
							<div id="select-amount">
								<input type="checkbox" /> <label for="select-buy-num">수량</label>
								<a href="#">증가</a> <a href="#">감소</a>
							</div>
							<div id="shop-bag-or-buy">
								<button class="shop-bag-btn">장바구니</button>
								<button class="buy-btn" onclick="buyPage()">바로구매</button>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>
			<%
            URLEncoder.encode(searchText,"UTF-8");
            %>
			<div id="page-list">
			
				<div id="page-list-inner">
					<span id="page"> 
							<c:choose>
	
							<c:when test="${currentPage == 1}">
	            				<a href="${pageContext.request.contextPath}/search?searchText=<%= URLEncoder.encode(searchText,"UTF-8")%>&page=${1}">
									&lt; 
								</a>
	         				</c:when>
	
							<c:otherwise>
	            				<a href="${pageContext.request.contextPath}/search?searchText=<%= URLEncoder.encode(searchText,"UTF-8")%>&page=${currentPage-1}">
									&lt; 
								</a>
	         				</c:otherwise>
	         				
							</c:choose>
					</span>
					<c:forEach items="${pagination}" var="page">
										
										<c:if test="${curPage eq page}">
									    	<span id="page" class="active">
												<a href="${pageContext.request.contextPath}/search?searchText=<%= URLEncoder.encode(searchText,"UTF-8")%>&page=${page}">
													${page}
												</a>
											</span>
										</c:if>
										<c:if test="${curPage ne page}">
									    	<span id="page">
												<a href="${pageContext.request.contextPath}/search?searchText=<%= URLEncoder.encode(searchText,"UTF-8")%>&page=${page}">
													${page}
												</a>
											</span>
										</c:if>
						
					</c:forEach>
					<span id="page"> 
					
						<c:choose>
	
							<c:when test="${currentPage == endPage}">
	            				<a href="${pageContext.request.contextPath}/search?searchText=<%= URLEncoder.encode(searchText,"UTF-8")%>&page=${endPage}">
									&gt; 
								</a>
	         				</c:when>
	
							<c:otherwise>
	            				<a href="${pageContext.request.contextPath}/search?searchText=<%= URLEncoder.encode(searchText,"UTF-8")%>&page=${currentPage+1}">
									&gt; 
								</a>
	         				</c:otherwise>
	         				
						</c:choose>
						
					</span>
				</div>

			</div>
		</div>
		<footer id="footer"> 
			<div id="footer-inner">
				<div id="footer-left">
					<div id="logo">
						<img src="./resources/images/footer/img_logo_kyobo_footer.png" alt="로고">
					</div>
					<div id="bottom-menu">
						<ul>
							<li>
								<a href="#">회사소개</a>
							</li>
							<li>
								<a href="#">이용약관</a>
							</li>
							<li>
								<a href="#">개인정보처리방침</a>
							</li>
							<li>
								<a href="#">청소년보호정책</a>
							</li>
							<li>
								<a href="#">대량주문안내</a>
							</li>
							<li>
								<a href="#">협력사여러분</a>
							</li>
							<li>
								<a href="#">채용정보</a>
							</li>
							<li>
								<a href="#">광고소개</a>
							</li>
						</ul>
					</div>
					<div id="copy-right">
						<ul>
							<li>
								<a href="#">대표이사 : 안병현</a>
							</li>
							<li>
								<a href="#">서울특별시 종로구 종로 1</a>
							</li>
							<li>
								<a href="#">사업자등록번호 : 102-81-11670</a>
							</li>
						</ul>
						<br/>
						<ul>
							<li>
								<a href="#">대표전화 : 1544-1900</a>
							</li>
							<li>
								<a href="#">FAX : 0502-987-5711(지역번호 공통)</a>
							</li>
							<li>
								<a href="#">서울특별시 통신판매업신고번호 : 제 653호</a>
							</li>
						</ul>
					</div>
					<div id="copy-right-text">
						<span>© KYOBO BOOK CENTRE</span>
					</div>
				</div>
				<div id="footer-right">
					<div id="family-site">
						<select>
							<option>Family Site</option>
						</select>
						<ul id="sns-list">
							<li>
								<a href="#">
									<img src="./resources/images/footer/btn_footer_sns_youtube.png" alt="유튜브"/>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="./resources/images/footer/btn_footer_sns_fb.png" alt="페이스북"/>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="./resources/images/footer/btn_footer_sns_insta.png" alt="인스타그램"/>
								</a>
							</li>
						</ul>
					</div>
					<div id="service">
						<div id="service-row01">
							<span>LG U+ 구매안전서비스</span>
							<button>서비스 가입 확인</button>
						</div>
						<div id="service-row02">
							<span>고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한</span>
							<span>LG유플러스의 구매안전서비스를 이용하실 수 있습니다.</span>
						</div>
					</div>
					<div id="isms">
						<div id="isms-left">
							<img src="./resources/images/footer/img_mark_isms.png" alt="isms로고"/>
						</div>
						<div id="isms-mid">
							<span>정보보호관리체계</span>
							<span>ISMS 인증획득</span>
						</div>
						<div id="isms-right">
							<span>[인증범위]온라인 교보문고 서비스 운영</span>
							<span>[유효기간]2020.11.04 ~ 202311.03</span>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>