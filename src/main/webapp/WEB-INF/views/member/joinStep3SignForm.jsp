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
		alert("�α��� üũ!")
		//������ ��ȿ�� �˻� ����� �̵�
		form.action = "./signUpCheck"
		//document.getElementById('sign-up-form').submit();
	}
	function findAddress(){
		alert("�ּ� �˻�!")
		 new daum.Postcode({
		        oncomplete: function(data) {
		            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ��Դϴ�.
		            // ������ �����Ͽ� �پ��� Ȱ����� Ȯ���� ������.
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
			<label for="id">���̵�</label>
			<input type="text" placeholder="���ҹ���/����5~10�ڸ�"
			id="id" name="id">
		</div>
		<div id="pw-area">
			<label for="pw">��й�ȣ</label>
			<input type="text" placeholder="����/����/Ư������ ���� 8~15�ڸ�(��ҹ��� ����)"
			id="pw" name="pw">
			<input type="text" placeholder="��й�ȣ Ȯ��">
		</div>
		<div id="name-area">
			<label for="name">�̸�:</label>
			<input type="text" name="name"><br/>
		</div>
		<div id="borndata-area">
			<label for="bornDate">�������:</label>
			<input type="text" name="bornDate"><br/>
		</div>
		<div id="address-area">
			<label for="address">�ּ�:</label>
			<button onClick="findAddress()">�ּҰ˻�</button>
			<input type="text" name="zonecode" id="zonecode"><br/>
			<input type="text" name="address" id="address"><br/>
		</div>
		<div id="email-area">
			<label for="email">�̸���</label>
			<input type="text" placeholder="�̸����ּ� �Է�" id="email" name="email">
		</div>
		<div>
		
		</div>
		<input type="submit" value="���ԿϷ�" id="signup-btn">
	</form>
</body>
</html>