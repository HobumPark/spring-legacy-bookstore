<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${member == null}">
	<form action="login" method="post">
		<input type="text" name="id" id="id"><br/>
		<input type="password" name="pw" id="pw"><br/>
		<input type="submit" value="�α���"> 
	</form>
	<a href="./signup">ȸ������</a>
</c:if>	
<c:if test="${member != null}">
<c:redirect url="/loginSuccess"/>
</c:if>
</body>
</html>