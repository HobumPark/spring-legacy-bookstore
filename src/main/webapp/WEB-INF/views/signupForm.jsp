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
		alert("�ּ� �˻�!")
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
		<label for="id">���̵�:</label>
		<input type="text" name="id">
		<input type="button" onClick="IdCheck()" value="���̵� �ߺ�üũ"><br/>
		
		<label for="id">�н�����:</label>
		<input type="password" name="pw"><br/>
		
		<label for="name">�̸�:</label>
		<input type="text" name="name"><br/>
		
		<label for="bornDate">�������:</label>
		<input type="text" name="bornDate"><br/>
		
		<label for="address">�ּ�:</label>
		<button onClick="findAddress()">�ּҰ˻�</button>
		<input type="text" name="zonecode" id="zonecode"><br/>
		<input type="text" name="address" id="address"><br/>
		
		<input type="submit" value="ȸ������"> 
	</form>
</body>
</html>