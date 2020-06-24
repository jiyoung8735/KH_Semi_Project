<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#goback").click( function(){
		$(location).attr('href','/view/mywork');
	});
	
});

</script>

</head>

<div style="width: 800px; margin:0 auto;">
<h1>내가 작성한 리뷰 & 별점 수정하기</h1>
<hr>

	<div style="border: 1px solid red; width:700px; height:400px;">
	<form action="/update/myreviewstar" method="POST">
		<table>
			<tr><th>메뉴명</th><td>${myWork.menuName }</td></tr>	
			<tr><th>별명</th><td>${myWork.usersNick }</td></tr>	
			<tr><th>별점</th><td>${myWork.starScore }</td></tr>	
			<tr><th>리뷰</th><td><input type="text" value="${myWork.reviewContent }"/></td></tr>	
		</table>
		<button style="width:100px; height: 50px; background-color: yellow;">수정완료</button>
	</form>
	<br>
	<button id="goback" style="width:100px; height: 50px; background-color: blue;">뒤로가기</button>
	</div>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>