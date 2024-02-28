<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시글 수정 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/common/header.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common/footer.css" type="text/css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/css/customerCenter/customerCenter.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/board/userBoardUpdate.css" type="text/css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<script>
	$(document).ready(function(){
		
		ckeditorSet()
		fileDelete()
	})
	

	function ckeditorSet(){
		
		var ckeditor_config = {
	            height: 395,
	            enterMode :  CKEDITOR.ENTER_BR.CKEDITOR,
	            shiftEnterMode : CKEDITOR.ENTER_P,
	            filebrowserUploadUrl:''
	    }
		
		CKEDITOR.replace("textarea",ckeditor_config)
	}
	
	function fileDelete(){
		$("#file-delete-btn").click(function(){
			alert("파일 삭제!")
			var fileName=$("#file-name").val()
			alert(fileName)
			
			$.ajax({
			    url:"/db/board/user/file/delete",
				type:"get",
				async : false,
				data : {'fileName' : fileName },
				dataType:'JSON',
			success : function(data) {
				alert(data);
				alert("success");
				$("#file-related").empty()
			},
			error : function() {
			 	alert("error");
			}
			}).done(function(){
				alert("done!")
							 
			})
		})
	}
</script>
</head>
<body>
	<%=(String) session.getAttribute("id")%>
	<%
		String session_id = (String) session.getAttribute("id");
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
					if (session_id == null) {
				%>
					<a href="${pageContext.request.contextPath}/login" id="login-btn">로그인</a>
					<%
					} else {
				%>
					<a href="${pageContext.request.contextPath}/update">회원정보수정</a> <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
					<%
					}
				%>
					<a href="${pageContext.request.contextPath}/signup">회원가입</a> 
					<a href="#">출석체크</a> 
					<a href="#">고객센터</a>
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
							<a href="#">
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
							<a href="#">
								1:1 문의 접수
							</a>
						</li>
						<li>
							<a href="#">
								1:1 문의 내역
							</a>
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
					<div id="user-head">
						<div id="user-head-top">
							<h1>사용자 게시판</h1>
							<div id="btn-group">
								<button id="ebook-btn">eBook 공지사항</button>
								<button id="notice-btn">중고장터 공지사항</button>
							</div>
						</div>
						<div id="user-head-bottom">
							<div id="input-area">
								<input type="text" placeholder="검색어를 검색해 보세요"/>
								<button>검색</button>
							</div>
						</div>
					</div>
					<div id="user-main">
						<div id="user-head">
							<span>
								<b></b>
								건
							</span>
							
							<select>
								<option>전체</option>
								<option>교보문고</option>
								<option>고객센터</option>
							</select>
						</div>
						<div id="user-board">
							<form action="${pageContext.request.contextPath}/board/user/update" method="post">
								<div id="user-title">
									<div id="user-title-top">
										<input type="text" value="${userView.title}" name="title" id="title"/>
										<input type="hidden" value="${userView.no}" name="no" id="no"/>
									</div>
									<div id="user-title-bottom">
										<span>${userView.name}</span>
										<span>${userView.writeDate}</span>
										
										<!-- 
										<a href="#">수정</a>
										<a href="${pageContext.request.contextPath}/board/user/delete?no=${userView.no}">삭제</a>
										 -->
										 <%
										 String session_id2 = session_id ;
									     pageContext.setAttribute("session_id2", session_id) ;
										 %>
										 <span>1:<c:out value="${userView.id}"/></span> <!-- 글쓴이 아이디 -->
										 <span>2:<c:out value="${session_id2}"/></span> <!-- 로그인된 아이디 -->
										 <c:choose>
										    <c:when test="${userView.id==session_id2}">
										        <button id="update-action-btn" type="submit">등록</button>
										    </c:when>    
										    <c:otherwise>
										        
										    </c:otherwise>
										</c:choose>
									</div>
								</div>
								<div id="user-contents">
									<textarea id="textarea" name="textarea">
											${userView.contents}
									</textarea>
									<div id="file-related">
										<c:if test="${userView.fileAttach eq 'Yes'}">
										    <span>
											    <a href='${pageContext.request.contextPath}/fileDownload?fileName=${userView.fileName}'>
											    	${userView.fileName}
											    </a>
											    <button type="button" id="file-delete-btn">X</button>
												<input type="hidden" id="file-name" value="${userView.fileName}"/>
											</span>
										</c:if>
									</div>
									<div id="btn-area">
										<div id="btn-area-inner">
											<input type="submit" value="수정"/>
											<input type="reset" value="취소"/>
										</div>
									</div>
								</div>
								
							</form>
							
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