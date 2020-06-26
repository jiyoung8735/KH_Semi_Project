<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="mo_overlay" id="mo_overlay"></div>
	<div class="mo_content">
		<div id="mo_left">
			<div class="mo_detail" id="mo_image" style="background-color: tomato; height: 74%;">이미지 ajax</div>
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

<script type="text/javascript">
$('#mo_close').on("click", function() {
	$('#mo_wrapper').addClass("mo_hidden");
});
$('#mo_overlay').on("click", function() {
	$('#mo_wrapper').addClass("mo_hidden");
});
</script>
 <script type="text/javascript">
   $("#mo_image").css({
       "backgroundImage": "url(/upload/${image.imgServer })",
       "background-size" : "cover",
       "background-position-x": "center"
     });
   </script>