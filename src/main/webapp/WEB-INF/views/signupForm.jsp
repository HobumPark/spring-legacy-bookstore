<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function IdCheck(){
		alert("IdCheck")
		window.open("./popup/IdCheckForm.jsp","idwin","width=400, height=350")		
	}
	function findAddress(){
		alert("주소 검색!")
		new daum.Postcode({

			oncomplete:function(data) {

				jQuery("#zonecode").val(data.zonecode);
				jQuery("#address").val(data.address);

				jQuery("#detail").focus();	
				
				$("#zonecode").css({background:"gray"});
				$("#address").css({background:"gray"});

			}

		}).open();
	}
</script>
</head>
<body>
	<form action="signup" method="POST">
		<label for="id">아이디:</label>
		<input type="text" name="id">
		<input type="button" onClick="IdCheck()" value="아이디 중복체크"><br/>
		
		<label for="id">패스워드:</label>
		<input type="password" name="pw"><br/>
		
		<label for="name">이름:</label>
		<input type="text" name="name"><br/>
		
		<label for="bornDate">생년월일:</label>
		<input type="text" name="bornDate"><br/>
		
		<label for="address">주소:</label>
		<button onClick="findAddress()">주소검색</button>
		<input type="text" name="zonecode" id="zonecode"><br/>
		<input type="text" name="address" id="address"><br/>
		
		<input type="submit" value="회원가입"> 
	</form>
</body>
</html>