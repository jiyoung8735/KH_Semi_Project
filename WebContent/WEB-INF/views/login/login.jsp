<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- header -->
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<!--XMLHttpRequest 생성  -->
<script type="text/javascript" src="/resources/js/httpRequest.js"></script>

<script type="text/javascript">
function login(){
	
	if( id.value == "" ){
		a.innerHTML = "아이디를 입력하세요";
		return false;
	} else if( pw.value == ""){
		b.innerHTML = "비밀번호를 입력하세요";
		return false;
	}
	
	var params = "id=" + id.value + "&pw=" + pw.value;
	console.log(params);
	
	sendRequest("POST", "/login", params, callback);
	
};	

function callback() {
	
	if( httpRequest.readyState == 4 ){
		if( httpRequest.status == 200){
			loginResult();
		} else console.log("AJAX 요청/응답 에러")
	}
};	
	
function loginResult() {
	
	var loginResult = JSON.parse(httpRequest.responseText);
	console.log(loginResult);
	console.log(loginResult.login)
	console.log(loginResult.userAuth)

	//로그인성공
	if( loginResult.login == 'success'){
		//일반사용자
		if(loginResult.userAuth == 1 ){ location.href="/main" }
		//프랜차이즈관리자
		if(loginResult.userAuth == 2 ){ location.href="/m/fran"}
	}
	
	//로그인실패
	if( loginResult.login == 'fail'){
		result.innerHTML = "로그인실패! 입력하신 아이디와 비밀번호가 일치하지 않습니다."
	}
	
};

</script>
<!-- content css  -->
<style type="text/css">
#login{
	width: 500px;
	margin: 0 auto;
	height: 500px;
	text-align: center;
}

#forget > a{
	margin-right: 30px;
	color: black;
}

</style>

<div id="login">
   	<input type="text" id="id" class="form-control" placeholder="아이디를 입력하세요" ><br>
   	<div id="a"></div>
   	<input type="text" id="pw" class="form-control" placeholder="비밀번호를 입력하세요"><br>
	<div id="b"></div>
	<div id="result"></div>
	<button onclick="login();" class="btn btn-default btn-block">로그인</button>
<br><hr><br>

<div id="forget">
<a href="/forgetid">아이디찾기</a>
<a href="/forgetpw">비밀번호찾기</a>
<a href="/join">회원가입</a> 
</div>
</div>

<!-- footer css  -->
<style type="text/css">
.footer {padding: 25px 0; text-align: center; color:black;}
.footer ul {margin-bottom: 20px;}
.footer li {position: relative; display: inline; padding: 0 7px 0 10px;}
.footer li:before {content: ''; width: 1px; height: 12px; background: #ccc; position: absolute; left: 0; top: 2px;}
.footer li:first-child:before {width: 0; height: 0;}
.footer .w3c {margin-top: 15px;}
.footer a {color: black;}
</style>
<hr>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</html>