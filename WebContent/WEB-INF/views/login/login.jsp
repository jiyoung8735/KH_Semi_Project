<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- header -->
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<div style="width: 500px; margin:0 auto; height: 700px;">
<form action="/login" method="POST">
	<div class="form-group">
    	<label >아이디</label>
    	<input type="text" name="id" class="form-control" placeholder="아이디를 입력하세요" required="required">
	</div>  
	<div class="form-group">
    	<label >비밀번호</label>
    	<input type="text" name="pw" class="form-control" placeholder="비밀번호를 입력하세요" required="required">
	</div>
	<button class="btn btn-primary btn-lg btn-block">로그인</button>
</form>
<hr>

<div style="text-align: center;">
<a href="/forgetid" style="margin-right: 30px;">아이디찾기</a>
<a href="/forgetpw" style="margin-right: 30px;">비밀번호찾기</a>
<a href="/join">회원가입</a> 
</div>
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
</html>