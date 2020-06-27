<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- header -->
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<!--XMLHttpRequest 생성  -->
<script type="text/javascript" src="/resources/js/httpRequest.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	//전역변수
	var emailsend = false;
	var checkcode = false;
	var checkemail = false;
	
	$("#btnSendEmail").click(function(){
		
		var e = "email=" + $("#email").val();
		sendRequest("GET", "/checkemail", e, callbackCheckE )
		
		function callbackCheckE(){
			console.log("이메일확인 콜백함수 호출");
			if( httpRequest.readyState == 4 ){
				if( httpRequest.status == 200){
					checkEmailResult();
				} else console.log("AJAX 요청/응답 에러")
			}
		}
		function checkEmailResult(){
			var checkEResult = JSON.parse(httpRequest.responseText);
			console.log(checkEResult);
			
			checkemail = checkEResult.result;
			console.log(checkemail)
		}
		
		if( checkemail == false){
			$("#emailv").text( "회원번호와 일치하는 이메일이 아닙니다." );
			$("#emailv").css( "color", 'red' );
		}
		if( checkemail == true ){
			$("#emailv").text( "회원번호와 일치하는 이메일입니다." );
			$("#emailv").css( "color", 'blue' );
		
			var param = "email=" + $("#email").val();
			sendRequest("GET", "/send", param, callbackEmail);
		}
	})
	
	function callbackEmail(){
		console.log("인증이메일 전송 콜백함수 호출");
		if( httpRequest.readyState == 4 ){
			if( httpRequest.status == 200){
				emailSendResult();
			} else console.log("AJAX 요청/응답 에러")
		}
	}
	function emailSendResult(){
		var sendresult = JSON.parse(httpRequest.responseText);
		console.log(sendresult);
		
		emailsend = sendresult.result;
		
		if( emailsend == true ){
			$("#emailv").text( "이메일을 발송하였습니다" );
			$("#emailv").css( "color", 'red' );
		} 
		
		if( emailsend == false ){
			$("#emailv").text( "이메일 발송에 실패했습니다" );
			$("#emailv").css( "color", 'red' );
		} 
	}
	$("#btnCodeVerify").click(function(){
		var params = "email=" + $("#email").val() + "&code=" + $("#code").val();
		sendRequest("POST", "/send", params, callbackCode)
	});
	function callbackCode(){
		console.log("코드인증 콜백함수 호출");
		if( httpRequest.readyState == 4 ){
			if( httpRequest.status == 200){
				codeVerifyResult();
			} else console.log("AJAX 요청/응답 에러")
		}
	}
	function codeVerifyResult(){
		var codeVerifyResult = JSON.parse(httpRequest.responseText);
		console.log(codeVerifyResult);
		
		checkcode = codeVerifyResult.result;
		
		if( checkcode == true ){
			$("#codev").text("인증에 성공하였습니다.")
			$("#codev").css("color", "blue")
		}
		
		if( checkcode == false ){
			$("#codev").text("인증에 실패하였습니다.")
			$("#codev").css("color", "red")
		}
	}
	$("#btnNext").click(function(){
		
		if( checkcode == true ){
			$("#codev").text("인증에 성공하였습니다.");
			$("#codev").css("color", "blue");
			location.href = "/changepw";
		}
		if( checkcode == false){
			$("#codev").text("인증에 실패하였습니다.")
			$("#codev").css("color", "red")
			return false;
		}
	})
	
});
</script>

<div style="width: 500px; margin:0 auto; height: 700px;">
<h1>비밀번호 찾기</h1>
<hr>
<h5>이메일로 본인인증이 필요합니다.</h5>
	<div class="form-group">
		<label>이메일</label><br>
		<input type="email" id="email" name="email" class="form-control" required="required" style="width: 325px; display:inline-block; margin-right: 20px;"/>
		<button type="button" id="btnSendEmail" class="form-control" style="width: 150px; display:inline-block; background-color:#ccc;">이메일 인증받기</button>
		<div id="emailv"></div>
	</div>
	
	<div class="form-group">
		<label>인증번호 입력</label><br>
		<input type="text" id="code" name="code" class="form-control"  placeholder="인증번호를 입력하세요" style="width: 325px; display:inline-block; margin-right: 20px;"/>
		<button class="form-control" id="btnCodeVerify" style="width: 150px; display:inline-block; background-color:#ccc;">확인</button>
		<div id="codev"></div>
	</div>
	<button id="btnNext">다음 ></button>
</div>


<c:import url="/WEB-INF/views/login/footer.jsp"></c:import>