<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
function idCheck(id){

	$.ajax({
	    url: 'ID_Check',
	    type: 'POST',
	    dataType: 'text', //�����κ��� ���� �޴� �������� Ÿ��
	    contentType : 'text/plain; charset=utf-8;',//���� ������ ������ �������� Ÿ��
	    data: id ,

	    success: function(data){
	         if(data == 0){
	         console.log("���̵� ����");
	         alert("����Ͻ� �� �ִ� ���̵��Դϴ�.");
	         }else{
	         	console.log("���̵� ����");
	         	alert("�ߺ��� ���̵� �����մϴ�.");
	         }
	    },
	    error: function (){        
	                      
	    }
	  });
}
</script>
</head>
<body>

<div style="text-align: center"> 
<h3>* ���̵� �ߺ�Ȯ�� *</h3> 
<form method="post" action="IdCheckAction.jsp"> 
<label for="id">���̵�</label>
<input type="text" name="id" maxlength="10" autofocus> 
<input type="submit" value="�ߺ�Ȯ��" onclick="idCheck"> 
</form> 
</div>

</body>
</html>