<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

</script>
</head>
<body>
<div style="text-align: center"></div> 
<h3>* ���̵� �ߺ� Ȯ�� ��� *</h3> 
<% 
//1) ��밡���� ���̵��� ���, ���̵� �Է� ���� �ֱ� ���� 
String id=request.getParameter("id"); 
boolean id_check=true;
int cnt=0;
out.println("�Է� ID : <strong>" + id + "</stong>"); 
if(id_check==true){ out.println("<p>��� ������ ���̵��Դϴ�.</p>"); 
out.println("<a href='javascript:apply(\"" + id + "\")'>[����]</a>");
%>
<script> 
function apply(id){ 
	//2) �ߺ�Ȯ�� id�� �θ�â�� ���� 
	//�θ�â opener 
	alert("apply");
	opener.document.regForm.userId.value=id; 
	opener.document.regForm.userId.readOnly=true;
	opener.document.regForm.userId.style.backgroundColor='gray';
	window.close(); //â�ݱ� 
	}//apply () end 
</script> 
	<% }else{ 
		out.println("<p style='color: red'>�ش� ���̵�� ����Ͻ� �� �����ϴ�.</p>"); }//if end %> <hr> 
		<a href="javascript:history.back()">[�ٽýõ�]</a> 
		&nbsp; &nbsp; 
		<a href="javascript:window.close()">[â�ݱ�]</a>

</body>
</html>