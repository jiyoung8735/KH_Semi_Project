<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

<div style="width: 800px; margin:0 auto; height: 1200px;" >

<h1>내가 작성한 리뷰 & 별점</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
	<tr class="success">
	<th style="width: 15%;">작성번호</th>
	<th style="width: 40%;">메뉴명</th>
	<th style="width: 15%;">작성일자</th>
	</tr>

 	<!-- var는 반복될 객체 , items는 반복될 대상 객체  -->	
	<c:forEach var="boardList" items="${boardList }"  >
	<tr>
		<td>${boardList.boardno }</td>
		<td><a href="/board/view?boardno=${boardList.boardno }">${boardList.title }</a></td>
		<td>${boardList.id }</td>
	</tr>
	</c:forEach> 
</table>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>