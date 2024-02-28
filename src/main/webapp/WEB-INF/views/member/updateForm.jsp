<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/member/updateForm.css" type="text/css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		findAddress()
		
	})
	
	function findAddress(){
		$("#find-address-btn").click(function(){
			alert("find!");
				
			new daum.Postcode({
	
			oncomplete:function(data) {
	
					$("#zone-code").val(data.zonecode);
					$("#address").val(data.address);

					$("#detail").focus();	
						
					$("#zone-code").css({background:"gray"});
					$("#address").css({background:"gray"});
				}
			}).open();
		})
	}
</script>
</head>
<body>
	<div id="update-member-area">
		<h1>회원정보 설정</h1>
		<div id="update-member-area-inner">
			
			<form action="update" method="post" id="update-form">
				<div id="id-row">
					<span>
						<label for="id">아이디:</label>
					</span>
					<span>
						<input type="text" name="id" id="id" readonly
			    		value="<c:out value="${memberVO.getId()}" />"/>
					</span>
				</div>
				<div id="pw-row">
					<span>
						<label for="pw">패스워드:</label>
					</span>
					<span>
						<input type="password" name="pw" id="pw"
			    		value="<c:out value="${memberVO.getPw()}"/>"/>
					</span>
				</div>
				<div id="pw-confirm-row">
					<span>
						<label for="pw">패스워드 확인:</label>
					</span>
					<span>
						<input type="password" name="pw" id="pw"
			    		value="<c:out value="${memberVO.getPw()}"/>"/>
					</span>
				</div>
				<div id="name-row">
					<span>
						<label for="name">이름:</label>
					</span>
					<span>
						<input type="text" name="name" id="name" readonly
			    	value="<c:out value="${memberVO.getName()}"/>" />
					</span>
				</div>
		    	
		    	<div id="born-date-row">
		    		<span>
		    			<label for="bornDate">생년원일:</label>
		    		</span>
		    		<span>
		    			<input type="text" name="bornDate" id="bornDate" readonly
			    	value="<c:out value="${memberVO.getBornDate()}" />"/>
		    		</span>
		    	</div>
		    	
		    	<div id="email-row">
		    		<span>
		    			<label for="email">이메일:</label>	
		    		</span>
		    		<span>
		    			<input type="text" name="email-front" id="email-front"
			    		value="<c:out value="${memberVO.getEmailFront()}"/>"/>
			    		@
			    		<input type="text" name="email-back" id="email-back"
			    		value="<c:out value="${memberVO.getEmailBack()}"/>"/>
		    		</span>
					
		    	</div>
		    	
		    	<div id="phone-number-row">
		    		<span>
		    			<label for="phone-number">전화번호:</label>	
		    		</span>
		    		<span>
		    			<input type="text" name="phone-number-front" id="phone-number-front"
			    		value="<c:out value="${memberVO.getPhoneNumberFront()}"/>"/>
			    		-
			    		<input type="text" name="phone-number-middle" id="phone-number-middle"
			    		value="<c:out value="${memberVO.getPhoneNumberMiddle()}"/>"/>
			    		-
			    		<input type="text" name="phone-number-back" id="phone-number-back"
			    		value="<c:out value="${memberVO.getPhoneNumberBack()}"/>"/>
		    		
		    			<span>통신사</span>
		    			<select id="phone-provider">
		    				<option>선택</option>
		    				<option <c:if test ="${memberVO.getProvider() eq 'KT'}">selected="selected"</c:if>>KT</option>
		    				<option <c:if test ="${memberVO.getProvider() eq 'SKT'}">selected="selected"</c:if>>SKT</option>
		    				<option <c:if test ="${memberVO.getProvider() eq 'LG U+'}">selected="selected"</c:if>>LG U+</option>
		    			</select>
		    		</span>
					
		    	</div>
		    	
		    	<div id="address-row">
		    		<span>
		    			<label for="address">주소:</label>
		    		</span>
		    		<span>
		    			<input type="text" name="zonecode" id="zonecode" readonly
			    		value="<c:out value="${memberVO.getZonecode()}"/>"/>
			    		<br>
			    		<input type="text" name="address" id="address" readonly
			    		value="<c:out value="${memberVO.getMainAddress()}"/>"/>
			    		
			    		<input type="text" name="detail-address" id="detail-address"
			    		value="<c:out value="${memberVO.getDetailAddress()}"/>"/>
			    		<br>
			    		
			    		<button type="button" id="find-address-btn">주소검색</button>
		    		</span>
		    	</div>
		    	
				<input type="submit" value="회원정보수정" id="update-btn"> 
			</form>
		</div>
	</div>
</body>
</html>