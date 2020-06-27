<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

div.mywork {
	margin-top: 30px;
	height: 500px;
}

.mywork hr {
	margin-top: 15px;
	margin-bottom: 15px;
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

.myreport {
	margin-top: 30px;
	height: 700px;
}

.myreport hr {
	margin-top: 15px;
	margin-bottom: 15px;
}

.myreport table{
	border: 1px solid black;
	border-collapse: collapse;
}

.myreport th, td {
	text-align: center;
	padding: 10px;
	border: 1px solid black;
}
.myreport td {
	font-weight: normal;
}
</style>


<script type="text/javascript">
$(document).ready(function() {
	
	ss();
	
	
	$('.delete_btn').click(function() {
	    var dBtnRes = confirm( ' 정말 삭제하시겠습니까?');
	    console.log(dBtnRes);
	});
	
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

<section class="wrapper">
	<nav>
	<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/editProfile" style="text-decoration:none;">프로필</a></h3></div>
	<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/view/mywork" style="text-decoration:none;">활동내역</a></h3></div>
	<div style="border: 1px solid black; width:180px; display:inline-block; text-align: center;"><h3><a href="/leavesite" style="text-decoration:none;">사이트탈퇴</a></h3></div>
	</nav>

	<div class="mywork">
	<h1>나의 리뷰 관리</h1>
	<hr>

	<table>
		<tr>
			<th style="width: 20%;"><h1>메뉴명</h1></th>
			<th style="width: 20%;"><h1>별점</h1></th>
			<th style="width: 20%;"><h1>리뷰</h1></th>
			<th style="width: 15%;"><h1>작성자</h1></th>
			<th style="width: 15%;"><h1>작성일자</h1></th>
			<th style="width: 10%;"><h1>관리</h1></th>
		</tr>
	 	<c:forEach var="mywork" items="${myworkList }" varStatus="status" > 
		<tr>
			<td><h1>${mywork.menuName }</h1></td>
			<td>
			<div class="star-box" data-starScore="${mywork.starScore }">
			<h1><span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span>
			<span class="star star_left"></span>
			<span class="star star_right"></span></h1>
			</div>
			</td>
			<td><h1>${mywork.reviewContent }</h1></td>
			<td><h1>${mywork.usersNick }</h1></td>
			<td><h1>${mywork.writtendate }</h1></td>
			<td><button><a href="/update/mywork?menuNo=${mywork.menuNo }"><h3>수정<h3></a></button> 
				<button class="delete_btn">삭제</button>
				<button style="display: none;" id="realDelete${status.index }"><a href="/delete/mywork?menuNo=${mywork.menuNo }"><h3>삭제<h3></a></button>
			</td>
		</tr>
	 	</c:forEach> 
	</table>
	</div>
	
	<div class="myreport">
	<h1>나의 신고 내역</h1>
	<hr>

	<table>
		<tr>
			<th style="width: 10%;"><h1>신고대상</h1></th>
			<th style="width: 20%;"><h1>신고리뷰</h1></th>
			<th style="width: 10%;"><h1>신고이유</h1></th>
			<th style="width: 15%;"><h1>상세내용</h1></th>
			<th style="width: 15%;"><h1>신고일자</h1></th>
			<th style="width: 10%;"><h1>조치내용</h1></th>
			<th style="width: 5%;"><h1>조치여부</h1></th>
		</tr>
	 	<c:forEach var="i" begin="0" end="${fn:length(Myreport)}" items="${Myreport }" >
			<tr>
			<td><h1>${i.user.userNick }</h1></td>
			<td><h1>${i.review.reviewContent }</h1></td>
			<td>
			<c:choose>
				<c:when test="${i.report.rptRsn eq 1 }">
				<h1><%="욕설" %></h1>
				</c:when>
				<c:when test="${i.report.rptRsn eq 2 }">
				<h1><%="비방" %></h1>
				</c:when>
				<c:when test="${i.report.rptRsn eq 3 }">
				<h1><%="거짓" %></h1>
				</c:when>
				<c:otherwise>
				<h1><%="기타" %></h1>
				</c:otherwise>
			</c:choose> 
			</td>
			<td><h1>${i.report.rptDetail }</h1></td>
			<td><h1>${i.report.rptDate }</h1></td>
			<td>
			<c:choose>
		        <c:when test="${i.report.rptManage eq 1 }">
		        <h1><%="계정 1일 정지" %></h1>
		        </c:when>
		        <c:when test="${i.report.rptManage eq 2 }">
		        <h1><%="계정 3일 정지" %></h1>
		        </c:when>
		        <c:when test="${i.report.rptManage eq 3 }">
		        <h1><%="계정 7일 정지" %></h1>
		        </c:when>
		        <c:otherwise>
		        <h1><%="계정 30일 정지" %></h1>
		        </c:otherwise>
 		 	</c:choose>
			</td>
			<td><h1>${i.report.rptYn }</h1></td>
			</tr>
			</c:forEach>
	</table>
	</div>
	
	
</section>


<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>