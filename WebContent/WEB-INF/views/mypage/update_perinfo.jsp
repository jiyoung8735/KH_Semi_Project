<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
<style type="text/css">
.personalInfo_container{
	margin-top: 30px;
	margin-left: 390px;
	width: 610px;
	height: 500px;
}

.personalInfo_container > h1{
	margin-bottom: 15px;
}

.personalInfo_container > hr {
	margin-bottom: 15px;
}

.personalInfo_container tr {
	border-bottopm: 1px solid #bcbcbc;
} 

.personalInfo_container th {
	text-align: left;
} 

.personalInfo_container th, td {
	padding-top: 12px;
	padding-bottom: 12px;
	padding-right: 70px;
} 

</style>
    
	<div class="personalInfo_container">
		<h1>개인 정보</h1>
		<hr>
		<table>
		<tr><th><h3>성명</h3></th><td><h3 style="font-weight: normal;">${username }</h3></td></tr> 
		<tr><th><h3>닉네임</h3></th><td><h3 style="font-weight: normal;">${usernick }</h3></td></tr> 
		<tr><th><h3>성별</h3></th><td><h3 style="font-weight: normal;">${usergender }</h3></td></tr> 
		<tr><th><h3>생년월일</h3></th><td><h3 style="font-weight: normal;">${userbirth }</h3></td></tr> 
		<tr><th><h3>이메일</h3></th><td><h3 style="font-weight: normal;">${useremail }</h3></td></tr> 
		<tr><th><h3>전화번호</h3></th><td><h3 style="font-weight: normal;">${usertel }</h3></td></tr> 
		<tr><th><h3>관심프랜차이즈</h3></th><td><h3 style="font-weight: normal;">${usertel }</h3></td></tr> 
		</table>
	</div>