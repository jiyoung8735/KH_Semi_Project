<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

<div style="width: 1200px; margin:0 auto;">
<h1>나의 신고 내역</h1>
<hr>

	<div>
		<table>
			<tr><th>대상자 번호</th><th>대상 한줄평</th><th>신고 이유</th><th>상세 내용</th><th>신고 일자</th><th>조치 여부</th><th>조치 내용</th></tr>	
			<tr>
			<td>${Myreport[0].report.rptTarget }</td>
			<td>${Myreport[0].review.reviewContent }</td>
			<td>${Myreport[0].report.rptRsn }</td>
			<td>${Myreport[0].report.rptDetail }</td>
			<td>${Myreport[0].report.rptDate }</td>
			<td>${Myreport[0].report.rptYn }</td>
			<td>${Myreport[0].report.rptManage }</td>
			</tr>
		</table>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>