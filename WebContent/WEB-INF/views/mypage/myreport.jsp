<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:import url="/WEB-INF/views/mypage/profile.jsp"></c:import>

<style type="text/css">

.myreport {
	margin-top: 290px;
	height: 700px;
	display: inline-block;
	width: 72%;
}

.myreport hr {
	margin-top: 15px;
	margin-bottom: 30px;
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
<body>

<div class="myreport">
	<h1>신고 내역</h1>
	<hr>

	<table>
		<tr>
			<th style="width: 10%;"><h3>신고대상</h3></th>
			<th style="width: 20%;"><h3>신고리뷰</h3></th>
			<th style="width: 5%;"><h3>신고이유</h3></th>
			<th style="width: 10%;"><h3>상세내용</h3></th>
			<th style="width: 10%;"><h3>신고일자</h3></th>
			<th style="width: 10%;"><h3>조치내용</h3></th>
			<th style="width: 10%;"><h3>조치여부</h3></th>
		</tr>
	 	<c:forEach var="i" begin="0" end="${fn:length(Myreport)}" items="${Myreport }" >
			<tr>
			<td><h1>${i.user.userNick }</h1></td>
			<td><h1>${i.review.reviewContent }</h1></td>
			<td>
			<c:choose>
				<c:when test="${i.report.rptRsn eq 1 }">
				<h1><%="비속어 사용" %></h1>
				</c:when>
				<c:when test="${i.report.rptRsn eq 2 }">
				<h1><%="허위사실 유포" %></h1>
				</c:when>
				<c:when test="${i.report.rptRsn eq 3 }">
				<h1><%="불충분한 정보" %></h1>
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
		        <c:when test="${i.report.rptManage eq 4 }">
		        <h1><%="계정 30일 정지" %></h1>
		        </c:when>

 		 	</c:choose>
			</td>
			<td><h1>${i.report.rptYn }</h1></td>
			</tr>
			</c:forEach>
	</table>
	</div>

</body>
</html>