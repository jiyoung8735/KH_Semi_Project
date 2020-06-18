<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
<c:import url="/WEB-INF/views/layout/header_slide.jsp"></c:import>
<section class="wrapper">

<div style="border: 1px solid black;">
서브메뉴
</div>
<div style="border: 1px solid black;">
필터링
</div>

<!-- modal -->
<div class="modal mo_hidden" id="mo_wrapper">
	<div class="mo_overlay" id="mo_overlay"></div>
		<div class="mo_content">
			<div id="mo_left">
				<div class="mo_detail" id="mo_image" style="background-color: tomato; height: 74%;">이미지</div>
				<div class="mo_detail mo_detail_blank"></div>
				<div class="mo_detail" id="mo_expl" style="background-color: tomato; height: 24%;">설명</div>
				<div></div>
			</div>
			<div id="mo_middle"></div>
			<div id="mo_right">
				<button class="mo_button" id="mo_close">X</button>
				<div class="mo_detail" id="mo_star" style="background-color: tomato; height: 21%;">평점</div>
				<div class="mo_detail mo_detail_blank"></div>
				<div class="mo_detail" id="mo_review" style="background-color: tomato; height: 70%;">
				<table>
				<tr>
					<td></td>
				</tr>
				</table>
				</div>
				<div class="mo_detail mo_detail_blank"></div>
				<div class="mo_detail" id="mo_pn" style="background-color: tomato; height: 5%;">페이지네이션</div>
			</div>
		</div>
</div>

<div class="eval">
<div class="ver">
<div class="hor" id="eval11"></div>
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

</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>