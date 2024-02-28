<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="resources/css/member/joinStep2.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		//alert("ready!");
		$("#all-agree").click(function(){
			alert("전체동의 클릭!");
			$("check")
			$('input:checkbox').prop('checked',true);
			
		})
		
	})
	
</script>
</head>
<body>
	<%
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String phoneNum=request.getParameter("phoneNum");
	out.print("name:"+name+"<br/>");
	out.print("birth:"+birth+"<br/>");
	out.print("phoneNum:"+phoneNum+"<br/>");
	
	%>
	<div id="joinStep2-wrap">
	<form id="check-radio-form" action="joinStep3SignForm" method="post">
		<div id="check-area1">
			<input type="checkbox" id="all-agree"><label for="all-agree">전체동의</label>
		</div>
		<div id="check-area2">
			<span>
				<input type="checkbox" id="kyobo-terms-must"><label for="kyobo-terms">교보문고 이용약관<b>(필수)</b></label>
			</span>
			<span>
				<input type="checkbox" id="personal-info-must"><label for="personal-info">개인정보 수집 및 이용안내<b>(필수)</b></label>
			</span>
		</div>
		<div id="check-area3">
			<span>
				<input type="checkbox" id="personal-info-select"><label for="personal-info-select">개인정보 수집 및 이용안내(선택)</label>
			</span>
			<span>
				<input type="checkbox" id="kyobo-hot-trax-select"><label for="kyobo-hot-trax-select">제3자 정보제공 동의 교보핫트랙스,꾸밍(선택)</label>
			</span>
			<span>
				<input type="checkbox" id="life-insurance-select"><label for="life-insurance-select">제3자 정보제공 동의 교보라이프플래닛 생명보험(선택)</label>
			</span>
		</div>
		<div id="check-area4">
			<div>
				<input type="checkbox" id="marketing-select"><label for="marketing-select">마케팅(광고)수신여부동의(선택)</label>
				<br/>
				<span>
					<input type="checkbox" id="SMS"><label for="SMS">SMS</label>
					<input type="checkbox" id="email"><label for="email">이메일</label>
				</span>
				<span>
				*회원가입,주문배송,약관안내,회사 주요정책관련내용은 수신동의여부와 관계없이 발송됩니다.
				</span>
			</div>
			<div>
				<input type="radio" name="year" id="one-year"><label for="one-year">1년</label>
				<input type="radio" name="year" id="three-year"><label for="three-year">3년</label>
				<input type="radio" name="year" id="five-year"><label for="five-year">5년</label>
				<input type="radio" name="year" id="until-resign"><label for="until-resign">탈퇴시까지</label>
			</div>
		</div>
		<div>
			<span>개인정보 위탁안내(고지)</span>
		</div>
		<div>
			<input type="submit" value="동의하기" id="agree-btn">
		</div>
	</form>

	</div>
</body>
</html>