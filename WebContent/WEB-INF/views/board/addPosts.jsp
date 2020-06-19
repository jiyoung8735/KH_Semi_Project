<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css"  href="/resources/css/board/board.css" >    
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
<section class="wrapper">
<div class="board">

<h1>게시판 작성</h1>

<form action="/add/posts" method="post">

<table>

<tr><th>아이디</th><td></td></tr>
<tr><th>닉네임</th><td></td></tr>
<tr><th>제목</th><td><input type="text" name="title" style="width:100%"/></td></tr>
<tr><th colspan="2">본문</th></tr>
<tr><td colspan="2"><textarea id="content" name="content" cols="100" rows="10"></textarea></td></tr>
</table>
<button class="button" onclick="location.href='/add/posts'">작성</button>
<button class="button" onclick="javascript:history.go(-1)">취소</button>

</form>

</div>
</section>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>