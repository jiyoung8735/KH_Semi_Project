<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/mypage/profile.jsp"></c:import>

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

.mywork {
	margin-top: 290px;
	height: 900px;
	display: inline-block;
	width: 72%;
}

.mywork hr {
	margin-top: 15px;
	margin-bottom: 30px;
}

.mywork table{
	border: 1px solid black;
	border-collapse: collapse;
}

.mywork th, td {
	text-align: center;
	padding: 10px;
	border: 1px solid black;
}

.mywork td {
	font-weight: normal;
}

</style>


<script type="text/javascript">
$(document).ready(function() {
	
	function ss() {
		
		$(".star-box").each(function() {
			
			$(this).find(".star").removeClass("on")
			
			for(var i=0; i<= $(this).attr("data-starScore")*2-1; i++){
				$(this).find(".star").eq(i).addClass("on");
			}
	
		});
	}

	ss();
	
	$('.delete_btn').click(function() {
	    var dBtnRes = confirm( ' 정말 삭제하시겠습니까?');
	    console.log(dBtnRes);
	    
	    if(dBtnRes) {
	    	$(this).next().click();
	    }
	    
	});
	
})

</script>

	<div class="mywork">
	<h1>리뷰 관리</h1>
	<hr>
	<table>
		<tr>
			<th style="width: 15%;"><h3>메뉴명</h3></th>
			<th style="width: 10%;"><h3>작성자</h3></th>
			<th style="width: 20%;"><h3>별점</h3></th>
			<th style="width: 10%;"><h3>별점작성일자</h3></th>
			<th style="width: 30%;"><h3>리뷰</h3></th>
			<th style="width: 10%;"><h3>리뷰 작성일자</h3></th>
			<th style="width: 10%;"><h3>관리</h3></th>
	 	<c:forEach var="i" items="${myworkList }" begin="0" end="${fn:length(myworkList)}"> 
		<tr>
			<td><h3>${i.menu.menuName }</h3></td>
			<td><h3>${i.user.userNick }</h3></td>
			<td>
			<div class="star-box" data-starScore="${i.star.starScore }">
			<h3><span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span></h3>
			</div>
			</td>
			<td><h3>${i.star.starDate }</h3></td>
			<td><h3>${i.review.reviewContent }</h3></td>
			<td><h3>${i.review.reviewDate }</h3></td>
			<td><button><h3><a href="/update/mywork?menuNo=${i.menu.menuNo }">수정</a><h3></button> 
				<button class="delete_btn"><h3>삭제</h3></button>
				<button style="display: none;" onclick="location.href='/delete/mywork?menuNo=${i.menu.menuNo }'"></button>
			</td>
		</tr>
	 	</c:forEach> 
	</table>
	</div>
	
</section>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>