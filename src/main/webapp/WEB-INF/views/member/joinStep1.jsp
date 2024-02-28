<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/member/joinStep1.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var phoneAuth=false;
//휴대전화 인증여부

$(document).ready(function() {
	/*전송버튼 클릭*/
    $("#send-btn").click(function(e) {
    	e.preventDefault()
    	alert("전송!")
    	var phoneNum=$("#phoneNum").val()
    	if(!phoneNumCheck(phoneNum)){
    		alert("휴대전화번호 유효성 미충족!")
    		return false;
    	}
    	//휴대전화번호 유효성 통과했을때 문자전송함
    	
    	var number = 0;
    	var genCertNum='';
        for(var i=1; i<=6; i++){
        	number = Math.floor(Math.random() * 10);
        	genCertNum += number;
        }
        alert(genCertNum)
    	smsTimer();//타이머 시작
    	
        $("#genCertNum").val(genCertNum);
        /* 난수로 생성된 인증번호를 hidden name : hidden_text 에 숨긴다 */
		
    	$.ajax({
            url:"sendSms",
            type:"post",
            data:{
            	genCertNum: $("#genCertNum").val(),
            	sendTo: phoneNum
                 },
          
         });
		  	
    })
    
    var startTime=180;
	var intervalResult=null;
    function smsTimer(){
    	if(intervalResult==null){
    		currentTime=startTime
    		intervalResult=setInterval(tick,1000)	
    	}
	}
    
	function tick(){
		var min=0;
		var sec=0;
		
		if(currentTime==0){
			alert("인증번호 만료!")
			alert("재전송 해주세요!")
			clearInterval(intervalResult)
			intervalResult=null
			$("#genCertNum").val('');
			$("#timer-display").text('');
		}
		
		currentTime -= 1
		min = currentTime/60;
		min = parseInt(min)
		sec = currentTime%60;
		var timeFormat=min+":"+sec
		$("#timer-display").text(timeFormat);
	}
    
	//action="./joinStep2"
	function checkData(){
		alert("데이터 확인")
		return false
		//document.getElementById('input-auth-form').submit();
	}
	
    $("#agree-btn").click(function(e) {
    	e.preventDefault()
    	alert("데이터 검사!")
    	var valid=false
    	var phoneAuth=false
    	valid=checkAll()//이름,생년월일,휴대전화번호 유효성 검사
    	phoneAuth=phoneAuthCheck()//휴대전화번호 인증
    	
    	if(valid==true){
    		alert("데이터 유효성 충족!")
    		if(phoneAuth==true){
    			alert("휴대전화번호 인증!")
    		}else{
    			alert("휴대전화번호 미인증!")
    			return
    		}
    		var my_form=document.getElementById('input-auth-form')
    		my_form.action="./joinStep2"
    		my_form.method="post"
    		my_form.submit();
    	}else{
    		alert("데이터 유효성 미충족!")
    		alert("이동 불가!")
    	}
    })
    
    function checkAll() {
    	var name = document.getElementById("name").value;
    	var birth = document.getElementById("birth").value;
    	var phoneNum = document.getElementById("phoneNum").value;
    	if (!checkName(name)) {
        	alert("이름 유효성 미충족!")
        	return false
        }
    	if (!checkBirthDate(birth)) {
        	alert("생년월일 유효성 미충족!")
        	return false
        }
    	if (!phoneNumCheck(phoneNum)) {
        	alert("휴대전화번호 미충족!")
        	return false
        }
    	return true;
    }
    
    function checkName(name) {
        var name=name.trim()
    	if(name==''){
    		alert("이름을 입력하세요")
    		return false;
    	}
    	
        var nameRegExp = /^[가-힣]{2,4}$/;
        if (!nameRegExp.test(name)) {
            alert("이름이 올바르지 않습니다.");
            document.getElementById("name").value=''
            return false;
        }
        alert("이름 유효성 충족!")
        return true;//확인이 완료되었을 때
    }
    
    function checkBirthDate(birth){
    	var birth=birth.trim()
    	if(birth==''){
    		alert("생년월일을 입력하세요")
    		return false;
    	}
    	var birthRegExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
    	if (!birthRegExp.test(birth)) {
            alert("생년월일이 올바르지 않습니다.");
            document.getElementById("birth").value=''
            return false;
        }
        alert("생년월일 유효성 충족!")
        return true;//확인이 완료되었을 때
    }
    
    function phoneNumCheck(phoneNum){
    	var phoneNum=phoneNum.trim()
    	if(phoneNum==''){
    		alert("휴대전화번호를 입력하세요")
    		return false;
    	}
        var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        if (!regPhone.test(phoneNum)) {
            alert('휴대전화번호가 올바르지 않습니다.');
            document.getElementById("phoneNum").value=''
            return false;
        }
        alert("휴대전화번호 유효성 충족!")
    	return true;//확인이 완료되었을 때
    }

	function phoneAuthCheck(){
		var genCertNum=$("#genCertNum").val().trim()
		var inputCertNum=$("#inputCertNum").val().trim()
		
		if(genCertNum==''){
			alert("인증번호를 전송해주세요!")
			return false;
		}
		
		if(inputCertNum==genCertNum){
			//입력한 번호랑, 랜덤생성 번호랑 일치하면 인증 성공!
    		alert("휴대전화 인증 성공!")
    		return true;
    	}else{
    		alert("휴대전화 인증 실패!")
    		return
    	}
	}
    
    /*
    $("#agree-btn").click(function(e) {
     e.preventDefault()
   	 alert("인증 확인!!")
   	 var genCertNum = $("#genCertNum").val();
     var inputCertNum = $("#inputCertNum").val(); 
     /*
     $.ajax({
         url:"joinStep2",
         type:"get",
         data:{
        	 genCertNum: $("#genCertNum").val(),
        	 inputCertNum: $("#inputCertNum").val(),
              },
       
      });
	     
	 if(genCertNum.trim()==inputCertNum.trim()){
		 alert("인증성공!")
		 //response.sendRedirect("joinStep2.jsp")
		 //window.location.href="/certCheck"
		 //window.location.href="./joinStep2"
	 }else {
		 alert("인증실패!")
	 }
	
   	 
    })
    */
    
})
</script>
</head>
<body>
	<div id="wrap">
		<header id="header">
			<h1>
			<img src="./resources/images/member/img_logo_01.png" alt="로고"> <span>회원가입</span>
			</h1>
		</header>
		<div id="info-input">
			<div id="info-input-header">
				<h1>정보입력</h1>
				<div>
					<input type="checkbox">
					<span>개인정보 수집 및 이용안내 <b>(필수)</b></span>
				</div>
				
				<span id="info-desc">
					입력하신 정보는 회원 유무 확인용으로 수집/이용 되며,
					가입 회원에 한해 입력하신 모든 정보가 저장되는데 동의합니다.
				</span>
			</div>
			<form id="input-auth-form">
				<div id="name-form">
					<label for="name">이름</label>
					<input type="text" placeholder="10자리 내 입력" id="name" name="name"/>
				</div>
				
				<div id="birth-gender-form">
					<label for="name">생년월일/성별</label>
					<input type="text" placeholder="8자리 내 입력(예.19850101)" id="birth" name="birth"/>
					<select id="select-gender">
						<option value="gender">성별</option>
						<option value="male">남자</option>
						<option value="female">여자</option>
					</select>
				</div>
				
				<div id="phone-form">
					<div id="phone-head">
						<label for="name">휴대폰번호</label>
						<a>휴대폰없는 해외거주자 <span>?</span></a>
					</div>
					<div id="phone-input">
						<input type="text" placeholder="숫자만 입력(예.01012345678)" id="phoneNum" name="phoneNum"/>
						<button id="send-btn">인증번호 요청</button>
					</div>
					<div id="cert-input">
						<input type="text" placeholder="인증번호6자리 입력" 
						id="inputCertNum" name="inputCertNum"/> <br/>
						<input type="text" placeholder="생성된 인증번호" 
						id="genCertNum" name="genCertNum"/> <br/>
						<span id="timer-display"></span>
					</div>
				</div>
				<div id="agree">
					<input type="button" id="agree-btn" value="동의 및 인증 확인"></input>
				</div>
			</form>
			
		</div>
	</div>
</body>
</html>