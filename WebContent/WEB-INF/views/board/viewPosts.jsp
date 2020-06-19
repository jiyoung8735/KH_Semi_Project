<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" type="text/css"  href="/resources/css/board/board.css" >
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
<section class="wrapper">
<div class="board">

	<c:set var="path" value="location.href='/add/posts'"></c:set>
<%-- <c:if test="${login eq true }"> --%>
<%-- </c:if> --%>

<%-- <c:if test="${login != true }"> --%>
<%-- 	<c:set var="path" value="location.href='/main'"></c:set> --%>
<%-- </c:if> --%>

<div class="board_top">
	<h3 style="display: inline;">공지사항 참고하시고 사용자 질문 올려주세요</h3><input type="text"  /><button class="button" onclick="${path}">글쓰기</button>
</div>
<table>
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>아이디</th>
	<th>조회수</th>
	<th>작성일</th>
</tr>

<c:forEach var="item" items="${boardList}">
<tr>
	<td><c:out value="${item.bdNo}" /></td>
	<td><a href="/detail/posts<%-- ?bdNo=${item.bdNo } --%>"><c:out value="${item.bdTitle}" /></a></td>
	<td><c:out value="${item.bdNo}" /></td>
	<td><c:out value="${item.bdNo}" /></td>
	<td><c:out value="${item.bdNo}" /></td>

</tr>
</c:forEach>
</table>

</div>
</section>
<c:import url="/WEB-INF/views/layout/paging_board.jsp" />
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>