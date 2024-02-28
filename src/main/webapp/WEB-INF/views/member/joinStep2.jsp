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
			alert("��ü���� Ŭ��!");
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
			<input type="checkbox" id="all-agree"><label for="all-agree">��ü����</label>
		</div>
		<div id="check-area2">
			<span>
				<input type="checkbox" id="kyobo-terms-must"><label for="kyobo-terms">�������� �̿���<b>(�ʼ�)</b></label>
			</span>
			<span>
				<input type="checkbox" id="personal-info-must"><label for="personal-info">�������� ���� �� �̿�ȳ�<b>(�ʼ�)</b></label>
			</span>
		</div>
		<div id="check-area3">
			<span>
				<input type="checkbox" id="personal-info-select"><label for="personal-info-select">�������� ���� �� �̿�ȳ�(����)</label>
			</span>
			<span>
				<input type="checkbox" id="kyobo-hot-trax-select"><label for="kyobo-hot-trax-select">��3�� �������� ���� ������Ʈ����,�ٹ�(����)</label>
			</span>
			<span>
				<input type="checkbox" id="life-insurance-select"><label for="life-insurance-select">��3�� �������� ���� �����������÷��� ������(����)</label>
			</span>
		</div>
		<div id="check-area4">
			<div>
				<input type="checkbox" id="marketing-select"><label for="marketing-select">������(����)���ſ��ε���(����)</label>
				<br/>
				<span>
					<input type="checkbox" id="SMS"><label for="SMS">SMS</label>
					<input type="checkbox" id="email"><label for="email">�̸���</label>
				</span>
				<span>
				*ȸ������,�ֹ����,����ȳ�,ȸ�� �ֿ���å���ó����� ���ŵ��ǿ��ο� ������� �߼۵˴ϴ�.
				</span>
			</div>
			<div>
				<input type="radio" name="year" id="one-year"><label for="one-year">1��</label>
				<input type="radio" name="year" id="three-year"><label for="three-year">3��</label>
				<input type="radio" name="year" id="five-year"><label for="five-year">5��</label>
				<input type="radio" name="year" id="until-resign"><label for="until-resign">Ż��ñ���</label>
			</div>
		</div>
		<div>
			<span>�������� ��Ź�ȳ�(����)</span>
		</div>
		<div>
			<input type="submit" value="�����ϱ�" id="agree-btn">
		</div>
	</form>

	</div>
</body>
</html>