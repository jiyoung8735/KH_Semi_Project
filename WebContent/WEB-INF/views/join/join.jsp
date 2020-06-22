<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
<!--header-->    
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<!--XMLHttpRequest 생성  -->
<script type="text/javascript" src="/resources/js/httpRequest.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	//회원가입
	$("#btnJoin").click(function(){
		
		//필수정보입력
		if( $("#id").val() == "" ){
			$("#idv").html( "<span>필수정보입니다.</span>" ); 
			return false;
		}
		
		if( $("#pw").val() == "" ){
			$("#pwv").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
		
		if( $("#pwConfirm").val() == "" || $("#pw").val() != $("#pwConfirm").val()  ){
			$("#pwcv").html( "<div>비밀번호 재확인이 필요합니다.</div>" ); 
			return false;
		}
		
		if(  $("#name").val() == "" ){
			$("#namev").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
		if( $("#nick").val() == ""  ){
			$("#nickv").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
		if( $("#year").val() == "" ){
			$("#birthv").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
		if( $("#month").val() == "" ){
			$("#birthv").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
		if( $("#date").val() == "" ){
			$("#birthv").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
		if( $("#gender").val() == "" ){
			$("#genderv").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
		if( $("#email").val() == "" ){
			$("#emailv").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
		if( $("#tel_02").val() == "" ){
			$("#telv").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
		if( $("#tel_03").val() == "" ){
			$("#telv").html( "<div>필수정보입니다.</div>" ); 
			return false;
		}
//		if( $("#emailCode").val() == "" ){
//			$("#emailCodev").html( "<div>이메일 인증이 필요합니다.</div>" );
//			return false;
//		}
		//이메일인증실패
//		if( $("#emailCode").val() == "인증실패" ){
//			$("#emailCodev").html( "<div>이메일 인증을 실패하였습니다.</div>" );
//			return false;
//		}
		//아이디중복
		if( $("#id").val() == "실패" ){
			$("#idv").html( "<div>이미사용중인아이디입니다.</div>" );
			return false;
		}
	
	});
	

	//아이디중복확인
	$("#id").blur(function(){
		
		var params =  "id=" + $("#id").val();
		console.log(params);
		sendRequest("POST", "/doublecheckid", params, callback);
		
		if( $("#id").val() == "" ){	$("#idv").html( "<div>필수정보입니다.</div>" );}
	})
	
	
	function callback(){
		console.log("콜백함수 호출");
		if( httpRequest.readyState == 4 ){
			if( httpRequest.status == 200){
				idCheckResult();
			} else console.log("AJAX 요청/응답 에러")
		}
	}
	
	function idCheckResult() {
		
		var idCheckResult = JSON.parse(httpRequest.responseText);
		console.log(idCheckResult);
		
		if(idCheckResult == '성공' ){
			$("#idv").html( "<span>사용가능한 아이디입니다.</span>" );
		} 
		
		if(idCheckResult == '실패' ){
			$("#idv").html( "<span>이미사용중인 아이디입니다.</span>" );
		} 
		
	};
	
	//포커스잃을때
	$("#pw").blur(function() {
		
		if( $("#pw").val() != "" ){
			$("#pwv").html( "<div></div>" );
		} 
		
	});
	$("#pwConfirm").blur(function() {
		
		//비밀번호 재확인
		if( $("#pw").val() != $("#pwConfirm").val() ){
			$("#pwcv").html( "<div>비밀번호가 일치하지 않습니다!</div>" );
		} else{
			$("#pwcv").html( "<div></div>" );
		}	
	});
	$("#name").blur(function(){
			
		if( $("#name").val() != "" ){
			$("#namev").html( "<div></div>" ); 
		}
	});
	$("#nick").blur(function(){
			
		if( $("#nick").val() != "" ){
			$("#nickv").html( "<div></div>" ); 
		}
	});
	$("#year").blur(function(){
			
		if( $("#year").val() != "" && $("#month").val() != "" && $("#date").val() != ""  ){
			$("#birthv").html( "<div></div>" ); 
		}
	});
	$("#month").blur(function(){
			
		if( $("#year").val() != "" && $("#month").val() != "" && $("#date").val() != ""  ){
			$("#birthv").html( "<div></div>" ); 
		}
	});
	$("#date").blur(function(){
			
		if( $("#year").val() != "" && $("#month").val() != "" && $("#date").val() != ""  ){
			$("#birthv").html( "<div></div>" ); 
		}
	});
	$("#gender").blur(function(){
			
		if( $("#gender").val() != "" ){
			$("#genderv").html( "<div></div>" ); 
		}
	});
	$("#email").blur(function(){
			
		if( $("#email").val() != "" ){
			$("#emailv").html( "<div></div>" ); 
		}
	});
	$("#tel_02").blur(function(){
			
		if( $("#tel_02").val() != "" && $("#tel_03").val() != "" ){
			$("#telv").html( "<div></div>" ); 
		}
	});
	$("#tel_03").blur(function(){
			
		if( $("#tel_02").val() != "" && $("#tel_03").val() != "" ){
			$("#telv").html( "<div></div>" ); 
		}
	});
	$("#emailCode").blur(function(){
			
		if( $("#emailCode").val() == "인증성공" ){
			$("#emailCodev").html( "<div></div>" ); 
		}
	});
	
	
	//이메일 인증 받기
	$("#btnEmailCode").click(function(){
		console.log("#btnEmailCode")
	});
	//인증번호 확인
	$("#btnCodeVerify").click(function(){
		console.log("#btnCodeVerify")
	});



});
</script>


<div style="width: 500px; margin:0 auto; height: 1200px;">

<form action="/join" method="POST">

<div class="form-group">
    <label>아이디</label>
    <input type="text" name="id" id="id" class="form-control">
    <div id="idv"></div>
</div>
<div class="form-group">
    <label>비밀번호</label>
    <input type="text" name="pw" id="pw" class="form-control" >
	<div id="pwv"></div>
</div>
<div class="form-group">
    <label>비밀번호 재확인</label>
    <input type="text" id="pwConfirm" class="form-control" >
	<div id="pwcv"></div>
</div>
<div class="form-group">
    <label>이름</label>
    <input type="text" name="name" id="name" class="form-control">
	<div id="namev"></div>
</div>
<div class="form-group">
    <label>닉네임</label>
    <input type="text" name="nick" id="nick" class="form-control">
	<div id="nickv"></div>
</div>

<div class="form-group">
	<label>생년월일</label><br>
	<input type="text" name="year" id="year" class="form-control" placeholder="년(4자)" style="width: 150px; display:inline-block; margin-right: 21px;" />
               
	<select name="month" id="month" class="form-control" style="width: 150px; display:inline-block; margin-right: 21px;">
	<option value="">월</option>
	<option value="1">01</option>
	<option value="2">02</option>
	<option value="3">03</option>
	<option value="4">04</option>
	<option value="5">05</option>
	<option value="6">06</option>
	<option value="7">07</option>
	<option value="8">08</option>
	<option value="9">09</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	</select>

	<input type="text" name="date" id="date" class="form-control" placeholder="일" style="width: 150px; display:inline-block;"/><br>
	<div id="birthv"></div>
</div>	

<div class="form-group">
    <label>성별</label>
	<select name="gender" id="gender" class="form-control" >
    	<option value="">선택</option>
    	<option value="m">남</option>
    	<option value="f">여</option>
	</select>
	<div id="genderv"></div>
</div>

<div class="form-group">
	<label>이메일</label><br>
	<input type="email" name="email" id="email" class="form-control" style="width: 325px; display:inline-block; margin-right: 20px;"/>
	<button type="button" id="btnEmailCode" class="form-control" style="width: 150px; display:inline-block; background-color:#ccc;">이메일 인증받기</button>
	<div id="emailv"></div>
</div>

<div class="form-group">
	<label>인증번호 입력</label><br>
	<input type="text" name="emailCode" id="emailCode" class="form-control" style="width: 325px; display:inline-block; margin-right: 20px;" placeholder="인증번호를 입력하세요" />
	<button type="button" id="btnCodeVerify" class="form-control" style="width: 150px; display:inline-block; background-color:#ccc;">확인</button>
	<div id="emailCodev"></div>
</div>

<div class="form-group">
<label>전화번호</label><br>
<select name="tel_01" id="tel_01" class="form-control" style="width: 150px; display:inline-block; margin-right: 21px;">
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="017">017</option>
</select>
<input type="text" name="tel_02" id="tel_02" class="form-control"  style="width: 150px; display:inline-block; margin-right: 21px;"/> 
<input type="text" name="tel_03" id="tel_03" class="form-control"  style="width: 150px; display:inline-block;"/><br>
<div id="telv"></div>
</div>

<div class="form-group">
<label>관심프랜차이즈</label>
<select name="franName" id="franName" class="form-control">
    <option value="">선택</option>
    <option value="BBQ">BBQ</option>
    <option value="도미노">도미노</option>
    <option value="KFC">KFC</option>
    <option value="한솥">한솥</option>
    <option value="피자헛">피자헛</option>
</select>
</div>


<hr>
<button id="btnJoin" class="btn btn-primary btn-lg btn-block">가입하기</button>
</form>
</div>

<!-- footer css  -->
<style type="text/css">
.footer {padding: 25px 0; text-align: center;}
.footer ul {margin-bottom: 20px;}
.footer li {position: relative; display: inline; padding: 0 7px 0 10px;}
.footer li:before {content: ''; width: 1px; height: 12px; background: #ccc; position: absolute; left: 0; top: 2px;}
.footer li:first-child:before {width: 0; height: 0;}
.footer .w3c {margin-top: 15px;}
</style>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
