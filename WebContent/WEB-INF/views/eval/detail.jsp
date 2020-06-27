<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<div class="mo_overlay" id="mo_overlay"></div>
<div class="mo_content">
	<div id="mo_left">
		<div class="mo_detail" id="mo_image"
			style="background-color: tomato; height: 74%;"></div>
		<div class="mo_detail mo_detail_blank"></div>
		<div class="mo_detail" id="mo_expl"
			style="background-color: tomato; height: 24%;">설명</div>
		<div></div>
	</div>
	<div id="mo_middle"></div>
	<div id="mo_right">
		<button class="mo_button" id="mo_close">X</button>
		<div class="mo_detail" id="mo_star"
			style="background-color: tomato; height: 21%;">
			<div class="star-box">
				<span class="star star_left"></span> <span class="star star_right"></span>
				<span class="star star_left"></span> <span class="star star_right"></span>
				<span class="star star_left"></span> <span class="star star_right"></span>
				<span class="star star_left"></span> <span class="star star_right"></span>
				<span class="star star_left"></span> <span class="star star_right"></span>
			</div>
<%-- 			<div class="star-value">${staravg }</div> --%>
			<button class = "ajaxbutton">등록</button>
		</div>

		<div class="mo_detail mo_detail_blank"></div>


		<div class="mo_detail" id="mo_review"
			style="background-color: tomato; height: 77.5%; overflow: scroll;" >
			<table>
				<c:forEach var="item" items="${reportvalue}" varStatus="status">
					<tr>
						<td><div id="profile${status.index }" style="display: inline-block; width: 105px; height: 105px; border-radius: 50%; margin: 10%;"></div>
						</td> <td width="100%" style="padding: 20px">
						<c:out value="${reportkey[status.index].reviewContent}" /></td>
					</tr>
					<script type="text/javascript">
						$("#profile${status.index }")
								.css(
										{
											"backgroundImage" : "url(/upload_picture/${item.picServer })",
											"background-size" : "cover",
											"background-position-x" : "center"
										});
					</script>
				</c:forEach>
			</table>
			
 		
 			
		</div>
<!-- 		<div class="mo_detail mo_detail_blank"></div> -->
<!-- 		<div class="mo_detail" id="mo_pn" -->
<!-- 			style="background-color: tomato; height: 5%;">페이지네이션</div> -->
<!-- 	</div> -->
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
		"backgroundImage" : "url(/upload/${image.imgServer })",
		"background-size" : "cover",
		"background-position-x" : "center"
	});

	$("#mo_expl").html("${menu.menuInfo}");
</script>
 <script type="text/javascript">
   $("#mo_image").css({
	      "backgroundImage" : "url(/upload/${image.imgServer })",
	      "background-size" : "cover",
	      "background-position-x" : "center"
	   });
	   $(".ajaxbutton").click(function() {
	         $.ajax({
	            type: "get"
	            , url: "/eval/detail/insert"
	            , data: {
	               menuno: ${menuno }
	            }
	            , dataType: "html"
	            , success: function(result) {
	               console.log("AJAX 성공")
	               console.log(result)
	               $("#mo_right").html(result);
	            }
	            , error: function() {
	               console.log("AJAX 실패")
	            }
	         });
	   });
	</script>

<style type="text/css">
.star-box {
	/* 별과 별 사이 공백 제거 */
    font-size: 0;
}

.star {
	/* width,height 적용가능하도록 변경 */
	display: inline-block;

	/* 별이 표현되는 영역 크기 */
	width: 50px;
    height: 100px;
    

	/* 투명한 별 표현 */
	background-image: url(https://image.flaticon.com/icons/svg/159/159772.svg);
	background-repeat: no-repeat;
	background-size: 200%;
}

.star_left {
	/* 왼쪽 별 */
	background-position: 0 0;
}

.star_right {
	/* 오른쪽 별 */
	background-position: 100% 0;
}

.on {
	/* 채워진 별로 이미지 변경 */
	background-image: url(https://image.flaticon.com/icons/svg/149/149763.svg);
}
.star-value{
width:50px;
margin-left:550px;
font-size: 20px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
	${staravg}
		//클릭된 별이 몇 번째 칸인지 알아내기
		var idx =  ${staravg } * 2 - 1;

		//모두 투명하게 만들기
		$(".star").removeClass("on")

		//클릭이 된 곳까지 채워진 별로 만들기
		for (var i = 0; i <= idx; i++) {
			$(".star").eq(i).addClass("on");
		}

	})
</script>





