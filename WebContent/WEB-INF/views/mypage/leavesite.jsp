<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>
<div style="width: 800px; margin:0 auto;">
<h1>정말 탈퇴하시겠습니까?</h1>

<form action="/leavesite" method="POST">
<button>탈퇴하기</button>
</form>
</div>

</html>