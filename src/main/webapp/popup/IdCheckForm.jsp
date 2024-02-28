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
	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
	    contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
	    data: id ,

	    success: function(data){
	         if(data == 0){
	         console.log("아이디 없음");
	         alert("사용하실 수 있는 아이디입니다.");
	         }else{
	         	console.log("아이디 있음");
	         	alert("중복된 아이디가 존재합니다.");
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
<h3>* 아이디 중복확인 *</h3> 
<form method="post" action="IdCheckAction.jsp"> 
<label for="id">아이디</label>
<input type="text" name="id" maxlength="10" autofocus> 
<input type="submit" value="중복확인" onclick="idCheck"> 
</form> 
</div>

</body>
</html>