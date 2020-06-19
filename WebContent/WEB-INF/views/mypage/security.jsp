<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#goback").click( function(){
		history.go(-1);
	});
	
});

</script>
</head>
<div style="width: 800px; margin:0 auto;" >
<h1>비밀번호 변경</h1>
<hr>
<form action="/security" method="POST">
	<div class="form-group">
		<input type="text" name="pwC" class="form-control" required="required" placeholder="현재 비밀번호"/>
	</div>
	<div class="form-group">
		<input type="text" name="pwN" class="form-control" required="required" placeholder="새 비밀번호"/>
	</div>
	
	<div class="form-group">
		<input type="text" name="pwConfirm" class="form-control" required="required" placeholder="새 비밀번호 확인"/>
	</div>
	
	<div class="form-group">
		<input type="submit" class="form-control" value="확인" style="width: 100px; background-color:#ccc;"/>
	</div>
</form>
<br><br>
<button id="goback" style="width:100px; height: 50px; background-color: blue;">뒤로가기</button>
<br>


</div>
</html>