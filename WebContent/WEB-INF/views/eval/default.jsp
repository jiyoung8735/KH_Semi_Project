<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/header_slide.jsp"></c:import>

<script type="text/javascript">
$(document).ready(function(){
	
	var div = document.getElementById("eval11"); // 이미지를 감싸는 div
	var img = document.getElementById("image1"); // 이미지
	
	var divAspect = 220 / 220; 
	var imgAspect = ${image[1].imgVer } / ${image[1].imgHor }
	
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


<section class="wrapper">

<div class="submenu_back">
  	<div class="submenu_list">
  	 <ul>
	   	<li class="submenu"><input type="button" class="filter_btn" value="음식1" id="food_1" /></li>
	   	<li class="submenu"><input type="button" class="filter_btn" value="음식2" id="food_2" /></li>
	   	<li class="submenu"><input type="button" class="filter_btn" value="음식3" id="food_3" /></li>
	   	<li class="submenu"><input type="button" class="filter_btn" value="음식4" id="food_4" /></li>
	   	<li class="submenu"><input type="button" class="filter_btn" value="음식5" id="food_5" /></li>
   	</ul>
  	</div>
</div>

<!-- modal -->
<div class="modal mo_hidden" id="mo_wrapper">


</div>

<div class="eval" id="evalDiv">

<div class="ver">
<div class="hor" id="eval11"><img src="/upload/${image[1].imgServer }" alt="이미지사진" id="image1" ></div>

<div class="h_blank"></div>
<div class="hor" id="eval12"></div>

<div class="h_blank" ></div>
<div class="hor" id="eval13"></div>

<div class="h_blank"></div>
<div class="hor" id="eval14"></div>

</div>

<div class="v_blank"></div>
<div class="ver">
<div class="hor" id="eval21"></div>
<div class="h_blank"></div>
<div class="hor" id="eval22"></div>
<div class="h_blank" ></div>
<div class="hor" id="eval23"></div>
<div class="h_blank"></div>
<div class="hor" id="eval24"></div>
</div>
<div class="v_blank"></div>
<div class="ver">
<div class="hor" id="eval31"></div>
<div class="h_blank"></div>
<div class="hor" id="eval32"></div>
<div class="h_blank" ></div>
<div class="hor" id="eval33"></div>
<div class="h_blank"></div>
<div class="hor" id="eval34"></div>
</div>
<div class="v_blank"></div>
<div class="ver">
<div class="hor" id="eval41"></div>
<div class="h_blank"></div>
<div class="hor" id="eval42"></div>
<div class="h_blank" ></div>
<div class="hor" id="eval43"></div>
<div class="h_blank"></div>
<div class="hor" id="eval44"></div>
</div>
</div>

</section>



<script type="text/javascript">

$('.hor').on("click", function() {
	$('#mo_wrapper').removeClass("mo_hidden");
});

$('#mo_close').on("click", function() {
	$('#mo_wrapper').addClass("mo_hidden");
});

$('#mo_overlay').on("click", function() {
	$('#mo_wrapper').addClass("mo_hidden");
});

$("input[id^=food_]").click(function() {
      $.ajax({
         type: "POST"
         , url: "/eval/filter"
         , data: {
            food: $(this).val()
         }
         , dataType: "html"
         , success: function(result) {
            console.log("AJAX 성공")
            console.log(result)
            $("#evalDiv").html(result);
         }
         , error: function() {
            console.log("AJAX 실패")
         }
      });
});

$(".hor").click(function() {
      $.ajax({
         type: "POST"
         , url: "/eval/detail"
         , data: {
            food: $(this).attr("value")
         }
         , dataType: "html"
         , success: function(result) {
            console.log("AJAX 성공")
            console.log(result)
            $("#mo_wrapper").html(result);
         }
         , error: function() {
            console.log("AJAX 실패")
         }
      });
});

</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>