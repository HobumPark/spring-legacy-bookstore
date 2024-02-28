<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="resources/css/member/idDuplicateCheckForm.css" type="text/css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		var idAvailable = false //아이디 사용가능 여부
		var id = null
		
		duplicateCheckBtn()
		idUse()
		closePopUp()
	})
	
	
	function duplicateCheckBtn(){
		
		$("#id-check-btn").click(function(){
			//alert("id체크!")
			id = $("#id").val().trim()
			
			if( id === ''){
				alert('아이디를 입력하세요!')
				return
			}
			
			var check=idValidationCheck(id)
			
			if( check === true){
				//alert('아이디 유효성 검사 통과')
			}else{
				//alert('아이디는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.')
				$("#id").val('')
				return
			}
		
			$.ajax({
	            url:"idDuplicateCheck",
	            type:"get",
	            async : false,
	            data:{
	            	id: $("#id").val(),
	                 },
	            success : function(data) {
	            	//alert("success!")
	     			console.log(data)
	     			//alert(data.msg)
	     			const result = data.msg
	     			
	     			if(result == "ok"){//사용가능
	     				//$("#result-contents").text(${id}+'는 사용가능 합니다')
	     				idAvailable = true
	     			}else if(result == "not"){//사용불가
	     				//$("#result-contents").text(${id}+'는 사용 불가능 합니다')
	     				idAvailable = false
	     			}
	            },
	            error : function() {
	        		alert("error");
	        	}
	         }).done(function(){
	        	 //alert("done!")
				 //alert(id)
	        	 if(idAvailable == true){//사용가능
	     			$("#result-contents").text(id+'는 사용가능 합니다')
	     		}else if(idAvailable == false){//사용불가
	     			$("#result-contents").text(id+'는 사용 불가능 합니다')
	     		}
	         })
		})
		
		
		
		
	}
	
	function idValidationCheck(id){
		var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test(id)) {
            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            return false;
        }
        return true; //확인이 완료되었을 때
	}
	
	function idUse(){
		$("#id-use-btn").click(function(){
			//alert("id사용!")
			if(idAvailable == true){
				//사용가능일경우
				//사용하려는 아이디를 입력창에 넣어준다.
				//alert("사용 가능!")
				var openerObj=window.opener.document//부모창에 접근
				$(openerObj).find("#id").val(id)
				$(openerObj).find("#id").css("backgroundColor","#777")
				$(openerObj).find("#id").attr("readonly","true")
				window.close()
			}else if(idAvailable == false) {
				//사용불가능일경우
				//alert("사용불가!")
			}
			
		})
	}
	
	function closePopUp(){
		$("#popup-close-btn").click(function(){
			alert("닫기!")
			window.close()
		})
	}
</script>
<title>아이디 중복 확인</title>
</head>
<body>
	<div id="wrap">
		<h1>아이디 중복 확인</h1>
		<form>
			<div id="id-wrap">
				<div id="id-label">
					사용할 아이디
				</div>
				<div id="id-contents">
					<input type="text" id="id"/>
				</div>
			</div>
			<div id="result-wrap">
				<div id="result-label">
					결과
				</div>
				<div id="result-contents">
					중복확인을 실행하십시오
				</div>
			</div>
			<div id="btn-group">
				<div id="btn-group-inner">
					<button onClick="duplicateCheckBtn()" id="id-check-btn" type="button">조회</button>
					<button onClick="idUse()" id="id-use-btn" type="button">사용</button>
					<button onClick="closePopUp()" id="popup-close-btn" type="button">닫기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>