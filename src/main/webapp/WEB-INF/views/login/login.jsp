<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="resources/css/common/header.css" type="text/css"
	rel="stylesheet">
<link href="resources/css/login/login.css" type="text/css" rel="stylesheet">
<link href="resources/css/common/footer.css" type="text/css" rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script>
	$(document).ready(function(){
		market_hover()
		header_slide()
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
	
	function header_slide(){
		var currentSlide=1;
		$(".prev").click(function(){
			//alert("prev!")
			if(currentSlide-1 <= 0){
				currentSlide=5
			}else{
				currentSlide-=1
			}
			
			$("#current-slide").text(currentSlide)
			$("#tab>img").hide()
			$("#tab>img").eq(currentSlide-1).show()
		})
		$(".next").click(function(){
			//alert("next!")
			if(currentSlide+1 > 5){
				currentSlide=1
			}else{
				currentSlide+=1
			}
			$("#current-slide").text(currentSlide)
			$("#tab>img").hide()
			$("#tab>img").eq(currentSlide-1).show()
		})
	}
	
</script>
</head>
<body>
	<div id="wrap">
		<div id="ad_top">
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
										<li><a href="${pageContext.request.contextPath}/daegu">대구점</a></li>
									</ul>
								</div>
							</div></li>
						<li><a href="#">회원혜택</a></li>
						<li><a href="#">Prestige Lounge</a></li>
					</ul>
				</div>
				<div id="header-top-right">
					<a href="${pageContext.request.contextPath}/login">로그인</a>
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
				<nav id="search">
					<form action="${pageContext.request.contextPath}/search">
						<div id="search-input-area">
							<input type="text" placeholder="홍춘욱의 돈의 신호를 포착하는 방법" name="searchText"
								id="searchText" />
						</div>
						<input type="submit" value="" id="search-btn" /> 
						<input type="hidden" placeholder="1페이지 넘기기" 
							   name="page" id="page" value="1" />
					</form>
					
				</nav>
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
		<div id="nav">
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
		</div>
		<div id="contents">
			<h1>로그인</h1>
			<div id="login-area">
				<div id="login-area-top">
					<div id="login-area-top-left">
						<div id="login-tab">
							<div id="login-tab-btn">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/images/login/title_login.gif" alt="로고"></a>
								<span id="bar"></span>
								<a href="#"><img src="${pageContext.request.contextPath}/resources/images/login/title_login02.gif" alt="로고"></a>
							</div>
							<div id="login-tab-cont">
								<div id="member-login">
									<div id="login-form">
										<form action="${pageContext.request.contextPath}/login" method="post">
											<input type="text" id="id" name="id"
											placeholder="아이디를 대/소문자를 구분하여 입력하세요">
											<input type="password" id="pw" name="pw"
											placeholder="비밀번호를 대/소문자를 구분하여 입력하세요">
											<input type="submit" value="로그인" id="login-btn">
										</form>
									</div>
									<div id="login-other1">
										<input type="checkbox">
										<span>아이디 저장</span>
										<span id="bar"></span>
										<span>아이디/비밀번호 찾기</span>
									</div>
									<div id="login-other2">
										<a href="#" id="naver-login">네이버 ID로 <br>가입/로그인</a>
										<a href="${pageContext.request.contextPath}/signup" id="kyobo-signup">교보문고 회원가입</a>
									</div>
								</div>
								<div id="non-member-order-confirm">
								
								</div>
							</div>
						</div>
						<div id="login-tab-bottom">
						
						</div>
					</div>
					<div id="login-area-top-right">
						<img src="${pageContext.request.contextPath}/resources/images/login/bn_323x298.jpg" alt="로고">
					</div>
				</div>
				<div id="login-area-bottom">
					<img src="${pageContext.request.contextPath}/resources/images/login/bnL_01.jpg" alt="로고">
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
							<option>교보생명</option>
							<option>교보증권</option>
							<option>교보정보통신</option>
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
