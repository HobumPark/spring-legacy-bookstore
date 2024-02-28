<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판</title>

<link href="${pageContext.request.contextPath}/resources/css/common/header.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common/footer.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/customerCenter/customerCenter.css" type="text/css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		market_hover()
	})
	
	function market_hover(){
		$("#introduce-market").hover(
				function(){
					//alert("mouseover!")
					$("#introduce-market>a").css("text-decoration","underline");
					$("#market-div").show();
				},
				function(){
					//alert("mouseout!")
					$("#introduce-market>a").css("text-decoration","none");
					$("#market-div").hide();
				}
		)
	}
	
</script>
</head>
<body>
	<%=(String) session.getAttribute("id")%>
	<%
		String id = (String) session.getAttribute("id");
	%>
	<div id="wrap">
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
					<a href="${pageContext.request.contextPath}/update">회원정보수정</a> <a href="./logout">로그아웃</a>
					<%
					}
				%>
					<a href="${pageContext.request.contextPath}/signup">회원가입</a> <a href="#">출석체크</a> <a href="#">고객센터</a>
					<a href="#">주문배송</a> <a href="./basket">장바구니</a>
				</div>
			</div>
			<div id="header-bottom">
				<div id="logo">
					<a href="${pageContext.request.contextPath}/"> <img src="${pageContext.request.contextPath}/resources/images/home/logo_kyobo.png"
						alt="로고">
					</a>
				</div>
				<div id="search">
					<div id="search-text-slide">
						
					</div>
					<form action="${pageContext.request.contextPath}/search">
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
		</nav>
		<div id="contents">
			<div id="contents-inner">
				<div id="contents-left">
					<h1>고객센터</h1>
					<h2 id="main">
						<a href="#">
							메인
						</a>
					</h2>
					<!-- 자주묻는 질문 목록 -->
					<h3 id="often">
						<a href="#">
							자주묻는질문
						</a>
					</h3>
					<ul id="often-question">
						<li>
							<a href="#">
								BEST10
							</a>
						</li>
						<li>
							<a href="./board/user">
								회원
							</a>
						</li>
						<li>
							<a href="#">
								도서/상품정보/교과서
							</a>
						</li>
						<li>
							<a href="#">
								주문/결제
							</a>
						</li>
						<li>
							<a href="#">
								배송/수령일 안내
							</a>
						</li>
						<li>
							<a href="#">
								반품/교환/환불
							</a>
						</li>
						<li>
							<a href="#">
								세금계산서/증빙
							</a>
						</li>
						<li>
							<a href="#">
								기타
							</a>
						</li>
						<li>
							<a href="#">
								eBook
							</a>
						</li>
						<li>
							<a href="#">
								중고장터
							</a>
						</li>
						<li>
							<a href="#">
								POD 주문형출판
							</a>
						</li>
						<li>
							<a href="#">
								PubPle(퍼플)
							</a>
						</li>
						<li>
							<a href="#">
								sam
							</a>
						</li>
						<li>
							<a href="#">
								북모닝
							</a>
						</li>
					</ul>
					<!-- 1:1 문의 목록 -->
					<h3 id="one-to-one">
						<a href="#">
							1:1문의
						</a>
					</h3>
					<ul id="one-to-one-question">
						<li>
							<% 
	                    	if (session.getAttribute("id")  == null) { 
	                		%>
							<a href="${pageContext.request.contextPath}/login">
								1:1 문의 접수
							</a>
							<%
	                    	}else{
							%>
							<a href="${pageContext.request.contextPath}/one_to_one_question">
								1:1 문의 접수
							</a>
							<%
	                    	}
							%>
						</li>
						<li>
							<% 
	                    	if (session.getAttribute("id")  == null) { 
	                		%>
							<a href="${pageContext.request.contextPath}/login">
								1:1 문의 내역
							</a>
							<%
	                    	}else{
							%>
							<a href="${pageContext.request.contextPath}/one_to_one_list">
								1:1 문의 내역
							</a>
							<%
	                    	}
							%>
						</li>
					</ul>
					<h3 id="notice">
						<a href="${pageContext.request.contextPath}/board/notice">
							공지사항
						</a>
					</h3>
					<h3 id="user">
						<a href="${pageContext.request.contextPath}/board/user">
							회원게시판
						</a>
					</h3>
					<h3 id="tax">
						<a href="#">
							세금계산서 신청/내역
						</a>
					</h3>
					<h3 id="law">
						<a href="#">
							법인회원 대량주문 안내
						</a>
					</h3>
				</div>
				<div id="contents-right">
					<div id="head">
						<span id="head-top">
							<h1>무엇을 도와드릴까요?</h1>
						</span>
						
						<span id="head-bottom">
							<h1>
								교보문고 고객센터입니다.
								<button>핫트랙스 고객센터</button>
							</h1>
						</span>
					</div>
					
					<div id="question-many">
						<span id="head">
							<h1>
								자주묻는 질문
								<a href="">더보기</a>
							</h1>
						</span>
						<span id="contents">
							<span>
								<input type="text"/>
								<button>검색</button>
							</span>
						</span>
						<span id="menu">
							<span id="list-box">
								<ul>
									<li>
										<a href="#">BEST10</a>
									</li>
									<li>
										<a href="#">반품/교환/환불</a>
									</li>
									<li>
										<a href="#">주문/결제</a>
									</li>
									<li>
										<a href="#">배송/수령일 안내</a>
									</li>
									<li>
										<a href="#">eBook</a>
									</li>
									<li>
										<a href="#">도서/상품정보/교과서</a>
									</li>
									<li>
										<a href="#">중고장터</a>
									</li>
								</ul>
							</span>
						</span>
					</div>
					
					<div id="question-each">
						<h1>1:1 문의</h1>
						
						<div id="cont">
							<div id="left">
							
							</div>
							<div id="mid">
							
							</div>
							<div id="right">
							
							</div>
						</div>
					</div>
					
					<div id="notice">
						<div>
							<span>공지사항</span>
							<a href="#">더보기</a>
						</div>
						<div>
						
						</div>
					</div>
					
					<div id="publisher-contact">
						<span id="input-box">
							<b>출판사 연락처 안내</b>
							<input type="text"
							placeholder="출판사명 또는 ISBN-13을 입력해 보세요"/>
						</span>
					</div>
					
					<div id="service-quick-menu">
						<h1>서비스 바로가기</h1>
						<div>
							<ul>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_01_36x36@2x.png"/>
										</span>
										기프트 카드 안내
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_02_36x36@2x.png"/>
										</span>
										회원정보 수정
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_03_36x36@2x.png"/>
										</span>
										매장안내
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_04_36x36@2x.png"/>
										</span>
										영수증 후 적립
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_05_36x36@2x.png"/>
										</span>
										문화공간
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_06_36x36@2x.png"/>
										</span>
										혜택/포인트
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_07_36x36@2x.png"/>
										</span>
										회원 등급별 혜택
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_08_36x36@2x.png"/>
										</span>
										라이브러리
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_09_36x36@2x.png"/>
										</span>
										신규 회원 혜택
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_10_36x36@2x.png"/>
										</span>
										세금계산서 신청/내역
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_11_36x36@2x.png"/>
										</span>
										아이디/비밀번호 찾기
									</a>
								</li>
								<li>
									<a href="">
										<span>
											<img src="${pageContext.request.contextPath}/resources/images/customer_center/ico_shortcut_12_36x36@2x.png"/>
										</span>
										법인회원 대량주문안내
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer id="footer"> 
			<div id="footer-inner">
				<div id="footer-left">
					<div id="logo">
						<img src="${pageContext.request.contextPath}/resources/images/footer/img_logo_kyobo_footer.png" alt="로고">
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
									<img src="${pageContext.request.contextPath}/resources/images/footer/btn_footer_sns_youtube.png" alt="유튜브"/>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="${pageContext.request.contextPath}/resources/images/footer/btn_footer_sns_fb.png" alt="페이스북"/>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="${pageContext.request.contextPath}/resources/images/footer/btn_footer_sns_insta.png" alt="인스타그램"/>
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
							<img src="${pageContext.request.contextPath}/resources/images/footer/img_mark_isms.png" alt="isms로고"/>
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