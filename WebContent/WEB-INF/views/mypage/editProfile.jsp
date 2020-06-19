<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<div style="width: 800px; margin:0 auto;">

<section>
<div style="border: 1px solid black; width:200px; display:inline-block; text-align: center;"><h3><a href="/editProfile" style="text-decoration:none;">프로필</a></h3></div>
<div style="border: 1px solid black; width:200px; display:inline-block; text-align: center;"><h3><a href="/view/mywork" style="text-decoration:none;">활동내역</a></h3></div>
<div style="border: 1px solid black; width:200px; display:inline-block; text-align: center;"><h3><a href="/leavesite" style="text-decoration:none;">사이트탈퇴</a></h3></div>
</section>

<h1>My 프로필</h1>

<form action="/editProfile" method="POST">
<div style="border: 1px solid red; width:700px; height:400px;">프로필 출력되서 나타나는 곳!<br>프로필 출력되서 나타나는 곳!<br>프로필 출력되서 나타나는 곳!<br></div>
<br>
<button style="width:100px; height: 50px; background-color: yellow;">편집 적용</button>
</form>
<br>
<a href="/security">비밀번호 변경하기</a>
</div>

</html>