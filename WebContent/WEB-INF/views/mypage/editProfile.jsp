<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

<style type="text/css">
.wrapper01{
	width: 1280px;
	margin: 0 auto;
   	height: 1000px;
}

.wrapper02{
   	height: 420px;
}

.wrapper03 {
 	display: inline-block; 
	float: left;
	width: 30%;
	height: 80%;
	margin-top: 60px;
	margin-left: 66px;
	
	text-align: center;
}

.wrapper04 {
	display: inline-block; 
	width: 30%;
	height: 80%;
	margin-top: 67px;
	
	text-align: left;
}

.gradeview{
	margin-top: 40px;
}

.wrapper05 {
	display: inline-block;
	float: right;
	width: 30%;
	height: 80%;
	margin-top: 67px;
}
.wrapper07 {
	width: 70%;
	margin-left: 150px;
}


div#preview{
	margin: 0 auto;
	width: 200px; 
	height: 200px; 
	overflow: hidden;
	border-radius: 50%;
	background-color: #faf8f8;
}

table {
	width: 400px;
	height: 200px;
	border-collapse: collapse;
}

th{
	background-color: #ccc;
}

td{
	padding-left: 20px;
}
</style>

<script type="text/javascript" >
$(document).ready(function(){
	
$("#btnUpFile").click( function(){
	$("#upload").trigger("click");
});

$("#upload").change(function(e) {

 var file = e.target.files // FileList 객체      
 
 if( !file[0].type.includes("image")) {
    alert("이미지가 아닙니다.")
    e.target.value = null;
    return false;
 }
 
 // FileReader 객체 생성
 var reader = new FileReader();
 
 // File 객체의 정보(내용물)을 모두 읽어서 메모리에 적재(load)한 이후 동작되도록 이벤트 리스너 작성
 reader.onload = function(ev) {
    console.log(ev)
    console.log(ev.target)
    
    console.log("--------------------------------")
    
    console.log(ev.target.result)
    
    // 이미지가 한장만 유지됨
    $("#preview").html( $("<img>").attr({
          "src": ev.target.result,
          "width": 300,
          "height": 200
    }))
 }
 
 // FileReader 객체를 이용한 File 객체 정보 읽기
 reader.readAsDataURL(file[0]); // Blob 또는 File 형식으로 읽기
 
})

var div = document.getElementById("preview"); // 이미지를 감싸는 div
var img = document.getElementById("profileimage"); // 이미지
var divAspect = 400 / 200; // div의 가로세로비는 알고 있는 값이다
var imgAspect = img.height / img.width;

if (imgAspect <= divAspect) {
    // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
    var imgWidthActual = div.offsetHeight / imgAspect;
    var imgWidthToBe = div.offsetHeight / divAspect;
    var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
    img.style.cssText = 'width: auto; height: 100%; margin-left: '
                      + marginLeft + 'px;'
} else {
    // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
    img.style.cssText = 'width: 100%; height: auto; margin-left: 0;';
}
	
})
</script>


<div class="wrapper01">
	<div class="wrapper02">
		<div class="wrapper03">
		<form action="/editProfile" method="post" enctype="multipart/form-data">
		
			<div id="preview" >
			<img src="/upload/${picture.picServer }" alt="프로필사진" id="profileimage" >
			</div>
			<br>
			<input type="text" name="userno" id="userno" value="${userno }" style="display: none;"/>
			<input type="file" name="upload" id="upload" style="display: none;"/>
			<button type="button" id="btnUpFile" style="background-color:#faf8f8; width: 100px; height: 40px; border: 1px solid black;">프로필 등록</button>
			<button id="btnSave" style="background-color:#faf8f8; width: 100px; height: 40px; border: 1px solid black;">프로필 저장</button><br><br>
			
		
		</form>
		</div>
		
		<div class="wrapper04">
			<div class="gradeview">
				<c:if test="${usergrade eq 1}">
					<h1>별명 : ${usernick } </h1><br> 
					<h1>회원등급 : ${grade }
					<img src="/resources/image/grade01.JPG" alt="grade01" style="width: 65px; height: 65px; vertical-align:middle;"/></h1>
				</c:if>
				
				<c:if test="${usergrade eq 2}">
					<h1>별명 : ${usernick } </h1><br> 
					<h1>회원등급 : ${grade }
					<img src="/resources/image/grade02.JPG" alt="grade01" style="width: 65px; height: 65px; vertical-align:middle;"/></h1>
				</c:if>
				
				<c:if test="${usergrade eq 3}">
					<h1>별명 : ${usernick } </h1><br> 
					<h1>회원등급 : ${grade }
					<img src="/resources/image/grade03.JPG" alt="grade01" style="width: 65px; height: 65px; vertical-align:middle;"/></h1>
				</c:if>
				
				<c:if test="${usergrade eq 4}">
					<h1>별명 : ${usernick } </h1><br> 
					<h1>회원등급 : ${grade }
					<img src="/resources/image/grade04.JPG" alt="grade01" style="width: 65px; height: 65px; vertical-align:middle;"/></h1>
				</c:if>
			</div>
		</div>
		<div class="wrapper05">
			<div>
				<h1>23${cntstar }</h1>
				<h3>별점 작성수</h3>
			</div>
			<div>
				<h1>12${cntreview }</h1>
				<h3>리뷰 작성수</h3>
			</div>
			<div>
				<h1>30${users_cnt }</h1>
				<h3>방문 횟수</h3>
			</div><br>
			<div>
				<h4><a href="/view/mywork" style="text-decoration: underline;">활동 내역 확인 >></a></h4>
			</div>
		</div>
	</div>
	
	
	
	
	<div class="wrapper06">
		<div class="wrapper07">
			<h1>개인 정보</h1><br>
			<table border="1">
			<tr><th>성명</th><td>${username }</td></tr> 
			<tr><th>닉네임</th><td>${usernick }</td></tr>
			<tr><th>성별</th><td>${usergender }</td></tr>
			<tr><th>생년월일</th><td>${userbirth }</td></tr>
			<tr><th>이메일</th><td>${useremail }</td></tr>
			<tr><th>전화번호</th><td>${usertel }</td></tr>
			<tr><th>전화번호</th><td>${usertel }</td></tr>
			</table><br>
			<a href="/update/perinfo"><button style="background-color:#faf8f8; width: 100px; height: 40px; border: 1px solid black;">개인정보 수정</button></a>
		</div>
	</div>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>