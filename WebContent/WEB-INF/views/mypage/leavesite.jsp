<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/mypage/profile.jsp"></c:import>

<script>
window.onload = function(){
	
	goback.onclick = function(){
		console.log("test")
		location.href = '/editProfile';
	}
	
}
</script>
<style type="text/css">
.leavesite {
	height: 1000px;
	width: 72%;
	display: inline-block;
	margin-top: 290px;
}

.leavesite h1 {
	margin-top: 15px;
	margin-bottom: 15px;
}

.leavesite button {	
	width: 200px;
	height: 30px;
	margin-top: 20px;
}
</style>

<div class="leavesite">
<h1>사이트 탈퇴</h1>
<hr><br>
<h1>정말 탈퇴하시겠습니까?</h1>
<form action="/leavesite" method="POST">
<button>네, 탈퇴하겠습니다.</button><br>
<button type="button" id="goback">아니요, 계속하겠습니다.</button>
</form>

</div>
</section>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>