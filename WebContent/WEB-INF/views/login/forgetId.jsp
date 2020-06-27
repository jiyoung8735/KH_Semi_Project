<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- header -->
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<!--XMLHttpRequest 생성  -->
<script type="text/javascript" src="/resources/js/httpRequest.js"></script>

<script type="text/javascript">
	//전역변수
	var emailSend = false;
	var codeCheck = false;
$(document).ready(function(){
	
	
	//이메일 인증
	$("#btnSendEmail").click(function(){
		console.log("btnSendEmail")
		var param = "email=" + $("#email").val();
		console.log(param);
		sendRequest("GET", "/send", param, callbackEmail);
	});
	function callbackEmail(){
		console.log("이메일 발송 콜백함수 호출");
		if( httpRequest.readyState == 4 ){
			if( httpRequest.status == 200){
				emailSendResult();
			} else console.log("AJAX 요청/응답 에러")
		}
	}
	function emailSendResult(){
		var emailSendResult = JSON.parse(httpRequest.responseText);
		console.log(emailSendResult);
		
		emailsend = emailSendResult.result
		
		if( emailsend == true ){
			$("#emailv").text( "이메일을 발송하였습니다" );
			$("#emailv").css( "color", 'red' );
		} 
		
		if( emailsend == false ){
			$("#emailv").text( "이메일 발송에 실패했습니다" );
			$("#emailv").css( "color", 'red' );
		} 
	}
	//인증번호 확인
	$("#btnCodeVerify").click(function(){
		console.log("btnCodeVerify");
		var params = "email=" + $("#email").val() + "&code=" + $("#code").val();
		console.log(params);
		sendRequest("POST", "/send", params, callbackCode);
	});
	function callbackCode(){
		console.log("인증코드 확인 콜백함수 호출");
		if( httpRequest.readyState == 4){
			if( httpRequest.status == 200){
				codeCheckResult();
			}else console.log("AJAX 요청/응답 에러")
		}
	}
	function codeCheckResult(){
		var codeCheckResult = JSON.parse(httpRequest.responseText);
		console.log(codeCheckResult);
		
		codeCheck = codeCheckResult.result;
		
		if( codeCheck == true ){
			$("#codev").text("코드 인증에 성공하였습니다.");
			$("#codev").css("color", 'red');
			// 아이디 조회
			searchId();
		}
		
		if( codeCheck == false ){
			$("#codev").text("코드 인증에 실패하였습니다.");
			$("#codev").css("color", 'red');
		}
	}
	function searchId(){
		console.log("search Id...");
		var params = "name=" + $("#name").val() + "&email=" + $("#email").val();
		console.log(params);
		sendRequest("GET", "/searchid", params, callbackId);
	}
	function callbackId(){
		console.log("아이디조회 확인 콜백함수 호출");
		if( httpRequest.readyState == 4){
			if( httpRequest.status == 200){
				idSearchResult();
			}else console.log("AJAX 요청/응답 에러")
		}
	}
	function idSearchResult (){
		var idSearchResult = JSON.parse(httpRequest.responseText);
		console.log(idSearchResult);
		
		if( idSearchResult != null ){
			console.log("dd")
			$("#showid").text("아이디 : " + idSearchResult)
			$("#showid").css("color", "blue")
		}else{
			console.log("ss")
			$("#showid").text("조회하신 아이디가 없습니다.")
			$("#showid").css("color", "blue")
		}
	}
	
});
	// 아이디 조회
//	if( codeCheck == true ){
//		searchId();
//	}
</script>

<div style="width: 500px; margin:0 auto; height: 700px;">
<h1>아이디 찾기</h1>
<hr>
	<div class="form-group">
    	<label >이름</label>
    	<input type="text" id="name" name="name" class="form-control" required="required">
	</div>  
	<div class="form-group">
		<label>이메일</label><br>
		<input type="email" id="email" name="email" class="form-control" required="required" style="width: 325px; display:inline-block; margin-right: 20px;"/>
		<button id="btnSendEmail" class="form-control" style="width: 150px; display:inline-block; background-color:#ccc;">이메일 인증받기</button>
		<div id="emailv"></div>
	</div>
	
	<div class="form-group">
		<label>인증번호 입력</label><br>
		<input type="text" name="code" id="code" class="form-control"  required="required"  placeholder="인증번호를 입력하세요" style="width: 325px; display:inline-block; margin-right: 20px;"/>
		<button id="btnCodeVerify" class="form-control" style="width: 150px; display:inline-block; background-color:#ccc;">확인</button>
		<div id="codev"></div>
	</div>

<!-- 아이디 조회 (AJAX)  -->
<div id="showid"></div>
<hr>
<button class="btn btn-primary btn-block"><a href="/login">로그인하러 가기</a></button>
<hr>

<div style="text-align: center;">
<a href="/forgetpw">비밀번호찾기</a>
</div>
</div>

<c:import url="/WEB-INF/views/login/footer.jsp"></c:import>