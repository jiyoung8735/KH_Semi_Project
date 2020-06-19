<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
<!--header-->    
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<script type="text/javascript">
$(document).ready(function(){
	
	//비밀번호 재확인
	$("#pwConfirm").click(function(){
		console.log("pwConfirm")
	});
	//이메일 인증번호 받기
	$("#emailVerify").click(function(){
		console.log("emailVerify")
	});
	//인증번호 입력
	$("#verifyCode").click(function(){
		console.log("verifyCode")
	});
});
</script>


<div style="width: 500px; margin:0 auto; height: 1200px;">

<form action="/join" method="POST">

<div class="form-group">
    <label >아이디</label>
    <input type="text" name="id" class="form-control" required="required">
</div>
<div class="form-group">
    <label >비밀번호</label>
    <input type="text" name="pw" class="form-control" required="required">
</div>
<div class="form-group">
    <label >비밀번호 재확인</label>
    <input type="text" name="pwConfirm" id="pwConfirm" class="form-control" required="required">
</div>
<div class="form-group">
    <label >이름</label>
    <input type="text" name="name" class="form-control" required="required">
</div>
<div class="form-group">
    <label >닉네임</label>
    <input type="text" name="nick" class="form-control" required="required">
</div>

<div class="form-group">
	<label>생년월일</label><br>
	<input type="text" name="year" class="form-control" required="required" placeholder="년(4자)" style="width: 150px; display:inline-block; margin-right: 21px;" />
               
	<select name="month"  class="form-control" required="required" style="width: 150px; display:inline-block; margin-right: 21px;">
	<option value="">월</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	</select>

	<input type="text" name="date"  class="form-control" required="required" placeholder="일" style="width: 150px; display:inline-block;"/>
</div>	

<div class="form-group">
    <label >성별</label>
	<select name="gender" class="form-control" required="required" >
    	<option value="">선택</option>
    	<option value="m">남</option>
    	<option value="f">여</option>
	</select>
</div>

<div class="form-group">
	<label>이메일</label><br>
	<input type="email" name="email" class="form-control" required="required" style="width: 325px; display:inline-block; margin-right: 20px;"/>
	<button type="button" id="emailVerify" class="form-control" style="width: 150px; display:inline-block; background-color:#ccc;">이메일 인증받기</button>
</div>

<div class="form-group">
	<label>인증번호 입력</label>
	<input type="text" name="verifyCode" id="verifyCode" class="form-control"  placeholder="인증번호를 입력하세요" />
</div>

<div class="form-group">
<label>전화번호</label><br>
<select name="tel_01" id="tel_01" required="required" class="form-control" style="width: 150px; display:inline-block; margin-right: 21px;">
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="017">017</option>
</select>
<input type="text" name="tel_02" id="tel_02" required="required" class="form-control"  style="width: 150px; display:inline-block; margin-right: 21px;"/> 
<input type="text" name="tel_03" id="tel_03" required="required" class="form-control"  style="width: 150px; display:inline-block;"/>
</div>

<div class="form-group">
<label>관심프랜차이즈</label>
<select name="franName" class="form-control">
    <option value="">선택</option>
    <option value="BBQ">BBQ</option>
    <option value="도미노">도미노</option>
    <option value="KFC">KFC</option>
    <option value="한솥">한솥</option>
    <option value="피자헛">피자헛</option>
</select>
</div>


<hr>
<button class="btn btn-primary btn-lg btn-block">가입하기</button>
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
