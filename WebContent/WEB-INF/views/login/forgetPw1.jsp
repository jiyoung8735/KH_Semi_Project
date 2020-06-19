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
<h5>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</h5>
<form action="/checkid" method="POST">
	<div class="form-group">
    	<input type="text" name="name" class="form-control" placeholder="아이디를 입력하세요">
	</div> 
	<div style="width: 120px; margin:0 auto;"> 
		<button class="form-control" style="width: 100px; background-color:#ccc;">다음 ></button>
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