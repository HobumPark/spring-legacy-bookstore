<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="resources/css/member/joinStep3SignForm.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function loginCheck(){
		alert("로그인 체크!")
		//데이터 유효성 검사 통과후 이동
		form.action = "./signUpCheck"
		//document.getElementById('sign-up-form').submit();
	}
	function findAddress(){
		alert("주소 검색!")
		 new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        	$("#zonecode").val(data.zonecode);
					$("#address").val(data.address);
		        }
		 }).open();
	}
</script>
</head>
<body>
	<form id="sign-up-form" method="post" onSubmit="loginCheck()">
		<div id="id-area">
			<label for="id">아이디</label>
			<input type="text" placeholder="영소문자/숫자5~10자리"
			id="id" name="id">
		</div>
		<div id="pw-area">
			<label for="pw">비밀번호</label>
			<input type="text" placeholder="영문/숫자/특수문자 조합 8~15자리(대소문자 구분)"
			id="pw" name="pw">
			<input type="text" placeholder="비밀번호 확인">
		</div>
		<div id="name-area">
			<label for="name">이름:</label>
			<input type="text" name="name"><br/>
		</div>
		<div id="borndata-area">
			<label for="bornDate">생년월일:</label>
			<input type="text" name="bornDate"><br/>
		</div>
		<div id="address-area">
			<label for="address">주소:</label>
			<button onClick="findAddress()">주소검색</button>
			<input type="text" name="zonecode" id="zonecode"><br/>
			<input type="text" name="address" id="address"><br/>
		</div>
		<div id="email-area">
			<label for="email">이메일</label>
			<input type="text" placeholder="이메일주소 입력" id="email" name="email">
		</div>
		<div>
		
		</div>
		<input type="submit" value="가입완료" id="signup-btn">
	</form>
</body>
</html>