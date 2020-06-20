<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- header -->
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<!-- jQuery  -->
<script type="text/javascript">
$(document).ready(function(){
	
});


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
<form action="/login" method="POST">
    	<input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력하세요" required="required"><br>
    	<div></div>
    	<input type="text" name="pw" id="pw" class="form-control" placeholder="비밀번호를 입력하세요" required="required"><br>
		<div></div>
		<button class="btn btn-default btn-block">로그인</button>
</form>
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