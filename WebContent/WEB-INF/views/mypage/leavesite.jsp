<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

<script>
window.onload = function(){
	
	goback.onclick = function(){
		console.log("test")
		history.go(-1);
	}
	
}
</script>
<style type="text/css">
.leavesite {
	height: 300px;
}

.leavesite h1 {
	margin-top: 15px;
	margin-bottom: 15px;
}
</style>

<section class="wrapper">

<section>
<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/editProfile" style="text-decoration:none;">프로필</a></h3></div>
<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/view/mywork" style="text-decoration:none;">활동내역</a></h3></div>
<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/leavesite" style="text-decoration:none;">사이트탈퇴</a></h3></div>
</section>

<div class="leavesite">
<h1>정말 탈퇴하시겠습니까?</h1>

<form action="/leavesite" method="POST">
<button>네, 탈퇴하겠습니다.</button>
<button type="button" id="goback">아니요, 계속하겠습니다.</button>
</form>

</div>
</section>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>