<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>



<style type="text/css">

.wrapper01{
   	height: 400px;
}

.wrapper02 {
 	display: inline-block; 
	float: left;
	width: 49%;
	height: 100%;
	border: 1px solid red;
	
	text-align: center;
}

.wrapper03 {
	display: inline-block; 
	float: right;
	width: 50%;
	height: 100%;
	border: 1px solid blue;
	
	text-align: center;
}

.wrapper04 {
	border: 1px solid blue;
}
.wrapper04_02 {
	width: 80%;
	padding-left: 200px;
	border: 1px solid green;
}

.wrapper05{
	width: 1280px;
	margin: 0 auto;
   	height: 800px;
}

div#preview{
	margin: 0 auto;
	width: 200px; 
	height: 200px; 
	border: 1px solid red;
	overflow: hidden;
	border-radius: 50%;
}

</style>

<script type="text/javascript" >
$(document).ready(function(){
	
$("#btnUpFile").click( function(){
	$("#upload").trigger("click");
});

$("#upload").change(function(e) {
//  console.log("파일 선택됨, change")
//  console.log(e)
//  console.log(e.target)

 // -------------------------------

 // 선택한 파일들 변수
 var file = e.target.files // FileList 객체      
 
//  console.log(file)
//  console.log(file[0])
 
//  if( file[0].type.split("/")[0] != "image" ) {
 if( !file[0].type.includes("image")) {
    alert("이미지가 아닙니다.")
    e.target.value = null;
    return false;
 }
 
 // ** File 객체에는 파일의 정보가 들어있긴 하지만 해당 파일의 내용물(컨텐츠) 정보는 없다.
 //   -> FileReader 객체를 이용해 파일 내용을 읽어들여야한다.
 
 console.log("---------------------------")
 
 // FileReader 객체 생성
 var reader = new FileReader();
 
 // File 객체의 정보(내용물)을 모두 읽어서 메모리에 적재(load)한 이후 동작되도록 이벤트 리스너 작성
 reader.onload = function(ev) {
    console.log(ev)
    console.log(ev.target)
    
    console.log("--------------------------------")
    
    console.log(ev.target.result)
    
    // 이미지가 추가됨 - 좋지 않음
//     $("<img>").attr("src", ev.target.result).appendTo( $("#preview") )

    // 이미지가 한장만 유지됨
    $("#preview").html( $("<img>").attr({
          "src": ev.target.result,
          "width": 300,
          "height": 200
    }))
 }
 
 // FileReader 객체를 이용한 File 객체 정보 읽기
//  reader.readAsText(file[0]); // 텍스트 형식으로 읽기
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
<div class="wrapper05">

<div class="wrapper01">

<div class="wrapper02">

	<h1>나의 프로필</h1>
<form action="/editProfile" method="post" enctype="multipart/form-data">

	<div id="preview" >
	<img src="/upload/${picture.picServer }" alt="프로필사진" id="profileimage" >
	</div>
	
	<input type="text" name="userno" id="userno" value="${userno }" style="display: none;"/>
	<input type="file" name="upload" id="upload" style="display: none;"/>
	<button type="button" id="btnUpFile">프로필 등록</button><button id="btnSave">프로필 저장</button>

</form>


</div>


<div class="wrapper03">
	<div class="gradeview"><h1>회원등급</h1><br>
	<c:if test="${usergrade eq 1}">
		<strong>${usernick }</strong>님!
		<strong>${grade }</strong>입니다. 조금 더 분발하세요!
	</c:if>
	<c:if test="${usergrade eq 2}">
		<strong>${usernick }</strong>님!
		<strong>${grade }</strong>입니다. 페이스를 유지하세요.
	</c:if>
	<c:if test="${usergrade eq 3}">
		<strong>${usernick }</strong>님!
		<strong>${grade }</strong>입니다. 아주 잘하고 있습니다.
	</c:if>
		<strong>${usernick }</strong>님!
		<c:if test="${usergrade eq 4}">
	<strong>${grade }</strong>입니다. 항상 사랑합니다.
	</c:if>
	</div>

</div>

</div>

<div class="wrapper04">

<div class="wrapper04_02">
<h1>개인 정보</h1>
<form action="/editProfile" method="POST">
<table>
<tr><td>성명</td><td><input type="text" value="${username }"/></td></tr> 
<tr><td>닉네임</td><td><input type="text" value="${usernick }"/></td></tr>
<tr><td>성별</td><td><select name="gender" id="gender" class="form-control" >
    	<option value="">선택</option>
    	<option value="m">남</option>
    	<option value="f">여</option>
	</select></td></tr>
<tr><td>생년월일</td><td><input type="text" value="${userbirth }"/></td></tr>
<tr><td>이메일</td><td><input type="email" value="${useremail }"/></td></tr>
<tr><td>전화번호</td><td><input type="text" value="${usertel }"/></td></tr>
</table>
<button>수정적용</button>
</form>
</div>
</div>

</div>


<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>