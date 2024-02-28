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
		
		var idAvailable = false //���̵� ��밡�� ����
		var id = null
		
		duplicateCheckBtn()
		idUse()
		closePopUp()
	})
	
	
	function duplicateCheckBtn(){
		
		$("#id-check-btn").click(function(){
			//alert("idüũ!")
			id = $("#id").val().trim()
			
			if( id === ''){
				alert('���̵� �Է��ϼ���!')
				return
			}
			
			var check=idValidationCheck(id)
			
			if( check === true){
				//alert('���̵� ��ȿ�� �˻� ���')
			}else{
				//alert('���̵�� ���� ��ҹ��ڿ� ���� 4~12�ڸ��� �Է��ؾ� �մϴ�.')
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
	     			
	     			if(result == "ok"){//��밡��
	     				//$("#result-contents").text(${id}+'�� ��밡�� �մϴ�')
	     				idAvailable = true
	     			}else if(result == "not"){//���Ұ�
	     				//$("#result-contents").text(${id}+'�� ��� �Ұ��� �մϴ�')
	     				idAvailable = false
	     			}
	            },
	            error : function() {
	        		alert("error");
	        	}
	         }).done(function(){
	        	 //alert("done!")
				 //alert(id)
	        	 if(idAvailable == true){//��밡��
	     			$("#result-contents").text(id+'�� ��밡�� �մϴ�')
	     		}else if(idAvailable == false){//���Ұ�
	     			$("#result-contents").text(id+'�� ��� �Ұ��� �մϴ�')
	     		}
	         })
		})
		
		
		
		
	}
	
	function idValidationCheck(id){
		var idRegExp = /^[a-zA-z0-9]{4,12}$/; //���̵� ��ȿ�� �˻�
        if (!idRegExp.test(id)) {
            alert("���̵�� ���� ��ҹ��ڿ� ���� 4~12�ڸ��� �Է��ؾ��մϴ�!");
            return false;
        }
        return true; //Ȯ���� �Ϸ�Ǿ��� ��
	}
	
	function idUse(){
		$("#id-use-btn").click(function(){
			//alert("id���!")
			if(idAvailable == true){
				//��밡���ϰ��
				//����Ϸ��� ���̵� �Է�â�� �־��ش�.
				//alert("��� ����!")
				var openerObj=window.opener.document//�θ�â�� ����
				$(openerObj).find("#id").val(id)
				$(openerObj).find("#id").css("backgroundColor","#777")
				$(openerObj).find("#id").attr("readonly","true")
				window.close()
			}else if(idAvailable == false) {
				//���Ұ����ϰ��
				//alert("���Ұ�!")
			}
			
		})
	}
	
	function closePopUp(){
		$("#popup-close-btn").click(function(){
			alert("�ݱ�!")
			window.close()
		})
	}
</script>
<title>���̵� �ߺ� Ȯ��</title>
</head>
<body>
	<div id="wrap">
		<h1>���̵� �ߺ� Ȯ��</h1>
		<form>
			<div id="id-wrap">
				<div id="id-label">
					����� ���̵�
				</div>
				<div id="id-contents">
					<input type="text" id="id"/>
				</div>
			</div>
			<div id="result-wrap">
				<div id="result-label">
					���
				</div>
				<div id="result-contents">
					�ߺ�Ȯ���� �����Ͻʽÿ�
				</div>
			</div>
			<div id="btn-group">
				<div id="btn-group-inner">
					<button onClick="duplicateCheckBtn()" id="id-check-btn" type="button">��ȸ</button>
					<button onClick="idUse()" id="id-use-btn" type="button">���</button>
					<button onClick="closePopUp()" id="popup-close-btn" type="button">�ݱ�</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>