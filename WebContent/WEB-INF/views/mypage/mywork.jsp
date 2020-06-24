<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

<div style="width: 800px; margin:0 auto;" >

<section>
<div style="border: 1px solid black; width:200px; display:inline-block; text-align: center;"><h3><a href="/editProfile" style="text-decoration:none;">프로필</a></h3></div>
<div style="border: 1px solid black; width:200px; display:inline-block; text-align: center;"><h3><a href="/view/mywork" style="text-decoration:none;">활동내역</a></h3></div>
<div style="border: 1px solid black; width:200px; display:inline-block; text-align: center;"><h3><a href="/leavesite" style="text-decoration:none;">사이트탈퇴</a></h3></div>
</section>

<h1>My 활동내역</h1>
<hr>
<h3>1. 평점 & 한줄평</h3>

<div style="border: 1px solid red; width:700px; height:400px;">평점 & 한줄평 출력되서 나타나는 곳!</div>
<br>
<a href="/update/myreviewstar"><button style="width:100px; height: 50px; background-color: yellow;">수정하기</button></a>

<hr>

<h3>2. 신고내역</h3>
<div style="border: 1px solid tomato; width:700px; height:400px;">신고내역 출력되서 나타나는 곳!</div>
</div>

<div style="height: 200px;"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>