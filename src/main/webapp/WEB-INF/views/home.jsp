<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
<link href="resources/css/home/home.css" type="text/css" rel="stylesheet">
<link href="resources/css/home/slide.css" type="text/css" rel="stylesheet">
<link href="resources/css/home/contents.css" type="text/css" rel="stylesheet">
<link href="resources/css/common/header.css" type="text/css" rel="stylesheet">
<link href="resources/css/common/footer.css" type="text/css" rel="stylesheet">
<link href="resources/css/home/popup.css" type="text/css" rel="stylesheet">
<!-- 슬라이드 관련 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<script>
	$(document).ready(function(){
		search_detach()//검색창 분리
		header_slide()
		market_hover()
		slide_tab()
		slide_text_tab()
		best_steady_contents_tab()//베스트,스테디셀러 탭
		event_tab()//이벤트 탭 동작
		event_tab_slide01()//이벤트 탭 슬라이드1
		event_tab_slide02()//이벤트 탭 슬라이드2
		m_slide()//4장 슬라이드
		popup_close()//팝업창 닫기
	})
	
	function search_detach(){
		$(window).scroll(function(){
			var sc_top=$(window).scrollTop()
			if(sc_top>=150){
				$("#header-bottom").css({
					"position":"fixed",
					"top":"0px",
					"z-index":"2",
					"margin-left": "calc((100% - 1200px) / 2)"
				})	
			}else{
				$("#header-bottom").css({
					"position":"static",
				})
			}
		})
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
	
	function slide_tab(){
		var idx=0
	    $("#tab-btn-area>#tab-btn-inner>ul>li").hover(function(){
	    	idx=$(this).index()
	    	//alert("hover!:"+idx)
	    	$("#slide>#tab-contents>div").hide()
	    	$("#slide>#tab-contents>div").eq(idx).show()
	   		    	
	    })
	}

	
	function slide_text_tab(){
		var idx=0
		var slide_idx=0
		var slide_length=2
	    $("#search-text-slide>#btn-area>img").click(function(){
	    	idx=$(this).index()
	    	alert("click!:"+idx)
	    	
	    	if(idx==0){
	    		slide_idx--;
	    	}else if(idx==1){
	    		slide_idx++;
	    	}
	    	
	    	if(slide_idx >= slide_length){
	    		slide_idx=0
	    	}
	   		    	
	    	$("#search-text-slide>#slide-area>div").hide()
	    	$("#search-text-slide>#slide-area>div").eq(slide_idx).show()
	    })
	}
	
//베스트-스테디 컨텐츠 탭메뉴 동작

function best_steady_contents_tab(){
	var tab_btn="#contents-mid-inner>#tab>#tab-btn>button"
	var tab_contents="#contents-mid-inner>#tab>#tab-contents>div"
	$(tab_btn).click(function(){
		//alert("탭버튼 클릭")
		const idx = $(this).index()
		//alert(idx)
		$(tab_contents).hide()
		$(tab_contents).eq(idx).show()
		
		$(tab_btn).removeClass("active")
		$(tab_btn).eq(idx).addClass("active")
	})
}

//이벤트 탭 (슬라이드 포함된 탭)
function event_tab(){
	var tab_btn = "#contents-bottom-slide02>#tab>#tab-btn>button"
	var tab_contents="#contents-bottom-slide02>#tab>#tab-contents>div"
	
	$(tab_btn).click(function(){
		var idx = $(this).index()
		//alert(idx)
		$(tab_btn).removeClass("bottom_slide02_active")
		$(tab_btn).eq(idx-1).addClass("bottom_slide02_active")	
		$(tab_contents).hide()
		$(tab_contents).eq(idx-1).show()
		if(idx==1){
			kyoboSlider.reloadSlider();
		}else if(idx==2){
			ebookSlider.reloadSlider();
		}
	})
}
var kyoboSlider;
var ebookSlider;
function event_tab_slide01(){
	kyoboSlider=$("#kyobo-slide").bxSlider({
		pager:false
	});
}
function event_tab_slide02(){
	ebookSlider=$("#ebook-slide").bxSlider({
		pager:false
	});
}
function m_slide(){
	$("#m-slide").bxSlider({
		 minSlides: 4,
		 maxSlides: 4,
		 moveSlides: 1,
		 slideWidth: 300,
		 pager:false
	});
}

function popup_close(){
	
	if( $.cookie('popup_cookie') === 'ok'){
        //popup_cookie라는 이름의 쿠키의 값이 ok라면
        //쿠키가 존재하면?
        $("#popup").hide()
    }
		
	
	$("#popup>.icon_close_white").click(function(){
		$("#dialog-background").show()
	})
	
	$("#dialog #cancel").click(function(){
		$("#dialog-background").hide()
		$("#popup").stop().animate({"bottom":"-200px"},1500,function(){
			$("#popup").hide()
		})
	})
	
	$("#dialog #confirm").click(function(){
		$("#dialog-background").hide()
		$("#popup").stop().animate({"bottom":"-200px"},1500,function(){
			$("#popup").hide()
			//1일간 유지되는 쿠키 생성
			$.cookie('popup_cookie','ok',{
            expires:1,
            path:'/'
        	})
		})
	})
}

function queryChange(){
	console.log('queryChange');
	var searchWord = document.getElementById("searchText").value;
    console.log(searchWord);
    
    $.ajax({
        url:"recommend_search_word",
        type:"get",
        async : false,
        data:{
        	searchWord: searchWord,
             },
        success : function(data) {
        	console.log("success");
        	console.log(data);
        },
        error : function() {
        	console.log("error");
    	}
     }).done(function(){
    	 	console.log("done");
     })
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
										<li><a href="${pageContext.request.contextPath}/daegu">대구점</a></li>
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
								id="searchText" onkeyup="queryChange()" />
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
		<div id="slide">

			<div id="tab-contents">
				<div>
					<div id="contents-wrap">
						<div id="contents-introduce">
							<img src="${pageContext.request.contextPath}/resources/images/contents_wrap/these_days_book.jpg"
										alt="요즘이책">
						</div>
						<div id="ad-area">
							<div id="ad-left">
								<div id="ad-left-top">
									<img src="${pageContext.request.contextPath}/resources/images/home/slide/title_bookcast.gif"
										alt="상단광고">
								</div>
								<div id="ad-left-mid">
									<span id="image-box"> <img
										src="${pageContext.request.contextPath}/resources/images/home/slide/bn_10.jpg" alt="이미지">
									</span>
									<h1>춤을 추면 자존감이 높아진다?</h1>
									<h2>걷고 뛰고 춤춰라!</h2>
								</div>
								<div id="ad-left-bottom">
									<ul>
										<li><a href="#">공부가 취미가 된 할머니</a></li>
										<li><a href="#">우리에겐 여전히 친구가 중요하다</a></li>
										<li><a href="#">파리, 세 마리 위험하다!</a></li>
										<li><a href="#">부모를 돌본다는 것</a></li>
									</ul>
								</div>
							</div>

							<div id="ad-right">
								<div id="ad-right-top">
									<img src="${pageContext.request.contextPath}/resources/images/home/slide/bnE_03.jpg" alt="상단광고">
								</div>
								<div id="ad-right-bottom">
									<img
										src="${pageContext.request.contextPath}/resources/images/home/slide/1641945955673_220112.jpg"
										alt="하단광고">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div id="contents-wrap">
						<div id="contents-introduce">
							<img src="./resources/images/contents_wrap/hot_issue.jpg"
										alt="요즘이책">
						</div>
						<div id="ad-area">
							<div id="ad-left">
								<div id="ad-left-top">
									<img src="./resources/images/home/slide/title_bookcast.gif"
										alt="상단광고">
								</div>
								<div id="ad-left-mid">
									<span id="image-box"> <img
										src="./resources/images/home/slide/bn_10.jpg" alt="이미지">
									</span>
									<h1>춤을 추면 자존감이 높아진다?</h1>
									<h2>걷고 뛰고 춤춰라!</h2>
								</div>
								<div id="ad-left-bottom">
									<ul>
										<li><a href="#">공부가 취미가 된 할머니</a></li>
										<li><a href="#">우리에겐 여전히 친구가 중요하다</a></li>
										<li><a href="#">파리, 세 마리 위험하다!</a></li>
										<li><a href="#">부모를 돌본다는 것</a></li>
									</ul>
								</div>
							</div>

							<div id="ad-right">
								<div id="ad-right-top">
									<img src="./resources/images/home/slide/bnE_03.jpg" alt="상단광고">
								</div>
								<div id="ad-right-bottom">
									<img
										src="./resources/images/home/slide/1641945955673_220112.jpg"
										alt="하단광고">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div id="contents-wrap">
						<div id="contents-introduce">
							<img src="./resources/images/contents_wrap/new_book.jpg"
										alt="새로나온책">
						</div>
						<div id="ad-area">
							<div id="ad-left">
								<div id="ad-left-top">
									<img src="./resources/images/home/slide/title_bookcast.gif"
										alt="상단광고">
								</div>
								<div id="ad-left-mid">
									<span id="image-box"> <img
										src="./resources/images/home/slide/bn_10.jpg" alt="이미지">
									</span>
									<h1>춤을 추면 자존감이 높아진다?</h1>
									<h2>걷고 뛰고 춤춰라!</h2>
								</div>
								<div id="ad-left-bottom">
									<ul>
										<li><a href="#">공부가 취미가 된 할머니</a></li>
										<li><a href="#">우리에겐 여전히 친구가 중요하다</a></li>
										<li><a href="#">파리, 세 마리 위험하다!</a></li>
										<li><a href="#">부모를 돌본다는 것</a></li>
									</ul>
								</div>
							</div>

							<div id="ad-right">
								<div id="ad-right-top">
									<img src="./resources/images/home/slide/bnE_03.jpg" alt="상단광고">
								</div>
								<div id="ad-right-bottom">
									<img
										src="./resources/images/home/slide/1641945955673_220112.jpg"
										alt="하단광고">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div id="contents-wrap">
						<div id="contents-introduce">
							<img src="./resources/images/contents_wrap/plan.jpg"
										alt="기획/테마">
						</div>
						<div id="ad-area">
							<div id="ad-left">
								<div id="ad-left-top">
									<img src="./resources/images/home/slide/title_bookcast.gif"
										alt="상단광고">
								</div>
								<div id="ad-left-mid">
									<span id="image-box"> <img
										src="./resources/images/home/slide/bn_10.jpg" alt="이미지">
									</span>
									<h1>춤을 추면 자존감이 높아진다?</h1>
									<h2>걷고 뛰고 춤춰라!</h2>
								</div>
								<div id="ad-left-bottom">
									<ul>
										<li><a href="#">공부가 취미가 된 할머니</a></li>
										<li><a href="#">우리에겐 여전히 친구가 중요하다</a></li>
										<li><a href="#">파리, 세 마리 위험하다!</a></li>
										<li><a href="#">부모를 돌본다는 것</a></li>
									</ul>
								</div>
							</div>

							<div id="ad-right">
								<div id="ad-right-top">
									<img src="./resources/images/home/slide/bnE_03.jpg" alt="상단광고">
								</div>
								<div id="ad-right-bottom">
									<img
										src="./resources/images/home/slide/1641945955673_220112.jpg"
										alt="하단광고">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div id="contents-wrap">
						<div id="contents-introduce">
							<img src="./resources/images/contents_wrap/ebook.jpg"
										alt="ebook">
						</div>
						<div id="ad-area">
							<div id="ad-left">
								<div id="ad-left-top">
									<img src="./resources/images/home/slide/title_bookcast.gif"
										alt="상단광고">
								</div>
								<div id="ad-left-mid">
									<span id="image-box"> <img
										src="./resources/images/home/slide/bn_10.jpg" alt="이미지">
									</span>
									<h1>춤을 추면 자존감이 높아진다?</h1>
									<h2>걷고 뛰고 춤춰라!</h2>
								</div>
								<div id="ad-left-bottom">
									<ul>
										<li><a href="#">공부가 취미가 된 할머니</a></li>
										<li><a href="#">우리에겐 여전히 친구가 중요하다</a></li>
										<li><a href="#">파리, 세 마리 위험하다!</a></li>
										<li><a href="#">부모를 돌본다는 것</a></li>
									</ul>
								</div>
							</div>

							<div id="ad-right">
								<div id="ad-right-top">
									<img src="./resources/images/home/slide/bnE_03.jpg" alt="상단광고">
								</div>
								<div id="ad-right-bottom">
									<img
										src="./resources/images/home/slide/1641945955673_220112.jpg"
										alt="하단광고">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div id="contents-wrap">
						<div id="contents-introduce">
							<img src="./resources/images/contents_wrap/sam.jpg"
										alt="sam">
						</div>
						<div id="ad-area">
							<div id="ad-left">
								<div id="ad-left-top">
									<img src="./resources/images/home/slide/title_bookcast.gif"
										alt="상단광고">
								</div>
								<div id="ad-left-mid">
									<span id="image-box"> <img
										src="./resources/images/home/slide/bn_10.jpg" alt="이미지">
									</span>
									<h1>춤을 추면 자존감이 높아진다?</h1>
									<h2>걷고 뛰고 춤춰라!</h2>
								</div>
								<div id="ad-left-bottom">
									<ul>
										<li><a href="#">공부가 취미가 된 할머니</a></li>
										<li><a href="#">우리에겐 여전히 친구가 중요하다</a></li>
										<li><a href="#">파리, 세 마리 위험하다!</a></li>
										<li><a href="#">부모를 돌본다는 것</a></li>
									</ul>
								</div>
							</div>

							<div id="ad-right">
								<div id="ad-right-top">
									<img src="./resources/images/home/slide/bnE_03.jpg" alt="상단광고">
								</div>
								<div id="ad-right-bottom">
									<img
										src="./resources/images/home/slide/1641945955673_220112.jpg"
										alt="하단광고">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div id="contents-wrap">
						<div id="contents-introduce">
							<img src="./resources/images/contents_wrap/hot_trax.jpg"
										alt="hot_trax">
						</div>
						<div id="ad-area">
							<div id="ad-left">
								<div id="ad-left-top">
									<img src="./resources/images/home/slide/title_bookcast.gif"
										alt="상단광고">
								</div>
								<div id="ad-left-mid">
									<span id="image-box"> <img
										src="./resources/images/home/slide/bn_10.jpg" alt="이미지">
									</span>
									<h1>춤을 추면 자존감이 높아진다?</h1>
									<h2>걷고 뛰고 춤춰라!</h2>
								</div>
								<div id="ad-left-bottom">
									<ul>
										<li><a href="#">공부가 취미가 된 할머니</a></li>
										<li><a href="#">우리에겐 여전히 친구가 중요하다</a></li>
										<li><a href="#">파리, 세 마리 위험하다!</a></li>
										<li><a href="#">부모를 돌본다는 것</a></li>
									</ul>
								</div>
							</div>

							<div id="ad-right">
								<div id="ad-right-top">
									<img src="./resources/images/home/slide/bnE_03.jpg" alt="상단광고">
								</div>
								<div id="ad-right-bottom">
									<img
										src="./resources/images/home/slide/1641945955673_220112.jpg"
										alt="하단광고">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="tab-btn-area">
				<div id="tab-btn-inner">
					<ul>
						<li><a href="#">요즘 이 책</a></li>
						<li><a href="#">핫이슈</a></li>
						<li><a href="#">새로나온책</a></li>
						<li><a href="#">기획/테마</a></li>
						<li><a href="#">ebook</a></li>
						<li><a href="#">sam</a></li>
						<li><a href="#">한정특가</a></li>
					</ul>
				</div>

			</div>

		</div>
		<div id="contents">
			<div id="contents-top">
				<div id="contents-top-first">
					<div id="contents-top-first-inner">
						<div id="left">
							<img src="./resources/images/home/contents/W_left.jpg" alt="왼쪽">
						</div>
						<div id="mid">
							<img src="./resources/images/home/contents/mid.png" alt="가운데">
						</div>
						<div id="right">
							<img src="./resources/images/home/contents/welcome.jpg" alt="오른쪽">
						</div>
					</div>
				</div>
				<div id="contents-top-second">
					<div id="contents-top-second-inner">
						<div id="left">
							<img src="./resources/images/home/contents/bnO_01.jpg" alt="왼쪽">
						</div>
						<div id="mid">
							<img src="./resources/images/home/contents/bnK_w02.jpg" alt="왼쪽">
						</div>
						<div id="right">
							<img src="./resources/images/home/contents/bnG_w02.jpg" alt="왼쪽">
						</div>
					</div>
				</div>
			</div>
			<div id="contents-mid">
				<div id="contents-mid-inner">
					<div id="tab">
						<div id="tab-btn">
							<button id="best-btn" class="active">베스트</button>
							<button id="steady-btn">스테디</button>
						</div>
						<div id="tab-contents">
							<div id="best-contents">
								<div id="best-contents-row01">
									<div>
										<span id="rank">1</span>
										<img src="./resources/images/home/best_steady/best01.jpg" alt="베스트셀러">
										<span>생에 감사해</span>
										<span>김혜자 수오서재</span>
									</div>
									<div>
									    <span id="rank">2</span>
										<img src="./resources/images/home/best_steady/best02.jpg" alt="베스트셀러">
										<span>2023 해커스 산업안전기사 산업기사 실기 필수이론+최신 기술문제</span>
										<span>이성찬 챔프스터디</span>
									</div>
									<div>
										<span id="rank">3</span>
										<img src="./resources/images/home/best_steady/best03.jpg" alt="베스트셀러">
										<span>만일 내가 인생을 다시 산다면(10만 부 기념 스페셜 에디션)</span>
										<span>김혜남 메이븐</span>
									</div>
									<div>
										<span id="rank">4</span>
										<img src="./resources/images/home/best_steady/best04.jpg" alt="베스트셀러">
										<span>The Scent of Page : 룸 스프레이 60ml</span>
										<span>교보문고 교보문고</span>
									</div>
									<div>
										<span id="rank">5</span>
										<img src="./resources/images/home/best_steady/best05.jpg" alt="베스트셀러">
										<span>원씽(The One Thing)(리커버리 특별판)</span>
										<span>게리 켈러 외 비즈니스 북스</span>
									</div>
								</div>
								<div id="best-contents-row02">
									<div>
										<span id="rank">6</span>
										<img src="./resources/images/home/best_steady/best06.jpg" alt="베스트셀러">
										<span>미스터 프레지던트</span>
										<span>탁현민 메디치미디어</span>
									</div>
									<div>
										<span id="rank">7</span>
										<img src="./resources/images/home/best_steady/best07.jpg" alt="베스트셀러">
										<span>윤혜정의 개념의 나비효과 입문 편</span>
										<span>윤혜정 EBS한국교육방송공사</span>
									</div>
									<div>
										<span id="rank">8</span>
										<img src="./resources/images/home/best_steady/best08.jpg" alt="베스트셀러">
										<span>트렌드 코리아 2023</span>
										<span>김난도 외 미래창</span>
									</div>
									<div>
										<span id="rank">9</span>
										<img src="./resources/images/home/best_steady/best09.jpg" alt="베스트셀러">
										<span>슬램덩크 챔프</span>
										<span>Takehiko Inoue 대원씨아이</span>
									</div>
									<div>
										<span id="rank">10</span>
										<img src="./resources/images/home/best_steady/best10.jpg" alt="베스트셀러">
										<span>심리학이 제갈량에게 말하다1</span>
										<span>천위안 리드리드출판</span>
									</div>
								</div>
							</div>
							<div id="steady-contents">
								<div id="steady-contents-row01">
									<div>
										<span id="rank">1</span>
										<img src="./resources/images/home/best_steady/steady01.jpg" alt="스테디셀러">
										<span>디 에센셜:장미의 이름(완전판)</span>
										<span>움베르토 에코 열린책들</span>
									</div>
									<div>
										<span id="rank">2</span>
										<img src="./resources/images/home/best_steady/steady02.jpg" alt="스테디셀러">
										<span>참을수 없는 존재의 가벼움</span>
										<span>밀란쿤데라 민음사</span>
									</div>
									<div>
										<span id="rank">3</span>
										<img src="./resources/images/home/best_steady/steady03.jpg" alt="스테디셀러">
										<span>인듀어런스</span>
										<span>캐롤라인 알렉산더 뜨인돌 출판사</span>
									</div>
									<div>
										<span id="rank">4</span>
										<img src="./resources/images/home/best_steady/steady04.jpg" alt="스테디셀러">
										<span>해커스 토익 기출보카 TOEIC VOCA(토익보카) 단어장</span>
										<span>David Cho · 해커스어학연구소</span>
									</div>
									<div>
										<span id="rank">5</span>
										<img src="./resources/images/home/best_steady/steady05.jpg" alt="스테디셀러">
										<span>마플시너지 고등 수학1 내신대비 문제집(2022)</span>
										<span>임정선 · 희망에듀</span>
									</div>
								</div>
								<div id="steady-contents-row02">
									<div>
										<span id="rank">6</span>
										<img src="./resources/images/home/best_steady/steady06.jpg" alt="스테디셀러">
										<span>원씽(The One Thing)(리커버 특별판)</span>
										<span>게리 켈러 외 · 비즈니스북스</span>
									</div>
									<div>
										<span id="rank">7</span>
										<img src="./resources/images/home/best_steady/steady07.jpg" alt="스테디셀러">
										<span>레버리지</span>
										<span>롭 무어 · 다산북스</span>
									</div>
									<div>
										<span id="rank">8</span>
										<img src="./resources/images/home/best_steady/steady08.jpg" alt="스테디셀러">
										<span>부자 아빠 가난한 아빠 1(20주년 특별 기념판)</span>
										<span>로버트 기요사키 · 민음인</span>
									</div>
									<div>
										<span id="rank">9</span>
										<img src="./resources/images/home/best_steady/steady09.jpg" alt="스테디셀러">
										<span>데일 카네기 인간관계론</span>
										<span>데일 카네기 · 현대지성</span>
									</div>
									<div>
										<span id="rank">10</span>
										<img src="./resources/images/home/best_steady/steady10.jpg" alt="스테디셀러">
										<span>EBS 50일 고등 수학(상)(2023)</span>
										<span>EBS 편집부 · EBS한국교육방송공사</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="contents-bottom">
				<div id="contents-bottom-slide01">
					<div id="m-slide">
						<div>
							<span>
								<img src="./resources/images/home/mslide/m_slide01.jpg" alt="여러장슬라이드">
								<b>텍스트1</b>
							</span>
						</div>
						<div>
							<span>
								<img src="./resources/images/home/mslide/m_slide02.jpg" alt="여러장슬라이드">
								<b>텍스트2</b>
							</span>
						</div>
						<div>
							<span>
								<img src="./resources/images/home/mslide/m_slide03.jpg" alt="여러장슬라이드">
								<b>텍스트3</b>
							</span>
						</div>
						<div>
							<span>
								<img src="./resources/images/home/mslide/m_slide04.jpg" alt="여러장슬라이드">
								<b>텍스트4</b>
							</span>
						</div>
						<div>
							<span>
								<img src="./resources/images/home/mslide/m_slide05.jpg" alt="여러장슬라이드">\
								<b>텍스트5</b>
							</span>
						</div>
						<div>
							<span>
								<img src="./resources/images/home/mslide/m_slide06.jpg" alt="여러장슬라이드">
								<b>텍스트6</b>
							</span>
						</div>
					</div>
				</div>
				<div id="contents-bottom-slide02">
					<div id="tab">
						<div id="tab-btn">
							<h1>이벤트</h1>
							<button class="bottom_slide02_active">교보문고</button>
							<button>ebook</button>
							<a href="#" id="see-more">
								<span>더보기</span>
								<span class="icon_plus"></span>
							</a>
						</div>
						<div id="tab-contents">
							<div id="kyobo">
								<div id="kyobo-slide">
									<div>
										<img src="./resources/images/home/event/kyobo/kyobo01.jpg" alt="교보">
									</div>
									<div>
										<img src="./resources/images/home/event/kyobo/kyobo02.jpg" alt="교보">
									</div>
									<div>
										<img src="./resources/images/home/event/kyobo/kyobo03.jpg" alt="교보">
									</div>
									<div>
										<img src="./resources/images/home/event/kyobo/kyobo04.jpg" alt="교보">
									</div>
									<div>
										<img src="./resources/images/home/event/kyobo/kyobo05.jpg" alt="교보">
									</div>
								</div>
							</div>
							<div id="ebook">
								<div id="ebook-slide">
									<div>
										<img src="./resources/images/home/event/ebook/ebook01.jpg" alt="교보">
									</div>
									<div>
										<img src="./resources/images/home/event/ebook/ebook02.jpg" alt="교보">
									</div>
									<div>
										<img src="./resources/images/home/event/ebook/ebook03.jpg" alt="교보">
									</div>
									<div>
										<img src="./resources/images/home/event/ebook/ebook04.jpg" alt="교보">
									</div>
									<div>
										<img src="./resources/images/home/event/ebook/ebook05.jpg" alt="교보">
									</div>
								</div>
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
	<div id="popup">
		<img src="./resources/images/home/popup/welcomepopup.png" alt="웰컴팝업"/>
		<span class="icon_close_white"></span>
	</div>
	<div id="dialog-background">
		<div id="dialog">
			<h1>오늘 하루 그만 보시겠습니까?</h1>
			<div id="btn-wrap">
				<button id="cancel">취소</button>
				<button id="confirm">확인</button>
			</div>
		</div>
	</div>
	<div id='goto-top'>
	
	</div>
</body>
</html>
