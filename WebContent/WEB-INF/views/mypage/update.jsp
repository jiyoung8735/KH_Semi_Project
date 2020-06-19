<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/login/header.jsp"></c:import>

<!-- jQuery 라이브러리  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#goback").click( function(){
		$(location).attr('href','/view/mywork');
	});
	
});

</script>

</head>

<div style="width: 800px; margin:0 auto;">
<h1>한줄평 & 평점 수정</h1>
<hr>
<form action="/update/myreviewstar" method="POST">
<div style="border: 1px solid red; width:700px; height:400px;">평점 & 한줄평 출력되서 나타나는 곳! <br>수정 할 수 있다</div>
<button style="width:100px; height: 50px; background-color: yellow;">수정완료</button>
</form>
<br>
<button id="goback" style="width:100px; height: 50px; background-color: blue;">뒤로가기</button>
</div>


</html>