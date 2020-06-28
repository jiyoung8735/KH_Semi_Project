<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

<style type="text/css">

.profile_container{
   	height: 450px;
   	margin-top: 100px;
}

.profile_img_container {
 	display: inline-block; 
	float: left;
	width: 26%;
}

.mywork_container {
	display: inline-block; 
	width: 600px;
	margin-top: 140px;
	margin-left: 65px;
}

.mywork_container > h1 {
	margin-bottom:15px;
}

.mywork_container div#grade {
	margin-top:15px;
}

.mywork_preview_container {
	margin-top: 15px;
}

.mywork_preview_container > div{
	display: inline-block;
	width: 145px;
}


div#preview{
	width: 200px; 
	height: 200px; 
	overflow: hidden;
	border-radius: 50%;
	background-color: #faf8f8;
}


.gradeview {
	width: 60%;
	text-align: left;
}

</style>

<script type="text/javascript" >
$(document).ready(function(){
	
	$("#btnUpFile").click( function(){
		$("#upload").trigger("click");
	
	});

	$("#upload").change( function(e) {

		 var file = e.target.files // FileList 객체      
		 
		 if( !file[0].type.includes("image") ) {
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
		    }));
		    
		 }
		 
		 // FileReader 객체를 이용한 File 객체 정보 읽기
		 reader.readAsDataURL(file[0]); // Blob 또는 File 형식으로 읽기
	 
	})

	var div = document.getElementById("preview"); 
	var img = document.getElementById("profileimage"); 
	var divAspect = 200 / 200;
	var imgAspect = ${picture.picVer } / ${picture.picHor };

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
	
	//test
	$("#btnTest").click(function(){
	// 요청 URL
	var url = "/view/mywork"
	
	// 요청 파라미터
	var data = {
		//	"num1" : $("#num1").val()
		//	, "num2" : $("#num2").val()
		//	, "oper" : $("#oper").val()
	}
	
	// AJAX 요청 보내기 - $.get(), $.post()
		$.get( url, data, function( res ){
			$("#resultLayout").html( res )
		}); 
		
	})
	
	
})
</script>


<section class="wrapper">
	<nav>
	<div style="border: 1px solid black; width:200px; display:inline-block; text-align: center;"><h3><a href="/editProfile" style="text-decoration:none;">프로필</a></h3></div>
	<div style="border: 1px solid black; width:200px; display:inline-block; text-align: center;"><h3><a href="/view/mywork" style="text-decoration:none;">활동내역</a></h3></div>
	<div style="border: 1px solid black; width:200px; display:inline-block; text-align: center;"><h3><a href="/leavesite" style="text-decoration:none;">사이트탈퇴</a></h3></div>
	</nav>

	<div class="profile_container">
		<div class="profile_img_container">
		<form action="/editProfile" method="post" enctype="multipart/form-data">
			
			<div id="preview" >
			<img src="/upload_picture/${picture.picServer }" alt="프로필사진" id="profileimage" >
			</div>
		
			<br>
			<input type="text" name="userno" id="userno" value="${userno }" style="display: none;"/>
			<input type="file" name="upload" id="upload" style="display: none;"/>
			<button type="button" id="btnUpFile" style="background-color:#faf8f8; width: 100px; height: 40px; border: 1px solid black;">프로필 등록</button>
			<button id="btnSave" style="background-color:#faf8f8; width: 100px; height: 40px; border: 1px solid black;">프로필 저장</button><br><br>
			
		
		</form>
		<div class="grade_container">
			<div class="gradeview">
					<h3>${useremail }</h3>
					<h3>${usernick }</h3>
					<div >
					<c:if test="${usergrade eq 1}">
						<h3>${grade }
						<img src="/resources/image/grade01.JPG" alt="grade01" style="width: 30px; height: 40px; vertical-align:middle;"/></h3>
					</c:if>
					<c:if test="${usergrade eq 2}">
						<h3>${grade }
						<img src="/resources/image/grade02.JPG" alt="grade01" style="width: 50px; height: 60px; vertical-align:middle;"/></h3>
					</c:if>
					<c:if test="${usergrade eq 3}">
						<h3>${grade }
						<img src="/resources/image/grade03.JPG" alt="grade01" style="width: 50px; height: 60px; vertical-align:middle;"/></h3>
					</c:if>
					<c:if test="${usergrade eq 4}">
						<h3>${grade }
						<img src="/resources/image/grade04.JPG" alt="grade01" style="width: 50px; height: 60px; vertical-align:middle;"/></h3>
					</c:if>
					</div>
					<button id="btnTest">테스트</button>
			</div>
		</div>
		</div>
		
		<div class="mywork_container">
			<h1>${username } 님 </h1>
			<hr>
			<div class="mywork_preview_container">
				<div>
					<h3>방문 횟수</h3>
					<h1>${users_cnt }</h1>
				</div>
				<div>
					<h3>별점 작성</h3>
					<h1>${cntstar }</h1>
				</div>
				<div>
					<h3>리뷰 작성</h3>
					<h1>${cntreview }</h1>
				</div>
				<div>
					<h3>신고 내역</h3>
					<h1>${cntreport }</h1>
				</div>
			</div>
		</div>
		
	<div id="resultLayout"></div>
	</div>
</section>


<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>