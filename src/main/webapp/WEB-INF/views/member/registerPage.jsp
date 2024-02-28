<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/member/registerPage.css" type="text/css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var windowObj = null
	var id = null
	var dataValidation = false;
	
	$(document).ready(function(){
		idDuplicateCheck()
		findAddress()
		inputDataValidationCheck()
		phoneFirstChange()
		pwValidationCheck()
		pwConfirmValidationCheck()
		nameValidationCheck()
	})
	
	function idDuplicateCheck(){
		
		$("#id-duplicate-check-btn").click(function(){
			alert("아이디 중복 확인")		
			
			
			windowObj=window.open("/db/idDuplicateCheckForm"
					,"","width=500px,height=300px")
					
			
			
			windowObj.onbeforeunload = function(){
				//새창이 닫힌것을 감지하는 이벤트 설정
			    //alert("새창 닫힘 감지!");
			}
		})
	}
	
	function findAddress(){
		$("#find-button").click(function(){
			alert("find!");
				
			new daum.Postcode({
	
			oncomplete:function(data) {
	
					$("#zone-code").val(data.zonecode);
					$("#address").val(data.address);
					$("#zone-code").attr("readonly",true); 
					$("#address").attr("readonly",true); 
					
					$("#detail").focus();	
						
					$("#zone-code").css({background:"gray"});
					$("#address").css({background:"gray"});
				}
			}).open();
		})
	}
	
	function inputDataValidationCheck(){
		var id=document.getElementById('id')
		if(id === ''){
			alert('아이디 유효성 통과 못함')
			return false
		}
		var pw=document.getElementById('pw')
		if(pw === ''){
			alert('패스워드 유효성 통과 못함')
			return false
		}
		
		var pwConfirm=document.getElementById('pw-confirm')
		if(pw === ''){
			alert('패스워드 유효성 통과 못함')
			return false
		}
		
		var name=document.getElementById('name')
		if(name === ''){
			alert('이름 유효성 통과 못함')
			return false
		}
		
	}
	

	
	function pwValidationCheck(){
		
		$("#pw").blur(function(){
			console.log('pw blur')
			var pw = $("#pw").val()

			var pwRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
	        if (!pwRegExp.test(pw)) {
	            //alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	            $("#pw-contents>span")
	            .css("color","red").text('비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!')
	            $("#pw").val('')
	            return false;
	        }
	        $("#pw-contents>span")
            .css("color","blue").text('비밀번호는 영문 대소문자와 숫자 4~12자리로 입력 완료!')
	        return true; //확인이 완료되었을 때
		})
		
	}
	
	function pwConfirmValidationCheck(){
		
		$("#pw-confirm").blur(function(){
			console.log('pw confirm blur')
			var pw = $("#pw").val()
			var pwConfirm = $("#pw-confirm").val()
			if(pwConfirm===''){
				//alert('값을 입력하세요')
				$("#pw-confirm-contents>span")
	            .css("color","red").text('값을 입력하세요!')
				return false
			}
			
			if(pw === pwConfirm){
				//alert('비밀번호 일치')
				$("#pw-confirm-contents>span")
	            .css("color","blue").text('비밀번호, 비밀번호 확인 일치!')
				return true
			}else{
				//alert('비밀번호와 비밀번호 확인은 동일해야합니다.')
				$("#pw-confirm-contents>span")
	            .css("color","red").text('비밀번호와 비밀번호 확인은 동일해야합니다.')
				$("#pw-confirm").val('')
				return false
			}
		})
	}
	
	function nameValidationCheck(){
		
		$("#name").blur(function(){
			console.log('name blur')
			var name = $("#name").val()

			var nameRegExp = /^[가-힝]{2,4}$/; //아이디 유효성 검사
	        if (!nameRegExp.test(name)) {
	            alert("이름은 한글 2~4글자로 입력해야합니다!");
	            $("#name").val('')
	            return false;
	        }
	        return true; //확인이 완료되었을 때
		})
		
	}
	
	function phoneFirstChange(){
		$("#phone-first").change(function(){
			var myVal=$(this).val()
			alert(myVal)
		})
	}
	
	function phoneValidationCheck(){
		$("#phone-middle").blur(function(){
			console.log('phone middle blur')
			var phoneMiddle = $("#phone-middle").val()

			var phoneRegExp = /^[0-9]+/g; //아이디 유효성 검사
	        if (!phoneRegExp.test(phoneMiddle)) {
	            alert("전화번호는 숫자로 입력해야합니다!");
	            $("#phone-middle").val('')
	            return false;
	        }
		})
		
		$("#phone-back").blur(function(){
			console.log('phone back blur')
			var phoneBack = $("#phone-back").val()

			var phoneRegExp = /^[0-9]+/g; //아이디 유효성 검사
	        if (!phoneRegExp.test(phoneBack)) {
	            alert("전화번호는 숫자로 입력해야합니다!");
	            $("#phone-back").val('')
	            return false;
	        }
		})
		
		return true; //확인이 완료되었을 때
	}
	
	function emailValidationCheck(){
		
		$("#email-address").blur(function(){
			console.log('email-address')
			var emailAddress = $("#email-address").val()
			var emailDomain = $("#email-domain option:selected").val();
					
			var reg1=/^[a-zA-Z0-9]{4,12}$/
			var reg1=/^[a-zA-Z0-9]*.[a-zA-Z]{2,3}$/
			
			if (!reg1.test(emailAddress)) {
		        alert("이메일은 영문 숫자 4~12글자로 입력해야합니다!");
		        $("#email-address").val('')
		        return false;
		    }else{
		    	return true;
		    }
				
		})
		
	}
	
	function registerMemberPost(){
		alert('post전송!')
		
		const result=inputDataValidationCheck()
		if(result===true){
			alert('데이터 유효성 통과 성공!')
		}else if(result===false){
			alert('데이터 유효성 통과 실패!')
		}
		
		const form = document.getElementById('register-form');
		form.method = 'post';
		form.action = 'register';
		form.submit();
	}
	
	
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<h1><b>*</b>는 필수 입력사항 입니다.</h1>
		<form method='post' action='register' onSubmit='registerMemberPost()' id='register-form'>
		
		<table id="sign-up-wrap">
			<tr id="id-wrap">
				<td id="id-label">
					아이디<b>*</b>
				</td>
				<td id="id-contents">
					<div id="id-contents01">
						<input type="text" id="id" name="id" readonly/>
						<button type="button" id="id-duplicate-check-btn">중복확인</button>
					</div>
					<div id="id-contents02">
						<span>영문, 숫자만 가능(5자 ~ 20자), 중복확인 버튼을 눌러 ID 중복여부를 확인해 주시기 바랍니다.</span>
					</div>
				</td>
			</tr>
			<tr id=pw-wrap>
				<td id="pw-label">
					비밀번호<b>*</b>
				</td>
				<td id="pw-contents">
					<input type="password" id="pw" name="pw"/>
					<span></span>
				</td>	
			</tr>
			<tr id=pw-confirm-wrap>
				<td id="pw-confirm-label">
					비밀번호 확인<b>*</b>
				</td>
				<td id="pw-confirm-contents">
					<input type="password" id="pw-confirm"/>
					<span></span>
				</td>
			</tr>
			<tr id="name-wrap">
				<td id="name-label">
					이름<b>*</b>
				</td>
				<td id="name-contents">
					<input type="text" id="name" name="name"/>
					
					<select name="year">
						<option>2000</option>
						<option>1999</option>
						<option>1998</option>
						<option>1997</option>
						<option>1996</option>
						<option>1995</option>
					</select>
					-
					<select name="month">
						<option>01</option>
						<option>02</option>
						<option>03</option>
						<option>04</option>
						<option>05</option>
						<option>06</option>
					</select>
					-
					<select name="day">
						<option>01</option>
						<option>02</option>
						<option>03</option>
						<option>04</option>
						<option>05</option>
						<option>06</option>
					</select>
				</td>
			</tr>
			<tr id="phone-wrap">
				<td id="phone-label">
					휴대폰<b>*</b>
				</td>
				<td id="phone-contents">
					<select id="phone-first" name="phone-first">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
						<option>070</option>
					</select>
					-
					<input type="text" id="phone-middle" name="phone-middle"/>
					-
					<input type="text" id="phone-back" name="phone-back"/>
					
					<select id="provider" name="provider">
						<option>선택</option>
						<option>KT</option>
						<option>SKT</option>
						<option>LG U+</option>
					</select>
				</td>
			</tr>
			<tr id="address-wrap">
				<td id="address-label">
					주소<b>*</b>
				</td>
				<td id="address-contents">
					<div id="address-contents01">
						<input type="text" id="zone-code" name="zone-code"/>
						<button type="button" id="find-button">우편번호 찾기</button>
					</div>
					<div id="address-contents02">
						<input type="text" id="address" name="address"/>
					</div>
					<div id="address-contents03">
						<input type="text" placeholder="상세주소를 입력하세요" name="detail-address"/>
					</div>
				</td>
			</tr>
			<tr id="email-wrap">
				<td id="email-label">
					이메일<b>*</b>
				</td>
				<td id="email-contents">
					<input type="text" id='email-address' name="email-address"/> @ 
					<select id='email-domain' name="email-domain">
						<option option="selected">선택하세요</option>
						<option>naver.com</option>
						<option>daum.net</option>
						<option>google.com</option>
						<option>직접입력</option>
					</select>
				</td>	
			</tr>
			<tr id="email-sns-agree-wrap">
				<td id="email-sns-label">
					메일/SMS 수신동의
				</td>
				<td id="email-sns-contents">
				
					<div id="email-sns-contents01">
						<input type="radio" name='email-accept' value='email-agree'/>
						<span>수신</span>
						<input type="radio" name='email-accept' value='email-reject'/>
						<span>미수신</span>
					</div>
					
					<div id="email-sns-contents02">
						<span>
							※ 달구벌미소문자(문자서비스)와 대구소식당(뉴스레터) 수신을 원하지 않을 경우 미수신을 체크해 주십시오.
						</span>
					</div>
				</td>
			</tr>
		</table>
		<div id='register-btn-area'>
			<div id='register-btn-area-inner'>
				<button type="button" onClick="registerMemberPost()">입력완료</button>
				<button type="button" >처음으로</button>
			</div>
		</div>
		</form>
	</div>
</body>
</html>