<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/detail/bookDetailView.css" type="text/css" rel="stylesheet">
<link href="resources/css/common/header.css" type="text/css" rel="stylesheet">
<link href="resources/css/common/footer.css" type="text/css" rel="stylesheet">
<title>책 상세보기</title>
</head>
<body>
	<%=(String) session.getAttribute("id")%>
	<%
		String id = (String) session.getAttribute("id");
	%>
	<div id="wrap"> 
		<div id="ad-top">
			<img src="./resources/images/home/bnD_top.jpg" alt="광고">
			<span id="close-btn">
				<img src="./resources/images/home/header/btn_close5.gif" alt="닫기버튼">
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
					<a href="./login" id="login-btn">로그인</a>
					<%
					} else {
				%>
					<a href="./update">회원정보수정</a> <a href="./logout">로그아웃</a>
					<%
					}
				%>
					<a href="./signup">회원가입</a> <a href="#">출석체크</a> <a href="#">고객센터</a>
					<a href="#">주문배송</a> <a href="./basket">장바구니</a>
				</div>
			</div>
			<div id="header-bottom">
				<div id="logo">
					<a href="./"> <img src="./resources/images/home/logo_kyobo.png"
						alt="로고">
					</a>
				</div>
				<div id="search">
					<div id="search-text-slide">
						
					</div>
					<form action="./search">
						<div id="search-input-area">
							<input type="text" placeholder="홍춘욱의 돈의 신호를 포착하는 방법" name="searchText"
								id="searchText" />
						</div>
						<input type="submit" value="" id="search-btn" /> 
						<input type="hidden" placeholder="1페이지 넘기기" 
							   name="page" id="page" value="1" />
					</form>

				</div>
				<div id="right">
					<div id="tab">
						<img src="./resources/images/home/gnb_slide/gnb_slide01.jpg">
						<img src="./resources/images/home/gnb_slide/gnb_slide02.jpg">
						<img src="./resources/images/home/gnb_slide/gnb_slide03.jpg">
						<img src="./resources/images/home/gnb_slide/gnb_slide04.jpg">
						<img src="./resources/images/home/gnb_slide/gnb_slide05.jpg">
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
		</nav>
		
		<div id="contents">
			<div id="contents-top">
				<ul>
					<li>
						<a href="#">
						<span>
							<img src="./resources/images/detail/ico_home.png">
						</span>
						국내도서
						</a>
					</li>
					<li>
						<a href="#">인문</a>
					</li>
					<li>
						<a href="#">철학</a>
					</li>
					<li>
						<a href="#">서양철학일반</a>
					</li>
					<li>
						<a href="#">현대철학</a>
					</li>
				</ul>
			</div>
			<div id="contents-bottom">
				<div id="book-head">
					<div id="book-title">
						<h1>${bookDetail.title}</h1>
					</div>
					<div id="book-tab">
						<div id="book-tab-inner">
							<ul>
								<li>
									<a href="#">
										<span>종이책</span>
										<span>${bookDetail.price}원</span>
									</a>
								</li>
								<li>
									<a href="#">
										<span>eBook</span>
										<span>${bookDetail.ebookPrice}원</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="book-detail-info">
					<div id="book-detail-info01">
						<div id="book-author"><!-- 바뀔곳 -->
							<span>${bookDetail.author}</span>
						</div>
						<div id="book-pubDate"><!-- 바뀔곳 -->
							<span>동녘</span>
							<span>${year}년 ${month}월 ${day}일</span>
						</div>
						<div id="book-review">
							<div id="book-review-info">
								<span></span>
								<span></span>
							</div>

						</div>
					</div>
					<div id="book-detail-info02">
						<div id="book-cover">
							<img src="${pageContext.request.contextPath}/resources/images/bookcover/${bookDetail.coverImg}">
						</div>
						<div id="book-slide-btn">
						
						</div>
						<div id="book-detail-btn">
						
						</div>
					</div>
					<div id="book-detail-info03">
						<div id="book-etc-info">
							<span>MD의 선택</span>
							<span>무료배송</span>
							<span>소득공제</span>
						</div>
						<div id="book-price-info">
							<span id="discount-ratio">10%</span>
							<span id="discount-price">${bookDetail.price}원</span>
							<span id="original-price">${bookDetail.discountedPrice}원</span>
						</div>
						<div id="book-point-info">
							<span id="book-point-info-label">적립/혜택</span>
							<span id="book-point-info-num">900P</span>
						</div>
						<div id="book-delivery-info">
							<div id="book-delivery-info01">
								<span id="label">배송안내</span>
								<span id="delivery-price">무료배송 적용상품</span>
							</div>
							<div id="book-delivery-info02">
								<span id="delivery-date">1월26일(목)도착 예정</span>
							</div>
							<div id="book-delivery-info03">
								<span id="delivery-address">서울 종로구 종로1</span>
								<button id="delivery-update">변경</button>
							</div>
						</div>
						<div id="book-alarm-info">
							<div id="book-alarm-info01">
								<span id="label">알림 신청하시면 원하시는 정보를 받아 보실 수 있습니다.</span>
								<button id="alarm-btn">알림신청</button>
							</div>
							<div id="book-alarm-info02">
								<button id="shop-location-btn">매장 재고 위치</button>
							</div>
						</div>
						
					</div>
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