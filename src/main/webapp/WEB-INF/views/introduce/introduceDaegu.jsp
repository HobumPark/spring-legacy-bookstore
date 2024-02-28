<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대구점 소개</title>
<link href="resources/css/common/header.css" type="text/css" rel="stylesheet">
<link href="resources/css/introduce/introduceDaegu.css" type="text/css" rel="stylesheet">
<link href="resources/css/common/footer.css" type="text/css" rel="stylesheet">
</head>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=3a56e34811149329c6c86d9f12089fa6&libraries=services,clusterer"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		tab_fixed()
		floorTab()
	})
	
	function tab_fixed(){
		$(window).scroll(function(){
			//console.log('scroll!')
			var sc_top=$(window).scrollTop();
			console.log(sc_top)
			if(sc_top>=860){
				$("#daegu-tab>#tab-btn").css({
					position:"fixed",
					top:"0px",
					zIndex:2
				})
			}else{
				$("#daegu-tab>#tab-btn").css({
					position:"static",
					zIndex:2,
					top:"0px"
				})
			}
		})
	}
	
	function floorTab(){
		$("#floor1-btn").click(function(){
			//alert("floor1!")	
			$("#inner-info-tab-btn>button").removeClass("active")
			$("#floor1-btn").addClass("active")
			$("#inner-info-tab-contents>div").hide()
			$("#inner-info-tab-contents>div").eq(0).show()
			$("#inner-info-desc>div").hide()
			$("#inner-info-desc>div").eq(0).show()
			
		})
		
		$("#floor2-btn").click(function(){
			//alert("floor2!")	
			$("#inner-info-tab-btn>button").removeClass("active")
			$("#floor2-btn").addClass("active")
			$("#inner-info-tab-contents>div").hide()
			$("#inner-info-tab-contents>div").eq(1).show()
			$("#inner-info-desc>div").hide()
			$("#inner-info-desc>div").eq(1).show()
			
		})
		
		$("#floor3-btn").click(function(){
			//alert("floor3!")	
			$("#inner-info-tab-btn>button").removeClass("active")
			$("#floor3-btn").addClass("active")
			$("#inner-info-tab-contents>div").hide()
			$("#inner-info-tab-contents>div").eq(2).show()
			$("#inner-info-desc>div").hide()
			$("#inner-info-desc>div").eq(2).show()
			
		})
	}
	
</script>
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
										<li><a href="#">대구점</a></li>
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
					<a href="./signup">회원가입</a> <a href="#">출석체크</a> <a href="#">고객센터</a>
					<a href="#">주문배송</a> <a href="./basket">장바구니</a>
				</div>
			</div>
			<div id="header-bottom">
				<div id="logo">
					<a href="${pageContext.request.contextPath}/"> 
					<img src="${pageContext.request.contextPath}/resources/images/home/logo_kyobo.png"
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
			<div id="daegu-introduce">
				<div id="daegu-desc">
					<div id="head">
						<h1>대구점</h1>
						<span id="concern">
							<img src="${pageContext.request.contextPath}/resources/images/introduce/ico_star.png"
										alt="별모양 아이콘">
						</span>
					</div>
					<div id="mid">
						<ul>
							<li>매장주소</li>
							<li>대구광역시 중구 국채보상로 586, 교보생명빌딩 1~3층</li>
						</ul>
						<br/><br/>
						<ul>
							<li>영업시간</li>
							<li>10:00 ~ 22:00</li>
						</ul>
						<br/><br/>
						<ul>
							<li>휴점</li>
							<li>설(당일), 추석(당일)</li>
						</ul>
					</div>
					<div id="bottom">
						<button id="map-button">지도보기</button>
						<button id="inquire-button">매장문의 1544-9000</button>
					</div>
				</div>
				<div id="daegu-image-area">
					<img src="${pageContext.request.contextPath}/resources/images/introduce/kyobo_daegu.png"
										alt="교보문고 대구점 이미지">
				</div>
			</div>
			<div id="daegu-tab">
				<div id="tab-btn">
					<ul>
						<li>오시는길</li>
						<li>내부 안내도</li>
						<li>행사/소식</li>
						<li>시설/서비스</li>
					</ul>
					<div id="search-area">
						<input type="text" placeholder="보유 도서를 검색해보세요"/>
						<button id="search-btn">
						</button>
					</div>
				</div>
				<div id="road">
					<div id="map-area">
						<h1>오시는길</h1>
						<h2>대구광역시 중구 국채보상로 586, 교보생명빌딩 1~3층</h2>
						<div id="map" style="width:90%;height:80%;"></div>
					</div>
					<div id="desc">
						<div id="btn-area">
							<button id="traffic">대중교통 안내</button>
							<button id="parking">주차안내</button>
						</div>
						<div id="desc-area">
							<ul>
								<li>*지하철로 오시려면</li>
								<li>중앙로역 하차 후 2번 출구 1분 거리</li>
							</ul>
							<br/>
							<ul>
								<li>*버스로 오시려면</li>
								<li><span>CGV한일극장 앞 하차 후 3분 거리</span> 급행6, 156, 323-1, 524
								</li>
								<li><span>2.28기념공원 하차 후 5분 거리</span> 급행1, 급행3, 급행5</li>
								<li>234, 240, 309, 424, 518, 650, 724, 909, 939</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="inner-info">
					<h1>매장안내도</h1>
					<div id="inner-info-contents" class="clearfix">
						<div id="inner-info-desc">
							<div>
								<ul>
									<li>
										<span>서가 A</span>
										<span>소설·비소설 / 만화</span>
									</li>
									<li>
										<span>기타</span>
										<span>기타</span>
									</li>
								</ul>
							</div>
							<div>
								<ul>
									<li>
										<span>서가 C</span>
										<span>외국서적</span>
									</li>
									<li>
										<span>서가 D</span>
										<span>외국어·외국어교재·사전·잡지</span>
									</li>
									<li>
										<span>서가 E</span>
										<span>컴퓨터·건강·여행</span>
									</li>
									<li>
										<span>서가 F</span>
										<span>기술·취미·스포츠</span>
									</li>
									<li>
										<span>서가 G</span>
										<span>중고학습·과학·청소년</span>
									</li>
									<li>
										<span>기타</span>
										<span>기타</span>
									</li>
								</ul>	
							</div>
							<div>
								<ul>
									<li>
										<span>서가 H</span>
										<span>경제·경영</span>
									</li>
									<li>
										<span>서가 I</span>
										<span>정치·사회·수험서</span>
									</li>
									<li>
										<span>서가 K</span>
										<span>인문·종교·역사·문화</span>
									</li>
									<li>
										<span>서가 L</span>
										<span>요리·가정생활</span>
									</li>
									<li>
										<span>서가 M</span>
										<span>유아·아동·초등학습·어린이영어</span>
									</li>
									<li>
										<span>기타</span>
										<span>기타</span>
									</li>
								</ul>	
							</div>
						</div>
						<div id="inner-info-floor">
							<div id="inner-info-tab-btn">
								<button class="active" id="floor1-btn">1F</button>
								<button id="floor2-btn">2F</button>
								<button id="floor3-btn">3F</button>
							</div>
							<div id="inner-info-tab-contents">
								<div>
									<img src="${pageContext.request.contextPath}/resources/images/introduce/floor1.gif"/>
								</div>
								<div>
									<img src="${pageContext.request.contextPath}/resources/images/introduce/floor2.png"/>
								</div>
								<div>
									<img src="${pageContext.request.contextPath}/resources/images/introduce/floor3.gif"/>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="festival">
					<div id="festival-head">
						<h1>이벤트&공지사항</h1>
						<span>
							<a href="#">
								더보기
								<img src="${pageContext.request.contextPath}/resources/images/introduce/ico_plus_h10_bold@2x.png"/>
							</a>
						</span>
					</div>
					
					<div id="festival-contents">
						<ul>
							<li id="festival-contents-header">
								<a href="#">
									<span>제목</span>
									<span>분류</span>
									<span>행사일자</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span>1</span>
									<span>교보문고 시그니처 독서대 할인 이벤트</span>
									<span>일반행사</span>
									<span>2023.03.01 ~ 2023.03.14</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span>2</span>
									<span>*청소년이벤트*</span>
									<span>일반행사</span>
									<span>2023.02.28 ~ 2023.03.20</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span>3</span>
									<span>☆신학기 교재는 교보문고에서!☆</span>
									<span>일반행사</span>
									<span>2023.02.28 ~ 2023.03.20</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span>4</span>
									<span>2023년 제4회 책 읽는 대구 '독서 마라톤 대회'</span>
									<span>일반행사</span>
									<span>2023.02.28 ~ 2023.03.20</span>
								</a>
							</li>
							<li>
								<a href="#">
									<span>5</span>
									<span>★청소년을 위한 쿠폰도장콩콩★</span>
									<span>일반행사</span>
									<span>2023.02.28 ~ 2023.03.20</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div id="service">
					<div id="service-head">
						<h1>매장서비스</h1>
						
					</div>
					
					<div id="service-contents">
					
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
<script>
//35.87055°N 128.59472°E - 교보문고
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(35.87055, 128.59472), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
 	// 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(35.87055, 128.59472); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
 // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
    var mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
</script>
</html>