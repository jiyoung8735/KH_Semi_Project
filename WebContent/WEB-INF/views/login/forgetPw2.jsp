<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- header -->
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<script type="text/javascript">
$(document).ready(function(){
	

});
</script>

<div style="width: 500px; margin:0 auto; height: 700px;">
<h1>비밀번호 찾기</h1>
<hr>
<h5>이메일로 본인인증이 필요합니다.</h5>
<form action="/emailverify" method="POST">
	<div class="form-group">
		<label>이메일</label><br>
		<input type="email" name="email" class="form-control" required="required" style="width: 325px; display:inline-block; margin-right: 20px;"/>
		<button type="button" id="emailVerify" class="form-control" style="width: 150px; display:inline-block; background-color:#ccc;">이메일 인증받기</button>
	</div>
	
	<div class="form-group">
		<label>인증번호 입력</label><br>
		<input type="text" name="verifyCode" id="verifyCode" class="form-control"  placeholder="인증번호를 입력하세요" style="width: 325px; display:inline-block; margin-right: 20px;"/>
		<button class="form-control" style="width: 150px; display:inline-block; background-color:#ccc;">확인</button>
	</div>
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
</html>