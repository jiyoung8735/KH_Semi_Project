<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

<style type="text/css">
.star-box {
	/* 별과 별 사이 공백 제거 */
    font-size: 0;
}

.star {
	/* width,height 적용가능하도록 변경 */
	display: inline-block;

	/* 별이 표현되는 영역 크기 */
	width: 15px;
    height: 30px;

	/* 투명한 별 표현 */
	background-image: url(/resources/image/empty.png);
	background-repeat: no-repeat;
}

.star_left {
	/* 왼쪽 별 */
	background-position: 0 0;
	background-size: 200%;
}

.star_right {
	/* 오른쪽 별 */
	background-position: 100% 0;
	background-size: 200%;
}

.on {
	/* 채워진 별로 이미지 변경 */
	background-image: url(/resources/image/star.png);
}
</style>


<script type="text/javascript">
$(document).ready(function() {
	
	ss();
	
});	

function ss() {
	
	$(".star-box").each(function() {
		
		$(this).find(".star").removeClass("on")
		
		for(var i=0; i<= $(this).attr("data-starScore")*2-1; i++){
			$(this).find(".star").eq(i).addClass("on");
		}

	})
	
}

</script>


<div style="width: 800px; margin:0 auto; height: 1200px;" >

<section>
<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/editProfile" style="text-decoration:none;">프로필</a></h3></div>
<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/view/mywork" style="text-decoration:none;">활동내역</a></h3></div>
<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/view/myreport" style="text-decoration:none;">신고내역</a></h3></div>
<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/leavesite" style="text-decoration:none;">사이트탈퇴</a></h3></div>
</section>

<br><br><br>

<h1>내가 작성한 리뷰 & 별점</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
	<tr class="success">
	<th style="width: 10%;">메뉴명</th>
	<th style="width: 20%;">작성일자</th>
	<th style="width: 20%;">별점</th>
	<th style="width: 30%;">리뷰</th>
	<th style="width: 5%;">수정</th>
	<th style="width: 5%;">삭제</th>
	</tr>
${myworkList }
 	<!-- var는 반복될 객체 , items는 반복될 대상 객체  -->	
 	<c:forEach var="mywork" items="${myworkList }"  > 
	<tr>
		<td>${mywork.menuName }</td>
		<td>${mywork.writtendate }</td>
		<td>
			<div class="star-box" data-starScore="${mywork.starScore }">
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			</div>
		</td>
		<td>${mywork.reviewContent }</td>
		<td><a href="/update/mywork?menuNo=${mywork.menuNo }">수정</a></td>
		<td><a href="#">삭제</a></td>
	</tr>
 	</c:forEach> 
</table>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>